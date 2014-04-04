package controllers;

import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import models.Category;
import models.Product;
import models.ProductsCategory;
import models.Staff;
import models.User;
import play.db.jpa.JPA;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Security;
import views.html.category.*;

public class CategoryController extends Controller {
	
	@Transactional
	public static Result listAllCategories(int num, int page) {
		List<Category> allCategories = getListOfAllCategories();
		List<Category> categories = getListOfCategoriesOnPage(num, page);
		List<User> users = ApplicationController.getLoggedInUser();
    	
        return ok(listAllCategories.render(categories, allCategories, num, page, users));
	}
	
	@Transactional
	public static Result showOneCategory(int categoryId) {
		Category c;
		List<ProductsCategory> productsCategories;
		List<User> users = ApplicationController.getLoggedInUser();
		if(getListOfAllCategories().size() < categoryId) {
			return notFound("Category id inserted out of bounds");
		} else if(categoryId < 1) {
			return notFound("Category id inserted out of bounds");
		} else {
			c = getListOfAllCategories().get(categoryId - 1);
//			productsCategory = JPA.em().find(ProductsCategory.class, 1);
			
			TypedQuery<ProductsCategory> q = JPA.em().createQuery("SELECT a FROM ProductsCategory a WHERE a.category = :categoryParam", ProductsCategory.class);
	    	q.setParameter ("categoryParam", c);
	    	productsCategories = q.getResultList();
		}
		
		return ok(showOneCategory.render(c, productsCategories, users));
	}
	
	@Transactional
	public static Result editCategory() {
		List<User> users = ApplicationController.getLoggedInUser();
		
		return ok(editCategory.render("My edit of category", users));
	}
	
	@Transactional
	@Security.Authenticated
	public static Result formInsertCategory() {
		List<Category> categories = getListOfAllCategories();
		List<User> users = ApplicationController.getLoggedInUser();
		List<Staff> staffs = JPA.em().createQuery("SELECT a FROM Staff a", Staff.class).getResultList();
		
		return ok(formInsertCategory.render(categories, staffs, users));
	}
	
	@Transactional
	public static Result insertCategory() {
		Map<String, String[]> form = request().body().asFormUrlEncoded();
		String name = "";
		int staffId = 0;
		Staff staff = null;
		
		TypedQuery<Category> q = JPA.em().createQuery("SELECT a FROM Category a WHERE a.categoryName = :category_nameParam", Category.class);
    	q.setParameter ("category_nameParam", form.get("name")[0]);
    	List<Category> oneCategories = q.getResultList();
		
		if(form.get("name")[0].equals("")) {
//			return notFound("No category name");
			flash().put("empty-name", "No category name");
			flash().put("selected-staff", form.get("staff")[0]);
			
			return redirect(routes.CategoryController.formInsertCategory());
		} else if(oneCategories.size() > 0) {
//			return notFound("Category name already used");
			flash().put("already-used-name", "Category name already used");
			flash().put("not-empty-name", form.get("name")[0]);
			flash().put("selected-staff", form.get("staff")[0]);
			
			return redirect(routes.CategoryController.formInsertCategory());
		} else {
			name = form.get("name")[0];
		}
		
		staffId = Integer.parseInt(form.get("staff")[0]);
		
		staff = JPA.em().find(Staff.class, staffId);
		
		Category category = new Category();
		category.setCategoryName(name);
		category.setStaff(staff);
		
		JPA.em().persist(category);
		
//		return ok(name + " " + staff.getFirstName() + " " + staff.getSurName());
//		return ok(name + " " + staffId);
		return redirect(routes.CategoryController.formInsertCategory());
	}
	
	private static List<Category> getListOfAllCategories() {
//		List<Category> categories = Ebean.find(Category.class).findList();
		List<Category> categories = JPA.em().createQuery("SELECT a FROM Category a ORDER BY a.id DESC", Category.class).getResultList();
		
		return categories;
	}
	
	private static List<Category> getListOfCategoriesOnPage(int num, int page) {
		List<Category> categories;
		int numberOfCategories = getListOfAllCategories().size();
		
		if(page * num <= numberOfCategories) {
			categories = getListOfAllCategories().subList((page - 1) * num, (page * num));
		} else {
			categories = getListOfAllCategories().subList((page - 1) * num, numberOfCategories);
		}
		
		return categories;
	}
}
