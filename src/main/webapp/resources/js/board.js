

function fn_comment(){
    if($.trim($("#bc_cont").val()).length > 0){
	    $.ajax({
	        type:'POST',
	        url : "/dabang/b_comment_add.do",
	        data:$("#comments").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#bc_cont").val("");
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
    }
    else{
    	alert("내용을 입력해주세요!");
    }
}


function del_comment(bc_no,bc_group){
	var data={"bc_no":bc_no,"bc_group":bc_group};
	if(confirm("댓글을 삭제하시겠습니까?")){
	   $.ajax({
	        type:'POST',
	        url : "/dabang/b_comment_dele.do",
	        data:data,
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	}
}

function edit_comment(bc_no,b_no,bc_id,bc_cont,bc_date,bc_group,bc_step,bc_indent){
	var html ="";
	
		if($("#check2").val()==1){
			if(confirm("내용 입력을 취소하시겠습니까?")){
				getCommentList();
				html +="<li id='bc_no'"+bc_no+"><div>";
				html +="<table border='0' style='width: 100%;'><tr>";
				if(bc_step>0){
					html +="<td valign='top' align='right' style='color: red;' rowspan='2' width='7%'>&nbsp;</td>";
				}
				html +="<td><div>";
				html +="<div style='display: inline; float: left;'>";
				html +="<table border='0'>";
				html +="<tbody><tr><td>";
				html +="<span style='font-weight: bold;'>"+bc_id+"&nbsp;</span>";
				html +="</td><td>";
				html +="<span><font size='1em'>"+bc_date+"</font></span>";
				html +="┗<a id='reply_on"+bc_no+"' onClick='reply_comment("+bc_no+","+b_no+",\""+bc_id+"\",\""+bc_cont+"\","+bc_group+","+bc_indent+")'>답글</a>";
				html +="</td></tr></tbody></table></div>";
				html +="<div align='right'>";
				html +="<table border='0'><tbody><tr><td>";
				html +="<a onClick='cencelComment()' style='font-weight: lighter;'>수정취소</a>";
				html +="</td></tr></tbody></table></div></div></td></tr>";
				html +="<tr><td><form id='comment' name='comment'>";
				html +="<input type='hidden' value="+bc_no+" name='bc_no'>";
				html +="<table  cellspacing='0' cellpadding='0' border='1' style='width: 100%;'>";
				html +="<tbody><tr >";
				html +="<td style='background-color: #ffffff; padding: 8px 10px;' width='*'>";
				html +="<div >";
				html +="<textarea class='autosize' name='bc_cont' id='bc_cont1' maxlength='4000' style='overflow: hidden auto; line-height: 14px; height: 100%; width: 100%; resize: none; border:0;' >"+bc_cont+"</textarea>";
				html +="</div></td><td width='1%'>&nbsp;</td><td valign='bottom' width='10%'><div >";
				html +="<input onClick='update_comment("+bc_no+","+bc_cont+")' type='button' value='등록' style='background-color: #ffffff; border:0; width: 60pt; height: 40pt;' >";
				html +="</div></td></tr></tbody></table></form></td></tr></table><br>";
				html +="</div><div style='border-top:1px dashed; margin-top: 2px;'></div>";
				html +="</li>";
			
				$("#bc_no"+bc_no).replaceWith(html);
				
				$("#check2").val('0');
			}
		}
		else{
			getCommentList();
			html +="<li id='bc_no'"+bc_no+"><div>";
			html +="<table border='0' style='width: 100%;'><tr>";
			if(bc_step>0){
				html +="<td valign='top' align='right' style='color: red;' rowspan='2' width='7%'>&nbsp;</td>";
			}
			html +="<td><div>";
			html +="<div style='display: inline; float: left;'>";
			html +="<table border='0'>";
			html +="<tbody><tr><td>";
			html +="<span style='font-weight: bold;'>"+bc_id+"&nbsp;</span>";
			html +="</td><td>";
			html +="<span><font size='1em'>"+bc_date+"</font></span>";
			html +="┗<a id='reply_on"+bc_no+"' onClick='reply_comment("+bc_no+","+b_no+",\""+bc_id+"\",\""+bc_cont+"\","+bc_group+","+bc_indent+")'>답글</a>";
			html +="</td></tr></tbody></table></div>";
			html +="<div align='right'>";
			html +="<table border='0'><tbody><tr><td>";
			html +="<a onClick='cencelComment()' style='font-weight: lighter;'>수정취소</a>";
			html +="</td></tr></tbody></table></div></div></td></tr>";
			html +="<tr><td><form id='comment' name='comment'>";
			html +="<input type='hidden' value="+bc_no+" name='bc_no'>";
			html +="<table  cellspacing='0' cellpadding='0' border='1' style='width: 100%;'>";
			html +="<tbody><tr >";
			html +="<td style='background-color: #ffffff; padding: 8px 10px;' width='*'>";
			html +="<div >";
			html +="<textarea class='autosize' name='bc_cont' id='bc_cont1' maxlength='4000' style='overflow: hidden auto; line-height: 14px; height: 100%; width: 100%; resize: none; border:0;' >"+bc_cont+"</textarea>";
			html +="</div></td><td width='1%'>&nbsp;</td><td valign='bottom' width='10%'><div >";
			html +="<input onClick='update_comment("+bc_no+","+bc_cont+")' type='button' value='등록' style='background-color: #ffffff; border:0; width: 60pt; height: 40pt;' >";
			html +="</div></td></tr></tbody></table></form></td></tr></table><br>";
			html +="</div><div style='border-top:1px dashed; margin-top: 2px;'></div>";
			html +="</li>";
			
			$("#bc_no"+bc_no).replaceWith(html);
			
		}

	$("#bc_cont1").on("input propertychange paste",function() {
		$("#check2").val('1');
		
	});
	
	$("textarea.autosize").on('keydown keyup', function () {
		var limit=468;
		if(limit>$(this).prop('scrollHeight')){
				$(this).height(1).height( $(this).prop('scrollHeight')+12 );
		} 
	});
	
}
function update_comment(){

	if($.trim($("#bc_cont1").val()).length > 0){
	$("#check2").val('0');
	   $.ajax({
	        type:'POST',
	        url : "/dabang/b_comment_update.do",
	        data:$("#comment").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	 }
    else{
    	alert("내용을 입력해주세요!");
    }
	
}

function reply_comment(bc_no,b_no,bc_id,bc_cont,bc_group,bc_indent){
	
	
	var html ="";
	var html2= "";
	
	if($("#check2").val()==1){
		if(confirm("내용 입력을 취소하시겠습니까?")){
		getCommentList();
		html +="<br><li><div>";
		html +="<form id='comment' name='comment'>";
		html +="<input type='hidden' value="+bc_no+" name='bc_no'>";
		html +="<input type='hidden' value="+b_no+" name='b_no'>";
		html +="<input type='hidden' value="+bc_group+" name='bc_group'>";
		html +="<input type='hidden' value="+bc_indent+" name='bc_indent'>";
		html +="<input type='hidden' value="+bc_id+" name='bc_replyid'>";
		html +="<table  cellspacing='0' cellpadding='0' border='0' style='width: 100%;'>";
		html +="<tbody><tr ><td valign='top' align='right' style='color: red;' width='7%'>┗&nbsp;</td>";
		html +="<td style='background-color: #ffffff; padding: 8px 10px;' width='*'>";
		html +="<div>";
		html +="<textarea class='autosize' name='bc_cont' id='bc_cont1' maxlength='4000' style='overflow: hidden auto; line-height: 14px; height: 100%; width: 100%; resize: none; border:0;' ";
		if(bc_indent>0){
			html +=" placeholder='"+bc_id+"님께 답글쓰기'";
		}	
		html +="></textarea>";
		html +="</div></td><td width='1%'>&nbsp;</td><td valign='bottom' width='10%'><div >";
		html +="<input onClick='fn_replycomment()' type='button' value='등록' style='background-color: #ffffff; border:0; width: 60pt; height: 40pt;' >";
		html +="</div></td></tr></tbody></table></form></div><br>";
		html +="</div><div style='border-top:1px dashed; margin-top: 2px;'></div></li>";
		
		html2 +="<a id='reply_cancel"+this.bc_no+"' onClick='cencelComment()'>답글 취소</a>";
		
		$("#reply_on"+bc_no).replaceWith(html2);
		$("#reply"+bc_no).replaceWith(html);
		
		
		}
	}
	else{
		getCommentList();
		html +="<br><li><div>";
		html +="<form id='comment' name='comment'>";
		html +="<input type='hidden' value="+bc_no+" name='bc_no'>";
		html +="<input type='hidden' value="+b_no+" name='b_no'>";
		html +="<input type='hidden' value="+bc_group+" name='bc_group'>";
		html +="<input type='hidden' value="+bc_indent+" name='bc_indent'>";
		html +="<input type='hidden' value="+bc_id+" name='bc_replyid'>";
		html +="<table  cellspacing='0' cellpadding='0' border='0' style='width: 100%;'>";
		html +="<tbody><tr ><td valign='top' align='right' style='color: red;' width='7%'>┗&nbsp;</td>";
		html +="<td style='background-color: #ffffff; padding: 8px 10px;' width='*'>";
		html +="<div>";
		html +="<textarea class='autosize' name='bc_cont' id='bc_cont1' maxlength='4000' style='overflow: hidden auto; line-height: 14px; height: 100%; width: 100%; resize: none; border:0;' ";
		if(bc_indent>0){
			html +=" placeholder='"+bc_id+"님께 답글쓰기'";
		}	
		html +="></textarea>";
		html +="</div></td><td width='1%'>&nbsp;</td><td valign='bottom' width='10%'><div >";
		html +="<input onClick='fn_replycomment()' type='button' value='등록' style='background-color: #ffffff; border:0; width: 60pt; height: 40pt;' >";
		html +="</div></td></tr></tbody></table></form></div><br>";
		html +="</div><div style='border-top:1px dashed; margin-top: 2px;'></div></li>";
		
		html2 +="<a id='reply_cancel"+this.bc_no+"' onClick='cencelComment()'>답글 취소</a>";
		
		$("#reply_on"+bc_no).replaceWith(html2);
		$("#reply"+bc_no).replaceWith(html);
		
		
	}
		$("#bc_cont1").on("input propertychange paste",function() {
			$("#check2").val('1');
			
		});
		
		$("textarea.autosize").on('keydown keyup', function () {
			var limit=468;
			if(limit>$(this).prop('scrollHeight')){
					$(this).height(1).height( $(this).prop('scrollHeight')+12 );
			} 
		});
}




function fn_replycomment(){
	
	if($.trim($("#bc_cont1").val()).length > 0){
	$("#check2").val('0');
	   $.ajax({
	        type:'POST',
	        url : "/dabang/b_replycomment_update.do",
	        data:$("#comment").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	 }
    else{
    	alert("내용을 입력해주세요!");
    }
	
}

$(function(){
		
    getCommentList();
    
    
});
 

function cencelComment() {
	if($("#check2").val()==1){
		if(confirm("내용 입력을 취소하시겠습니까?")){
			$("#check2").val('0');
			getCommentList();
		}
	}
	else{
		getCommentList();
	}
}


function getCommentList() {
		
		
		$.ajax({
			type : "GET", // 데이터 전송 방식	
			url : "/dabang/b_comment.do",
			// userId 변수에 userId 값을 저장하여 넘긴다.
			data : $("#comments").serialize(),
			dataType:'json',
			async:false,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			success : function(data) {
				
				var html ="";
				/*var cCnt = data.length;*/
				if(data.length > 0) {
					$(data).each(function(){
						if(this.bc_check1==1){ //답글이 있는 상태에서 메인글 삭제시
							html +="<li id='bc_no'><div>";
							html +="<table border='0' style='width: 100%;'>";
							html +="<tr><td><div style='margin-top: 14px; margin-bottom: 14px '><span>삭제된 댓글입니다.</span></div></td></tr>";
							html +="</table></div><div style='border-top:1px dashed; margin-top: 2px;'></div>";
							html +="</li>";
							html +="<li id='bc_no"+this.bc_no+"'><div>";
							html +="<table border='0' style='width: 100%;'>";
							html +="<tr>";
							if(this.bc_step>0){
								html +="<td valign='top' align='right' style='color: red;' rowspan='2' width='7%'>┗&nbsp;</td>";
							}
							html +="<td><div>";
							html +="<div style='display: inline; float: left;'>";
							html +="<table border='0'>";
							html +="<tbody><tr><td>";
							html +="<span style='font-weight: bold;'>"+this.bc_id+"&nbsp;</span>";
							if(this.bc_id==this.b_writer){
								html +="<img alt='' src='resources/images/writer.png' width='45' height='20'>";
							}
							html +="</td><td>";
							html +="<span><font size='1em'>"+this.bc_date.substring(0,16)+"</font></span>";
							if(this.session!=null){
							html +="┗<a id='reply_on"+this.bc_no+"' onClick='reply_comment("+this.bc_no+","+this.b_no+",\""+this.bc_id+"\",\""+this.bc_cont+"\","+this.bc_group+","+this.bc_indent+")'>답글</a>";
							}
							html +="</td></tr></tbody></table></div>";
							html +="<div align='right'>";
							html +="<table border='0'><tbody><tr><td>";
							if(this.session!=null){
								if(this.session==this.bc_id){
									html +="<a onClick='edit_comment("+this.bc_no+","+this.b_no+",\""+this.bc_id+"\",\""+this.bc_cont+"\",\""+this.bc_date.substring(0,16)+"\","+this.bc_group+","+this.bc_step+","+this.bc_indent+")' style='font-weight: lighter;'>수정</a>";
									html +="<span>&nbsp;|&nbsp;</span>";
								}
								if(this.session==this.bc_id || this.session=="admin"){
									html +="<a onClick='del_comment("+this.bc_no+","+this.bc_group+")' style='font-weight: lighter;'>삭제</a>";
							}
							}
							html +="</td></tr></tbody></table></div></div></td></tr>";
							html +="<tr><td><p><span id='bc_cont2'>";
							if(this.bc_indent>1){
								html +="<a style='font-weight: 100;'>"+this.bc_replyid+"&nbsp;</a>";
							}
							html +=""+this.bc_cont+"</span></p></td></tr>";
							html +="</table></div><div style='border-top:1px dashed; margin-top: 2px;'></div>";
							html +="</li><input type='hidden' id='reply"+this.bc_no+"'>";
						}
						else{
							html +="<li id='bc_no"+this.bc_no+"'><div>";
							html +="<table border='0' style='width: 100%;'>";
							html +="<tr>";
							if(this.bc_step>0){
								html +="<td valign='top' align='right' style='color: red;' rowspan='2' width='7%'>┗&nbsp;</td>";
							}
							html +="<td><div>";
							html +="<div style='display: inline; float: left;'>";
							html +="<table border='0'>";
							html +="<tbody><tr><td>";
							html +="<span style='font-weight: bold;'>"+this.bc_id+"&nbsp;</span>";
							if(this.bc_id==this.b_writer){
								html +="<img alt='' src='resources/images/writer.png' width='45' height='20'>";
							}
							html +="</td><td>";
							html +="<span><font size='1em'>"+this.bc_date.substring(0,16)+"</font></span>";
							if(this.session!=null){
								html +="┗<a id='reply_on"+this.bc_no+"' onClick='reply_comment("+this.bc_no+","+this.b_no+",\""+this.bc_id+"\",\""+this.bc_cont+"\","+this.bc_group+","+this.bc_indent+")'>답글</a>";
							}
							html +="</td></tr></tbody></table></div>";
							html +="<div align='right'>";
							html +="<table border='0'><tbody><tr><td>";
							if(this.session!=null){
								if(this.session==this.bc_id){
									html +="<a onClick='edit_comment("+this.bc_no+","+this.b_no+",\""+this.bc_id+"\",\""+this.bc_cont+"\",\""+this.bc_date.substring(0,16)+"\","+this.bc_group+","+this.bc_step+","+this.bc_indent+")' style='font-weight: lighter;'>수정</a>";
									html +="<span>&nbsp;|&nbsp;</span>";
								}
								if(this.session==this.bc_id || this.session=="admin"){
									html +="<a onClick='del_comment("+this.bc_no+","+this.bc_group+")' style='font-weight: lighter;'>삭제</a>";
								}
							}
							html +="</td></tr></tbody></table></div></div></td></tr>";
							html +="<tr><td><p><span id='bc_cont2'>";
							if(this.bc_indent>1){
								html +="<a style='font-weight: 100;'>"+this.bc_replyid+"&nbsp;</a>";
							}
							html +=""+this.bc_cont+"</span></p></td></tr>";
							html +="</table></div><div style='border-top:1px dashed; margin-top: 2px;'></div>";
							html +="</li><input type='hidden' id='reply"+this.bc_no+"'>";
						}

						
					});
			} /*else{ 
				   html += "<div>";
	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	                
	            }*/
	            
	            /*$("#cCnt").html(cCnt);*/
	            $("#commentList").html(html);
			},				
			error : function() { // 비동기 통신이 실패한 경우
				alert("data error");
			} 
		}); 
}

function deleteShere(b_no,b_head) {
	if(confirm("게시글을 삭제하시겠습니까?")){
		location.href="board_delete.do?b_no="+b_no+"&b_head="+b_head+"";
	}
}


