package models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import models.Orderline;
import models.ShoppingBasket;

@Entity
@Table(name = "products")
@Inheritance(strategy=InheritanceType.JOINED)
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int productId;
	
	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "cost")
	private double cost;
	
	@Column(name = "rrp")
	private double rrp;
	
	//bi-directional many-to-one association to ProductsCategory
	@OneToMany(mappedBy="product")
	private List<ProductsCategory> productsCategories;
	
	//bi-directional many-to-one association to ShoppingBasket
	@OneToMany(mappedBy="product")
	private List<ShoppingBasket> shoppingBaskets;
	
	//bi-directional many-to-one association to Orderline
	@OneToMany(mappedBy="product")
	private List<Orderline> orderlines;
	
	public Product() {}
	
	public int getProductId() {
		return productId;
	}
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public double getRrp() {
		return rrp;
	}

	public void setRrp(double rrp) {
		this.rrp = rrp;
	}
	
	public List<ProductsCategory> getProductsCategories() {
		return this.productsCategories;
	}

	public void setProductsCategories(List<ProductsCategory> productsCategories) {
		this.productsCategories = productsCategories;
	}
	
	public List<ShoppingBasket> getShoppingBaskets() {
		return this.shoppingBaskets;
	}

	public void setShoppingBaskets(List<ShoppingBasket> shoppingBaskets) {
		this.shoppingBaskets = shoppingBaskets;
	}
	
	public List<Orderline> getOrderlines() {
		return this.orderlines;
	}

	public void setOrderlines(List<Orderline> orderlines) {
		this.orderlines = orderlines;
	}
	
}