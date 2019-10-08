package com.camp.service;

import java.util.ArrayList;

import com.camp.vo.Rental;

public interface RentService {
	
	ArrayList<Rental> findRentsByCampNo(int campNo);
	
	void registerRent(Rental rent);

}
