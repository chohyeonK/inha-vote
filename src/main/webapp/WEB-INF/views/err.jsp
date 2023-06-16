<%--
  Created by IntelliJ IDEA.
  User: choi
  Date: 2023-05-27
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Error Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <link href="../../../resources/css/err.css" rel="stylesheet">
    <script src="../../../resources/js/manager.js"></script>
<%--    <script src="../../../resources/js/common.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="main-banner">
    <%@include file="./layout/top_menu.jsp" %>

    <div class="err-banner-l">
        <div class="frame">
            <div>
                <img src="../../../resources/img/err-icon.png" width="100">
            </div>
            <div class="err-font">
                404: 페이지를 표시할 수 없습니다!
            </div>
            <div class="err-tab-content">
                <div id="reg1">
                    <c:if test="${manager_id == null}">
                        <div class="alert alert-danger" role="alert">
                            잘못된 접근입니다.
                        </div>
                    </c:if>
                    <c:if test="${err2 == false}">
                        <div class="alert alert-danger" role="alert">
                                ${end_date}이후 확인할 수 있습니다.
                        </div>
                    </c:if>
                    <c:if test="${err3 == false}">
                        <div class="alert alert-danger" role="alert">
                            이미 등록된 투표입니다. 수정은 관리자에게 문의해주세요.
                        </div>
                    </c:if>
                    <c:if test="${err4 == false}">
                        <div class="alert alert-danger" role="alert">
                            아직 등록 되지 않은 투표입니다. 등록을 먼저 진행해주세요.
                        </div>
                    </c:if>
                    <c:if test="${err5 == false}">
                        <div class="alert alert-danger" role="alert">
                            이미 만료된 투표입니다. 자세한 내용은 관리자에게 문의해주세요.
                        </div>
                    </c:if>
                    <c:if test="${user_page==true}">
                        <a href="UserHome=${user}"> 돌아가기</a>
                    </c:if>
                </div>
                <div class="err-font">
                    <div class="err-btn" onclick="goHome()">
                        홈으로 돌아가기
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="./layout/footer.jsp" %>
<%--<a href="/">돌아가기</a>--%>
<script>
    function goHome() {
        window.location.href = "/";
    }
</script>
</body>
</html>
