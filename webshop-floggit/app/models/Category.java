package models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
public class Category {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int categoryId;
	
	@ManyToOne
	@JoinColumn(name = "staff_id")
	private Staff staff;
	
	@Column(name = "category_name")
	private String categoryName;
	
	//bi-directional many-to-one association to ProductsCategory
	@OneToMany(mappedBy="category")
	private List<ProductsCategory> productsCategories;
	
	public Category() {}
	
	public int getCategoryId() {
		return categoryId;
	}
	
	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public List<ProductsCategory> getProductsCategories() {
		return this.productsCategories;
	}

	public void setProductsCategories(List<ProductsCategory> productsCategories) {
		this.productsCategories = productsCategories;
	}
	
}