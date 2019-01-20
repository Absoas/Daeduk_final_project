<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<style>
.pgn {
	margin: 3rem auto;
	text-align: center;
}

.pgn ul {
	display: inline-block;
	list-style: none;
	margin-left: 0;
	position: relative;
	padding: 0 6rem;
}

.pgn ul li {
	display: inline-block;
	margin: 0;
	padding: 0;
}

.pgn__num {
	font-family: "metropolis-bold", sans-serif;
	font-size: 1.5rem;
	line-height: 2.4rem;
	display: inline-block;
	padding: .6rem 1.2rem;
	height: 3.6rem;
	margin: .3rem .15rem;
	color: #151515;
	border-radius: 3px;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.pgn__num:hover {
	background: #808080;
	color: #ffffff;
}

.pgn .current, .pgn .current:hover {
	background-color: #000000;
	color: #FFFFFF;
}

.pgn .inactive, .pgn .inactive:hover {
	color: #888888;
	cursor: default;
}

.pgn__prev, .pgn__next {
	display: block;
	background-color: #FFFFFF;
	background-repeat: no-repeat;
	background-size: 18px 12px;
	background-position: center;
	height: 4.8rem;
	width: 4.8rem;
	line-height: 4.8rem;
	padding: 0;
	margin: 0;
	border-radius: 50%;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);
	font: 0/0 a;
	text-shadow: none;
	color: transparent;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
}

.pgn__prev:hover, .pgn__next:hover {
	background-color: #151515;
	color: #FFFFFF;
	text-decoration: none;
	background-repeat: no-repeat;
	background-position: center;
}

.pgn__prev {
	background-image: url("../images/icons/icon-arrow-left.svg");
	left: 0;
}

.pgn__prev:hover {
	background-image: url("../images/icons/icon-arrow-left-w.svg");
}

.pgn__next {
	background-image: url("../images/icons/icon-arrow-right.svg");
	right: 0;
}

.pgn__next:hover {
	background-image: url("../images/icons/icon-arrow-right-w.svg");
}

.pgn__prev.inactive, .pgn__next.inactive {
	background-color: #ffffff;
	opacity: 0.5;
	cursor: default;
}

.pgn__prev.inactive:hover {
	background-image: url("../images/icons/icon-arrow-left.svg");
}

.pgn__next.inactive:hover {
	background-image: url("../images/icons/icon-arrow-right.svg");
}

/* ------------------------------------------------------------------- 
 * responsive:
 * pagination
 * ------------------------------------------------------------------- */
@media only screen and (max-width:600px) {
	.pgn ul {
		padding: 0 5rem;
	}
	.pgn__prev, .pgn__next {
		height: 3.6rem;
		width: 3.6rem;
		line-height: 3.6rem;
		background-size: 12px 8px;
	}
}
</style>
<script type="text/javascript">

function ${pagingVO.funcName}(page){
	$("[name='searchForm']").find("[name='page']").val(page);
	$("[name='searchForm']").submit();
}
	
function makeList(data){
	var navTag = $('#navtag');
	var bodyTag = $('#bodylist');
	var body="";
	var regex = /^(\s+)/;
	var surveyList = data.dataList;
	if(surveyList){
		$.each(surveyList,function(i, survey){
			var testArray = regex.exec(survey.survey_title);
			if(testArray && testArray.length > 0){
				console.log(survey.survey_title+"--"+testArray[1]+"-");
				survey.survey_title = survey.survey_title.replace(regex, Array(testArray[1].length).join("&nbsp;"));
			}
			body+="<tr><td>"+survey.rnum+"</td>";
			body+="<td>"+survey.survey_no+"</td>";
			body+="<td>"+survey.survey_title+"</td>";
			body+="<td>"+survey.company_id+"</td>";
			body+="<td>"+survey.survey_date+"</td>";
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
	
	 <c:url value="/survey/surveyView.do" var="surveyView" />
	 
	 $("#bodylist").on("click", "tr",function(){
		var what = $(this).find("td:nth-child(2)").text();
		location.href="${surveyView}?what="+what;
	 });
})

</script>
<link href="${pageContext.request.contextPath}/css/paging.css">


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">설문조사</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>순번</th>
								<th>설문번호</th>
								<th>제목</th>
								<th>기업ID</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody id="bodylist">
							<c:choose>
								<c:when test="${not empty pagingVO.dataList }">
									<c:forEach items="${pagingVO.dataList }" var="survey">
										<tr>
											<td>${survey.rnum }</td>
											<td>${survey.survey_no }</td>
											<td>${survey.survey_title }</td>
											<td>${survey.company_id }</td>
											<td>${survey.survey_date }</td>
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
										${pagingVO.pagingHTML }</nav>

									<form action="<c:url value="/survey/surveyList.do"/>"
										name="searchForm" class="form-inline justify-content-center">
										<input type="hidden" name="page" /> <input type="hidden"
											name="company_id" value="${authMember.person_id}" /> <select
											class="form-control" name="searchType">
											<option value="">검색 조건</option>
											<option value="title">설문 제목</option>
										</select>
										<script type="text/javascript">
						$('[name="searchType"]').val("${param.searchType}");
					</script>
										<input class="form-control" type="text" name="searchWord"
											value="${param.searchWord }" /> <input
											class="btn btn-success" type="submit" value="검색" />
										&nbsp;&nbsp;&nbsp;
									</form>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>