package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "films")
public class Film extends Product {
	
	@Column(name = "rating")
	private int rating;
	
	@Column(name = "agelimit")
	private int agelimit;
	
	@Column(name = "released")
	private String released;
	
	public Film() {}
	
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getAgelimit() {
		return agelimit;
	}

	public void setAgelimit(int agelimit) {
		this.agelimit = agelimit;
	}

	public String getReleased() {
		return released;
	}

	public void setReleased(String released) {
		this.released = released;
	}
	
}
