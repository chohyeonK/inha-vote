<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/03/24
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>투표 서비스</title>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <script src="../../../resources/js/manager.js"></script>
    <script src="../../../resources/js/common.js"></script>
    <script src="../../../resources/js/user.js"></script>
</head>
<body>
<div class="frame">
    <div style="border: 1px solid black; padding: 10px;">
        <div style="border: 1px solid black; padding: 10px;">
            ${vote_name}<br>
            투표 시작 : ${start_date}<br>
            투표 종료 : ${end_date}
        </div>
    </div>

    <div style="max-height: 750px; overflow: auto;">
        <c:forEach var="list" items="${candidate_student}" varStatus="status">
            <div class="d-flex bd-highlight mb-3" style="height: 100px">
                <div class="align-self-center p-2 bd-highlight">
                    <label for="${list.student_id}">
                        <input class="form-check-input" type="radio" name="radioCandidate" value="${list.student_id}"  id="${list.student_id}">
                        기호 ${status.index+1}번 ${list.student_name}
                    </label>
                </div>
<%--                <div class="align-self-center p-2 bd-highlight">기호 ${status.index+1}번 ${list.student_name}</div>--%>
                <div class="p-2 bd-highlight" style="width: 100px; height: 100px; border: 1px solid black;">
                    <img src="<c:url value="/resources/img_candidate/${list.img_path}"/>"class="img-fluid rounded-start" alt="...">
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="d-flex justify-content-center" style="margin: 15px">
        <button type="button" class="btn btn-primary btn-lg" onclick="onVote('${vote_student_id}', '${vote_id}', '${manager_id}')">투표 완료</button>
    </div>
</div>

<%--로딩 스피너 구현--%>
<div id="overlay">
    <span class="loader"></span>
</div>
</body>
</html>