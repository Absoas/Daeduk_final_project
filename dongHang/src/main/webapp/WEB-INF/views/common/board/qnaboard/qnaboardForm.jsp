<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<!-- ckeditor안됨 -->
<c:if test="${not empty message }">
	<script>
	alert("${message}");
	</script>
</c:if>
</head>
<body>
QnA 게시판 질문 등록
26.	kr.or.ddit.qnaboard.controller.QuestionInsertController
QnA 게시판 댓글 등록
22.	kr.or.ddit.qnaboard.controller.AnswerInsertController
<form method="post" id="boardForm" >
	<input type="hidden" name="qnaboard_no" value="${qnaboard.qnaboard_no }" />
	<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="qnaboard_title"
					value="${qnaboard.qnaboard_title }" /><span class="error">${errors.qnaboard_title}</span></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mem_id" value="${qnaboard.mem_id }" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="12" rows="60" name="qnaboard_content">${qnaboard.qnaboard_content }</textarea></td>
			</tr>
			<tr>
			<td colspan="3">
				<input type="submit" value="등록" />
				<input type="reset" value="취소" />
				<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/qnaboard/qnaboardList.do'" />
			</td>
		</tr>
	</table>
</form>
<script>
	CKEDITOR.replace('bo_content', {
	
	    extraAllowedContent: 'h3{clear};h2{line-height};h2 h3{margin-left,margin-top}',
	
	    // Adding drag and drop image upload.
	    extraPlugins: 'uploadimage',
	    uploadUrl: '${pageContext.request.contextPath}/board/uploadImage.do',
	
	    // Configure your file manager integration. This example uses CKFinder 3 for PHP.
	    filebrowserImageUploadUrl: '${pageContext.request.contextPath}/board/uploadImage.do',
	
	    height: 560,
	
	    removeDialogTabs: 'image:advanced;link:advanced'
	});
</script>
</body>
</html>