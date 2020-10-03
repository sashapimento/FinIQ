package com.finiq.stockanalysis;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.codoid.products.exception.FilloException;

@Controller
public class MyController {

	@Autowired
	StockRepo repo;
	
	@RequestMapping("/")
	String welcome(Model model) throws FilloException
	{
		//Comment out
	/*	ExceltoDB edb=new ExceltoDB();
		List<StockData> list=new ArrayList<>();
		
		list = edb.exceltoDatabase();
		
		for(StockData sd: list) {
			
			repo.save(sd);
		}
		model.addAttribute("res", repo);*/
		
		return "Welcome.jsp";
	}

	@RequestMapping("/graph")
	public String barGraph(Model model) {
		
		
		model.addAttribute("res", repo);
		return "index.jsp";
	}
		
}
