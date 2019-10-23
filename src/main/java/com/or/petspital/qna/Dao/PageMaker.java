package com.or.petspital.qna.Dao;

public class PageMaker {
private int totalcount;//��ü �Խù� ����
private int pagenum;//���� ������ ��ȣ
private int contentnum = 10;	//�� �������� �� �� ǥ������
private int startPage = 1;	//���� ����������� ����������
private int endPage = 5;	//���� ������ ����� ������ ������
private boolean	prev= false;//������������ ���� ȭ��ǥ
private boolean next;	//���� �������� ���� ȭ��ǥ
private int currentblock;	//���� ������ ���
private int lastblock;	//������ ������ ���

public void prevnext(int pagenum) {
	if(pagenum > 0 && pagenum <6) {
		setPrev(false);	
		setNext(true);
	}else if (getLastblock() == getCurrentblock()) {
		setPrev(true);
		setNext(false);
	}
	else {
		setPrev(true);
		setNext(true);
	}
	
}


public int calcpage(int totalcount, int contentnum) {//��ü ���������� ����ϴ��Լ�
	//125 /10 => 12.5
	//13������ �׷��� +1 ���ִ°�
	//50/ 10 ==> 5
	//5����������
	//�׷��� 51/ 10 ==> 5.1
	//�׷��� ++ 6������
	
	int totalpage = totalcount / contentnum;
	if(totalcount%contentnum>0) {
		totalpage++;
	}
	return totalpage;
}

public int getTotalcount() {
	return totalcount;
}
public void setTotalcount(int totalcount) {
	this.totalcount = totalcount;
}
public int getPagenum() {
	return pagenum;
}
public void setPagenum(int pagenum) {
	this.pagenum = pagenum;
}
public int getContentnum() {
	return contentnum;
}
public void setContentnum(int contentnum) {
	this.contentnum = contentnum;
}
public int getStartPage() {
	return startPage;
}
public void setStartPage(int currentblock) {
	this.startPage = (currentblock*5)-4;
	
	//1 2 3 4 5  --��� 1 
	//6 7 8 9 10--���2
	//11 12 13 -- ��� 3
}
public int getEndPage() {
	return endPage;
}
public void setEndPage(int getlastblock,int getcurrentblock) {
	if(getlastblock== getcurrentblock) {
		this.endPage = calcpage(getTotalcount(),getContentnum());	
		}else {
			this.endPage = getStartPage()+4;
		}
}
public boolean isPrev() {
	return prev;
}
public void setPrev(boolean prev) {
	this.prev = prev;
}
public boolean isNext() {
	return next;
}
public void setNext(boolean next) {
	this.next = next;
}
public int getCurrentblock() {
	return currentblock;
}
public void setCurrentblock(int pagenum) {
	//������ ��ȣ�� ���ؼ� ���Ѵ�.
	//������ ��ȣ / ������ �׷� ���� ������ ����
	//1p 1/5 => 0.2  0
	//6p  6/5 ==> 1.xx 2���
	this.currentblock = pagenum/5;
	if(pagenum%5>0) {
		this.currentblock++;
	}
}
public int getLastblock() {
	return lastblock;
}
public void setLastblock(int totalcount) {
	//10���� , 5���� ��� == > 10* 5 = 50;
	
	//125 / 50 ==> 2.5
	// +1 �ϸ� pageblock�� 3.
	this.lastblock = totalcount / (5*this.contentnum);
	if(totalcount %(5*this.contentnum)>0) {
		this.lastblock++;
	}
}






}
