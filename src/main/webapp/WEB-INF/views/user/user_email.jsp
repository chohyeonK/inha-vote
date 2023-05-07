<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/04/21
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사용자-투표 하기-인증</title>
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
<div class=frame>
  <label class="form-label" style="margin: 10px">이름</label>
  <input type="text" class="form-control" placeholder="홍길동" aria-label="name">
  <label class="form-label" style="margin: 10px">학번</label>
  <input type="text" class="form-control" placeholder="12220001" aria-label="number">
  <label class="form-label" style="margin: 10px">이메일</label>
  <input type="text" class="form-control" placeholder="inhastudent@inha.edu" aria-label="email">
  <div class="d-flex justify-content-center" style="margin: 10px">
    <button type="button" class="btn btn-primary" onclick="alert('확인되지 않은 사용자 입니다. 관리자에게 문의해주세요.')">이메일 인증</button>
  </div>
  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="인증 번호" aria-label="sc number" aria-describedby="button-addon2">
    <button class="btn btn-outline-primary" type="button" id="button-addon2" onclick="alert('인증되었습니다.')">확인</button>
  </div>
  <div style="border: 1px solid black; padding: 10px;">미융대 학생만 참여 가능하며, 인하대 이메일만 사용할 수 있습니다.</div>
</div>
</body>
</html>