<%--
  Created by IntelliJ IDEA.
  User: choi
  Date: 2023-05-20
  Time: 오전 9:50
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
    <script src="../../../resources/js/common.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script></head>
<body>
<div class="user-bg">
    <div class="user-frame">
        <div class="user-top">
            <span class="user-vote-title">후보자 상세 정보</span>
        </div>

        <div class="user-info">
            <div class="user-candidate">
                <div class="user-candidate-info">
<%--
                    <img src="<c:url value="/home/pi/img/${candidate_info.imgpath}"/>"class="img-fluid rounded-start" alt="...">
--%>
                    <img src="<c:url value="/resources/img/candidate_img/${candidate_info.imgpath}"/>"class="img-fluid rounded-start" alt="...">
                    <div style="margin-left: 20px;">
                        <h5 class="card-title"><div class="highlight">기호 ${candiNum}번 ${candidate.studentname}</div></h5>
                        <div class="candidate-spec">${candidate_info.candidatespec}</div>
                    </div>
                </div>
                <hr>
                <div style="padding-left: 20px;">
                    <div style="font-size: 22px; font-weight: bold; margin-bottom: 10px;">
                        <i class="bi bi-clipboard-check"></i><span style="margin-left: 10px;">공약</span>
                    </div>
                    <p class="card-text">${candidate_info.candidatepromise}</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<div class="frame">--%>
<%--    <div id="userinfo_3">--%>
<%--        <div class="row g-0">--%>
<%--            <div class="col-md-4">--%>
<%--                <img src="<c:url value="/resources/img/candidate_img/${candidate_info.imgpath}"/>"class="img-fluid rounded-start" alt="...">--%>
<%--            </div>--%>
<%--            <div class="col-md-8">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">기호 ${candiNum}번 ${candidate.studentname}</h5>--%>
<%--                    <p class="card-text">${candidate_info.candidatespec}</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card text-center" style="margin-top: 10px">--%>
<%--        <div class="card-header">--%>
<%--            <ul class="nav nav-pills card-header-pills">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active">공약</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="card-body">--%>
<%--            <p class="card-text">${candidate_info.candidatepromise}</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</div>--%>
</body>
</html>
