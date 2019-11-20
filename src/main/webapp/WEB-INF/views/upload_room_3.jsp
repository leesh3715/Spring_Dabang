<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
   <meta charset="utf-8">
	
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

   <title>방 올리기</title>
   <meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/basic.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/slick-theme.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/style_sub2_2.css">
	<link rel="stylesheet" href="resources/css/fine-uploader-gallery.css">
	<link rel="stylesheet" href="resources/plugins/jquery-ui/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51f66e54fd5e327b654103d5fc9ca1&libraries=services"></script>

   <!-- /* Bootstrap 3.3.2 */ -->
   
   <!-- <link rel="stylesheet" href="./plugins/bootstrap/css/bootstrap.min.css">
   <link rel="stylesheet" href="./plugins/bootstrap/css/bootstrap-theme.min.css">
   <script src="./plugins/bootstrap/js/bootstrap.min.js"></script> -->
   
   

</head>

<body>
<c:set var="tdto" value="${tdto }"/>



   
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

   <!--header-->
    <%@ include file="../../resources/include/header.jsp"%>



<div class="container">
<div class="gongyu my1 my1-4">

      <div style="background-image: url(resources/images/sub_2_2/2_2.jpg); background-position: center center; height: 170px;">
         <div class="is-frame-md is-relative" style="height: 100%;">
            <b class="title">방 올리기</b>

            <ul class="is-tab-nav columns-xs3" style="position: absolute; bottom: 0; left: 0; width: 100%;">
               <li class="is-col is-align-mid is-txt-left is-active">
                  <a href="<%=request.getContextPath() %>/upload_room.do">
                     <img src="resources/images/sub_2_2/i_1.png" alt="" >
                     
                  </a></li>
               <li class="is-col is-align-mid is-txt-center">
                  <a href="<%=request.getContextPath() %>/upload_room_2.do">
                     <img src="resources/images/sub_2_2/i_2.png" alt="" >
                     
                  </a></li>
               <li class="is-col is-align-mid is-txt-right">
                  <a href="<%=request.getContextPath() %>/upload_room_3.do">
                     
                     <img src="resources/images/sub_2_2/i_3_over.png" alt="" >
                  </a></li>
            </ul>
         </div>
      </div>
      
   <div class="tab_content">
                <div id="tab1">
                    <div class="wrap">
                        <form method="post" action="<%=request.getContextPath()%>/upload_room_ok.do" enctype="multipart/form-data">
							
							<input type="hidden" name="r_btype" value="셰어하우스">
							 	
                       	<c:if test="${!empty param.r_no  }">
                       	<input type="hidden" name="r_no" value="${param.r_no }">
                       	</c:if>
                       	<c:if test="${empty param.r_no  }">
                       	<input type="hidden" name="r_no" value="0">
                       	</c:if>
                       	
                            <div class="write_box write1">
                                <table class="type1">
                                    <thead>
                                        <tr>
                                            <th colspan="2">매물종류</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>성별</th>
                                            <td>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio1_1" name="r_gender" class="type1" title="" value="남자">
                                                    <label for="radio1_1">남자</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio1_2" name="r_gender" class="type1" title="" value="여자">
                                                    <label for="radio1_2">여자</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio1_3" name="r_gender" class="type1" title="" value="혼숙">
                                                    <label for="radio1_3">혼숙</label>
                                                </div>
                                                
                                                    <c:if test="${tdto.getR_gender() eq '남자'}">
                            					<script>
                                                    $("input:radio[name='r_gender']:radio[value='남자']").prop('checked', true); // 선택하기
                                                 </script>
                                                </c:if>
                                                <c:if test="${tdto.getR_gender() eq '여자'}">
                                                 <script>
                                                    $("input:radio[name='r_gender']:radio[value='여자']").prop('checked', true); // 선택하기
                                                 </script>
                                                 </c:if>
                                                 <c:if test="${tdto.getR_gender() eq '혼숙'}">
                                                 <script>
                                                    $("input:radio[name='r_gender']:radio[value='혼숙']").prop('checked', true); // 선택하기
                                                 </script>
                                                 </c:if>
                                            </td>
                                        </tr>
										<c:if test="${tdto.getR_person() ne null}">
											<tr>
												<th>방 타입</th>
												<td>
													<div class="is-input-field use-addon">
														<input type="text" name="r_person" value="${tdto.getR_person()}"> <span
															class="is-addon--back-default" >인실</span>
													</div>
												</td>
											</tr>
										</c:if>

										<c:if test="${tdto.getR_person() eq null}">
											<tr>
												<th>방 타입</th>
												<td>
													<div class="is-input-field use-addon">
														<input type="text" name="r_person"> <span
															class="is-addon--back-default">인실</span>
													</div>
												</td>
											</tr>
										</c:if>

									</tbody>
                                </table>
                            </div>


                         <div class="write_box write2">
                                <table class="type1">
                                    <thead>
                                        <tr>
                                            <th colspan="2">위치 정보
                                                <ul>
                                                    <li>* 등기부등본 상의 주소를 입력해 주세요.</li>
                                                </ul>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                              <th>주소</th>
                                            <td>
                                            
                                            <c:if test="${!empty tdto.getR_address() }">                                            	
                                                <input type="text" size="40" id="sample5_address" name="r_address" value="${tdto.getR_address().split(",")[0]}" >
												<input type="button" onclick="find_map()" value="주소 검색"><br><br>
												<input type="text" size="40" id="sample5_address_2" name="r_address2" value="${tdto.getR_address().split(",")[1]}" >
												<input type="hidden" size="40" id="map_location1" name="r_location1" placeholder="location1" value="${tdto.getR_location1() }">
												<input type="hidden" size="40" id="map_location2" name="r_location2" placeholder="location2" value="${tdto.getR_location2() }">
											</c:if>
											 <c:if test="${empty tdto.getR_address() }">                                             	
                                                <input type="text" size="40" id="sample5_address" name="r_address" placeholder="주소를 검색하세요" readonly >
												<input type="button" onclick="find_map()" value="주소 검색"><br><br>
												<input type="text" size="40" id="sample5_address_2" name="r_address2" placeholder="상세 주소를 입력하세요" >
												<input type="hidden" size="40" id="map_location1" name="r_location1" placeholder="location1">
												<input type="hidden" size="40" id="map_location2" name="r_location2" placeholder="location2">
											</c:if>
												
												<div id="map" style="width:600px;height:300px;margin-left:10px; margin-top:10px;display:none "></div>
												<%-- 찍는 곳의 좌표 위,경도 값 / hidden으로 받을 것 --%>
												
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    function find_map() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면_
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);

                        console.log(result.x);
                        console.log(result.y);
                        console.log(coords);
                        
						var mapLocation = result.y + ", " + result.x;
						console.log(mapLocation);

						
                        document.getElementById("map_location1").value = result.y;
                        document.getElementById("map_location2").value = result.x;
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();     
    }
</script>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>


                           <div class="write_box write3">
                                <table class="type1">
                                    <thead>
                                        <tr>
                                            <th colspan="2">거래 정보
                                                <ul>
                                                    <li>* 처음에 선택한 거래 종류가 우선노출됩니다.</li>
                                                    <li>* 예치금이 있는 경우 보증금 입력란에 필히 입력하세요.</li>
                                                </ul>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th rowspan="3">거래 종류</th>
                                            <td>
                                             	<c:if test="${tdto.getR_deposit() eq null }">
												
                                            	 <div class="info">
                                                    <span>보증금 / 월세 </span>
                                                    <input type="text" class="type1" name="r_rentfee" value="${tdto.getR_rentfee().split("/")[0]}">
                                                    &nbsp;&nbsp;/&nbsp;&nbsp;
                                                    <input type="text" class="type1" name="r_rentfee2" value="${tdto.getR_rentfee().split("/")[1]}">
                                                </div>
                                                </c:if>
                                               <c:if test="${tdto.getR_deposit() ne null }">
                                               <div class="info">
                                                    <span>보증금 / 월세 </span>
                                                    <input type="text" class="type1" name="r_rentfee" value="">
                                                    &nbsp;&nbsp;/&nbsp;&nbsp;
                                                    <input type="text" class="type1" name="r_rentfee2" value="">
                                                </div>
                                               </c:if>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <div class="write_box write4">
                                <table class="type1">
                                    <thead>
                                        <tr>
                                            <th colspan="4">기본 정보</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>건물 크기<br>(1p=3.3058)</th>
                                            <td colspan="3">
                                                <ul>
                                                <c:if test="${tdto.getR_dimension() ne null }">
                                                    <li>
                                                       전용 면적&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_dimension" value="${tdto.getR_dimension().split("/")[0]}">m²
                                                    </li>
                                                    <li>
                                                        평수&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_dimension2"  value="${tdto.getR_dimension().split("/")[1]}">평
                                                    </li>
                                                    </c:if>
                                                     <c:if test="${tdto.getR_dimension() eq null }">
                                                    <li>
                                                       전용 면적&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_dimension">&nbsp;&nbsp;m²
                                                    </li>
                                                    <li>
                                                        평수&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_dimension2">&nbsp;&nbsp;평
                                                    </li>
                                                    </c:if>
                                                </ul>										
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <th>건물 층수</th>
                                            <td colspan="3">
                                                <ul>
                                                     <c:if test="${tdto.getR_floor() ne null }">
                                                    <li>
                                                        건물 층수&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_floor"  value="${tdto.getR_floor().split("/")[0]}">&nbsp;&nbsp;층
                                                    </li>
                                                   
                                                    <li>
                                                        해당 층수&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_floor2"  value="${tdto.getR_floor().split("/")[1]}">&nbsp;&nbsp;층
                                                    </li>
                                                     </c:if>
                                                </ul>
                                                      <ul>
                                                     <c:if test="${tdto.getR_floor() eq null }">
                                                    <li>
                                                        건물 층수&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_floor">&nbsp;&nbsp;층
                                                    </li>
                                                   
                                                    <li>
                                                        해당 층수&nbsp;&nbsp;
                                                        <input type="text" class="type1" name="r_floor2">&nbsp;&nbsp;층
                                                    </li>
                                                     </c:if>
                                                </ul>
										
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>난방 종류</th>
                                            <td>
                                         
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio4_1" name="r_heating" class="type1" title="" value="개별난방">
                                                    <label for="radio4_1">개별 난방</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio4_2" name="r_heating" class="type1" title="" value="중앙난방">
                                                    <label for="radio4_2">중앙 난방</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio4_3" name="r_heating" class="type1" title="" value="지방난방">
                                                    <label for="radio4_3">지방 난방</label>
                                                </div>
                                            </td>
                                            <c:if test="${tdto.getR_heating() eq '개별난방'}">
                                            <script>
                                            $("input:radio[name='r_heating']:radio[value='개별난방']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getR_heating() eq '중앙난방'}">
                                            <script>
                                            $("input:radio[name='r_heating']:radio[value='중앙난방']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getR_heating() eq '지방난방'}">
                                            <script>
                                            $("input:radio[name='r_heating']:radio[value='지방난방']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            <th>입주 가능일</th>
                                            <td>
                                           	  <c:if test="${tdto.getR_movedate() ne null }">
                                                <div class="is-input-field">
					                              <input type="text" name="r_movedate" class="datepicker" value="${tdto.getR_movedate() }">
					                           </div>
					                           </c:if>
					                           <c:if test="${tdto.getR_movedate() eq null }">
                                                <div class="is-input-field">
					                              <input type="text" name="r_movedate" value="" class="datepicker">
					                           </div>
					                           </c:if>
                                            </td>
                                        </tr>

						<tr id="paneltooltips">
                            <th id="tooltip-1" class="is-relative">공과금 <a href="javascript:void(0);" class="tooltipToggle"><img src="resources/images/sub_2_2/qqq.png" alt="" /></a>
                                <div class="tooltip1" style="display: none;">
                                    <img src="resources/images/sub_2/tooltip/tooltip-img1.png" alt="" />
                                </div>
                            </th>
                            <td class="is-input-field" colspan="2">
                                <div data-uc-colgroup="">
                                    <div class="is-col-xs7 is-align-mid">
                                   
                                   
                                        <label for="info_type4" class="is-chk-btn no-margin is-relative" id="tooltip-2">
                                            
                                                 <div class="btn_yellow">
                                                    <input type="radio" id="radio5_1" class="type1" title="" name="r_sharedues" value="선불">
                                                    <label for="radio5_1" style="vertical-align: middle">선불</label>
                                                </div>   
                                               <a href="javascript:void(0);" class="tooltipToggle">
                                                  <img src="resources/images/sub_2_2/qqq.png" alt="" />
                                               </a>
                                               
                                            <div class="tooltip2" style="display: none;">
                                                <img src="resources/images/sub_2/tooltip/tooltip-img2.png" alt="" />
                                            </div>
                                            
                                        </label>
                                        <label for="info_type21" class="is-chk-btn no-margin is-relative" id="tooltip-3">
                                        
		                                    	<div class="btn_yellow">
                                                    <input type="radio" id="radio5_2" class="type1" title="" name="r_sharedues"value="후불">
                                                    <label for="radio5_2" style="vertical-align: middle">후불</label>
                                                </div>   
                                               <a href="javascript:void(0);" class="tooltipToggle">
                                                  <img src="resources/images/sub_2_2/qqq.png" alt="" />
                                               </a>
                                           
                                            <div class="tooltip3" style="display: none;">
                                                <img src="resources/images/sub_2/tooltip/tooltip-img3.png" alt="" />
                                            </div>
                                          
                                        </label>
                                        <c:if test="${tdto.getR_sharedues() eq '선불'}">
                                            <script>
                                            $("input:radio[name='r_sharedues']:radio[value='선불']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getR_sharedues() eq '후불'}">
                                            <script>
                                            $("input:radio[name='r_sharedues']:radio[value='후불']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                    </div>
                                    
                                    <c:if test="${tdto.getR_shareutility() eq null }">
                                    <div class="is-col-xs5 is-align-mid">
                                        <div class="is-input-field use-addon">
                                            <input type="text" name="r_shareutility">
                                            <span class="is-addon--back-default">만원</span>
                                        </div>
                                    </div>
                                    </c:if>
                                     <c:if test="${tdto.getR_shareutility() ne null }">
                                    <div class="is-col-xs5 is-align-mid">
                                        <div class="is-input-field use-addon">
                                            <input type="text" name="r_shareutility" value="${tdto.getR_shareutility() }">
                                            <span class="is-addon--back-default">만원</span>
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                                <script>
                                    $(document).on('click', '.tooltipToggle', function () {
                                        $('.tooltipToggle').removeClass('is-active');
                                        $(this).toggleClass('is-active');
                                    });
                                    $('html').click(function (e) {
                                        if (!$(e.target).hasClass("tooltipToggle")) {
                                            $('.tooltipToggle').removeClass('is-active');
                                        }
                                    });
                                </script>
                            </td>
                            <td>
                                *셰어하우스 특성상 공과금 정산방식은<br>
                                <span style="color: #FFD800;">1/N</span>로 계산됩니다.
                            </td>
                        </tr> 

<tr>
                                            <th>관리비 항목<br>(다중선택가능)</th>
                                            <td colspan="3">
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check1_1" name="ou_net" class="type1" title="" value="on">
                                                    <label for="check1_1">인터넷</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check1_2" name="ou_tv" class="type1" title="" value="on">
                                                    <label for="check1_2">유선tv</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check1_3" name="ou_clean" class="type1" title="" value="on">
                                                    <label for="check1_3">청소비</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check1_4" name="ou_gas" class="type1" title="" value="on">
                                                    <label for="check1_4">도시가스</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check1_5" name="ou_electric" class="type1" title="" value="on">
                                                    <label for="check1_5">전기세</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check1_6" name="ou_water" class="type1" title="" value="on">
                                                    <label for="check1_6">수도세</label>
                                                </div>                                                
                                        <tr>
                                            </td>
                                            <c:if test="${tdto.getOu_net() eq 'on'}">
                                            <script>
                                            $("#check1_1").prop('checked', true);
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getOu_tv() eq 'on'}">
                                            <script>
                                            $("#check1_2").prop('checked', true); 
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getOu_clean() eq 'on'}">
                                            <script>
                                            $("#check1_3").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            <c:if test="${tdto.getOu_gas() eq 'on'}">
                                            <script>
                                            $("#check1_4").prop('checked', true);
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getOu_electric() eq 'on'}">
                                            <script>
                                            $("#check1_5").prop('checked', true); 
                                            </script>
                                            </c:if>
                                             <c:if test="${tdto.getOu_water() eq 'on'}">
                                            <script>
                                            $("#check1_6").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            
                                        </tr>
                                        <tr>
                                            <th>주차 여부</th>
                                            <td>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio7_1" name="o_parking" class="type1" title="" value="null">
                                                    <label for="radio7_1">없음</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio7_2" name="o_parking" class="type1" title=""  value="on">
                                                    <label for="radio7_2">있음</label>
                                                </div>
                                            </td>
                                            <c:if test="${tdto.getO_parking() eq 'on'}">
                                            <script>
                                            $("input:radio[name='o_parking']:radio[value='on']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            
                                            <th>반려동물</th>
                                            <td>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio8_1" name="o_pet" class="type1" title="" value="null">
                                                    <label for="radio8_1">불가능</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio8_2" name="o_pet" class="type1" title="" value="on">
                                                    <label for="radio8_2">가능</label>
                                                </div>
                                            </td>
                                            <c:if test="${tdto.getO_pet() eq 'on'}">
                                            <script>
                                            $("input:radio[name='o_pet']:radio[value='on']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            <c:if test="${tdto.getO_pet() ne 'on'}">
                                            <script>
                                            $("input:radio[name='o_pet']:radio[value='null']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            
                                        </tr>

                                        <tr>
                                            <th>엘레베이터</th>
                                            <td>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio9_1" name="o_elevator" class="type1" title="" value="null">
                                                    <label for="radio9_1">없음</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio9_2" name="o_elevator" class="type1" title="" value="on">
                                                    <label for="radio9_2">있음</label>
                                                </div>
                                            </td>
                                             <c:if test="${tdto.getO_elevator() eq 'on'}">
                                            <script>
                                            $("input:radio[name='o_elevator']:radio[value='on']").prop('checked', true); 
                                            </script>
                                             </c:if>
                                            
                                            <th>베란다/발코니</th>
                                            <td>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio10_1" name="o_balcony" class="type1" title="" value="null">
                                                    <label for="radio10_1">없음</label>
                                                </div>
                                                <div class="btn_yellow">
                                                    <input type="radio" id="radio10_2" name="o_balcony" class="type1" title="" value="on">
                                                    <label for="radio10_2">있음</label>
                                                </div>
                                            </td>
											<c:if test="${tdto.getO_balcony() eq 'on'}">
                                            <script>
                                            $("input:radio[name='o_balcony']:radio[value='on']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            <c:if test="${tdto.getO_balcony() ne 'on'}">
                                            <script>
                                            $("input:radio[name='o_balcony']:radio[value='null']").prop('checked', true); 
                                            </script>
                                            </c:if>
                                            
                                        </tr>
                                        <tr>
                                            <th>옵션 항목</th>
                                            <td colspan="3">
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_1" name="o_tv" class="type1" title="">
                                                    <label for="check2_1">TV</label>
                                                </div>
                                                 <c:if test="${tdto.getO_tv() eq 'on'}">
                                            	<script>
                                            	$("#check2_1").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_2" name="o_desk" class="type1" title="">
                                                    <label for="check2_2">책상</label>
                                                </div>
                                                 <c:if test="${tdto.getO_desk() eq 'on'}">
                                            	<script>
                                            	$("#check2_2").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_3" name="o_bed" class="type1" title="">
                                                    <label for="check2_3">침대</label>
                                                </div>
                                                 <c:if test="${tdto.getO_bed() eq 'on'}">
                                            	<script>
                                            	$("#check2_3").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_4" name="o_stove" class="type1" title="">
                                                    <label for="check2_4">인덕션</label>
                                                </div>
                                                 <c:if test="${tdto.getO_stove() eq 'on'}">
                                            	<script>
                                            	$("#check2_4").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_5" name="o_closet" class="type1" title="">
                                                    <label for="check2_5">옷장</label>
                                                </div>
                                                 <c:if test="${tdto.getO_closet() eq 'on'}">
                                            	<script>
                                            	$("#check2_5").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_6" name="o_ac" class="type1" title="">
                                                    <label for="check2_6">에어컨</label>
                                                </div>
                                                 <c:if test="${tdto.getO_ac() eq 'on'}">
                                            	<script>
                                            	$("#check2_6").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_7" name="o_micro" class="type1" title="">
                                                    <label for="check2_7">전자레인지</label>
                                                </div>
                                                 <c:if test="${tdto.getO_micro() eq 'on'}">
                                            	<script>
                                            	$("#check2_7").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_8" name="o_laundry" class="type1" title="">
                                                    <label for="check2_8">세탁기</label>
                                                </div>
                                                 <c:if test="${tdto.getO_laundry() eq 'on'}">
                                            	<script>
                                            	$("#check2_8").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                <div class="btn_yellow">
                                                    <input type="checkbox" id="check2_9" name="o_refri" class="type1" title="">
                                                    <label for="check2_9">냉장고</label>
                                                     <c:if test="${tdto.getO_refri() eq 'on'}">
                                            	<script>
                                            	$("#check2_9").prop('checked', true);
                                            	</script>
                                            	</c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
				<script>
				 $(function() {
					$(".datepicker").datepicker({
						dateFormat: 'yy-mm-dd' //Input Display Format 변경
                            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                            ,changeYear: true //콤보박스에서 년 선택 가능
                            ,changeMonth: true //콤보박스에서 월 선택 가능
                            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                            ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                            ,maxDate: "+3Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
					    });
					});
				</script>

    <div class="write_box write5">
                                <table class="type1">
                                    <thead>
                                        <tr>
                                            <th colspan="2">상세 설명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<tr>
                                            <th>상세 설명</th>
                                             <c:if test="${tdto.getR_detail() ne null}">
                                            <td>
                                               <textarea name="r_detail" id="" cols="30" rows="30"  class="type1 detail_box">${tdto.getR_detail()}</textarea>
                                               </td>
                                               </c:if>
                                               <c:if test="${tdto.getR_detail() eq null}">
                                                <td>
                                               <textarea name="r_detail" id="" cols="30" rows="30"  class="type1 detail_box" placeholder="상세 설명은 3600자 이내로 작성 부탁드립니다."></textarea>
                                               </td>
                                               </c:if>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>



                          <div data-uc-table="sub2_2" >
					<table class="is-table-ver">
						<colgroup>
							<col width="100%">
						</colgroup>		
						<tr>
							<td>
								<h3>사진 등록</h3>
							</td>
						</tr>
						<tr> 
							<td>
								<c:set var="chc" value="0"/>
								<input type="hidden" name="put" value="">

								<div class="imgs_wrap" style="display: inline; float: left;">
								<c:if test="${empty tdto.getR_photo()}">
								<div class="is-txt-center gallery is-clearfix " align="center" style="padding-left: 43px; padding-right: 43px; margin-top: 30px; margin-left:30px; width: 100;">
								<img src="resources/images/sub_2_2/fileupload.png" alt="" style="width: 100%;" /></div></c:if>
								
								<c:if test="${!empty tdto.getR_photo() }">
									<c:forTokens items="${tdto.getR_photo() }" delims="/" var="i" varStatus="st">
										<c:set var="chc" value="${chc+1 }"/>
										<img id="img${chc }" alt="" width="100" height="100" src="${i }">
										<a onclick="aaa(${chc})" style="text-decoration: none;">
										<img id="close${chc }" src="resources/images/close.png" width="15" height="15" style="vertical-align: top; opacity: 0.7; "></a>
										<input type="hidden" id="put${chc}" value="" name="put">&nbsp;	
									</c:forTokens>
										<input type="hidden" id="end" value="${chc }">
								</c:if>
								</div>
								<div class="imgs_wrap2"  style="padding-left: 43px; padding-right: 43px; margin-top: 30px; margin-left:30px;">
									&nbsp;
								</div>		
								</td>
								</tr>
							<tr>
							<td>
								<div class="is-txt-center" align="center">
									<label> 파일추가
										<input type='file' id="input_imgs" name="file" multiple="multiple" style="display: none;"/>
									</label	>	
								</div>
							</td>
							</tr>
								
								<tr>
								<td>
								<div class="is-txt-center">
									<!-- <input multiple="multiple" name="file" type='file' id="gallery-photo-add" />
									<label for="gallery-photo-add"><img src="resources/images/sub_2_2/btn4.png" alt="" /></label> -->  
								</div>
							</td>
						</tr>
					</table>
				</div>
				<script>

				var sel_files = [];
				 
		        $(document).ready(function() {
		            $("#input_imgs").on("change", handleImgsFilesSelect);
		        }); 
		 
		        function handleImgsFilesSelect(e) {
		        	
		        	
		            var files = e.target.files;
		            var filesArr = Array.prototype.slice.call(files);
		            if(files.length<1){
		            	 console.log('cancel was pressed');
		            	 $(".imgs_wrap2").empty();
		            	 $(".gallery").show();
		            }else{
		            	var sel_files = [];
						$(".imgs_wrap2").empty();
						$(".gallery").hide(); 
		            
		            var a=parseInt($('#end').val());
		            var b=parseInt($('#chc').val());
					var c=a;
					 
		            filesArr.forEach(function(f) {
		                
		 
		                sel_files.push(f);
		 
		                var reader = new FileReader();
		                reader.onload = function(e) {
		      
		                	var img_html ="";
		                	a+=1;
		                	img_html += "<img id='img"+a+"' alt='' width='100' height='100' src='" + e.target.result + "'>&nbsp;";
		                 
		                    $('#end').val(a); 
		                    $(".imgs_wrap2").append(img_html);

		                }
		                reader.readAsDataURL(f);
		            });
		            }
		        }
				
					 function aaa(i) {
						 	var a= document.getElementById("img"+i);
						 
							$("#put"+i).val(a.src);
						
							$("#img"+i+"").remove();
							$("#close"+i+"").remove(); 
							
						}
				
					 /* $(function () {
						// Multiple images preview in browser
						var imagesPreview = function (input, placeToInsertImagePreview) {
							$('.gallery').html('');
							if (input.files) {
								var filesAmount = input.files.length;

								for (i = 0; i < filesAmount; i++) {
									var reader = new FileReader();

									reader.onload = function (event) {
										$($.parseHTML('<img>')).attr('src', event.target.result).appendTo(
											placeToInsertImagePreview);
									}

									reader.readAsDataURL(input.files[i]);
								}
							}

						};

						$('#gallery-photo-add').on('change', function () {
							imagesPreview(this, 'div.gallery');
						});
					}); */
					</script>
                   <div class="clearfix"></div>
				<div data-uc-table="sub2_2" style="margin-top:-40px;border:none;">
					<table class="is-table-ver" style="border:none !important;">
						<colgroup>
							<col width="100%">
						</colgroup>
						<tr style="border:none;">
							<td style="float:right;border:none">
								<a href="#fakePropertyModal" data-uc-click="modal">허위매물 제재 정책 확인하기</a>
							</td>
						</tr>
						<tr>
							<td class="is-txt-center" style="border:none;">
								<div class="is-input-field is-mg-t_10">
									<label for="accept_terms" class="is-chk-lab"><input type="checkbox" id="accept_terms"
											name="accept_terms" value="" />
										<span style="vertical-align: middle"></span>매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.
									</label>
								</div>
							</td>
						</tr>
						<tr style="border:none;border:none">
							<td style="text-align:center;">
								<div style="display:inline-flex">
									<!-- <button type="submit">글올리기</button> -->
									<input type="image" src="resources/images/sub_2_2/btn2.png" name="submit" value="submit">
									<input type="image" src="resources/images/sub_2_2/btn3.png" name="reset" value="reset">
								</div>
							</td>
						</tr>
					</table>
				</div>

                        </form>
                    </div>
                </div>
            </div><!--tab_content end-->
        </div>
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

           
             
</body>

</html>