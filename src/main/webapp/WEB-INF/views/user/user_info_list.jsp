<%--
  Created by IntelliJ IDEA.
  User: choi
  Date: 2023-05-20
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사용자-투표 정보</title>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <link href="../../../resources/css/user.css" rel="stylesheet">
    <script src="../../../resources/js/manager.js"></script>
<%--    <script src="../../../resources/js/common.js"></script>--%>
    <script src="../../../resources/js/user.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<div class="user-bg">
    <div class="user-frame">
        <div class="user-top">
            <div class="highlight"><span class="user-vote-title">${vote_name}</span></div> <br>
        </div>

        <div class="user-info" style="max-height: 450px; overflow: auto;">
            <c:forEach var="list" items="${cadidate_student}" varStatus="status">
                <div class="user-menu-item" onclick="location.href='/UserInfo_candidate?vote_id='+`${vote_id}`+'&student_id='+`${list.student_id}`+'&candiNum='+`${status.index+1}`">
<%--
                    <img src="<c:url value="/home/pi/img/${list.img_path}"/>"class="img-fluid rounded-start" alt="...">
--%>
                    <img src="<c:url value="/resources/img/candidate_img/${list.img_path}"/>"class="img-fluid rounded-start" alt="...">
                    <h5 class="user-info-txt">기호 ${status.index+1}번 ${list.student_name}</h5>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
