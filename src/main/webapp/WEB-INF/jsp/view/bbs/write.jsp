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
function fn_writeClick(){
    if($("#bbsTitle").val() == ""){
        alert("제목을 입력해주세요");
        return;
    }
    if($("#bbsContent").val() == ""){
        alert("내용을 입력해주세요");
        return;
    }
    var parameters = $("#frm").serialize();
    $.ajax({
        type:"post",
        dataType:"json",
        async:false,
        url:"<c:url value='/bbs/writeAction'/>",
        data:parameters ,
        success:function(data){
            alert("작성완료");
            location.href = "/bbs/list";
        }
    });
}
</script>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <form class="form-horizontal" name="frm" id="frm" method="get" onsubmit="return false;">
                                <div class="card-header"><input class="form-control" id="bbsTitle" name="bbsTitle" type="text" placeholder="제목을 입력해주세요" value="${searchVO.bbsTitle}"></div>
                                <div class="card-body">
                                    <textarea class="form-control" id="bbsContent" name="bbsContent" rows="10" placeholder="내용을 입력해주세요"></textarea>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button onclick="fn_writeClick();" class="btn btn-primary btn-block">작성</button></div>
                                    </div>
                                </div>
                                </form>
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
