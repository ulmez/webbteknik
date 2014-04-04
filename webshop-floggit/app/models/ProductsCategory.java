package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="products_categories")
//@NamedQuery(name="ProductsCategory.findAll", query="SELECT p FROM ProductsCategory p")
//public class ProductsCategory implements Serializable {
public class ProductsCategory {
//	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="categories_id")
	private Category category;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="products_id")
	private Product product;

	public ProductsCategory() {}

	public int getId() {
		return this.id;
	}

//	public void setId(int id) {
//		this.id = id;
//	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
