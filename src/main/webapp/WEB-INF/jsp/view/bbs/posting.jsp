<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width", initial-scale="1">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>글작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $.ajax({
        type:"post",
        dataType:"json",
        async:false,
        url:"<c:url value='/bbs/loginCheck'/>",
        success:function(data){
            var addHtml='';
            if(data.result == "N"){
                addHtml += '<div class="d-grid"><button onclick="location.href=\'/bbs/list\'" class="btn btn-primary btn-block">글목록</button></div>';
            }else{
                addHtml += '<div class="card-header">';
                addHtml += '<div class="d-grid"><button onclick="location.href=\'/bbs/list\'" class="btn btn-primary btn-block">글목록</button></div>';
                addHtml += '</div>';
                addHtml += '<div class="card-header">';
                addHtml += '<div class="d-grid"><button onclick="location.href=\'/bbs/edit\'" class="btn btn-primary btn-block">수정하기</button></div>';
                addHtml += '</div>';
            }
            $("#loginCheck").append(addHtml);
        }
    });
});
</script>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><label class="form-control">${bbsVO.bbsTitle}</label></div>
                                <div class="card-body">
                                    <div class="card-header"><label class="form-control">${bbsVO.bbsContent}</label></div>
                                    <div name="loginCheck" id="loginCheck" class="mt-4 mb-0">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="/assets/demo/chart-area-demo.js"></script>
<script src="/assets/demo/chart-bar-demo.js"></script>
<script src="/js/datatables-simple-demo.js"></script>
