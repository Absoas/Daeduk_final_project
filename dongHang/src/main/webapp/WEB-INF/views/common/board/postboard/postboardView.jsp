<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="<c:url value='/js/replyProcess.js' />"></script>

<script type="text/javascript">
	$.getContextPath = function(){
		return "${pageContext.request.contextPath}";
	}
	
// 	function deleteFunc(review_no){
// 		var review_pass = prompt("비밀번호 입력");
// 		if(!review_pass) return;
// 		document.deleteForm.review_pass.value=review_pass;
// 		document.deleteForm.submit();
// 	}
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
</script>
	<form name="deleteForm" action="<c:url value='/postboard/postboardDelete.do' />" method="post">
		<input type="hidden" name="review_no" value="${review.review_no }" />
	</form>
	<table class="table">
		<tr>
			<th>게시글 번호</th>
			<td>${review.review_no}</td>
		</tr>
		<tr>
			<th>게시글 작성자</th>
			<td>${review.review_mem_id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${review.review_title}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${review.pdsList }" var="pds" varStatus="vs">
					<c:url value="/postboard/postboardDownload.do" var="downloadURL">
						<c:param name="what" value="${pds.review_file_no }" />
					</c:url>
					<a href="${downloadURL }">${pds.review_file_name }</a>
					<c:if test="${not vs.last }">&nbsp;|&nbsp;</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${review.review_content}</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${review.review_date}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${review.review_view_count}</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${review.review_recommend_count}</td>
		</tr>
		<tr>
			<td colspan="2">
				<c:url value="/postboard/postboardUpdate.do" var="updateURL">
					<c:param name="what" value="${review.review_no }" />
				</c:url>
				<input type="button" value="수정" 
					onclick="location.href='${updateURL}';"
				/>
				<input type="button" value="삭제" 
<%-- 					onclick="deleteFunc(${review.review_no});" --%>
				/>
				<c:url value="/postboard/postboardInsert.do" var="insertURL">
					<c:param name="parent" value="${review.review_no }"/>
				</c:url>
				<input type="button" value="답글쓰기" 
					onclick="location.href='${insertURL}';"
				/>
			</td>
		</tr>
	</table>
<!-- 	<div> -->
<!-- 		<form name="replyForm" method="post"  -->
<%-- 			action='<c:url value="/reply/replyInsert.do" />'> --%>
<!-- 			<input type="hidden" name="rep_no" /> -->
<%-- 			<input type="hidden" name="review_no" value="${review.review_no }" /> --%>
<!-- 			작성자 : <input type="text" name="rep_writer" /> -->
<!-- 			비밀번호 : <input type="password" name="rep_pass" /> -->
<!-- 			내용 : <textarea name="rep_content" rows="3" cols="100"></textarea> -->
<!-- 			<input type="submit" value="등록" /> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- 	<table class="table"> -->
<!-- 	<thead class="thead-dark"> -->
<!-- 		<tr> -->
<!-- 			<th>댓글 작성자</th> -->
<!-- 			<th>댓글작성 IP</th> -->
<!-- 			<th>댓글내용</th> -->
<!-- 			<th>댓글단 날짜</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- 	<treviewdy id="listreviewdy"> -->
<!-- 	</treviewdy> -->
<!-- 	<tfoot> -->
<!-- 		<tr> -->
<!-- 			<td colspan="4"> -->
<!-- 				<nav aria-label="Page navigation" id="pagingArea"> -->
<!-- 				</nav> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</tfoot>		 -->
<!-- 	</table> -->


<!-- <!-- Modal --> -->
<!-- <div class="modal fade" id="replyDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-reviewdy"> -->
<!--       	<form onsubmit="return false;" id="modalForm"> -->
<%--       		<input type="hidden" id="review_no" value="${review.review_no }"/> --%>
<!--       		<input type="text" id="rep_no" /> -->
<!--         	비밀번호 : <input type="text" id="rep_pass" /> -->
<!--         </form>	 -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
<!--         <button type="button" class="btn btn-primary" id="modalBtn">삭제</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- <script type="text/javascript"> -->
<!-- 	function paging(page){ -->
<%-- 		pagingReply(page, ${review.review_no}); --%>
<!-- 	} -->
<!-- 	paging(1); -->
<!-- </script> -->











