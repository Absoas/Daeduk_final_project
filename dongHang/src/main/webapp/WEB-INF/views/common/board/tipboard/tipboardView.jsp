<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="<c:url value='/js/replyProcess3.js' />"></script>
<script type="text/javascript">
	$.getContextPath = function(){
		return "${pageContext.request.contextPath}";
	}
	
	function deleteFunc(travel_tip_no){
		var travel_tip_pass = prompt("비밀번호 입력");
		if(!travel_tip_pass) return;
		document.deleteForm.travel_tip_pass.value=travel_tip_pass;
		document.deleteForm.submit();
	}
	function aFunc(travel_tip_no){
		document.deleteForm.submit();
	}
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
	
</script>

<section class="s-content s-content--narrow s-content--no-padding-bottom">
<article class="row format-gallery">
	<div class="s-content__header col-full">
	<form name="deleteForm" action="<c:url value='/tipboard/tipboardDelete.do' />" method="post">
		<input type="hidden" name="travel_tip_no" value="${travel_tip.travel_tip_no }" />
		<input type="hidden" name="travel_tip_pass" />
		<input type="hidden" name="travel_tip_mem_id" value="${authMember.person_id}"/>
	</form>
	<h1 class="s-content__header-title">
		${travel_tip.travel_tip_title}
	</h1>
	<ul class="s-content__header-meta">
		<li class="date">${travel_tip.travel_tip_date}</li>
		<li class="cat">
			<a>조회수 : ${travel_tip.travel_tip_view_count}</a>
			<a>추천수 : ${travel_tip.travel_tip_recommend_count}</a>
			첨부파일 :
			<c:forEach items="${travel_tip.pdsList }" var="pds" varStatus="vs">
				<c:url value="/tipboard/tipboardDownload.do" var="downloadURL">
					<c:param name="what" value="${pds.travel_tip_file_no }" />
				</c:url>
				<a href="${downloadURL }">${pds.travel_tip_file_name }</a>
				<c:if test="${not vs.last }">&nbsp;|&nbsp;</c:if>
			</c:forEach>
		</li>
	</ul>
	</div>
	<div class="col-full s-content__main">
		<p>${travel_tip.travel_tip_content}</p>
		<div class="s-content__author">
                   <img src="${pageContext.request.contextPath}/boardImages/I.jpg" alt="">

                   <div class="s-content__author-about">
                       <h4 class="s-content__author-name">
                           <a href="#0">${travel_tip.travel_tip_mem_id}</a>
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
    			<c:url value="/tipboard/tipboardUpdate.do" var="updateURL">
					<c:param name="what" value="${travel_tip.travel_tip_no }" />
				</c:url>
				<input type="button" value="수정" 
					onclick="location.href='${updateURL}';"
				/>
				
				<input type="button" value="삭제" 
					onclick="deleteFunc(${travel_tip.travel_tip_no});"
				/>
				<c:url value="/tipboard/tipboardInsert.do" var="insertURL">
					<c:param name="parent" value="${travel_tip.travel_tip_no }"/>
				</c:url>
				
				<c:url value="/tipboard/tipboardRcmd.do" var="rcmdURL">
					<c:param name="what" value="${travel_tip.travel_tip_no }" />
				</c:url>
				<input type="button" value="추천하기" 
					onclick="location.href='${rcmdURL}';"
				/>
				
</article>
	<div class="comments-wrap">
	 <div id="comments" class="row">
   	  <div class="col-full">
     		<h3 class="h2"> COMMENTS  </h3>
		     	<ol class="commentlist">
		     		<li class="depth-1 comment">
		     			<div id="listBody"></div>
		     		</li>
		     	</ol>
		     	<div class="respond">
				<h3 class="h1">Add Comment</h3>
					<form name="replyForm" method="post" action='<c:url value="/tipboard/replyInsert.do" />'>
						<fieldset>
						<input type="hidden" name="travel_tip_reply_no" />
						<input type="hidden" name="travel_tip_reply_pass" />
						<input type="hidden" name="travel_tip_no" value="${travel_tip.travel_tip_no }" />
						<div class="form-field">
						작성자 :<input type="text" name="travel_tip_mem_id" class="full-width" placeholder="작성자 ID" value="${authMember.person_id}" readonly="readonly"/>
						</div>
						내용 : <textarea name="travel_tip_reply_content" class="full-width" placeholder="작성내용을 입력하세요."></textarea>
						<input type="submit" value="등록" class="submit btn--primary btn--large full-width"/>
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
          <span aria-hidden="true">삭제하시려면 비밀번호를 입력하세요 :</span>
      </div>
      <div class="modal-travel_tipdy">
      	<form onsubmit="return false;" id="modalForm">
      		<input type="hidden" id="travel_tip_no" value="${travel_tip.travel_tip_no }"/>
      		<input type="hidden" id="travel_tip_mem_id"/>
      		<input type="hidden" id="travel_tip_reply_no" />
        	<input type="text" id="travel_tip_reply_pass" />
        </form>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="modalBtn">삭제</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
function paging(page){
	pagingReply(page, ${travel_tip.travel_tip_no});
	}
</script> 








