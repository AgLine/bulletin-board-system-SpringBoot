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
function fn_joinClick(){
    if($("#userName").val() == ""){
        alert("이름을 입력해주세요");
        return;
    }

    if($("#userID").val() == ""){
        alert("아이디를 입력해주세요");
        return;
    }

    if($("#userEmail").val() == ""){
        alert("이메일을 입력해주세요");
        return;
    }

    if($("#userPwd").val() == ""){
        alert("비밀번호를 입력해주세요");
        return;
    }

    if($("#userPwd").val() != $("#userPwdRe").val()){
        alert("비밀번호를 다시 입력해주세요");
        return;
    }

    if(document.getElementById("idDuplication").value == 'idUnCheck'){
        alert("아이디 중복체크를 해주세요.");
        return;
    }

    var parameters = $("#frm").serialize();
    $.ajax({
        type:"post",
        dataType:"json",
        async:false,
        url:"<c:url value='/bbs/joinInsert'/>",
        data:parameters ,
        success:function(data){
            alert(data.result);
            location.href = "/bbs/list";
        }
    });
}

function fn_idClick(){
    var parameters = $("#frm").serialize();
    $.ajax({
        type:"post",
        dataType:"json",
        async:false,
        url:"<c:url value='/bbs/idCheck'/>",
        data:parameters ,
        success:function(data){
            if(data.result == 'false'){
                alert("중복된 아이디입니다.");
            }else{
                document.getElementById("idDuplication").value="idCheck";
                alert("사용 가능한 아이디 입니다.");
            }
        }
    });
}
</script>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register</title>
        <link href="./resources/css/styles.css" rel="stylesheet" />

</head>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                <div class="card-body">
                                    <form class="form-horizontal" name="frm" id="frm" method="get" onsubmit="return false;">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="userName" name="userName" type="text" placeholder="Enter your first name" value="${searchVO.userName}">
                                                    <label for="inputFirstName">name</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" id="userID" name="userID" type="text" placeholder="Enter your ID" />
                                                    <input type="hidden" id="idDuplication" name="idDuplication" value="idUnCheck"/>
                                                    <label for="inputID">ID</label>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><button onclick="fn_idClick();" class="btn btn-primary btn-block">id check</button></div>
                                            </div>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="userEmail" name="userEmail" type="email" placeholder="name@example.com" value="${searchVO.userEmail}">
                                            <label for="inputEmail">Email address</label>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="userPwd" name="userPwd" type="password" placeholder="Create a password" value="${searchVO.userPwd}">
                                                    <label for="inputPassword">Password</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="userPwdRe" name="userPwdRe" type="password" placeholder="Confirm password">
                                                    <label for="inputPasswordConfirm">Confirm Password</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid"><button onclick="fn_joinClick();" class="btn btn-primary btn-block">Create Account</button></div>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="login.html">Have an account? Go to login</a></div>
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

