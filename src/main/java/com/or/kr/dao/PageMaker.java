package com.or.kr.dao;

public class PageMaker {
private int totalcount;//전체 게시물 개수
private int pagenum;//현재 페이지 번호
private int contentnum = 10;	//한 페이지에 몇 개 표시할지
private int startPage = 1;	//현재 페이지블록의 시작페이지
private int endPage = 5;	//현재 페이지 블록의 마지막 페이지
private boolean	prev= false;//이전페이지로 가는 화살표
private boolean next;	//다음 페이지로 가는 화살표
private int currentblock;	//현재 페이지 블록
private int lastblock;	//마지막 페이지 블록

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


public int calcpage(int totalcount, int contentnum) {//전체 페이지수를 계산하는함수
	//125 /10 => 12.5
	//13페이지 그래서 +1 해주는것
	//50/ 10 ==> 5
	//5페이지까지
	//그러나 51/ 10 ==> 5.1
	//그래서 ++ 6페이지
	
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
	
	//1 2 3 4 5  --블록 1 
	//6 7 8 9 10--블록2
	//11 12 13 -- 블록 3
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
	//페이지 번호를 통해서 구한다.
	//페이지 번호 / 페이지 그룹 안의 페이지 개수
	//1p 1/5 => 0.2  0
	//6p  6/5 ==> 1.xx 2블록
	this.currentblock = pagenum/5;
	if(pagenum%5>0) {
		this.currentblock++;
	}
}
public int getLastblock() {
	return lastblock;
}
public void setLastblock(int totalcount) {
	//10개씩 , 5개의 블록 == > 10* 5 = 50;
	
	//125 / 50 ==> 2.5
	// +1 하면 pageblock은 3.
	this.lastblock = totalcount / (5*this.contentnum);
	if(totalcount %(5*this.contentnum)>0) {
		this.lastblock++;
	}
}






}
