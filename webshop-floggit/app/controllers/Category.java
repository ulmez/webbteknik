package controllers;

import java.util.ArrayList;
import java.util.List;

import models.CategoryModel;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.category.*;

public class Category extends Controller {
	
	public static Result listAllCat() {
		List<CategoryModel> categories = getListOfAllCategories();
		
		return ok(listAllCat.render(categories));
	}
	
	public static Result showOneCat(int categoryId) {
		CategoryModel c;
		if(getListOfAllCategories().size() < categoryId) {
			return notFound("Category id inserted out of bounds");
		} else if(categoryId < 1) {
			return notFound("Category id inserted out of bounds");
		} else {
			c = getListOfAllCategories().get(categoryId - 1);
		}
		
		return ok(showOneCat.render(c));
	}
	
	public static Result editCat() {
		return ok(editCat.render("My edit of category"));
	}
	
	private static List<CategoryModel> getListOfAllCategories() {
		List<CategoryModel> categories = new ArrayList<>();
		
		CategoryModel c1 = new CategoryModel(1);
		CategoryModel c2 = new CategoryModel(2);
		CategoryModel c3 = new CategoryModel(3);
		
		c1.setStaffId(56);
		c1.setCategoryName("Film");
		
		c2.setStaffId(34);
		c2.setCategoryName("Book");
		
		c3.setStaffId(87);
		c3.setCategoryName("Electronic");
		
		categories.add(c1);
		categories.add(c2);
		categories.add(c3);
		return categories;
	}
}
