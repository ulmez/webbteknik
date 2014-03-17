package controllers;

import java.util.List;

import com.avaje.ebean.Ebean;

import models.Category;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.category.*;

public class CategoryController extends Controller {
	
	public static Result listAllCategories() {
		List<Category> categories = getListOfAllCategories();
    	
        return ok(listAllCategories.render(categories));
	}
	
	public static Result showOneCategory(int categoryId) {
		Category c;
		if(getListOfAllCategories().size() < categoryId) {
			return notFound("Category id inserted out of bounds");
		} else if(categoryId < 1) {
			return notFound("Category id inserted out of bounds");
		} else {
			c = getListOfAllCategories().get(categoryId - 1);
		}
		
		return ok(showOneCategory.render(c));
	}
	
	public static Result editCategory() {
		return ok(editCategory.render("My edit of category"));
	}
	
	private static List<Category> getListOfAllCategories() {
		List<Category> categories = Ebean.find(Category.class).findList();
		
		return categories;
	}
}
