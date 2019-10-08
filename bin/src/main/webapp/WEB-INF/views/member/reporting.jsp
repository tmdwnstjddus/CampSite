<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>

   <style>
* {
  box-sizing: border-box;
}
body {
  font-family: "Open Sans";
  background: #2c3e50;
  color: #ecf0f1;
  line-height: 1.618em;
}
.wrapper {
  max-width: 50rem;
  width: 100%;
  margin: 0 auto;
}
.tabs {
  position: relative;
  margin: 3rem 0;
  background: navy;
  height: 14.75rem;
}
.tabs::before,
.tabs::after {
  content: "";
  display: table;
}
.tabs::after {
  clear: both;
}
.tab {
  float: left;
}
.tab-switch {
  display: none;
}
.tab-label {
  position: relative;
  display: block;
  line-height: 2.75em;
  height: 3em;
  padding: 0 1.618em;
  background: navy;
  border-right: 0.125rem solid navy;
  color: #fff;
  cursor: pointer;
  top: 0;
  transition: all 0.25s;
}
.tab-label:hover {
  top: -0.25rem;
  transition: top 0.25s;
}
.tab-content {
  height: 12rem;
  position: absolute;
  z-index: 1;
  top: 2.75em;
  left: 0;
  padding: 1.618rem;
  background: #fff;
  color: #2c3e50;
  opacity: 0;
}
.tab-switch:checked + .tab-label {
  background: #fff;
  color: #2c3e50;
  border-bottom: 0;
  border-top: 0.125rem solid #2c3e50;
  border-left: 0.125rem solid #2c3e50;
  border-right: 0.125rem solid #2c3e50;
  transition: all 0.35s;
  z-index: 1;
  top: -0.0625rem;
}
.tab-switch:checked + label + .tab-content {
  z-index: 2;
  opacity: 1;
  transition: all 0.35s;
}
    </style>
	<title>캠핑장 통계</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" />
	
</head>
<body class="animsition"> 

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
        <h4 class="m-text20 p-b-36 p-t-15 text-center" style="font-size: 28px; font-weight: bolder;">캠핑장 통계</h4> 
        
          
<div class="wrapper">
  <div class="tabs">
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch">
      <label for="tab-1" class="tab-label">캠핑장별 예약횟수</label>
      <div class="tab-content"><div id="camp-chart" style="width: 800px; height: 500px; text-align: center;"></div></div>
    </div>
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-2" class="tab-switch">
      <label for="tab-2" class="tab-label">캠핑용품별 판매량</label>
      <div class="tab-content"><div id="product-chart" style="width: 800px; height: 500px; text-align: center;"></div></div>
    </div>
  </div>
</div>                   
  	<br><br><br><br><br><br><br><br>
	
	
	<!-- Footer -->
	<jsp:include page="../include/footer" />

	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />
	
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        var data = google.visualization.arrayToDataTable([
            ['캠핑장 이름', '예약 횟수'],
            <c:forEach var="report" items="${ reports }" varStatus="status">
             ['${ report.campName }', '${ report.reserve }'],
            </c:forEach>
            ]);

        var options = {
            title: '캠핑장별 예약 횟수',
            subtitle: '통계 년도: 2018-2019',
            bar: { groupWidth: '70%' },
            isStacked: true,
            colors:['#262da6'],
            hAxis: {
	            		title: '캠핑장 이름',
            		},
            	vAxis: {
		            	title: '예약횟수'
            			}
            		};
		
        var chart = new google.charts.Bar(document.getElementById('camp-chart'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
      } 

      
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawVisualization2);

      function drawVisualization2() {
        var data = google.visualization.arrayToDataTable([
            ['캠핑용품 이름', '판매량'],
            <c:forEach var="reports" items="${ reportss }" varStatus="status">
             ['${ reports.productName }', '${ reports.sell }'],
            </c:forEach>
            ]);

        var options = {
            title: '캠핑용품별 판매량',
            subtitle: '통계 년도: 2018-2019',
            isStacked: true,
            colors:['#262da6'],
            hAxis: {
	            		title: '캠핑용품',
            		},
            	vAxis: {
		            	title: '판매량'
            			}
            		};
		
        var chart = new google.charts.Bar(document.getElementById('product-chart'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
      } 


      (function() {
    	    // 처음 탭만 활성화 시켜놓음
    	    if (!!location.hash) return;

    	    var link = document.querySelector('.tab-section > .tab-link');
    	    if (link) link.click();
    	})();
    </script>
</body>
</html>
