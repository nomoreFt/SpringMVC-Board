package com.or.petspital.shopping.vo;

public class ShoppingVO {

	private int product_num;
	private String product_kind;
	private String product_name;
	private String product_img;
	private int product_price;

	public ShoppingVO() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingVO(int product_num, String product_kind, String product_name, String product_img,
			int product_price) {

		this.product_num = product_num;
		this.product_kind = product_kind;
		this.product_name = product_name;
		this.product_img = product_img;
		this.product_price = product_price;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_kind() {
		return product_kind;
	}

	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

}
