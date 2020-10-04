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
	map = new HashMap<Object,Object>(); map.put("label", sd.getDate()); map.put("y", num); list.add(map);
	i+=10;
}
 
String dataPoints1 = gsonObj.toJson(list);
 
list = new ArrayList<Map<Object,Object>>();
i=0;
for (StockData sd : repo.findAll()) {
	double num =Double.parseDouble(sd.getPredicted()); 
	map = new HashMap<Object,Object>(); map.put("label", sd.getDate()); map.put("y", num); list.add(map);
	i+=10;
}
 
String dataPoints2 = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>




<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Stock Prediction Portfolio</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<mvc:resources mapping="/css/**" location="/css/" />
<link rel="stylesheet" type="text/css" href="css/material-dashboard.css" />

<!--  <link href="../assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />-->
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="../assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="azure" data-background-color="white"
			data-image="../assets/img/sidebar-1.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
			<div class="logo">
				<a href="http://www.creative-tim.com"
					class="simple-text logo-normal"> My Portfolio </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item   "><a class="nav-link"
						href="/"> <i class="material-icons">dashboard</i>
							<p>Schlumberger</p>
					</a></li>
					<li class="nav-item  "><a class="nav-link"
						href="/cisco"> <i class="material-icons">dashboard</i>
							<p>Cisco</p>
					</a></li>
					
					<li class="nav-item active"><a class="nav-link" href="/slbAnalysis">
							<i class="material-icons">content_paste</i>
							<p>SLB Analysis</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="/ciscoAnalysis">
							<i class="material-icons">content_paste</i>
							<p>CISCO Analysis</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="/review">
							<i class="material-icons">person</i>
							<p>My Weekly Review</p>
					</a></li>
					
					
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<!-- <nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<form class="navbar-form">
							<div class="input-group no-border">
								<input type="text" value="" class="form-control"
									placeholder="Search...">
								<button type="submit"
									class="btn btn-white btn-round btn-just-icon">
									<i class="material-icons">search</i>
									<div class="ripple-container"></div>
								</button>
							</div>
						</form>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="javascript:;">
									<i class="material-icons">dashboard</i>
									<p class="d-lg-none d-md-block">Stats</p>
							</a></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="http://example.com" id="navbarDropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="d-lg-none d-md-block">Some Actions</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Mike John responded to
										your email</a> <a class="dropdown-item" href="#">You have 5
										new tasks</a> <a class="dropdown-item" href="#">You're now
										friend with Andrew</a> <a class="dropdown-item" href="#">Another
										Notification</a> <a class="dropdown-item" href="#">Another One</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="javascript:;" id="navbarDropdownProfile"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">person</i>
									<p class="d-lg-none d-md-block">Account</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownProfile">
									<a class="dropdown-item" href="#">Profile</a> <a
										class="dropdown-item" href="#">Settings</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Log out</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
 -->







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


<div class="content">
				<div class="container-fluid">

<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>



					<div class="row">

						<div class="col-lg-3 col-md-6 col-sm-6">

							<div class="card card-stats">

								<!-- <div class="card-header card-header-warning card-header-icon">-->
								<!-- <div class="card-icon">
                    <i class="material-icons">content_copy</i>
                  </div>-->
								<!-- <p class="card-category">Distribution</p>-->
								<div class="card-block text-center">
									<div class="card-header bg-info text-white ">
										<h4>
											<b>Moving Average</b>
										</h4>
									</div>
									<br>
									<h3 class="card-title font-weight-bold">
										<b>18.53</b>
									</h3>
									<!--<div class="card-body">0.9654</div>-->
									<!--<p>0.9654 </p>-->
									<!--<small>GB</small>-->
									<!-- </h3></div>-->

								</div>

								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
										<!--<i class="material-icons text-danger">warning</i>
                    <a href="javascript:;">Get More Space...</a>-->
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-6 col-sm-6">

							<div class="card card-stats">
								<!--      <div class="card-header card-header-success card-header-icon">-->
								<!-- <div class="card-icon">
                    <i class="material-icons">store</i>
                  </div>-->
								<!--  <p class="card-category">Correlation</p>-->
								<div class="card-block text-center">
									<div class="card-header bg-info text-white">
										<h4>
											<b>Correlation</b>
										</h4>
									</div>
									<br>
									<h3 class="card-title font-weight-bold">
										<b>0.60</b>
									</h3>
									<!--  <h3 class="card-title">Correlation
                   <p>0.9654 </p></h3>-->
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<!--   <div class="card-header card-header-danger card-header-icon">-->
								<!--   <div class="card-icon">
                    <i class="material-icons">info_outline</i>
                  </div>-->
								<!-- <p class="card-category">Moving Average</p>-->
								<div class="card-block text-center">
									<div class="card-header bg-info text-white">
										<h4>
											<b>Beta</b>
										</h4>
									</div>
									<br>
									<h3 class="card-title font-weight-bold">
										<b>1.38</b>
									</h3>
									<!--<h3 class="card-title">Moving Average
                   <p>0.9654 </p></h3>-->
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<!--  <div class="card-header card-header-info card-header-icon">-->
								<div class="card-block text-center">
									<div class="card-header bg-info text-white">
										<h4>
											<b>Implied Volatility</b>
										</h4>
									</div>
									<br>
									<h3 class="card-title font-weight-bold">
										<b>57.3</b>
									</h3>
									<!--      <div class="card-icon">
                    <i class="fa fa-twitter"></i>
                  </div>-->
									<!-- <p class="card-category">Standard Deviation</p>-->
									<!-- <h3 class="card-title">Standard Deviation
                   <p>0.9654 </p></h3>-->
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
									</div>
								</div>
							</div>
						</div>
					</div>


	
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-info">
									<h4 class="card-title ">Schlumberger Historical Values</h4>
									<p class="card-category">Period : 22/09/20-30/09/20</p>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table">
											<thead class=" text-primary">
												<th>Date</th>
												<th>Open</th>
												<th>High</th>
												<th>Low</th>
												<th>Actual Value</th>
												<th>Predicted Value</th>
											</thead>
											<tbody>

											<%
												 repo = (StockRepo) request.getAttribute("res");
												 i=0;
												for (StockData sd : repo.findAll()) {
														if(i++<20) continue;
											%>	
													
													<tr>
														<td><%= sd.getDate() %></td>
														<td><%= sd.getOpen() %></td>
														<td><%= sd.getHigh() %></td>
														<td><%= sd.getLow() %></td>
														<td><%= sd.getActual() %></td>
														
														<td class="text-primary"><%= sd.getPredicted() %></td>
													</tr>
											<%} %>	
											
											</tbody>


										</table>
									</div>
								</div>
							</div>
						</div>

</body>
</html>