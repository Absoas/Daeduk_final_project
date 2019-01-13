<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${qnaboard.qnaboard_title }</title>
<script type="text/javascript">
	function deleteFunc(){
		if (confirm("게시글을 삭제하시겠습니까?") == true) {
			document.deleteForm.submit();
		} else {
			return;
		}
	}

</script>
</head>
<body>
	<form name="deleteForm" action='<c:url value="/qnaboard/qnaboardDelete.do" />' method="post" >
		<input type="hidden" name="qnaboard_no" value="${qnaboard.qnaboard_no }">
	</form>
	<table>
		<tr>
			<th>번호</th>
			<td>${qnaboard.qnaboard_no }</td>
		</tr>
		<tr>
			<th>회원명</th>
			<c:forEach items="${qnaboard.personList }" var="person">
				<td>${person.person_name }</td>
			</c:forEach>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${qnaboard.qnaboard_date }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${qnaboard.qnaboard_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qnaboard.qnaboard_content }</td>
		</tr>
		<tr>
			<td colspan="3">
				<c:url value="/qnaboard/qnaboardUpdate.do" var="updateURL">
					<c:param name="what" value="${qnaboard.qnaboard_no }"/>
				</c:url>
				<input type="button" value="수정" onclick="location.href='${updateURL }'"/>
				<input type="button" value="삭제" onclick="deleteFunc()" />
				<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/qnaboard/qnaboardList.do'" />
			</td>
		</tr>
	</table>
</body>
</html>