package com.or.petspital.product.vo;

public class ProductVO {
String product_num;
String product_kind;
String product_name;
String product_img;
String product_price;
String product_count;

public ProductVO() {
	// TODO Auto-generated constructor stub
}
public ProductVO(String product_num, String product_kind, String product_img, String product_name,  String product_price,
		String product_count) {
	super();
	this.product_num = product_num;
	this.product_kind = product_kind;
	this.product_name = product_name;
	this.product_img = product_img;
	this.product_price = product_price;
	this.product_count = product_count;
}
public String getProduct_num() {
	return product_num;
}
public void setProduct_num(String product_num) {
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
public String getProduct_price() {
	return product_price;
}
public void setProduct_price(String product_price) {
	this.product_price = product_price;
}
public String getProduct_count() {
	return product_count;
}
public void setProduct_count(String product_count) {
	this.product_count = product_count;
}



}