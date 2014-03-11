package controllers;

import play.mvc.Controller;
import play.mvc.Result;
import views.html.category.*;

public class Category extends Controller {
	
	public static Result listAllCat() {
		return ok(listAllCat.render("My listing of all categories"));
	}
	
	public static Result showOneCat() {
		return ok(showOneCat.render("My show one category"));
	}
	
	public static Result editCat() {
		return ok(editCat.render("My edit of category"));
	}
	
}
