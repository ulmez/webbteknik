package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int productId;
	private String productName;
	private String description;
	private double cost;
	private double rrp;
	
	public Product() {
		productName = null;
		description = null;
		cost = 0.0;
		rrp = 0.0;
	}
	
	public Product(String productName, String description, double cost, double rrp) {
		this.productName = productName;
		this.description = description;
		this.cost = cost;
		this.rrp = rrp;
	}
	
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
	
	@Override
	public String toString() {
		String productInfo = "";
		
		productInfo += "productId: " + productId + "\n";
		productInfo += "productName: " + productName + "\n";
		productInfo += "description: " + description + "\n";
		productInfo += "cost: " + cost + "\n";
		productInfo += "rrp: " + rrp + "\n";
		
		return productInfo;
	}
}