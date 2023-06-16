<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/04/10
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사용자</title>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <link href="../../../resources/css/user.css" rel="stylesheet">
    <script src="../../../resources/js/manager.js"></script>
<%--    <script src="../../../resources/js/common.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="user-bg">
    <div class="user-frame">
        <div class="user-top">
            <div class="highlight"><span class="user-vote-title"><c:forEach var="name" items="${vote_list}" >${name.votename}</c:forEach></span></div> <br>
            투표 시작 : ${start_date}<br>
            투표 종료 : ${end_date}
        </div>
        <div class="user-menu">
            <div class="user-menu-item" onclick="location.href='UserInfo_list=${manager_id}?vote_id=${vote_id}'">
                <img src="../../../resources/img/icon/document.png" /> 투표 정보
            </div>
            <div class="user-menu-item" onclick="location.href='UserEmail=${manager_id}'">
                <img src="../../../resources/img/icon/vote.png" /> 투표 하기
            </div>
            <div class="user-menu-item" onclick="location.href='UserResult=${manager_id}'">
                <img src="../../../resources/img/icon/result.png" />투표 결과
            </div>
        </div>

        <%--    <div class="d-flex justify-content-center" style="margin: 15px">--%>
        <%--        <button type="button" class="btn btn-primary btn-lg" onclick="location.href='UserInfo=${manager_id}'">투표 정보</button>--%>
        <%--    </div>--%>
        <%--    <div class="d-flex justify-content-center" style="margin: 15px">--%>
        <%--        <button type="button" class="btn btn-primary btn-lg" onclick="location.href='UserEmail=${manager_id}'">투표 하기</button>--%>
        <%--    </div>--%>
        <%--    <div class="d-flex justify-content-center" style="margin: 15px">--%>
        <%--        <button type="button" class="btn btn-primary btn-lg" onclick="location.href='UserResult=${manager_id}'">투표 결과</button>--%>
        <%--    </div>--%>
    </div>
</div>

</body>
</html>