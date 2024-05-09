<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width", initial-scale="1">

<!--bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/styles.css" rel="stylesheet" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function fn_loginClick(){
    if($("#userId").val() == ""){
        alert("아이디를 입력해주세요");
        return;
    }

    if($("#userPwd").val() == ""){
        alert("비밀번호를 입력해주세요");
        return;
    }

    var parameters = $("#frm").serialize();
    $.ajax({
        type:"post",
        dataType:"json",
        async:false,
        url:"<c:url value='/bbs/loginAction'/>",
        data:parameters ,
        success:function(data){
            if(data.result == "Y"){
                location.href = "/bbs/list";
            }else{
                alert(data.result);
            }
        }
    });
}

$(document).ready(function(){

});
</script>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login</title>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                <div class="card-body">
                                    <form name="frm" id="frm" method="get" onsubmit="return false;">
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="userId" name="userId" placeholder="ID"/>
                                            <label for="inputEmail">ID</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="userPwd" name="userPwd" type="password" placeholder="Password" />
                                            <label for="inputPassword">Password</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <button onclick="fn_loginClick();" class="btn btn-primary btn-block">Login</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="/bbs/join">Create Account</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="/assets/demo/chart-area-demo.js"></script>
<script src="/assets/demo/chart-bar-demo.js"></script>
<script src="/js/datatables-simple-demo.js"></script>