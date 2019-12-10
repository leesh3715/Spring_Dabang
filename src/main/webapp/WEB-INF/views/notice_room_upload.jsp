<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>방보기</title>
	 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
			   <link rel="stylesheet" href="resources/css/uc.min.css">
			   <link rel="stylesheet" href="resources/css/basic.css">
			   <link rel="stylesheet" href="resources/css/slick.css">
			   <link rel="stylesheet" href="resources/css/slick-theme.css">
			   <link rel="stylesheet" href="resources/plugins/fonts/line-awesome.css">
			   <link rel="stylesheet" href="resources/plugins/owlCarousel/owl.carousel.min.css">
			   <link rel="stylesheet" href="resources/plugins/owlCarousel/owl.theme.default.min.css">
			   <link rel="stylesheet" href="resources/css/style_sub2_3.css">
			   <link rel="stylesheet" href="resources/plugins/jquery-ui /jquery-ui.css">
			   <link rel="stylesheet" href="resources/css/layout.css">
			   <link rel="stylesheet" href="resources/plugins/slick/slick.css">
			   <link rel="stylesheet" href="resources/css/mapsearch.css">
			   	
			   	   <link rel="stylesheet" href="resources/css/common.css">
			   <link rel="stylesheet" href="resources/css/index.css">
			   <link rel="stylesheet" href="resources/css/join.css">

			   <script src="resources/js/js_package.js"></script>
			   <script src="resources/js/jquery-3.3.1.min.js"></script>
			   <script src="resources/js/uc.lib.min.js"></script>
			   <script src="resources/js/uc.plugin.min.js"></script>
			   <script src="resources/js/slick.min.js"></script>
			   <script src="resources/js/common.js"></script>   
</head>

<body>

<div>
		<%@ include file="../../resources/include/header.jsp"%>	
		<!--//header-->
     
	 <div class="container">
                <div class="content">
                   <div class="join_area cotent_width">
				   
					<h3 class="login_title">공지사항 작성</h3>
					<div class="boardWrite ">
                   <form name="fileForm" method="post" action="<%=request.getContextPath() %>/board_write_ok.do" enctype="multipart/form-data">
                   <c:if test="${!empty cont }">
						<c:set var="dto" value="${cont }"/>
						<input type="hidden" value="${dto.getB_no() }" name="b_no">
						<%-- <c:set var="s_src" value="${src }"/> --%>
					</c:if>
					<c:if test="${!empty reply }">
						<c:set var="dto" value="${reply }"/>
						<input type="hidden" value="${dto.getB_group() }" name="b_group">
						<input type="hidden" value="${dto.getB_step() }" name="b_step">
						<input type="hidden" value="${dto.getB_indent() }" name="b_indent">
					</c:if>
					<input type="hidden" value="${head }" name="b_head">
				   <div align="center">
					<table class="is-table-ver">
					<colgroup>
							<col width="10%">
							<col width="90%">
					</colgroup>	
				   	<tr>
						<th>제  목 </th>
					  <td>
						 <input type="text" size="60" id="b_title"  name="b_title" Maxlength="30" value="${dto.getB_title() }">
					  </td>
				   </tr>
				   <tr>
					  <th>작 성 자</th> 
					  <td><input type="text" size="30" name="b_writer" Maxlength="20" value="${nick }" readonly="readonly"></td>
					</tr>
				   <tr>
					  <th>본  문</th> 
					  <td><textarea rows="15" cols="60" id="b_cont"name="b_cont">${dto.getB_cont() }</textarea></td>
					</tr>
					<tr>
						<th rowspan="2">사진 등록</th>
						<td>
							<c:set var="chc" value="0"/>
							<input type="hidden" name="put" value="">
							
							<div class="imgs_wrap" style="display: inline; float: left; width: 100%">
								<c:if test="${empty dto.getB_src() }">
								<div class="is-txt-center gallery is-clearfix " align="center" style="padding-left: 10px; padding-right: 43px; margin-top: 30px; width: 100%;">
								<img src="resources/images/sub_2_2/fileupload.png" alt="" style="width: 95%;" /></div></c:if>
								
								<c:if test="${!empty dto.getB_src() }">
									<c:forTokens items="${dto.getB_src() }" delims="/" var="i" varStatus="st">
										<c:set var="chc" value="${chc+1 }"/>
										<img id="img${chc }" alt="" width="100" height="100" src="${i }">
										<a onclick="aaa(${chc})" style="text-decoration: none;">
										<img id="close${chc }" src="resources/images/close.png" width="15" height="15" style="vertical-align: top; opacity: 0.7; "></a>
										<input type="hidden" id="put${chc}" value="" name="put">&nbsp;	
									</c:forTokens>
										<input type="hidden" id="end" value="${chc }">
								</c:if>
							</div>
							
							<div  class="imgs_wrap2"  style="padding-left: 43px; padding-right: 43px; margin-left:30px;">
								&nbsp;
							</div>
						</td>
						</tr>
						<tr>
						
						<td>
							<div class="is-txt-center">
								<label> 파일추가
										<input type='file' id="input_imgs" name="file" multiple="multiple" style="display: none;"/>
								</label	>	
							</div>
						</td>
					</tr> 	    				   
					 </table>
				<script>
				var sel_files = [];
				 
		        $(document).ready(function() {
		            $("#input_imgs").on("change", handleImgsFilesSelect);

		    
		            $("#headType option").each(function(){

		                if($(this).val()=='${dto.getB_head() }'){

		                  $(this).attr("selected","selected"); // attr적용안될경우 prop으로 

		                }

		              });

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
				</script>
		    <div class="check-wrap">
		        <input type="checkbox" id="yes"><label for="yes">입력한 정보는 실제 내용과 다름이 없습니다.</label> <br>
		    </div>
					 <label for="write_submit" class="join_btn s_up" style="height: 41px;">등   록</label>
					 <input type="submit" name="write_submit" id="write_submit"value="등   록" style="display:none;" >
						 <label for="reset" class="join_btn reset" style="height: 41px;">취   소</label>
							 <input type="reset" id ="reset"name="reset" value="취   소" style="display:none;">
				   </div>
				     <script type="text/javascript">
			 		    $(".s_up").click(function() {
							if ($("#yes").prop("checked")){}
							else {
								alert("모든 항목에 동의해주세요.");
								return false;
							}
							var title=$("#b_title").val();
							var cont=$("#b_cont").val();
							
							if (title.length==0){
								alert("제목을 입력하세요.");
								return false;
							} 
							if (cont.length==0){
								alert("내용을 입력하세요.");
								return false;
							}
							 
						}); 
			
					   </script>
				  </form>
				  </div>
                    </div>
                </div>
                
            </div>
	  	<!--//container-->
	
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

	</div>

</body>

</html>