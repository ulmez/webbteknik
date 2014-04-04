package controllers;

import java.util.List;
import java.util.Map;

import models.Category;
import models.Check;
import models.Product;
import models.ProductsCategory;
import models.User;
import play.db.jpa.JPA;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Security;
import views.html.product.*;

public class ProductController extends Controller {
	
	@Transactional
	public static Result listAllProducts(int num, int page) {
		List<Product> allProducts = getListOfAllProducts();
		List<Product> products = getListOfProductsOnPage(num, page);
		List<User> users = ApplicationController.getLoggedInUser();
		
		return ok(listAllProducts.render(products, allProducts, num, page, users));
	}
	
	@Transactional
	public static Result showOneProduct(int productId) {
		Product p;
		List<User> users = ApplicationController.getLoggedInUser();
		
		if(getListOfAllProducts().size() < productId) {
			return notFound("Product id inserted out of bounds");
		} else if(productId < 1) {
			return notFound("Product id inserted out of bounds");
		} else {
			p = getListOfAllProducts().get(productId - 1);
		}
		
		return ok(showOneProduct.render(p, users, productId));
	}
	
	@Transactional
	public static Result editProduct() {
		List<User> users = ApplicationController.getLoggedInUser();
		
		return ok(editProduct.render("My edit of product", users));
	}
	
	@Transactional
	@Security.Authenticated
	public static Result formInsertProduct() {
		List<Product> products = getListOfAllProducts();
		List<User> users = ApplicationController.getLoggedInUser();
		List<Category> categories = JPA.em().createQuery("SELECT c FROM Category c", Category.class).getResultList();
		
		return ok(formInsertProduct.render(products, categories, users));
	}
	
	@Transactional
	public static Result insertProduct() {
		Map<String, String[]> form = request().body().asFormUrlEncoded();
		String name = "";
		String description = "";
		double cost = 0.0;
		double rrp = 0.0;
		boolean check = false;
		
//		return ok(form.get("category")[2]);
		
		if(form.get("name")[0].equals("")) {
			check = true;
			flash().put("empty-name", "No product name");
		} else {
			name = form.get("name")[0];
			flash().put("return-field-name", name);
		}
		
		if(form.get("description")[0].equals("")) {
			check = true;
			flash().put("empty-description", "No description");
		} else {
			description = form.get("description")[0];
			flash().put("return-field-description", description);
		}
		
		if(form.get("cost")[0].equals("")) {
			check = true;
			flash().put("empty-cost", "No cost");
		} else if(!Check.isNumeric(form.get("cost")[0])) {
			check = true;
			flash().put("no-integer-cost", "Not integer value for cost");
			flash().put("return-field-cost", form.get("cost")[0]);
		} else {
			cost = Double.parseDouble(form.get("cost")[0]);
			flash().put("return-field-cost", form.get("cost")[0]);
		}
		
		if(form.get("rrp")[0].equals("")) {
			check = true;
			flash().put("empty-rrp", "No rrp");
		} else if(!Check.isNumeric(form.get("rrp")[0])) {
			check = true;
			flash().put("no-integer-rrp", "Not integer value for rrp");
			flash().put("return-field-rrp", form.get("rrp")[0]);
		} else {
			rrp = Double.parseDouble(form.get("rrp")[0]);
			flash().put("return-field-rrp", form.get("rrp")[0]);
		}
		
		if(form.get("category") == null) {
			check = true;
			flash().put("empty-category", "No categories");
		} else {
			String temp = "";
			
			for(String cat : form.get("category")) {
				temp += cat + ",";
			}
			
			temp = temp.substring(0, temp.length() - 1);
			flash().put("return-field-category", temp);
		}
		
		if(check) {
			return redirect(routes.ProductController.formInsertProduct());
		}
		
//		Integer teacherId = Integer.parseInt(form.get("teacher-id")[0]);
//		Teacher teacher = JPA.em().find(Teacher.class, teacherId);

		Product product = new Product();
		product.setProductName(name);
		product.setDescription(description);
		product.setCost(cost);
		product.setRrp(rrp);
		
//		JPA.em().getTransaction().begin();
		
		JPA.em().persist(product);
		JPA.em().flush();
		
//		JPA.em().getTransaction().commit();
//		JPA.em().getTransaction().rollback();
		
		for(String catId : form.get("category")) {
			Category category = JPA.em().find(Category.class, Integer.parseInt(catId));
			
			ProductsCategory pc = new ProductsCategory();
			pc.setProduct(product);
			pc.setCategory(category);
			
//			return ok(Integer.toString(pc.getProduct().getProductId()) + " " + pc.getCategory().getCategoryId());
			
			JPA.em().persist(pc);
		}
//		flash().clear();
//		return ok(Integer.toString(product.getProductId()));
		
		flash().clear();
		return redirect(routes.ProductController.formInsertProduct());
	}
	
	private static List<Product> getListOfAllProducts() {
//		List<Product> products = Ebean.find(Product.class).findList();
		List<Product> products = JPA.em().createQuery("SELECT a FROM Product a ORDER BY a.id DESC", Product.class).getResultList();
    	
        return products;
	}
	
	private static List<Product> getListOfProductsOnPage(int num, int page) {
		List<Product> products;
		int numberOfProducts = getListOfAllProducts().size();
		
		if(page * num <= numberOfProducts) {
			products = getListOfAllProducts().subList((page - 1) * num, (page * num));
		} else {
			products = getListOfAllProducts().subList((page - 1) * num, numberOfProducts);
		}
		
		return products;
	}
}
