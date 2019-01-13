<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE>
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<script>

	function ${pagingVO.funcName}(page){
		$("[name='searchForm']").find("[name='page']").val(page);
		$("[name='searchForm']").submit();
	}
	
	function makeList(data){
		var navTag = $('#navtag');
		var bodyTag = $('#bodylist');
		var body = "";
		var regex = /^(\s+)/;
		var boardList = data.dataList;
		if(bodyList){
			$.each(bodyList, function(i, board){
				var testArray = regex.exec(board.board_title);
				if(testArray && testArray.length > 0){
					console.log(board.board_title+"--"+testArray[1]+"-");
					board.board_title = board.board_title.replace(regex, Array(testArray[1].length).join("&nbsp;"));
				}
				body+="<tr><td>"+board.board_no+"</td>";
				body+="<td>"+board.board_title+"</td>";
				body+="<td>"+board.board_mem_id+"</td>";
				body+="<td>"+board.board_date+"</td>";
				body+="<td>"+board.board_view_count+"</td>";
				body+="<td>"+board.board_recommend_count+"</td></tr>";
			})
		}else{
			body+="<tr><td colspan='6'>데이터없음</td></tr>";
		}
		navTag.html(data.pagingHTML);
		bodyTag.html(body);
	}
	
	$(function(){
		var navTag = $('#navtag');
		var bodyTag = $('#bodylist');
		var searchForm = $('[name="searchForm"]');
		
		//뒤로가기
		$(window).on("popstate", function(event){
			console.log(event);
			if(event.originalEvent.state){
				var pagingVO = event.originalEvent.state;
				makeList(pagingVO);
			}else{
				location.reload();
			}
		});
		
		//submit 결과를 ajaxForm이 가져옴
		searchForm.ajaxForm({ 
		       dataType:  'json', 
		       success:  function (data){
				makeList(data);
				// 비동기 처리 성공 -> push state on history (state, title, url)
				var pageNum = searchForm.find('[name="page"]').val();
				var queryString = searchForm.serialize();
				
				history.pushState(data, pageNum+" 페이지", "?"+queryString);
				searchForm.find('[name="page"]').val("");
			},
		 });
		 
		//페이지context 이런거 안붙힐라고
		 <c:url value="/board/boardView.do" var="boardView" />
		 
		 $("#bodylist").on("click", "tr",function(){
			var what = $(this).find("td:nth-child(2)").text();
			location.href="${boardView}?what="+what;
		 });
		
	});
</script>
<body>
자유게시판 조회 기능
kr.or.ddit.freeboard.controller.FreeboardListController
<br><br>
	<table>
		<thead>
		<tr>
		<td>
			<form action = "<c:url value="/freeboard/freeboardRetrieve.do"/>" name="searchForm">
				<select class = "form-control" name = "searchType">
					<option value = "">전체</option>
					<option value = "writer">작성자</option>
					<option value = "title">제목</option>
					<option value = "content">내용</option>
				</select>
				
				<script type="text/javascript">
						$('[name="searchType"]').val("${param.searchType}");
				</script>
				
				<input type = "text" name = "searchWord" value = "${param.searchWord }"/>
				<input type = "submit" value = "검색"/>
			</form>
			</td>
			</tr>
			<tr>			
				<th>게시글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
		</thead>
		
		<tbody id = "bodyList">
			<c:choose>
			<c:when test="${not empty pagingVO.dataList }">
				<c:forEach items="${pagingVO.dataList }" var="board">
					<tr>
						<td>${board.board_no }</td>
						<td>${board.board_title }</td>
						<td>${board.mem_id }</td>
						<td>${board.board_date }</td>
						<td>${board.board_view_count }</td>
						<td>${board.board_recommend_count }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">검색 조건에 맞는 글이 없음.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
		
		<tfoot>
		<tr>
			<td>
				<nav aria-label="Page navigation" id="navtag">
				 	${pagingVO.pagingHTML } 
				</nav>
			</td>
		</tr>
			<tr>
				<td>
					<input type = "button" value = "작 성"
						onclick="location.href='<c:url value = "/freeboard/freeboardInsert.do"/>';"/>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>