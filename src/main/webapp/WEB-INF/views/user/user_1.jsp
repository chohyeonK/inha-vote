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
    <script src="../../../resources/js/manager.js"></script>
    <script src="../../../resources/js/common.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="frame">
    <div style="border: 1px solid black; padding: 10px;">미융대 학생회장, 부회장 선거<br>
    투표 시작 : 2023.03.01 00:00<br>
    투표 종료 : 2023.04.01 00:00</div>
    <div class="d-flex justify-content-center" style="margin: 15px">
        <button type="button" class="btn btn-primary btn-lg" onclick="location.href='User2'">투표 정보</button>
    </div>
    <div class="d-flex justify-content-center" style="margin: 15px">
        <button type="button" class="btn btn-primary btn-lg">투표 하기</button>
    </div>
    <div class="d-flex justify-content-center" style="margin: 15px">
        <button type="button" class="btn btn-primary btn-lg" onclick="alert('2023.04.01 이후 확인할 수 있습니다.')">투표 결과</button>
    </div>
</div>
</body>
</html>