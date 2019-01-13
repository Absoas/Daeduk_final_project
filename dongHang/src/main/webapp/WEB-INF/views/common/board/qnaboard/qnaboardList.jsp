<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>
<title>QNA게시판</title>
<script>
$(function(){
	<c:url value="/qnaboard/qnaboardView.do" var="boardView" />
	$("#bodyList").on("click", "tr", function(){
		var what = $(this).find("td:nth-child(1)").text();
		location.href="${boardView}?what="+what;
	});
})
</script>
</head>
<body>
QnA 게시판 조회
18.	kr.or.ddit.qnaboard.controller.QnAListController
<br>
<input type="button" value="등록" onclick="location.href='${pageContext.request.contextPath}/qnaboard/qnaboardForm.do'"  />
<table>
	<thead>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody id="bodyList">
		<c:choose>
			<c:when test="${not empty pagingVO.dataList }">
				<c:forEach items="${pagingVO.dataList }" var="qnaboard">
					<tr>
						<td>${qnaboard.qnaboard_no }</td>
						<td>${qnaboard.qnaboard_title }</td>
						<c:forEach items="${qnaboard.personList}" var="person">
							<td>${person.person_name}</td>
						</c:forEach>
						<td>${qnaboard.qnaboard_date }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">게시글이 없음</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				${pagingVO.pagingHTML }
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>