package controllers;

import java.util.List;

import models.User;

import com.avaje.ebean.Ebean;

import play.mvc.Controller;
import play.mvc.Result;
import views.html.user.*;

public class UserController extends Controller {
	
	public static Result listAllUsers() {
		List<User> users = getListOfAllUsers();
    	
        return ok(listAllUsers.render(users));
	}
	
	public static Result showOneUser(int userId) {
		User user = getListOfAllUsers().get(userId - 1);
		
		return ok(showOneUser.render(user));
	}
	
	public static Result editUser() {
		return ok(editUser.render("Edit user page"));
	}
	
	private static List<User> getListOfAllUsers() {
		List<User> users = Ebean.find(User.class).findList();
		
		return users;
	}
	
}
