<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html lang="ko">
<head>
	<title>TheCamp</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="include/cssimport.jsp" />
 
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="include/header.jsp"    />


	<!-- Slide1 -->
	<section class="slide1">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item2-slick1" style="background-image: url(/resources/images/main.png);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="fadeInDown">
							Welcome
						</span>

						<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="fadeInUp">
							The Camp
						</h2>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="zoomIn">
							<!-- Button -->

						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(/resources/images/main2.png);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="rollIn">
							Welcome
						</span>

						<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="lightSpeedIn">
							The Camp
						</h2>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="slideInUp">
							<!-- Button -->

						</div>
					</div>
				</div>

				<div class="item-slick1 item3-slick1" style="background-image: url(/resources/images/main3.png);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="rotateInDownLeft">
							Welcome
						</span>

						<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="rotateInUpRight">
							The Camp
						</h2>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="rotateIn">
							<!-- Button -->

						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

<!-- SUB IMAGE -->
         <div style="text-align: center; padding-top: 40px; width:100%">
            <img style="width:100%" src="resources/images/m1.png">
            <img style="width:100%" src="resources/images/m2.png">
            <img style="width:100%" src="resources/images/m3.png">
         </div>
			
	<!-- Banner2 -->
	<section class="banner2 bg5 p-t-10 p-b-65" style="background-color: #f0f0f0;">
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-md-8 col-lg-6 m-l-r-auto p-t-10 p-b-15" style="width: 2000px; height: 400px; text-align: center;">
						<span style="font-size: 24px; font-weight: bolder;">오시는 길</span>
					<div id="map" style="width:100%;height:100%;"></div>
				</div>

<!-- 				<div class="col-sm-10 col-md-8 col-lg-6 m-l-r-auto p-t-10 p-b-15" style="width: 600px; height: 400px; text-align: center;">
						<span style="font-size: 23px; font-weight: bolder;">날 씨</span>
							weather widget start
							<div id="m-booked-weather-bl250-8037"> <div class="booked-wzs-250-175 weather-customize" style="background-color:#043569;width:430px;" id="width3"> <div class="booked-wzs-250-175_in"> <div class="booked-wzs-250-175-data"> <div class="booked-wzs-250-175-left-img wrz-03"> <a target="_blank" href="https://www.booked.net/"> <img src="//s.bookcdn.com/images/letter/logo.gif" alt="booked.net" /> </a> </div> <div class="booked-wzs-250-175-right"> <div class="booked-wzs-day-deck"> <div class="booked-wzs-day-val"> <div class="booked-wzs-day-number"><span class="plus">+</span>20</div> <div class="booked-wzs-day-dergee"> <div class="booked-wzs-day-dergee-val">&deg;</div> <div class="booked-wzs-day-dergee-name">C</div> </div> </div> <div class="booked-wzs-day"> <div class="booked-wzs-day-d">H: <span class="plus">+</span>20&deg;</div> <div class="booked-wzs-day-n">L: <span class="plus">+</span>19&deg;</div> </div> </div> <div class="booked-wzs-250-175-info"> <div class="booked-wzs-250-175-city">가평 </div> <div class="booked-wzs-250-175-date">금요일, 04 10월</div> <div class="booked-wzs-left"> <span class="booked-wzs-bottom-l">7일 예보 보기</span> </div> </div> </div> </div> <a target="_blank" href="https://booked.kr/weather/gapyeong-41895"> <table cellpadding="0" cellspacing="0" class="booked-wzs-table-250"> <tr> <td>토</td> <td>일</td> <td>월</td> <td>화</td> <td>수</td> <td>목</td> </tr> <tr> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td> </tr> <tr> <td class="week-day-val"><span class="plus">+</span>18&deg;</td> <td class="week-day-val"><span class="plus">+</span>17&deg;</td> <td class="week-day-val"><span class="plus">+</span>16&deg;</td> <td class="week-day-val"><span class="plus">+</span>13&deg;</td> <td class="week-day-val"><span class="plus">+</span>15&deg;</td> <td class="week-day-val"><span class="plus">+</span>17&deg;</td> </tr> <tr> <td class="week-day-val"><span class="plus">+</span>10&deg;</td> <td class="week-day-val"><span class="plus">+</span>7&deg;</td> <td class="week-day-val"><span class="plus">+</span>9&deg;</td> <td class="week-day-val"><span class="plus">+</span>3&deg;</td> <td class="week-day-val"><span class="plus">+</span>3&deg;</td> <td class="week-day-val"><span class="plus">+</span>7&deg;</td> </tr> </table> </a> </div></div> </div><script type="text/javascript"> var css_file=document.createElement("link"); css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href",'https://s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1'); document.getElementsByTagName("head")[0].appendChild(css_file); function setWidgetData(data) { if(typeof(data) != 'undefined' && data.results.length > 0) { for(var i = 0; i < data.results.length; ++i) { var objMainBlock = document.getElementById('m-booked-weather-bl250-8037'); if(objMainBlock !== null) { var copyBlock = document.getElementById('m-bookew-weather-copy-'+data.results[i].widget_type); objMainBlock.innerHTML = data.results[i].html_code; if(copyBlock !== null) objMainBlock.appendChild(copyBlock); } } } else { alert('data=undefined||data.results is empty'); } } </script> <script type="text/javascript" charset="UTF-8" src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=41895&type=3&scode=2&ltid=3458&domid=593&anc_id=70493&cmetric=1&wlangID=24&color=043569&wwidth=430&header_color=ffffff&text_color=333333&link_color=08488D&border_form=1&footer_color=ffffff&footer_text_color=333333&transparent=0"></script>
							weather widget end				
				</div> -->
			</div>
	</section>


	<!-- Footer -->
	<jsp:include page="include/footer.jsp" />



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>


	<!-- js import -->
	<jsp:include page="include/jsimport.jsp" />

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=219465bf3c4ca07515f1e5f0590f119d"></script>
	<script type="text/javascript">

	function change(form)
	{
	if (form.url.selectedIndex !=0)
	parent.location = form.url.options[form.url.selectedIndex].value
	}
	function setCookie( name, value, expiredays )
	{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	function getCookie( name )
	{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
	var y = (x+nameOfCookie.length);
	if ( document.cookie.substring( x, y ) == nameOfCookie ) {
	if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
	endOfCookie = document.cookie.length;
	return unescape( document.cookie.substring( y, endOfCookie ) );
	}
	x = document.cookie.indexOf( " ", x ) + 1;
	if ( x == 0 )
	break;
	}
	return "";
	}
	if ( getCookie( "Notice" ) != "done" )
	{
	noticeWindow = window.open("/pop","_blank","width=520,height=475,history=no,resizable=no,status=no,scrollbars=no,menubar=no");
	//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
	noticeWindow.opener = self;
	}

	/* 지도 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.4819707, 126.8959965), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.4819707, 126.8959965); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);

	
	
</script>
</body>
</html>
