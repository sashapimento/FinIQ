package com.finiq.stockanalysis;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.codoid.products.fillo.Recordset;

public class ExceltoDB {

	@Autowired 
	StockRepo repo;
	
    
	public List<StockData> exceltoDatabase() throws FilloException {

		List<StockData> list=new ArrayList<>();
		Fillo filo = new Fillo();
		Connection connection = filo.getConnection("src/main/resources/SLBExcel.xlsx");
		String query="select * from SLB"; 
		// applying the query on excel table
		Recordset rs = connection.executeQuery(query);
		StockData sd;
		while(rs.next())
		{
			sd = new StockData();
			sd.setDate(rs.getField("Date"));
			sd.setOpen(rs.getField("Open"));
			sd.setHigh(rs.getField("High"));
			sd.setLow(rs.getField("Low"));
			sd.setActual(rs.getField("Actual"));
			sd.setPredicted(rs.getField("Predicted"));
		
			list.add(sd);
		}
		
		return list;
	}
}
