package com.camp.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.mapper.RentMapper;
import com.camp.vo.Rental;

@Service
public class RentServiceImpl implements RentService {
	
	@Autowired
	private RentMapper rentMapper;
	
	@Override
	public ArrayList<Rental> findRentsByCampNo(int campNo) {
		List<Rental> rents = rentMapper.selectRentsByCampNo(campNo);
		return (ArrayList<Rental>) rents;
	}

	@Override
	public void registerRent(Rental rent) {
		rentMapper.insertRent(rent);	
	}

}

