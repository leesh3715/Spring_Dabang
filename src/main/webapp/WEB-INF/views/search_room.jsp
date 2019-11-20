<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
 <meta name="description" content="">
   <meta name="author" content="">

   <meta name="viewport" content="width=device-width,initial-scale=1">

   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" href="resources/css/uc.min.css">
   <link rel="stylesheet" href="resources/css/basic.css">
   <link rel="stylesheet" href="resources/css/slick.css">
   <link rel="stylesheet" href="resources/css/slick-theme.css">
   <link rel="stylesheet" href="resources/plugins/fonts/line-awesome.css">
   <link rel="stylesheet" href="resources/plugins/owlCarousel/owl.carousel.min.css">
   <link rel="stylesheet" href="resources/plugins/owlCarousel/owl.theme.default.min.css">
   <link rel="stylesheet" href="resources/css/style_sub2_3.css">
   <link rel="stylesheet" href="resources/plugins/jquery-ui/jquery-ui.css">
   <link rel="stylesheet" href="resources/css/layout.css">
   <link rel="stylesheet" href="resources/plugins/slick/slick.css">
   <link rel="stylesheet" href="resources/css/mapsearch.css">
   
   <script src="resources/js/jquery-3.3.1.min.js"></script>
   <script src="resources/js/uc.lib.min.js"></script>
   <script src="resources/js/uc.plugin.min.js"></script>
   <script src="resources/js/slick.min.js"></script>
   <script src="resources/js/common.js"></script>

<title>청춘다방</title>
</head>
<script>
      $(function () {


         $('#reset').click(function () {
            $("#yearPriceRange").slider({
               range: true,
               min: 0,
               max: 2000,
               values: [0, 2000],
               slide: function (event, ui) {

               }
            });

            $("#yearPriceRange1").slider({
               range: true,
               min: 0,
               max: 300,
               values: [0, 300],
               slide: function (event, ui) {

               }
            });
            $("#yearPriceRange2").slider({
               range: true,
               min: 0,
               max: 500,
               values: [0, 1000],
               slide: function (event, ui) {

               }
            });

            $("#monthPriceRange1").slider({
               range: true,
               min: 0,
               max: 300,
               values: [0, 600],
               slide: function (event, ui) {

               }
            });
            $("#monthPriceRange2").slider({
               range: true,
               min: 0,
               max: 50,
               values: [0, 100],
               slide: function (event, ui) {

               }
            });
            $("#slider-range2").slider({
               range: true,
               min: 0,
               max: 10,
               values: [0, 20],
               slide: function (event, ui) {

               }
            });
            filterInit();
         })

         $("#yearPriceRange").slider({
            range: true,
            min: 0,
            max: 2000,
            values: [0, 2000],
            slide: function (event, ui) {

            }
         });

         $("#yearPriceRange1").slider({
            range: true,
            min: 0,
            max: 300,
            values: [0, 300],
            slide: function (event, ui) {

            }
         });
         $("#yearPriceRange2").slider({
            range: true,
            min: 0,
            max: 500,
            values: [0, 1000],
            slide: function (event, ui) {

            }
         });

         $("#monthPriceRange1").slider({
            range: true,
            min: 0,
            max: 300,
            values: [0, 600],
            slide: function (event, ui) {

            }
         });
         $("#monthPriceRange2").slider({
            range: true,
            min: 0,
            max: 50,
            values: [0, 100],
            slide: function (event, ui) {

            }
         });
         $("#slider-range2").slider({
            range: true,
            min: 0,
            max: 10,
            values: [0, 20],
            slide: function (event, ui) {

            }
         });
      });

      function filterInit(name) {

         if (name == '전세') {
            $('.filter-chk').removeClass('is-active');
            $('.year-chk2').addClass('is-active');
            $('.range-wrap').css('display', 'none');
            $('#yearPrice2').css('display', 'block');
         } else if (name == '연세') {
            $('.filter-chk').removeClass('is-active');
            $('.year-chk1').addClass('is-active');
            $('.range-wrap').css('display', 'none');
            $('#yearPrice1').css('display', 'block')
         } else if (name == '월세') {
            $('.filter-chk').removeClass('is-active');
            $('.month-chk').addClass('is-active');
            $('.range-wrap').css('display', 'none');
            $('#monthPrice').css('display', 'block')
         } else {
            $('.range-wrap').css('display', 'none');
            $('.filter-chk').removeClass('is-active');
         }
      }
   </script>



<body>
<%@ include file="../../resources/include/header.jsp"%>	


<%-- <c:out value="${List}"/>	 --%>

  <c:set var="list" value="${List }"/>	
   <li class="content_wrap">
      <div class="is-frame-md is-pd-y_50" data-uc-tab>
      <div align="center"><b><c:out value="${search_text}"/></b> (으)로 검색한 결과 입니다.</div>
         <ul class="is-tab-nav">
            <li class="is-active">
            <a href="#prdList1" data-uc-click="tab"><b>핫한 방</b> </a></li>
         </ul>
         <div class="is-tab-content">
            <div id="prdList1" class="is-tab-pane is-active is-show">
               <div class="owl-carousel owl-theme is-product-wrap">
              
              <c:forEach items="${list }" var="tdto" varStatus="status">
                  <div id="item" class="item">
                     <div class="is-thumb">
                        <a href="room_cont.do?r_no=${tdto.getR_no() }">
                        <img style="width:450px; height:150px;"src="${tdto.getR_photoOne() }" alt="" /></a>
                     </div>
                     <div class="is-info">
                        <span>${ tdto.getR_btype()} <span>#</span></span>
                        <c:set var="String" value="${ tdto.getR_rentfee()}"/>
                        
                        <c:if test="${fn:contains(String,'/')}">
                        <p>보증금/월세</p>
                        <h3>${ tdto.getR_rentfee()}</h3>
                        </c:if>
                        
                        <c:if test="${!fn:contains(String,'/')}">
                        <p>전세</p>
                        <h3>${ tdto.getR_deposit()}</h3>
                        </c:if>
                        
                        <p>${ tdto.getR_floor()}층, ${ tdto.getR_dimension()}m²</p>
                         <p>관리비 ${ tdto.getR_utility()}, ${ tdto.getR_detail()})</p>
                     </div>
                  </div>
                </c:forEach>
                
               </div>
            </div>
         </div>
      </div>
      
      
</body>

<script src="resources/plugins/owlCarousel/owl.carousel.min.js"></script>
<script>
   $('.owl-carousel').owlCarousel({
      loop: false,
      margin: 10,
      nav: true,
      dots: true,
      responsive: {
         0: {
            items: 1
         },
         600: {
            items: 3
         },
         1000: {
            items: 5	
         }
      }
   })
</script>

</html>