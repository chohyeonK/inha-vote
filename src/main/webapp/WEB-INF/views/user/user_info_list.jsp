<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/04/21
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사용자-투표 정보-학생회장</title>
  <link href="../../../resources/css/common.css" rel="stylesheet">
  <link href="../../../resources/css/manager.css" rel="stylesheet">
  <script src="../../../resources/js/manager.js"></script>
  <script src="../../../resources/js/common.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="frame">
  <div style="border: 1px solid black; padding: 10px;"><br>${vote_name}<br><br></div>
  <div class="list-group" style="margin-top: 15px">
    <a onclick="location.href='list/candidate'" class="list-group-item list-group-item-action" style="padding: 30px">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">기호 1번</h5>
      </div>
    </a>
    <a class="list-group-item list-group-item-action" style="padding: 30px">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">기호 2번</h5>
      </div>
    </a>
    <a class="list-group-item list-group-item-action" style="padding: 30px">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">기호 3번</h5>
    </div>
  </a>
  </div>
</div>
</body>
</html>
