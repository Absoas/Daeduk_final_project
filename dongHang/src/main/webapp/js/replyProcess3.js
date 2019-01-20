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
                    html += "<img width='50' height='50' class='avatar' src='../boardImages/I.jpg'>";
                    html += "</div>";
                    html += "<div class='comment__content'>";
                    html += "<div class='comment__info'>";
                    html += "<cite>"+reply.travel_tip_mem_id+"</cite>";
                    html += "<div class='comment__meta'>";
                    html += "<time class='comment__time'>"+reply.travel_tip_reply_date+"</time>";
                    html += "</div>";
                    html += "</div>";
                    html += "<div class='comment__text'>";
                    html += "<p>"+reply.travel_tip_reply_content+"</p>";
                    html += "<p id='"+reply.travel_tip_mem_id+"_"+reply.travel_tip_reply_no+"'><span data-toggle='modal'  data-target='#replyDeleteModal' class='replyDelBtn'>[삭제]</span></p>";
                    html += "</div>";
                    html += "</div>";
				});
			}else{
				html += "<li>댓글이 없습니다.</li>";
			}
			$.pagingArea.html(resp.pagingHTML);	
			listBody.html(html);
			replyForm[0].reset();
		}
	}
	
	function pagingReply(page, travel_tip_no){
		$.ajax({
			url:$.getContextPath()+"/tipboard/replyList.do",
			data:{
				travel_tip_no:travel_tip_no,
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
 		travel_tip_reply_no = "";
 		travel_tip_mem_id = "";
 		listBody.on("click", "span" ,function(){
 			console.log("눌렸음");
 			var trId = $(this).closest("p").prop("id");
 			travel_tip_reply_no = trId.substring(trId.indexOf("_")+1);
 			travel_tip_mem_id = trId.substring(0,trId.indexOf("_"));
 			console.log(travel_tip_reply_no);
 			console.log(travel_tip_mem_id);
 			delModal.find("#travel_tip_reply_no").val(travel_tip_reply_no);
 			delModal.modal("show");
 		});
 		
 		$("#modalBtn").on("click", function(){
 			var action = replyForm.attr("action");
 			replyForm.attr("action", $.getContextPath()+"/tipboard/replyDelete.do");
 			var travel_tip_reply_pass = delModal.find("#travel_tip_reply_pass").val();
 			replyForm.find("[name='travel_tip_reply_no']").val(travel_tip_reply_no);
 			replyForm.find("[name='travel_tip_reply_pass']").val(travel_tip_reply_pass);
 			console.log(travel_tip_reply_pass);
 			replyForm.find("[name='travel_tip_mem_id']").val(travel_tip_mem_id);
 			replyForm.submit();
 			replyForm.attr("action", action);
 			replyForm[0].reset();
 			$("#modalForm")[0].reset(); 			
 			delModal.modal("hide");
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