<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.liHide{
		 list-style:none;
	}
</style>

<script type="text/javascript" src="<c:url value='/js/freeReplyProcess.js' />"></script>
<script type="text/javascript">
	$.getContextPath = function(){
		return "${pageContext.request.contextPath}";
	}
	
	$.getAuthMember = function(){
		return "${authMember.person_id}";
	}
	
	function deleteFunc(board_no){
		var result = confirm("삭제하시려면 확인을 눌러주세요.");
		if(result){
			document.deleteForm.submit();
		} else {
			return;
		}
	}
	
	function aFunc(board_no){
		document.deleteForm.submit();
	}
	
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
</script>

<section class="s-content s-content--narrow s-content--no-padding-bottom">
<article class="row format-gallery">
	<div class="s-content__header col-full">
	<form name="deleteForm" action="<c:url value='/freeboard/freeboardDelete.do' />" method="post">
		<input type="hidden" name="board_no" value="${board.board_no }" />
		<input type="hidden" name="board_pass" />
		<input type="hidden" name="mem_id" value="${board.mem_id}"/>
	</form>
	<h5>&#91;자유게시판	&#93;</h5>
	<h1 class="s-content__header-title">
		${board.board_title}
	</h1>
	<ul class="s-content__header-meta">
		<li class="liHide">${board.board_date}</li>
		<li class="liHide">
			<a>조회수 : ${board.board_view_count+1}</a>
			<a>추천수 : ${board.board_recommend_count}</a>
			첨부파일 :
			<c:forEach items="${board.freeFileList }" var="board" varStatus="vs">
				<c:url value="/freeboard/freeboardDownload.do" var="downloadURL">
					<c:param name="what" value="${board.board_file_no }" />
				</c:url>
				<a href="${downloadURL }">${board.board_file_name }</a>
				<c:if test="${not vs.last }">&nbsp;|&nbsp;</c:if>
			</c:forEach>
		</li>
	</ul>
	
	</div>
		<div class="col-full s-content__main">
			<p>${board.board_content}</p>
			<div class="s-content__author">
                   <div class="s-content__author-about">
                       <h4 class="s-content__author-name">
                           <a href="#0">${board.mem_id}</a>
                       </h4>
                       <p>개인의 소개말을 기입.</p>
                       <ul class="s-content__author-social">
                          <li>Facebook</li>
                          <li>Instagram</li>
                          <li>Google</li>
                          <li>Naver</li>
                       </ul>
                   </div>
   		</div>
    </div>
    
    <c:url value="/freeboard/freeboardUpdate.do" var="updateURL">
		<c:param name="what" value="${board.board_no }" />
	</c:url>
	
	<c:if test="${authMember.person_id eq board.mem_id}">
		<input type="button" value="수정" 
			onclick="location.href='${updateURL}';"
		/>
	</c:if>
	
	<c:if test="${authMember.person_id eq board.mem_id}">
		<input type="button" value="삭제" 
			onclick="deleteFunc(${board.board_no});"
		/>
	</c:if>
	<c:url value="/freeboard/freeboardInsert.do" var="insertURL">
		<c:param name="parent" value="${board.board_no }"/>
	</c:url>
	
	
	<c:url value="/freeboard/freeboardRcmd.do" var="rcmdURL">
		<c:param name="what" value="${board.board_no }" />
		<c:param name = "auth" value = "${authMember.person_id }"/>
	</c:url>
	
	<c:if test = "${not empty authMember.person_id }">
		<input type="button" value="추천하기" 
			onclick="location.href='${rcmdURL}';"
		/>
	</c:if>
</article>
<div class="comments-wrap">
	 <div id="comments" class="row">
   	  <div class="col-full">
     		<h3 class="h2"> COMMENTS  </h3>
		     	<ol class="commentlist">
		     		<li class="depth-1 comment" style="list-style: none">
		     			<div id="listBody"></div>
		     		</li>
		     	</ol>
		     	<div class="respond">
				<h3 class="h1">Add Comment</h3>
					<form name="replyForm" method="post" action='<c:url value="/freeboard/replyInsert.do" />'>
						<fieldset>
						<input type="hidden" name="board_reply_no" />
						<input type="hidden" name="board_reply_pass" />
						<input type="hidden" name="board_no" value="${board.board_no }" />
						<div class="form-field">
						<input type="hidden" name="board_reply_mem_id" class="full-width" value="${authMember.person_id}" readonly="readonly"/>
						</div>
						<c:if test="${empty authMember.person_id }">
							내용 : <textarea name="board_reply_content" class="full-width" placeholder="로그인 후 이용하실 수 있습니다." readonly="readonly"></textarea>
						</c:if>
						<c:if test="${not empty authMember.person_id }">
							내용 : <textarea name="board_reply_content" class="full-width" placeholder="작성내용을 입력하세요."></textarea>
							<input type="submit" value="등록" class="submit btn--primary btn--large full-width"/>
						</c:if>
					</fieldset>
				</form>
			</div>
    	</div>
	</div>
</div>

<table class="table">
	<tr>
		<td colspan="2">
			
		</td>
	</tr>
</table>
</section>

<!-- Modal -->
<div class="modal fade" id="replyDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <span aria-hidden="true">수정/삭제하시려면 비밀번호를 입력하세요 :</span>
      </div>
      <div class="modal-freedy">
      	<form onsubmit="return false;" id="modalForm">
      		<input type="hidden" id="board_no" value="${board.board_no }"/>
      		<input type="hidden" id="board_reply_mem_id"/>
      		<input type="hidden" id="board_reply_no" />
        	<input type="text" id="board_reply_pass" />
        </form>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="modalUpdBtn">수정</button>
        <button type="button" class="btn btn-primary" id="modalDelBtn">삭제</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
function paging(page){
	pagingReply(page, ${board.board_no});
}

</script> 