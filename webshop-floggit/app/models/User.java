package models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import models.Orderline;
import models.ShoppingBasket;

@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int userId;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "firstname")
	private String firstName;
	
	@Column(name = "surname")
	private String surName;
	
	@Column(name = "street_address")
	private String streetAddress;
	
	@Column(name = "post_code")
	private String postCode;
	
	@Column(name = "town")
	private String town;
	
	@Column(name = "telephone")
	private String telephone;
	
	//bi-directional many-to-one association to ShoppingBasket
	@OneToMany(mappedBy="user")
	private List<ShoppingBasket> shoppingBaskets;
	
	//bi-directional many-to-one association to Orderline
	@OneToMany(mappedBy="user")
	private List<Orderline> orderlines;
	
	public User() {}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public int getUserId() {
		return userId;
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