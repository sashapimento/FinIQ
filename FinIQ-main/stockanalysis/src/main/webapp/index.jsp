<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 <%@ page
	import="com.finiq.stockanalysis.StockRepo,com.finiq.stockanalysis.StockData"%>
<%

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
StockRepo repo = (StockRepo) request.getAttribute("res");
int i=0;
for (StockData sd : repo.findAll()) {
	
	double num =Double.parseDouble(sd.getActual()); 
	map = new HashMap<Object,Object>(); map.put("x", i); map.put("y", num); list.add(map);
	i+=10;
}
 
String dataPoints1 = gsonObj.toJson(list);
 
list = new ArrayList<Map<Object,Object>>();
i=0;
for (StockData sd : repo.findAll()) {
	double num =Double.parseDouble(sd.getPredicted()); 
	map = new HashMap<Object,Object>(); map.put("x", i); map.put("y", num); list.add(map);
	i+=10;
}
 
String dataPoints2 = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		zoomEnabled: true,
		theme: "light2",
		title: {
			text: "Analysis"
		},
		axisX: {
			title: "Date",
			//valueFormatString: "string"
		},
		axisY: {
			logarithmic: true, //change it to false
			title: "actual stock price $$",
			titleFontColor: "#6D78AD",
			lineColor: "#6D78AD",
			gridThickness: 0,
			lineThickness: 1,
			//valueFormatString: "0.0#"
		},
		axisY2: {
			title: "predicted stock value $$",
			titleFontColor: "#51CDA0",
			logarithmic: false, //change it to true
			lineColor: "#51CDA0",
			gridThickness: 0,
			lineThickness: 1
		},
		toolTip: {
			shared: true
		},
		legend: {
			verticalAlign: "top",
			dockInsidePlotArea: true
		},
		data: [{
			type: "line",
			//yValueFormatString: "0.0# g/cm3",
			//xValueFormatString: "#,##0 km",
			showInLegend: true,
			name: "Actual stock price",
			legendText: "{name}",
			dataPoints: <%out.print(dataPoints1);%>
		},
		{
			type: "line",
			//yValueFormatString: "###0 K",
			//xValueFormatString: "#,##0 km",
			axisYType: "secondary",
			showInLegend: true,
			name: "Predicted stock price",
			legendText: "{name}",
			dataPoints: <%out.print(dataPoints2);%>
		}]
	});
	chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>                              