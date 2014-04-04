package models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="orders")
//@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order {
//	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "orderdate")
	private String orderdate;

	//bi-directional many-to-one association to Orderline
	@OneToMany(mappedBy="order")
	private List<Orderline> orderlines;

	public Order() {}

	public int getId() {
		return this.id;
	}

//	public void setId(int id) {
//		this.id = id;
//	}

	public String getOrderdate() {
		return this.orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public List<Orderline> getOrderlines() {
		return this.orderlines;
	}

	public void setOrderlines(List<Orderline> orderlines) {
		this.orderlines = orderlines;
	}

	public Orderline addOrderline(Orderline orderline) {
		getOrderlines().add(orderline);
		orderline.setOrder(this);

		return orderline;
	}

	public Orderline removeOrderline(Orderline orderline) {
		getOrderlines().remove(orderline);
		orderline.setOrder(null);

		return orderline;
	}

}