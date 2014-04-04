package controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import models.Category;
import models.Check;
import models.Order;
import models.Orderline;
import models.Product;
import models.ShoppingBasket;
import models.User;
import play.db.jpa.JPA;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.shoppingbasket.*;

public class ShoppingBasketController extends Controller {
	@Transactional
	public static Result listAllShoppingBaskets(int num, int page) {
		List<ShoppingBasket> allShoppingBaskets = getListOfAllShoppingBaskets();
		List<ShoppingBasket> shoppingBaskets = getListOfShoppingBasketsOnPage(num, page);
		List<User> users = ApplicationController.getLoggedInUser();
    	
        return ok(listAllShoppingBaskets.render(shoppingBaskets, allShoppingBaskets, num, page, users));
	}
	
	@Transactional
	public static Result showOneShoppingBasket(int userId) {
		List<User> users = ApplicationController.getLoggedInUser();
		
		return ok(showOneShoppingBasket.render(getListOfUsersShoppingBasket(userId), users));
	}
	
	@Transactional
	public static Result showOneLineShoppingBasket(int shoppingBasketId) {
		ShoppingBasket shoppingBasket = getListOfAllShoppingBaskets().get(shoppingBasketId - 1);
		List<User> users = ApplicationController.getLoggedInUser();
		
		return ok(showOneLineShoppingBasket.render(shoppingBasket, users));
	}
	
	@Transactional
	public static Result checkout() {
		List<User> users = ApplicationController.getLoggedInUser();
		
		return ok(checkout.render("This is the checkout", users));
	}
	
	@Transactional
	public static Result insertShoppingBasket() {
		Map<String, String[]> form = request().body().asFormUrlEncoded();
		String quantity = "";
		boolean check = false;
		
		TypedQuery<User> q = JPA.em().createQuery("SELECT a FROM User a WHERE a.email = :emailParam", User.class);
    	q.setParameter ("emailParam", session().get("username"));
    	List<User> oneUsers = q.getResultList();
		
    	TypedQuery<ShoppingBasket> q1 = JPA.em().createQuery("SELECT a FROM ShoppingBasket a WHERE a.user = :userParam AND a.product = :productParam", ShoppingBasket.class);
    	q1.setParameter ("userParam", oneUsers).setParameter("productParam", JPA.em().find(Product.class, Integer.parseInt(form.get("productId")[0])));
    	List<ShoppingBasket> shoppingBaskets = q1.getResultList();
    	
		if(form.get("quantity")[0].equals("")) {
//			return ok("No quantity");
			check = true;
			flash().put("empty-quantity", "No quantity");
		} else if(!Check.isNumeric(form.get("quantity")[0])) {
//			return ok("Not numeric value for quantity");
			check = true;
			flash().put("return-field-quantity", form.get("quantity")[0]);
			flash().put("not-numeric-quantity", "Not a numeric value as quantity");
		} else if(shoppingBaskets.size() > 0) {
			check = true;
			flash().put("return-field-quantity", form.get("quantity")[0]);
			flash().put("product-already-used", "Already in the shoppingbasket");
		} else {
			quantity = form.get("quantity")[0];
		}
		
		if(check) {
			return redirect(routes.ProductController.showOneProduct(Integer.parseInt(form.get("listId")[0])));
		}
		
    	ShoppingBasket sb = new ShoppingBasket();
    	sb.setProduct(JPA.em().find(Product.class, Integer.parseInt(form.get("productId")[0])));
    	sb.setUser(oneUsers.get(0));
    	sb.setQuantity(Integer.parseInt(quantity));
    	
    	JPA.em().persist(sb);
    	
    	flash().clear();
    	return redirect(routes.ProductController.listAllProducts(5, 1));
//		return ok(shoppingBaskets.size() + " " + form.get("listId")[0] + " " + form.get("productId")[0] + " " + form.get("quantity")[0] + " " + oneUsers.get(0).getUserId());
	}
	
	@Transactional
	public static Result getYourShoppingBasket() {
		List<User> oneUsers = ApplicationController.getLoggedInUser();
		
		TypedQuery<ShoppingBasket> q = JPA.em().createQuery("SELECT a FROM ShoppingBasket a WHERE a.user = :userParam", ShoppingBasket.class);
    	q.setParameter ("userParam", oneUsers.get(0));
    	List<ShoppingBasket> shoppingBaskets = q.getResultList();
		
		return ok(getYourShoppingBasket.render("Your shoppingbasket", shoppingBaskets, oneUsers));
	}
	
	@Transactional
	public static Result makeOrder() {
		List<User> oneUsers = ApplicationController.getLoggedInUser();
		
		TypedQuery<ShoppingBasket> q = JPA.em().createQuery("SELECT a FROM ShoppingBasket a WHERE a.user = :userParam", ShoppingBasket.class);
    	q.setParameter ("userParam", oneUsers.get(0));
    	List<ShoppingBasket> shoppingBaskets = q.getResultList();
		
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date date = new Date();
    	String dateNow = dateFormat.format(date);    	
    	
    	Order order = new Order();
    	
    	order.setOrderdate(dateNow);
    	
    	JPA.em().persist(order);
    	JPA.em().flush();
    	
    	for(ShoppingBasket shoppingBasket : shoppingBaskets) {
    		Orderline orderline = new Orderline();
    		
        	orderline.setOrder(order);
        	orderline.setProduct(JPA.em().find(Product.class, shoppingBasket.getProduct().getProductId()));
        	orderline.setUser(oneUsers.get(0));
        	orderline.setQuantity(shoppingBasket.getQuantity());
        	
        	JPA.em().persist(orderline);
    	}
    	
    	for(ShoppingBasket shoppingBasket : shoppingBaskets) {
    		ShoppingBasket shoppingBasketRemove = JPA.em().find(ShoppingBasket.class, shoppingBasket.getShoppingBasketId());
    		JPA.em().remove(shoppingBasketRemove);
    	}
    	
    	flash().put("order-sent-message", "Your order is now sent");
    	
    	return redirect(routes.ShoppingBasketController.getYourShoppingBasket());
	}
	
	private static List<ShoppingBasket> getListOfAllShoppingBaskets() {
//		List<ShoppingBasket> shoppingBaskets = Ebean.find(ShoppingBasket.class).findList();
		List<ShoppingBasket> shoppingBaskets = JPA.em().createQuery("SELECT a FROM ShoppingBasket a", ShoppingBasket.class).getResultList();
		
		return shoppingBaskets;
	}
	
	private static List<ShoppingBasket> getListOfUsersShoppingBasket(int userId) {
		List<ShoppingBasket> shoppingBaskets = new ArrayList<>();
		
		for(ShoppingBasket sb : getListOfAllShoppingBaskets()) {
			if(sb.getUser().getUserId() == userId) {
				shoppingBaskets.add(sb);
			}
		}
		
		return shoppingBaskets;
	}
	
	private static List<ShoppingBasket> getListOfShoppingBasketsOnPage(int num, int page) {
		List<ShoppingBasket> shoppingBaskets;
		int numberOfShoppingBaskets = getListOfAllShoppingBaskets().size();
		
		if(page * num <= numberOfShoppingBaskets) {
			shoppingBaskets = getListOfAllShoppingBaskets().subList((page - 1) * num, (page * num));
		} else {
			shoppingBaskets = getListOfAllShoppingBaskets().subList((page - 1) * num, numberOfShoppingBaskets);
		}
		
		return shoppingBaskets;
	}
	
}
