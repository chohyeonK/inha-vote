<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/03/24
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>투표 서비스</title>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <script src="../../../resources/js/manager.js"></script>
<%--    <script src="../../../resources/js/common.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="main-banner">
    <%@include file="../layout/top_menu.jsp" %>

    <div class="main-banner-l">
        <div class="main-font">
            인하대 투표도<br>
            이제는<br>
            온라인에서!
            <div class="main-btn" onclick="goVote()">
                투표하기
            </div>
        </div>
        <div>
            <img src="../../../resources/img/main-person.png" width="430">
        </div>
    </div>
</div>
<div class="main-content">
    <div class="main-content-l">
        <div class="highlight">
            미래융합대학<br>
            학생을 위한<br>
            온라인 투표
        </div>
    </div>

    <div class="main-content-r">
        <div class="main-content-r-itm">
            <div style="line-height: 40px;">
                번거롭지 않게<br>
                어디에서나<br>
                투표 가능!
            </div>
        </div>
        <div class="main-content-r-itm" style="margin-left: 25px;">
            <div>
                인하대 메일만<br>
                있다면<br>
                투표 가능!
            </div>
        </div>
    </div>
</div>

<%@include file="../layout/footer.jsp" %>

<script>
    function goVote() {
        window.location.href = "/CreateVote";
    }
</script>
</body>
</html>
