package controllers;

import play.mvc.Controller;
import play.mvc.Result;
import views.html.shoppingbasket.*;

public class ShoppingBasket extends Controller {
	
	public static Result showShoppingBasket() {
		return ok(showShoppingBasket.render("This is the shoppingbasket"));
	}
	
	public static Result checkout() {
		return ok(checkout.render("This is the checkout"));
	}
	
}
