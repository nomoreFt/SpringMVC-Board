package com.or.petspital.reserve.service;

import java.util.List;

import com.or.petspital.reserve.vo.Reservation;

public interface IReserveService {
	
	public void resInsert(Reservation reserveVO); 
	public List<Reservation> resSelectDate(String res_date);
	public boolean resSelectTime(Reservation reserveVO); //이미 예약 돼있으면 false, 예약 가능하면 true
	public List<Reservation> resSelectList(Reservation reserveVO);
	public Reservation resSelectMemo(String res_num);
	public void resUpdateMemo(Reservation reserveVO);
	public int time_check(String date, String time);
	public int resDelete(int res_num);
}
