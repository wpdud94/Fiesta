<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
		$('button[name=reviewInsert]').click(function() {
			window.location.href="ShowService.do?companycode="+$('input[type=hidden]').val();
		});//button[name=reviewInsert] click
	});//ready
    </script>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript">
   
	
    $(function() {
		$('button[name=reviewInsert]').click(function() {
			window.location.href="./review/insertReview.jsp";
		});//button[name=reviewInsert] click
		
		$('.collapsible').collapsible();
		
	});//ready

    </script>
    
    
</head>
<body>
<!-- 업체 마이페이지로도 사용할 수 있음 -->
<!-- 업체 1개에 대한 정보가 들어옴 / 찜하기 -->
<h3>업체소개</h3>

<h3 align="center">서비스</h3><p>
<table border="2" width="350" bgcolor="yellow" align="center">
	<c:forEach items="${serviceList}" var="service">
		<tr>
			<td>${service.serviceName}</td>
			<td>${service.serviceImg}</td>
			<td>${service.serviceDesc}</td>
			<td>${service.serviceTag}</td>
		</tr>
	</c:forEach>
</table>
<a href="ServiceDelete.do?serviceCode=4">삭제</a>
<p></p>
<hr>
<!-- 리뷰 / 문의 : 탭 방식 -->
<!-- 리뷰에 대한 답은 해당 고객만 -->
<!-- 나중에 '리뷰하기'는 마이페이지로 이동 -->
<div id="review">
	<div id="reviewInsert">
	<button name="reviewInsert">리뷰하기</button>
	<input type="hidden" name="companycode" value="${companycode}">
	</div>
	<div id="reviewScore">
	평점 : 
	<span>리뷰개수</span>
	</div>
	<hr>
	<c:forEach items="${list2}" var="review">
	<div id="reviewContent">
	<span>이름 : ${review.customer.custName}, </span><span>만족도 : ${review.reviewScore}, </span><span>일시 : ${review.reviewDate}</span><br>
	<span><img src= "${review.reviewImg}" width=100 height=100></span><br>
	<span>내용 : ${review.reviewDesc}</span><br>
	</div>
	<br>
	</c:forEach>
</div>
<hr>
<!-- 문의/답변하기 -->
<!-- 고객 문의, 업체 답변 -->

<!-- 문의내역 -->
 <ul class="collapsible">
 <c:forEach items="${questionList}" var="question">
    <li>
      <div class="collapsible-header">	<span>${question.qCode}</span> 
									    <span>${question.qDate}</span> 
									    <span>${question.qTitle}</span> 
									    <span>${question.qDesc}</span> 
									    <span>${question.qCondition}</span> </div>

			<c:if test="${question.qCondition eq '답변완료'}" >
			<c:forEach items="${answerList}"  var="answer">
				<c:if test="${answer.qCode == question.qCode}" >
	      		<div class="collapsible-body"><span>${answer.aDesc}</span>
	      										<span>${answer.aDate}</span></div>
	      		</c:if>
	      	</c:forEach>
      		</c:if>
	
		<c:if test="${question.qCondition eq '답변대기'}">
      		<div class="collapsible-body"><span>답변대기중입니다</span></div>
      		<c:set var="loop_flag" value="true" />
     	</c:if>
    </li>
</c:forEach> 
</ul>




</body>
</html>