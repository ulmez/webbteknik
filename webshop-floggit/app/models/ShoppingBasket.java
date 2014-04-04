package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "shoppingbasket")
public class ShoppingBasket {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int shoppingBasketId;
	
	@ManyToOne
	@JoinColumn(name = "users_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "products_id")
	private Product product;

	@Column(name = "quantity")
	private int quantity;
	
	public ShoppingBasket() {}
	
	public int getShoppingBasketId() {
		return shoppingBasketId;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}