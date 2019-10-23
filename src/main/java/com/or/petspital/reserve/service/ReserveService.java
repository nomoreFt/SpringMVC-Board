package com.or.petspital.reserve.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.or.petspital.reserve.dao.ReserveDao;
import com.or.petspital.reserve.vo.Reservation;

@Service
public class ReserveService implements IReserveService{

	@Autowired
	private ReserveDao resDao;

	@Override
	public void resInsert(Reservation reserveVO) {
			resDao.resInsert(reserveVO);
	}

	@Override
	public List<Reservation> resSelectDate(String res_date) {
		List<Reservation> list = resDao.resSelectDate(res_date);
		return list;
	}
	
	@Override
	public boolean resSelectTime(Reservation reserveVO) {
		
		Reservation resSelectTime = resDao.resSelectTime(reserveVO);
		
		if(resDao.resSelectTime(reserveVO) != null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<Reservation> resSelectList(Reservation reserveVO) {
		
		List<Reservation> reserveList = resDao.resSelectList(reserveVO);
		
		return reserveList;
	}

	@Override
	public Reservation resSelectMemo(String res_num) {
		
		Reservation reserveMemo = resDao.resSelectMemo(res_num);
		
		return reserveMemo;
	}

	@Override
	public void resUpdateMemo(Reservation reserveVO) {		
		resDao.resUpdateMemo(reserveVO);	
	}

	@Override
	public int time_check(String date, String time) {
		int result = resDao.time_check(date, time);
		return result;
	}

	@Override
	public int resDelete(int res_num) {
		return resDao.resDelete(res_num);
	}


	

}
