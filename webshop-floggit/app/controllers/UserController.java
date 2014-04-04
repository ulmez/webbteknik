package controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;

import models.Check;
import models.User;
import play.db.jpa.JPA;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.loggin;
import views.html.user.*;

public class UserController extends Controller {
	
	@Transactional
	public static Result listAllUsers(int num, int page) {
		List<User> allUsers = getListOfAllUsers();
		List<User> users = getListOfUsersOnPage(num, page);
		List<User> oneUsers = ApplicationController.getLoggedInUser();
    	
        return ok(listAllUsers.render(users, allUsers, num, page, oneUsers));
	}
	
	@Transactional
	public static Result showOneUser(int userId) {
		User user = getListOfAllUsers().get(userId - 1);
		List<User> oneUsers = ApplicationController.getLoggedInUser();
		
		return ok(showOneUser.render(user, oneUsers));
	}
	
	@Transactional
	public static Result editUser() {
		List<User> oneUsers = ApplicationController.getLoggedInUser();
		
		return ok(editUser.render("Edit user page", oneUsers));
	}
	
	@Transactional
	public static Result registerUser() {
		List<User> oneUsers = ApplicationController.getLoggedInUser();
		
		return ok(registerUser.render("Register user", oneUsers));
	}
	
	@Transactional
	public static Result insertUser() {
		Map<String, String[]> form = request().body().asFormUrlEncoded();
		String email = "";
		String password = "";
		String passwordCheck = "";
		String firstName = "";
		String surName = "";
		String streetAddress = "";
		String postCode = "";
		String town = "";
		String telephone = "";
		boolean check = false;
		List<User> oneUsers = new ArrayList<>();
		
		if(form.get("email")[0].equals("")) {
			check = true;
			flash().put("empty-email", "No email");
		} else {
			email = form.get("email")[0];
			flash().put("return-field-email", email);
		}
		
		if(form.get("password")[0].equals("")) {
			check = true;
			flash().put("empty-password", "No password");
		} else if(!(form.get("password")[0].equals(form.get("passwordCheck")[0]))) {
			check = true;
			password = form.get("password")[0];
			flash().put("return-field-password", password);
			flash().put("not-same-password", "You haven't inserted the same password twice");
		} else {
			password = form.get("password")[0];
			flash().put("return-field-password", password);
		}
		
		if(form.get("passwordCheck")[0].equals("")) {
			check = true;
			flash().put("empty-passwordCheck", "No password check");
		} else if(!(form.get("password")[0].equals(form.get("passwordCheck")[0]))) {
			check = true;
			passwordCheck = form.get("passwordCheck")[0];
			flash().put("return-field-passwordCheck", passwordCheck);
			flash().put("not-same-passwordCheck", "You haven't inserted the same password check twice");
		} else {
			passwordCheck = form.get("passwordCheck")[0];
			flash().put("return-field-passwordCheck", passwordCheck);
		}
		
		if(form.get("firstName")[0].equals("")) {
			check = true;
			flash().put("empty-firstName", "No firstname");
		} else {
			firstName = form.get("firstName")[0];
			flash().put("return-field-firstName", firstName);
		}
		
		if(form.get("surName")[0].equals("")) {
			check = true;
			flash().put("empty-surName", "No surname");
		} else {
			surName = form.get("surName")[0];
			flash().put("return-field-surName", surName);
		}
		
		if(form.get("streetAddress")[0].equals("")) {
			check = true;
			flash().put("empty-streetAddress", "No street address");
		} else {
			streetAddress = form.get("streetAddress")[0];
			flash().put("return-field-streetAddress", streetAddress);
		}
		
		if(form.get("postCode")[0].equals("")) {
			check = true;
			flash().put("empty-postCode", "No post code");
		} else if(!Check.isNumeric(form.get("postCode")[0])) {
			check = true;
			postCode = form.get("postCode")[0];
			flash().put("return-field-postCode", postCode);
			flash().put("not-numeric-postCode", "Inserted not numeric value for post code");
		} else {
			postCode = form.get("postCode")[0];
			flash().put("return-field-postCode", postCode);
		}
		
		if(form.get("town")[0].equals("")) {
			check = true;
			flash().put("empty-town", "No town");
		} else {
			town = form.get("town")[0];
			flash().put("return-field-town", town);
		}
		
		if(form.get("telephone")[0].equals("")) {
			check = true;
			flash().put("empty-telephone", "No telephone");
		} else {
			telephone = form.get("telephone")[0];
			flash().put("return-field-telephone", telephone);
		}
		
		if(check) {
			return redirect(routes.UserController.registerUser());
		}
		
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setFirstName(firstName);
		user.setSurName(surName);
		user.setStreetAddress(streetAddress);
		user.setPostCode(postCode);
		user.setTown(town);
		user.setTelephone(telephone);
		
		JPA.em().persist(user);
		JPA.em().flush();
		
		oneUsers.add(user);
		
		flash().clear();
		
		session().put("username", oneUsers.get(0).getEmail());
		
		return redirect(routes.ApplicationController.startPageApplication());
		
//		return ok(Integer.toString(user.getUserId()));
//		return redirect(routes.UserController.registerUser());
	}
	
	@Transactional
	public static Result listLoggedUser() {
		List<User> oneUsers = ApplicationController.getLoggedInUser();
		
		return ok(listLoggedUser.render("Logged in user", oneUsers));
	}
	
	private static List<User> getListOfAllUsers() {
//		List<User> users = Ebean.find(User.class).findList();
		List<User> users = JPA.em().createQuery("SELECT a FROM User a", User.class).getResultList();
		
		return users;
	}
	
	private static List<User> getListOfUsersOnPage(int num, int page) {
		List<User> users;
		int numberOfUsers = getListOfAllUsers().size();
		
		if(page * num <= numberOfUsers) {
			users = getListOfAllUsers().subList((page - 1) * num, (page * num));
		} else {
			users = getListOfAllUsers().subList((page - 1) * num, numberOfUsers);
		}
		
		return users;
	}
	
}
