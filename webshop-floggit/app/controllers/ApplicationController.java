package controllers;

import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

//import com.google.gson.Gson;

import models.Film;
import models.Product;
import models.User;
import play.db.jpa.JPA;
import play.db.jpa.Transactional;
import play.mvc.*;
import views.html.*;

public class ApplicationController extends Controller {
	
	@Transactional
    public static Result test() {
    	Film film = new Film();
    	film.setProductName("The evil the good and the ugly");
    	film.setDescription("A spagetti western movie.");
    	film.setCost(22);
    	film.setRrp(66);
    	film.setAgelimit(18);
    	film.setRating(4);
    	film.setReleased("1961");
    	
    	JPA.em().persist(film);
    	
    	List<Film> films = JPA.em().createQuery("SELECT f FROM Film f", Film.class).getResultList();
    	
    	return ok(test.render(films));
    }
	
	@Transactional
    public static Result startPageApplication() {
		List<User> users = getLoggedInUser();
    	
        return ok(start.render("Start page", users));
    }
    
	@Transactional
    public static Result ajax() {
    	List<User> users = getLoggedInUser();
    	
    	return ok(ajax.render(1, users));
    }
    
    @Transactional
    public static Result getJsonText(int num, int page) {
//    	Gson gson = new Gson();
        List<Product> products = getListOfProductsOnPage(num, page);
        
        return TODO;
//        return ok(gson.toJson(products));
    }
    
    @Transactional
    public static Result loggin() {
    	List<User> users = getLoggedInUser();
    	
    	return ok(loggin.render("", users));
    }
    
    public static Result logout() {
    	session().clear();
    	
    	return redirect(routes.ApplicationController.loggin());
    }
    
    @Transactional
    public static Result logginAuthentication() {
    	Map<String, String[]> form = request().body().asFormUrlEncoded();
    	List<User> users = null;
    	String userName = "";
    	String password = "";
    	
    	if(form.get("username")[0].equals("")) {
    		flash().put("user", "No username");
    		
    	} else {
    		userName = form.get("username")[0];
    		flash().put("formfieldusername", userName);
    	}
    	
    	if(form.get("password")[0].equals("")) {
    		flash().put("pass", "No password");
    	} else {
    		password = form.get("password")[0];
    		flash().put("formfieldpassword", password);
    	}
    	
    	if(userName.equals("") || password.equals("")) {
    		return redirect(routes.ApplicationController.loggin());
    	}
    	
    	TypedQuery<User> q = JPA.em().createQuery("SELECT a FROM User a WHERE a.email = :emailParam and a.password = :passwordParam", User.class);
    	q.setParameter ("emailParam", userName).setParameter ("passwordParam", password);
    	users = q.getResultList();
    	
    	if(users.size() == 0) {
    		flash().put("invaliduser", "Not a valid user");
    		return redirect(routes.ApplicationController.loggin());
    	} else {
			if(userName.equals(users.get(0).getEmail()) && password.equals(users.get(0).getPassword())) {
				session().put("username", users.get(0).getEmail());
	
				return redirect(routes.ApplicationController.startPageApplication());
			}
    	}
    	
    	return redirect(routes.ApplicationController.loggin());
    }

	private static List<Product> getListOfAllProducts() {
		return JPA.em().createQuery("SELECT a FROM Product a", Product.class).getResultList();
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
	
	public static List<User> getLoggedInUser() {
		List<User> users = null;
		TypedQuery<User> q = JPA.em().createQuery("SELECT a FROM User a WHERE a.email = :emailParam", User.class);
    	q.setParameter ("emailParam", session().get("username"));
    	users = q.getResultList();
		return users;
	}
}
