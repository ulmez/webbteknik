package controllers;

import java.util.List;

import com.avaje.ebean.Ebean;

import models.Product;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.product.*;

public class ProductController extends Controller {
	
	public static Result listAllProducts(int num, int page) {
		List<Product> allProducts = getListOfAllProducts();
		List<Product> products = getListOfProductsOnPage(num, page);
		
		return ok(listAllProducts.render(products, allProducts, num));
	}
	
	public static Result showOneProduct(int productId) {
		Product p;
		
		if(getListOfAllProducts().size() < productId) {
			return notFound("Product id inserted out of bounds");
		} else if(productId < 1) {
			return notFound("Product id inserted out of bounds");
		} else {
			p = getListOfAllProducts().get(productId - 1);
		}
		
		return ok(showOneProduct.render(p));
	}
	
	public static Result editProduct() {
		return ok(editProduct.render("My edit of product"));
	}
	
	private static List<Product> getListOfAllProducts() {
		List<Product> products = Ebean.find(Product.class).findList();
    	
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
