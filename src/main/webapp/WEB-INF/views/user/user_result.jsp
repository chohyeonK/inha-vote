<%--
  Created by IntelliJ IDEA.
  User: lsh99
  Date: 2023-05-12
  Time: 오후 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>투표 서비스</title>
  <link href="../../../resources/css/common.css" rel="stylesheet">
  <link href="../../../resources/css/manager.css" rel="stylesheet">
  <script src="../../../resources/js/manager.js"></script>
  <script src="../../../resources/js/common.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<div class="frame">
  <%-- 9 markup  --%>
  <div style="width: 400px; margin: 0 auto;">
    <div style="border: 1px solid black; padding: 20px;">
      <p>미융대 학생회장 선거 결과</p>
      <div style="display: flex; border: 1px solid black;">
        <div style="width: 40%; height: 150px; border-right: 1px solid black;">
          사진
        </div>
        <div style="width: 60%;">
          ${img_path}
        </div>
      </div>
      <div>
        <div style="margin-top: 10px;">득표수</div>
        <div class="progress">
          <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
        </div>
      </div>
    </div>
    <div style="border: 1px solid black; color: red; margin-top: 15px; text-align: center; padding: 20px;">
      결과는 ${end_date}까지 확인할 수 있습니다.
    </div>
  </div>
</div>
</body>
</html>
