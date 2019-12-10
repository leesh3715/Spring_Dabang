<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>방보기</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">


	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/basic.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/slick-theme.css">
	<link rel="stylesheet" href="resources/css/style_sub2_2.css">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/style_sub2_nanum.css">
	
	<link rel="stylesheet" href="resources/css/fine-uploader-gallery.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
	

</head>

<body>

<%@ include file="../../resources/include/header.jsp"%>

	<div class="content_wrap">
		<div class="gongyu">
			<!--sub_top-->
			<div class="sub_top top4">
				<b class="title">공유방</b>
				<div>
					<span>나눔하고 싶은 가구 또는 필요한 가구가 있다면 가전가구나눔을 이용! </span>
				</div>
			</div>
		</div>

		<!--tab_menu-->
		<div class="tab_menu menu3">
			<ul>
				<li><a href="<%=request.getContextPath()%>/con4_1.do">실생활 팁</a></li>
				<li><a href="<%=request.getContextPath()%>/con4_2.do">인테리어 팁</a></li>
				<li class="on"><a href="<%=request.getContextPath()%>/share_room.do">가전가구 나눔</a></li>
			</ul>
		</div>
		
		
		<form name="fileForm" method="post" action="<%=request.getContextPath() %>/share_ok.do" enctype="multipart/form-data" >
		<c:if test="${!empty cont }">
			<c:set var="dto" value="${cont }"/>
			<input type="hidden" value="${dto.getS_no() }" name="s_no">
			<%-- <c:set var="s_src" value="${src }"/> --%>
		</c:if>
		<c:if test="${!empty reply }">
			<c:set var="dto" value="${reply }"/>
			<input type="hidden" value="${dto.getS_group() }" name="s_group">
			<input type="hidden" value="${dto.getS_step() }" name="s_step">
			<input type="hidden" value="${dto.getS_indent() }" name="s_indent">
			
		</c:if>
		<div class="is-frame-md">
		    <div class="section table-wrap">
		        <table border="1">
		            <caption>글쓰기</caption>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="s_title" id="s_title" placeholder="예) 옷장 2개 나눔해요" value="${dto.getS_title() }">
		                </td>
		            </tr>
		            <tr>
		                <th>상세 내용</th>
		                <td>
		                    <textarea name="s_cont" id="s_cont" cols="80" rows="5" placeholder="예) 이삿짐 정리하면서 옷장이 불필요하게 되어 나눔하려고 합니다.
		                        
가전가구 나눔과 관련없는 홍보성 정보는 입력하실수 없습니다.
*상세설명 주의사항 위반시 허위글로 간주되어 글 삭제 및 이용의 제한이 있을 수 있습니다.">${dto.getS_cont() }</textarea>
		                </td>
		            </tr>
		            <tr>
		                <th>비공개 메모</th>
		                <td>
		                    <input type="text" name="s_memo" placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다." value="${dto.getS_memo() }">
		                </td>
		            </tr>
		        </table>
		    </div>
		     <div>
		     <br><br><br>
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
								<c:if test="${empty dto.getS_src() }">
								<div class="is-txt-center gallery is-clearfix " align="center" style="padding-left: 43px; padding-right: 43px; margin-top: 30px; margin-left:30px; width: 100;">
								<img src="resources/images/sub_2_2/fileupload.png" alt="" style="width: 100%;" /></div></c:if>
								
								<c:if test="${!empty dto.getS_src() }">
									<c:forTokens items="${dto.getS_src() }" delims="/" var="i" varStatus="st">
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
				</script>
			
		    <div class="check-wrap">
		        <input type="checkbox" id="yes"><label for="yes">입력한 정보는 실제 내용과 다름이 없습니다.</label> <br>
		        <div class="btn-wrap">
		            <button type="submit" class="s_up">글 올리기</button>
		           <button type="button">취소</button>
		        </div>
		    </div>
		    <script type="text/javascript">
 		    $(".s_up").click(function() {
				if ($("#yes").prop("checked")){}
				else {
					alert("모든 항목에 동의해주세요.");
					return false;
				}
				var title=$("#s_title").val();
				var cont=$("#s_cont").val();
				
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
		</div>
		</form>
		<div class="is-empty-xs120"></div>
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