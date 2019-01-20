/**
 * 게시글 상세조회의 덧글 처리
 */

	function replyListMaker(resp) {
		if (resp.errors) {
			alert(resp.errors.message); 					
		} else { // 등록 성공
			var html = "";
			if(resp.dataList){
				$.each(resp.dataList, function(idx, reply){
					
                    html += "<div class='comment__avatar'>";
                    html += "<img width='50' height='50' class='avatar' src='../boardImages/runi.jpg'>"+"&nbsp;&nbsp;<cite>"+reply.board_reply_mem_name+"("+reply.board_reply_mem_id+")</cite>&nbsp;&nbsp;&nbsp;<time class='comment__time'>"+reply.board_reply_date+"</time>";
                    html += "</div>";
                    html += "<div class='comment__content'>";
                    html += "<div class='comment__info'>";
//                    html += "<cite>"+reply.board_reply_mem_id+"</cite>";
                    html += "<div class='comment__meta'>";
//                    html += "<time class='comment__time'>"+reply.board_reply_date+"</time>";
                    html += "</div>";
                    html += "</div>";
                    html += "<div class='comment__text'>";
                    html += "<pre>"+reply.board_reply_content+"</pre>";
                    html += "<p id='"+reply.board_reply_mem_id+"_"+reply.board_reply_no+"'>";
                    		if($.getAuthMember() == reply.board_reply_mem_id){
                    			html +="<span data-toggle='modal'  data-target='#replyUpdateModal' class='replyUpdBtn'>[수정]</span>" + "&nbsp;&nbsp;&nbsp;";
                    			html +="<span data-toggle='modal'  data-target='#replyUpdateModal' class='replyDelBtn'>[삭제]</span>" ;
                    		}
                    		"</p>";
                    html += "</div>";
                    html += "</div>";
                    html += "<hr/>"
				});
			}else{
				html += "<li>댓글이 없습니다.</li>";
				html += "<hr/>"
			}
			$.pagingArea.html(resp.pagingHTML);	
			listBody.html(html);
			replyForm[0].reset();
		}
	}
	
	function pagingReply(page, board_no){
		$.ajax({
			url:$.getContextPath()+"/freeboard/replyList.do",
			data:{
				board_no:board_no,
				page:page
			},
			dataType:"json",
			success:replyListMaker,
			error:function(resp){
				console.log(resp.status);
			}
		});
	}
	
	
	$(function(){
		$.pagingArea = $("#pagingArea");
		listBody = $("#listBody");
 		replyForm = $("[name='replyForm']");
 		var delModal = $("#replyDeleteModal");
 		
 		review_reply_no = "";
 		review_reply_mem_id = "";
 		listBody.on("click", "span" ,function(){
// 			console.log("눌렸음");
 			var trId = $(this).closest("p").prop("id");
 			board_reply_no = trId.substring(trId.indexOf("_")+1);
 			board_reply_mem_id = trId.substring(0,trId.indexOf("_"));
 			console.log(board_reply_no);
 			console.log(board_reply_mem_id);
 			delModal.find("#board_reply_no").val(board_reply_no);
 			delModal.modal("show");
 		});
 		
 		$("#modalDelBtn").on("click", function(){
 			var action = replyForm.attr("action");
 			replyForm.attr("action", $.getContextPath()+"/freeboard/replyDelete.do");
 			var board_reply_pass = delModal.find("#board_reply_pass").val();
 			replyForm.find("[name='board_reply_no']").val(board_reply_no);
 			replyForm.find("[name='board_reply_pass']").val(board_reply_pass);
 			console.log(board_reply_pass);
 			replyForm.find("[name='board_reply_mem_id']").val(board_reply_mem_id);
 			replyForm.submit();
 			replyForm.attr("action", action);
 			replyForm[0].reset();
 			$("#modalForm")[0].reset(); 			
 			delModal.modal("hide");
 		});
 		
 		$("#modalUpdBtn").on("click", function(){
 			var action = replyForm.attr("action");
 			replyForm.attr("action", $.getContextPat()+"/freeboard/replyUpdate.do");
 			var board_reply_pass = delModal.find("#board_reply_pass").val();
 			replyForm.find("[name='board_reply_no']").val(board_reply_no);
 			replyForm.find("[name='board_reply_pass']").val(board_reply_pass);
 			console.log(board_reply_pass);
 			replyForm.find("[name='board_reply_mem_id']").val(board_reply_mem_id);
 			replyForm.submit();
 			replyForm.attr("action", action);
 			replyForm[0].reset();
 			$("#modalForm")[0].reset(); 			
 			updModal.modal("hide");
 		});
 		
 		replyForm.ajaxForm({
 			dataType:'json',
 			success:replyListMaker,
 			error:function(resp){
 				alert(resp.status);
 			}
 		});
 		paging(1);
	});