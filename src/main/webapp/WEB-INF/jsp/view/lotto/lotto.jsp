<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function fn_btn(){
	
	if($("#num").val()==0){
		alert("이상한값 입력하지 말자");
		return;
	}
	
	var parameters = $("#frm").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/lotto/num'/>",
		data:parameters ,
		success:function(data){
			$( '#dynamicBody').empty();
			for(var i = 0; i < data.result.length; i++){
				var addHtml="";
				addHtml += "<tr>";
				for(var j = 0; j < 6; j++){
					addHtml += "<td>" + data.result[i].number[j] + "</td>";
				}
				addHtml += "</tr>";
				$("#dynamicBody").append(addHtml);
			}
		}
	});
}
</script>
<body>
    <nav class="navbar navbar-light " style="background-color: #e3f2fd;">
		<div class="container-fluid">
			<a class="navbar-brand">Lotto</a>
		</div>
	</nav>

	<div class="container-md">
		<div>
			<img src="<spring:url value='/resources/img/lotto.png'/>">
		</div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<form name="frm" id="frm" method="post">
				<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="num" name="num">
					<option selected value="0">갯수선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<button type="button" class="btn btn-outline-info btn-lg" onclick="fn_btn()">번호 생성</button>				
			</form>
		</div>
		<table class="table table-hover">
			<tbody id="dynamicBody">
				
			</tbody>
		</table>
	</div>
	<footer>
	    <p style="font-size:40px;" class = "text-center text-muted">Copyright © 2021 AgLine.</p>
	</footer>
</body>

