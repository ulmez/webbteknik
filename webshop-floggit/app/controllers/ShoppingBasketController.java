package controllers;

import java.util.ArrayList;
import java.util.List;

import models.ShoppingBasket;

import com.avaje.ebean.Ebean;

import play.mvc.Controller;
import play.mvc.Result;
import views.html.shoppingbasket.*;

public class ShoppingBasketController extends Controller {
	
	public static Result listAllShoppingBaskets() {
		List<ShoppingBasket> shoppingBaskets = getListOfAllShoppingBaskets();
    	
        return ok(listAllShoppingBaskets.render(shoppingBaskets));
	}
	
	public static Result showOneShoppingBasket(int userId) {
		return ok(showOneShoppingBasket.render(getListOfUsersShoppingBasket(userId)));
	}
	
	public static Result checkout() {
		return ok(checkout.render("This is the checkout"));
	}
	
	private static List<ShoppingBasket> getListOfAllShoppingBaskets() {
		List<ShoppingBasket> shoppingBaskets = Ebean.find(ShoppingBasket.class).findList();
		
		return shoppingBaskets;
	}
	
	private static List<ShoppingBasket> getListOfUsersShoppingBasket(int userId) {
		List<ShoppingBasket> shoppingBaskets = new ArrayList<>();
		
		for(ShoppingBasket sb : getListOfAllShoppingBaskets()) {
			if(sb.getUserId() == userId) {
				shoppingBaskets.add(sb);
			}
		}
		
		return shoppingBaskets;
	}
	
}
