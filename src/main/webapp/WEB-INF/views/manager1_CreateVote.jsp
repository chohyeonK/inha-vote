<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/03/24
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>투표 서비스</title>
  <link href="../../resources/css/common.css" rel="stylesheet">
  <link href="../../resources/css/manager.css" rel="stylesheet">
  <script src="../../resources/js/manager.js"></script>
  <script src="../../resources/js/common.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="./layout/top_menu.jsp" %>
<div class="frame">
<div class="mb-3">
  <label for="manager-name" class="form-label">담당자명</label>
  <input type="text" class="form-control" id="manager-name">
</div>
<div class="mb-3">
  <label for="manager-tel" class="form-label">연락처</label>
  <input type="text" class="form-control" id="manager-tel">
</div>
<div class="btn btn-primary">생성하기</div>
<div class="form-floating mnr-zone">
  <textarea class="form-control mnr-guide" id="floatingTextarea2"disabled readonly></textarea>
  <label for="floatingTextarea2">관리자 코드를 분실하실 경우 관리자에게 문의하십시오.</label>
</div>
</div>
</body>
</html>