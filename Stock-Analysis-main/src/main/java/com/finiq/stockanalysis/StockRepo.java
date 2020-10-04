package com.finiq.stockanalysis;

import org.springframework.data.repository.CrudRepository;


public interface StockRepo  extends CrudRepository<StockData, Integer>{ 

}
