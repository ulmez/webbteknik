package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userId;
	private String email;
	private String password;
	private String firstName;
	private String surName;
	private String streetAddress;
	private String postCode;
	private String town;
	private String telephone;
	
	public User() {
		email = null;
		password = null;
		firstName = null;
		surName = null;
		streetAddress = null;
		postCode = null;
		town = null;
		telephone = null;
	}
	
	public User(String email, String password, String firstName,String surName,
	String streetAddress, String postCode, String town, String telephone) {
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.surName = surName;
		this.streetAddress = streetAddress;
		this.postCode = postCode;
		this.town = town;
		this.telephone = telephone;
	}
	
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
}