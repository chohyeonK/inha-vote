<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/03/24
  Time: 8:54 PM
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
    <%-- 6 markup --%>
    <div style="width: 400px; border: 1px solid black; margin: 20px auto; padding: 20px 10px; text-align: center;">
        <div>미융대 학생회장, 부회장 선거</div>
        <div>투표 시작 : 2023.03.01 00:00</div>
        <div>투표 종료 : 2023.04.01 00:00</div>
    </div>

    <div style="width: 400px; line-height: 50px; border: 1px solid black; margin: 20px auto; padding: 20px 10px; text-align: center; border-radius: 13px;">
        학생회장 투표
    </div>

    <%-- 7 markup --%>
    <div style="width: 400px; border: 1px solid black; margin: 20px auto; padding: 20px 10px; text-align: center;">
        <div><strong>학생회장 투표</strong><br>
            * 투표 후 변경이 불가능하오니 신중한 투표 부탁드립니다.</div>
    </div>
    <div style="width: 400px; border: 1px solid black; margin: 20px auto; padding: 20px 10px; text-align: center;">
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                기호 1번
                <div>

                </div>
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
            <label class="form-check-label" for="flexRadioDefault2">
                기호 2번
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
            <label class="form-check-label" for="flexRadioDefault2">
                기호 3번
            </label>
        </div>
    </div>
    <div class="d-flex justify-content-center" style="margin: 15px">
        <button type="button" class="btn btn-primary btn-lg">투표 완료</button>
    </div>
</div>
</body>
</html>