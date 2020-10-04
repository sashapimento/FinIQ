package com.finiq.stockanalysis;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class StockData {

//	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
//	int id;
	@Id
	String Date;
	String open;
	String high;
	String low;
	String actual;
	String predicted;
	
	public StockData() {
		
	}
	
	@Override
	public String toString() {
		return "StockData [ Date=" + Date + ", open=" + open + ", high=" + high + ", low=" + low
				+ ", actual=" + actual + ", predicted=" + predicted + "]";
	}

	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getActual() {
		return actual;
	}
	public void setActual(String actual) {
		this.actual = actual;
	}
	public String getPredicted() {
		return predicted;
	}
	public void setPredicted(String predicted) {
		this.predicted = predicted;
	}
	
	

}
