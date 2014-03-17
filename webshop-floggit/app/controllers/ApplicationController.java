package controllers;

import models.Category;
import models.Product;
import models.ShoppingBasket;
import models.User;

import com.avaje.ebean.Ebean;

import play.mvc.*;
import views.html.*;

public class ApplicationController extends Controller {

	public static Result createAll(){
		User user = new User("anders@karlsson.se", "testing", "Anders", "Karlsson", "Svenssongatan 78", "75443", "Hamburg", "08-6358953");
		Product product = new Product("Bike", "A good bike.", 233, 566);
		Category category = new Category(1, "Books");
		ShoppingBasket shoppingBasket1 = new ShoppingBasket(1, 1, 3);
		ShoppingBasket shoppingBasket2 = new ShoppingBasket(1, 3, 3);
		ShoppingBasket shoppingBasket3 = new ShoppingBasket(1, 2, 3);
		ShoppingBasket shoppingBasket4 = new ShoppingBasket(2, 2, 3);
		ShoppingBasket shoppingBasket5 = new ShoppingBasket(2, 4, 3);
		ShoppingBasket shoppingBasket6 = new ShoppingBasket(2, 8, 3);
		ShoppingBasket shoppingBasket7 = new ShoppingBasket(2, 10, 3);
		ShoppingBasket shoppingBasket8 = new ShoppingBasket(3, 6, 3);
		ShoppingBasket shoppingBasket9 = new ShoppingBasket(3, 3, 3);
		ShoppingBasket shoppingBasket10 = new ShoppingBasket(3, 2, 3);
		
		Ebean.save(user);
		Ebean.save(product);
		Ebean.save(category);
		Ebean.save(shoppingBasket1);
		Ebean.save(shoppingBasket2);
		Ebean.save(shoppingBasket3);
		Ebean.save(shoppingBasket4);
		Ebean.save(shoppingBasket5);
		Ebean.save(shoppingBasket6);
		Ebean.save(shoppingBasket7);
		Ebean.save(shoppingBasket8);
		Ebean.save(shoppingBasket9);
		Ebean.save(shoppingBasket10);
		
		return ok("Objects created");
	}
	
    public static Result startPageApplication() {
        return ok(start.render("This is my start page"));
    }

}
