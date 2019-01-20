 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
	</script>
</c:if>

<section class="s-content">
	<div class="row masonry-wrap">
	<form:form modelAttribute="free" id = "freeForm" method = "post" enctype="multipart/form-data">
		<input type="hidden" name="board_no" value="${board.board_no }" /> 
		<input type="hidden" name="mem_id" value="${authMember.person_id}" />
		
		<table>
			<tr>
				<th>글 제목</th>
				<td><div class = "input-group">
					<input type = "text" name = "board_title"
						value = "${board.board_title }">
				</div></td>
			</tr>
			
			<tr>				
				<th>기존 파일</th>
				<td>
					<c:forEach items="${board.freeFileList }" var="file" varStatus="vs">
						<span>
							${file.board_file_name }
							<span class="fileDelete" id="span_${file.board_file_no }">[삭제]</span>
							<c:if test="${not vs.last }">&nbsp;|&nbsp;</c:if>
						</span>
					</c:forEach>
				</td>
			</tr>
			
			<tr>	
				<th>첨부파일</th>
				<td>
					<input type="file" name="free_file" />
					<input type="file" name="free_file" />
					<input type="file" name="free_file" />
				</td>
			</tr>
			
			<tr>
				<th>글내용</th>
				<td>
					<div class="input-group">
						<textarea rows="10" cols="150" name="board_content" id="board_content">${board.board_content }</textarea>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="저장" />
					<input type="reset" value="취소" />
					<input type="button" value="뒤로가기" 
						onclick="history.back();"
					/>
				</td>
			</tr>
		</table>
	</form:form>
	
	<script type="text/javascript">
		var boardForm = $("#boardForm");
		var inputTag = "<input type='text' name='delFiles' value='%v' />";
		$(".fileDelete").on("click", function(){
			$(this).parent().hide();
			var regex = /span_(\d+)/ig;
			var file_no = regex.exec($(this).prop("id"))[1];
			boardForm.append(inputTag.replace("%v", file_no));
		});
		CKEDITOR.replace('board_content', {

		      extraAllowedContent: 'h3{clear};h2{line-height};h2 h3{margin-left,margin-top}',

		      // Adding drag and drop image upload.
		      extraPlugins: 'uploadimage',
		      uploadUrl: '${pageContext.request.contextPath}/freeboard/uploadImage.do',

		      // Configure your file manager integration. This example uses CKFinder 3 for PHP.
		      filebrowserImageUploadUrl: '${pageContext.request.contextPath}/freeboard/uploadImage.do',

		      height: 560,

		      removeDialogTabs: 'image:advanced;link:advanced'
	    });
	</script>
</div>
</section>