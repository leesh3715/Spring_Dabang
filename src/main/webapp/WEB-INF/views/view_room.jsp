<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>

<head>
<style>
    .r_wrap1 {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .r_wrap1 * {padding: 0;margin: 0;}
    .r_wrap1 .r_info {width: 284px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .r_wrap1 .r_info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .r_info .r_title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .r_info .r_close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .r_info .r_close:hover {cursor: pointer;}
    .r_info .r_body {position: relative;overflow: hidden;}
    .r_info .r_desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .r_desc .r_ellipsis {margin-right: 20px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .r_desc .r_jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .r_info .r_img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;} 
    .r_info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} 
    .r_info .r_link {color: #5085BB;}
</style>
   <meta charset="utf-8">

   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

   <title>방 올리기</title>
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
	
</head>

<body>
	
	<%@ include file="../../resources/include/header.jsp"%>	
		
   <!-- 허위매물 제재 정책 팝업 -->
   <div id="fakePropertyModal" data-uc-modal class="is-fade">
      <div class="is-modal-dialog">
         <div data-uc-panel>
            <div class="is-panel-body">
               <div data-uc-colgroup="">
                  <div class="is-col-lg12" style="font-size:0.8em; line-height: 2.8em">
                     <p>매물 등록</p>
                     <div>
                        <p>1) 전?월세 매물만 등록 가능</p>
                        <p>- 원룸, 1.5룸, 투룸, 쓰리룸, 오피스텔, 아파트에 해당하는 전,월세 매물만 등록 가능합니다.</p>
                        <p>&nbsp;&nbsp;&nbsp;ex) 상가, 사무실 등 주거 외 시설 불가</p>
                        <p>- LH/SH의 장기전세주택 상품과 고시원업(고시원,원룸텔 등), 쉐어하우스, 레지던스 등의 매물 등록은 불가합니다.</p>
                        <p>2) 직거래 매물 등록과 공인중개사 매물물 등록으로 구분</p>
                        <p>- 직거래 매물 : 개인사용자 회원의 경우 무료로 1개 매물 등록이 가능합니다.</p>
                        <p>- 공인중개사 매물 : 일반상품품, 지하철상품, 동상품, 대학교상품 등을 최소 10개 이상 구매 후 매물 등록 가능합니다.</p>
                        <p>3) 정확한 매물 위치 정보 입력</p>
                        <p>- 등록 매물의 정확한 주소를를 입력해야 합니다.</p>
                        <p>&nbsp;&nbsp;&nbsp;ex) 서울특별시 강남구 역삼동 635-2 / 서울특별시 강남구 태해란로 7길 2</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
	
	
   
<!-- 
      <div class="yellow-bg is-filter-nav">
         <div class="is-frame-sm">
            <div data-uc-colgroup="row-xs">
               <ul class="columns-xs5 is-clearfix">
                  <li class="uc-dropdown is-col" data-uc-dropdown="click" data-uc-dropdown-persistent="1"><button
                        type="button" class="is-dropdown-toggle is-btn-white is-align-mid w-full is-txt-left">원룸,홈스테이,셰어
                        <i class="la la-angle-down"></i></button>
                     <div class="is-dropdown-wrapper">
                        <div class="is-dropdown-inner" data-uc-listgroup="">
                           <div class="is-list-ver">
                              <ul>
                                 <li class="is-item"><a href="">원룸</a></li>
                                 <li class="is-item"><a href="">하숙</a></li>
                                 <li class="is-item"><a href="">쉐어하우스</a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </li>
                  <li class="uc-dropdown is-col" data-uc-dropdown="click" data-uc-dropdown-persistent="1"><button
                        type="button" class="is-dropdown-toggle is-btn-white is-align-mid w-full is-txt-left">월세,연세,전세
                        <i class="la la-angle-down"></i></button>
                     <div class="is-dropdown-wrapper">
                        <div class="is-dropdown-inner" data-uc-listgroup="">
                           <div class="is-list-ver">
                              <ul>
                                 <li class="is-item"><a href="javascript:filterInit('월세')"
                                       class="filter-chk month-chk">월세</a></li>
                                 <li class="is-item"><a href="javascript:filterInit('연세')"
                                       class="filter-chk year-chk1">연세</a></li>
                                 <li class="is-item"><a href="javascript:filterInit('전세')"
                                       class="filter-chk year-chk2">전세</a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </li>
                  <li class="uc-dropdown is-col" data-uc-dropdown="click" data-uc-dropdown-persistent="1"><button
                        type="button" class="is-dropdown-toggle is-btn-white is-align-mid w-full is-txt-left">가격
                        <i class="la la-angle-down"></i></button>
                     <div class="is-dropdown-wrapper">
                        <div class="is-dropdown-inner" data-uc-listgroup="">
                           <div id="monthPrice" class="range-wrap" style="display: none;">
                              <h3 class="is-mg-b_15">보증금</h3>
                              <div id="monthPriceRange1"></div>
                              <div data-uc-colgrou class="is-mg-t_5 is-filter-label">
                                 <div class="is-col-xs4 is-align-mid is-txt-left">
                                    <span style="margin-left:-2px;">0</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-center">
                                    <span>300</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-right">
                                    <span style="margin-right:-15px;">무한대</span>
                                 </div>
                              </div>
                              <hr>
                              <h3 class="is-mg-b_15">월세</h3>
                              <div id="monthPriceRange2"></div>
                              <div data-uc-colgrou class="is-mg-t_5 is-filter-label">
                                 <div class="is-col-xs4 is-align-mid is-txt-left">
                                    <span style="margin-left:-2px;">0</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-center">
                                    <span>500</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-right">
                                    <span style="margin-right:-15px;">무한대</span>
                                 </div>
                              </div>
                           </div>
                           <div id="yearPrice1" class="range-wrap" style="display: none;">
                              <h3 class="is-mg-b_15">보증금</h3>
                              <div id="yearPriceRange1"></div>
                              <div data-uc-colgrou class="is-mg-t_5 is-filter-label">
                                 <div class="is-col-xs4 is-align-mid is-txt-left">
                                    <span style="margin-left:-2px;">0</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-center">
                                    <span>150</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-right">
                                    <span style="margin-right:-15px;">무한대</span>
                                 </div>
                              </div>
                              <hr>
                              <h3 class="is-mg-b_15">연세</h3>
                              <div id="yearPriceRange2"></div>
                              <div data-uc-colgrou class="is-mg-t_5 is-filter-label">
                                 <div class="is-col-xs4 is-align-mid is-txt-left">
                                    <span style="margin-left:-2px;">0</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-center">
                                    <span>500</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-right">
                                    <span style="margin-right:-15px;">무한대</span>
                                 </div>
                              </div>
                           </div>
                           <div id="yearPrice2" class="range-wrap" style="display: none;">
                              <h3 class="is-mg-b_15">전세</h3>
                              <div id="yearPriceRange"></div>
                              <div data-uc-colgrou class="is-mg-t_5 is-filter-label">
                                 <div class="is-col-xs4 is-align-mid is-txt-left">
                                    <span style="margin-left:-2px;">0</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-center">
                                    <span>1000</span>
                                 </div>
                                 <div class="is-col-xs4 is-align-mid is-txt-right">
                                    <span style="margin-right:-15px;">무한대</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </li>
                  <li class="uc-dropdown is-col" data-uc-dropdown="click" data-uc-dropdown-persistent="1"><button
                        type="button" class="is-dropdown-toggle is-btn-white is-align-mid w-full is-txt-left">관리비
                        <i class="la la-angle-down"></i></button>
                     <div class="is-dropdown-wrapper">
                        <div class="is-dropdown-inner" data-uc-listgroup="">
                           <div id="slider-range2"></div>
                           <div data-uc-colgrou class="is-mg-t_5 is-filter-label">
                              <div class="is-col-xs4 is-align-mid is-txt-left">
                                 <span style="margin-left:-2px;">0</span>
                              </div>
                              <div class="is-col-xs4 is-align-mid is-txt-center">
                                 <span>10</span>
                              </div>
                              <div class="is-col-xs4 is-align-mid is-txt-right">
                                 <span style="margin-right:-15px;">무한대</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </li>
                  <li class="uc-dropdown is-col" data-uc-dropdown="click" data-uc-dropdown-persistent="1"><button
                        type="button" class="is-dropdown-toggle is-btn-white is-align-mid w-full is-txt-left">추가 옵션
                        <i class="la la-angle-down"></i></button>
                     <div class="is-dropdown-wrapper">
                        <div class="is-dropdown-inner" data-uc-listgroup="">
                           <div class="is-input-field">
                              <label for="info_type1" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type1" name="" value=""><span>주차가능</span></label>
                              <label for="info_type2" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type2" name="" value=""><span>반려동물</span></label>
                              <label for="info_type3" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type3" name="" value=""><span>풀옵션</span></label>
                              <label for="info_type4" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type4" name="" value=""><span>빌트인</span></label>
                              <label for="info_type5" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type5" name="" value=""><span>엘레베이터</span></label>
                              <label for="info_type6" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type6" name="" value=""><span>베란다/발코니</span></label>
                              <label for="info_type7" class="is-chk-btn no-margin"><input type="checkbox"
                                    id="info_type7" name="" value=""><span>전세자금대출</span></label>
                           </div>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </header> -->
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

	<c:set var="list" value="${List }"/>	
   <li class="content_wrap">
      <div class="is-frame-md is-pd-y_50" data-uc-tab>
         <ul class="is-tab-nav">
            <li class="is-active">
            <a href="#prdList1" data-uc-click="tab">이지역 핫한 방 </a></li>
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
	
      <div id="view" data-uc-modal>
         <div class="is-modal-dialog">
            <div data-uc-panel>
               <div class="is-panel-head is-pd-b_0">
                  <div class="is-col-xs6 is-align-mid is-txt-left">
                     <span>#주소</span>
                    
                  </div>
                  <div class="is-col-xs6 is-align-mid is-txt-right">
                     <a href="#call" data-uc-click="modal"><img src="resources/images/sub_2_3/icon/13.png" alt="" /></a>
                     <a href="#"><img src="resources/images/sub_2_3/icon/14.png" alt="" /></a>
                     <a href="#" data-uc-dismiss="modal"><img src="resources/images/sub_2_3/icon/15.png" alt="" /></a>
                  </div>
               </div>
               <div class="is-panel-body">
                  <div data-uc-colgroup="row-sm">
                     <div class="is-col-xs7">
                        <div>
                           <ul class="slider-for2">
                              <li><img src="resources/images/sub_2_3/1.jpg" alt="" /></li>
                              <li><img src="resources/images/sub_2_3/2.jpg" alt="" /></li>
                              <li><img src="resources/images/sub_2_3/3.jpg" alt="" /></li>
                              <li><img src="resources/images/sub_2_3/4.jpg" alt="" /></li>
                           </ul>
                        </div>
                        <div class="is-mg-t_20">
                           <ul class="slider-nav2">
                              <li><img src="resources/images/sub_2_3/1.jpg" alt="" /></li>
                              <li><img src="resources/images/sub_2_3/2.jpg" alt="" /></li>
                              <li><img src="resources/images/sub_2_3/3.jpg" alt="" /></li>
                              <li class="is-relative"><img src="resources/images/sub_2_3/4.jpg" alt="" />
                              <a href="#pichure" data-uc-click="modal" class="pichure"><span>+</span>더보기</a></li>
                           </ul>
                        </div>
                     </div>
                        <div class="is-col-xs5">
                        <div data-uc-table>
                           <table class="is-table-hor">
                              <thead>
                                 <tr>
                                    <th>인실</th>
                                    <th>월세/보증금</th>
                                    <th>전세</th>
                                    <th>관리비</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <td>${ tdto.getR_person() }</td>
                                    <td>${ tdto.getR_rentfee() } </td>
                                    <td>${ tdto.getR_deposit()}</td>
                                    <td>${ tdto.getR_utility()}</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div data-uc-colgroup>
                           <p class="is-col-xs6 is-align-mid is-txt-left">층/건물층수 : 1층/4층</p>
                           <p class="is-col-xs6 is-align-mid is-txt-right">전용면적 : 23.14m² (7P)</p>
                        </div>
                        <div data-uc-colgroup>
                           <p class="is-col-xs12 is-align-mid is-txt-left">관리비 포함항목 : 수도, 인터넷, TV</p>
                        </div>
                        <div data-uc-colgroup>
                           <p class="is-col-xs6 is-align-mid is-txt-left">반려동물 : 가능</p>
                           <p class="is-col-xs6 is-align-mid is-txt-right">베란다/발코니 : 있음</p>
                        </div>
                        <div data-uc-colgroup>
                           <p class="is-col-xs6 is-align-mid is-txt-left">난방종류 : 개별난방</p>
                           <p class="is-col-xs6 is-align-mid is-txt-right">입주가능일 : 즉시입주</p>
                        </div>
                        <div data-uc-colgroup class="is-mg-t_10">
                           <ul class="columns-xs6">
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/1.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/2.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/3.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/4.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/5.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/6.png"></ll>
                           </ul>
                        </div>
                        <div data-uc-colgroup="">
                           <ul class="columns-xs6">
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/7.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/8.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/9.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/10.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/11.png"></ll>
                              <ll class="is-col"><img src="resources/images/sub_2_3/icon/12.png"></ll>
                           </ul>
                        </div>
                        <div class="is-mg-t_10">
                           <!-- <img src="resources/images/sub_2_3/6.jpg" alt="" /> -->
                        </div>
                     </div>
                          
                  </div>  
               </div>
            </div>
         </div>
      </div>
      
       <div id="pichure" data-uc-modal style="z-index: 9999;">
         <div class="is-modal-dialog" style="background-color: #000; padding: 20px;">
            <div>
               <ul class="slider-nav">
                  <li><img src="resources/images/sub_2_3/1.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/2.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/3.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/4.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/5.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/1.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/2.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/3.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/4.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/5.jpg" alt="" /></li>
               </ul>
            </div>
            <div>
               <ul class="slider-for">
                  <li><img src="resources/images/sub_2_3/1.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/2.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/3.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/4.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/5.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/1.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/2.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/3.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/4.jpg" alt="" /></li>
                  <li><img src="resources/images/sub_2_3/5.jpg" alt="" /></li>
               </ul>
            </div>
         </div>
      </div>
   
       <c:forEach items="${list }" var="tdto">
      <div id="call" data-uc-modal>
         <div class="is-modal-dialog">
            <div data-uc-panel>
               <div class="is-panel-head is-pd-b_0">
                  <h3>
                     연락처보기
                  </h3>
                  <a href="#fakelink" data-uc-dismiss="modal"><img src="resources/images/sub_2_3/icon/15.png" alt="" /></a>
               </div>
               <div class="is-panel-body">
                  <div class="is-txt-center">
                     <img src="resources/images/sub_2_3/icon/18.png" alt="" />
                     <p class="is-name">아정오피스</p>
                     <p class="is-addr">충청남도 천안시 서북구 성환읍</p>
                     <p class="is-phone">010-2985-4298</p>
                  </div>
               </div>
               <div class="is-panel-foot is-pd-t_0">
                  <div class="is-txt-left">
                     <p class="is-ye">연락요청하기</p>
                     <p>연락처를 남겨주시면, 확인 후 연락드립니다.</p>
                     <div class="input-call">
                        <input type="text" id="" name="" value="">
                        <a href="#">연락받기</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </c:forEach>
      <script type="text/javascript">
         $(document).on('click', '[data-uc-click="modal"].pichure', function () {
            $('.slider-nav').slick({
               slidesToShow: 5,
               slidesToScroll: 1,
               dots: false,
               arrows: false,
               asNavFor: '.slider-for',
               centerMode: false,
               focusOnSelect: true,
               infinite: false
            });
            $('.slider-for').slick({
               slidesToShow: 1,
               slidesToScroll: 1,
               arrows: true,
               prevArrow: '<span style="position: absolute; top: 50%; left: 15px; z-index: 9999; cursor: pointer;"><img src="resources/images/sub_2_3/icon/19.png" alt="" ></span>',
               nextArrow: '<span style="position: absolute; top: 50%; right: 15px; z-index: 9999; cursor: pointer;"><img src="resources/images/sub_2_3/icon/20.png" alt="" ></span>',
               fade: true,
               centerMode: true,
               asNavFor: '.slider-nav'
            });
         });

         $(document).on('click', '[data-uc-click="modal"].item', function () {
            $('.slider-nav2').slick({
               slidesToShow: 4,
               slidesToScroll: 1,
               dots: false,
               arrows: false,
               asNavFor: '.slider-for2',
               centerMode: false,
               focusOnSelect: true,
               infinite: false
            });
            $('.slider-for2').slick({
               slidesToShow: 1,
               slidesToScroll: 1,
               arrows: true,
               prevArrow: '<span style="position: absolute; top: 50%; left: 15px; z-index: 9999; cursor: pointer;"><img src="resources/images/sub_2_3/icon/16.png" alt="" ></span>',
               nextArrow: '<span style="position: absolute; top: 50%; right: 15px; z-index: 9999; cursor: pointer;"><img src="resources/images/sub_2_3/icon/17.png" alt="" ></span>',
               fade: true,
               centerMode: false,
               asNavFor: '.slider-nav2'
            });
         });
      </script>
      
      <div class="is-bg-brown is-pd-y_30">
         <div class="is-frame-md">
            <h3 class="is-txt-center" style="font-size: 22px; color: #1d160e; margin-bottom: 30px;">청춘다방, 간편<span
                  style="font-size: 22px; color: #726c5c; ">하게 이용하는 방법</span></h3>
            <ul class="columns-xs5 is-clearfix">
               <li class="is-col" style="border-right: 2px solid #f8f2e6; height: 80px;">
                  <img src="resources/images/sub_2_3/icon_1.png">
               </li>
               <li class="is-col" style="border-right: 2px solid #f8f2e6; height: 80px;">
                  <img src="resources/images/sub_2_3/icon_2.png">
               </li>
               <li class="is-col" style="border-right: 2px solid #f8f2e6; height: 80px;">
                  <img src="resources/images/sub_2_3/icon_3.png">
               </li>
               <li class="is-col" style="border-right: 2px solid #f8f2e6; height: 80px;">
                  <img src="resources/images/sub_2_3/icon_4.png">
               </li>
               <li class="is-col">
                  <img src="resources/images/sub_2_3/icon_5.png">
               </li>
            </ul>

         </div>
      </div>
        
    <!-- 지도 시작-->
     
     
     <%-- <div style="width:100%; text-align: center;">
     <%@ include file="../../resources/include/view_room_map.jsp"%>
     <div id="map" style="width:100%;height:500px;"></div> --%>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="서울" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <ul id="placesList" hidden></ul>
        <div id="pagination" hidden></div>
    </div>
</div>
<div>   
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51f66e54fd5e327b654103d5fc9ca1&libraries=services"></script>
<script>
var json = ${json};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.54714542787447, 126.93276890560529), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
/* var infowindow = new kakao.maps.InfoWindow({zIndex:1}); */

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t123.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


var positions = [];
for(var i = 0; i < json.length; i++) {
	var Photosrc = json[i].r_photo.split('/');
	console.log(Photosrc[0]);
	positions.push({
		title : '<div class="r_wrap">' + 
        '    <div class="r_info">' + 
        '        <div class="r_title">' + json[i].r_no + 
        '            <div class="r_close" onclick="closeOverlay()" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="r_body">' + 
        '            <div class="r_img">' +
        '                <img src="'+Photosrc[0]+'" width="73" height="70">' +
        '           </div>' + 
        '            <div class="r_desc">' + 
        '                <div class="r_ellipsis">'+ json[i].r_address + 
        '                <div class="r_jibun ellipsis">방타입:'+json[i].r_btype+'&nbsp;&nbsp;&nbsp;&nbsp; 가격: '+json[i].r_rentfee +'</div>' + 
        '                <div><a href="room_cont.do?r_no='+json[i].r_no+'" class="r_link">자세히 보기</a></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>',
		latlng : new kakao.maps.LatLng(json[i].r_location1, json[i].r_location2)
	});		 														
}

for(var i = 0; i < positions.length; i++){
console.log(positions[i]);
}

var markers = [];
for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].title // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseover', makeOutListener(infowindow));

}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}

</script>
     </div>
      <!-- 하단 시작 -->
      <footer class="footer">
         <div class="is-frame-md is-relative">
            <div class="is-area-top">
               <ul>
                  <li class=""><a href="#">회사소개</a></li>
                  <li class=""><a href="#">이용약관</a></li>
                  <li class=""><a href="#">개인정보 처리방침</a></li>
                  <li class=""><a href="#">위치기반</a></li>
                  <li class=""><a href="#">중개사 사이트 바로가기</a></li>
               </ul>
            </div>
            <div class="is-area-mid">
               <p><span>상호: </span><span>대표: </span><span>사업자등록번호: </span></p>
               <p><span>주소: </span></p>
               <p><span>팩스: </span><span>통신판매업 신고번호: </span></p>
               <p><span>서비스 이용문의: </span><span>이메일: </span><span>서비스제휴문의: </span></p>
            </div>
            <div class="is-area-bot">
               <!-- 아이콘 필요 -->
               <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
               <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
               <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
               <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
               <p class="is-copyright">Copyright .All Rights Reserved.</p>
            </div>
         </div>
      </footer>
      <!-- 하단 끝 -->

   </li>

</body>
<script src="resources/plugins/owlCarousel/owl.carousel.min.js"></script>
<script>
   $('.owl-carousel').owlCarousel({
      loop: true,
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