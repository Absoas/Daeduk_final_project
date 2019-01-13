<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <script src="http://malsup.github.com/jquery.form.js"></script> -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">
function ${pagingVO.funcName }(page){
	$("[name='searchForm']").find("[name='page']").val(page);
	$("[name='searchForm']").submit();
}
	
function makeList(data){
	var navTag = $('#navtag');
	var bodyTag = $('#bodylist');
	var body="";
	var regex = /^(\s+)/;
	var reviewList = data.dataList;
	if(reviewList){
		$.each(reviewList,function(i, review){
			var testArray = regex.exec(review.review_title);
			if(testArray && testArray.length > 0){
				console.log(review.review_title+"--"+testArray[1]+"-");
				review.review_title = review.review_title.replace(regex, Array(testArray[1].length).join("&nbsp;"));
			}
			body+="<tr><td>"+review.rnum+"</td>";
			body+="<td>"+review.review_no+"</td>";
			body+="<td>"+review.review_title+"</td>";
			$.each(review.personList,function(i, person){
				body+="<td>"+person.person_name+"</td>";
			})
			body+="<td>"+review.review_mem_id+"</td>";
			body+="<td>"+review.review_date+"</td>";
			body+="<td>"+review.review_view_count+"</td>";
			body+="<td>"+review.review_recommend_count+"</td></tr>";
		})
	}else{
		body+="<tr><td colspan='7'>데이터없음</td></tr>";
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
// 	searchForm.ajaxForm({ 
// 	       dataType:  'json', 
// 	       success:  function (data){
// 			makeList(data);
// 			// 비동기 처리 성공 -> push state on history (state, title, url)
// 			var pageNum = searchForm.find('[name="page"]').val();
// 			var queryString = searchForm.serialize();
			
// 			history.pushState(data, pageNum+" 페이지", "?"+queryString);
// 			searchForm.find('[name="page"]').val("");
// 		},
// 	 });
	 
	//페이지context 이런거 안붙힐라고
	 <c:url value="/postboard/postboardView.do" var="postboardView" />
	 
	 $("#bodylist").on("click", "tr",function(){
		var what = $(this).find("td:nth-child(2)").text();
		location.href="${postboardView}?what="+what;
	 });
})

</script>    
<table class="table table-bordered table-striped table-hover">
	<thead class="thead-dark">
		<tr>
			<th>순번</th>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
	</thead>
	<tbody id="bodylist">
		<c:choose>
			<c:when test="${not empty pagingVO.dataList }">
				<c:forEach items="${pagingVO.dataList }" var="review">
					<tr>
						<td>${review.rnum }</td>
						<td>${review.review_no }</td>
						<td>${review.review_title }</td>
						<c:forEach items="${review.personList }" var="person">
								<td>${person.person_name }</td>
						</c:forEach>
						<td>${review.review_date }</td>
						<td>${review.review_view_count }</td>
						<td>${review.review_recommend_count }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">검색 조건에 맞는 글이 없음.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="7" class="text-center">
				<nav aria-label="Page navigation" id="navtag">
				 	${pagingVO.pagingHTML } 
				</nav>
				
				<form action="<c:url value="/postboard/postboardRetrieve.do"/>" name="searchForm" class="form-inline justify-content-center">
					<input type="hidden" name="page" />
					<select class="form-control" name="searchType">
						<option value="">검색 조건</option>
						<option value="mem_id">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<script type="text/javascript">
						$('[name="searchType"]').val("${param.searchType}");
					</script>
					<input class="form-control" type="text" name="searchWord" 
							value="${param.searchWord }"/>
					<input class="btn btn-success" type="submit" value="검색" />
					&nbsp;&nbsp;&nbsp;
					<input class="btn btn-success" type="button" 
							value="새글쓰기" onclick="location.href='<c:url value="/postboard/postboardInsert.do"/>" 
					/>
				</form>
			</td>
		</tr>
	</tfoot>
</table>
    	
	
    