package controllers;

import play.mvc.Controller;
import play.mvc.Result;
import views.html.product.*;

public class Product extends Controller {
	
	public static Result listAllProd() {
		return ok(listAllProd.render("My listing of all products"));
	}
	
	public static Result showOneProd() {
		return ok(showOneProd.render("My show one product"));
	}
	
	public static Result editProd() {
		return ok(editProd.render("My edit of product"));
	}
	
}
