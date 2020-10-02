package com.finiq.stockanalysis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codoid.products.exception.FilloException;

@Controller
public class MyController {

	@RequestMapping("/home")
	String welcome() throws FilloException
	{
		ExceltoDB edb=new ExceltoDB();
		edb.exceltoDatabase();
		return "Welcome.jsp";
	}
}
