package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int categoryId;
	private int staffId;
	private String categoryName;
	
	public Category() {
		staffId = 0;
		categoryName = null;
	}
	
	public Category(int staffId, String categoryName) {
		this.staffId = staffId;
		this.categoryName = categoryName;
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	
	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		String categoryInfo = "";
		
		categoryInfo += "categoryId: " + categoryId + "\n";
		categoryInfo += "staffId: " + staffId + "\n";
		categoryInfo += "categoryName: " + categoryName + "\n";
		
		return categoryInfo;
	}
}