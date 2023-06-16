<%--
  Created by IntelliJ IDEA.
  User: lsh99
  Date: 2023-05-12
  Time: 오후 8:53
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
  <link href="../../../resources/css/user.css" rel="stylesheet">
  <script src="../../../resources/js/manager.js"></script>
<%--  <script src="../../../resources/js/common.js"></script>--%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<div class="user-bg">
  <div class="user-frame">
    <div class="user-top">
      <span class="user-vote-title">${vote_name} 결과</span>
    </div>

    <div class="user-menu">
      <div class="user-candidate">
        <div class="user-candidate-info">
<%--
          <img src="<c:url value="/home/pi/img/${student_img}"/>"class="img-fluid rounded-start" alt="...">
--%>
          <img src="<c:url value="/resources/img/candidate_img/${student_img}"/>"class="img-fluid rounded-start" alt="...">
          <div style="margin-left: 60px;">
            <div>당선인</div>
            <h5 class="card-title" style="font-size: 30px; font-weight: bold;"><div class="highlight">${student_name}</div></h5>
          </div>
          <img src="/resources/img/icon/celebration.png" style="width: 80px;" />
        </div>
        <hr>
        <div style="padding: 0px 20px;">
          <div style="margin-top: 10px;">득표수 ${vote_counter}</div>
          <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: ${vote_rate}%;" aria-valuenow="${vote_rate}" aria-valuemin="0" aria-valuemax="100">${vote_rate}%</div>
          </div>
          <div style="float: right">${vote_counter}/${total_vote_count}</div>
        </div>
        <div class="user-description" style="margin: 69px 20px 20px 20px;">
          결과는 ${end_date}까지 확인할 수 있습니다.
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
