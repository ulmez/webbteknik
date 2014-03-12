package controllers;

import java.util.ArrayList;
import java.util.List;

import models.ProductModel;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.product.*;

public class Product extends Controller {
	
	public static Result listAllProd() {
		List<ProductModel> products = getListOfAllProducts();
		
		return ok(listAllProd.render(products));
	}
	
	public static Result showOneProd(int productId) {
		ProductModel p;
		
		if(getListOfAllProducts().size() < productId) {
			return notFound("Product id inserted out of bounds");
		} else if(productId < 1) {
			return notFound("Product id inserted out of bounds");
		} else {
			p = getListOfAllProducts().get(productId - 1);
		}
		
		return ok(showOneProd.render(p));
	}
	
	public static Result editProd() {
		return ok(editProd.render("My edit of product"));
	}
	
	private static List<ProductModel> getListOfAllProducts() {
		List<ProductModel> products = new ArrayList<>();
		
		ProductModel p1 = new ProductModel(1);
		ProductModel p2 = new ProductModel(2);
		ProductModel p3 = new ProductModel(3);
		
		p1.setProductName("Cykel");
		p1.setDescription("A very good bike.");
		p1.setCost(550);
		p1.setRrp(2350);
		
		p2.setProductName("Chair");
		p2.setDescription("A nice dark looking table.");
		p2.setCost(102);
		p2.setRrp(510);
		
		p3.setProductName("MacBook Air");
		p3.setDescription("A very good mac computer to have everywere.");
		p3.setCost(1500);
		p3.setRrp(12500);
		
		products.add(p1);
		products.add(p2);
		products.add(p3);
		return products;
	}
}
