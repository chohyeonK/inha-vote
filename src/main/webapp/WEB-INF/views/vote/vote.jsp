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
    <%-- 6, 8 markup --%>
    <div style="width: 400px; border: 1px solid black; margin: 20px auto; padding: 20px 10px; text-align: center;">
        <div>미융대 학생회장, 부회장 선거</div>
        <div>투표 시작 : 2023.03.01 00:00</div>
        <div>투표 종료 : 2023.04.01 00:00</div>
    </div>

    <div style="width: 400px; line-height: 50px; margin: 20px auto; padding: 20px 10px; text-align: center; border-radius: 13px; background-color: #0d6efd; color: white; font-size: 1.2rem;">
        학생회장 투표
    </div>
    <div style="width: 400px; line-height: 50px; margin: 20px auto; padding: 20px 10px; text-align: center; border-radius: 13px; background-color: #dee2e6; font-size: 1.2rem; border: 1px solid black;">
        투표 완료
    </div>

    <%-- 7 markup --%>
    <div style="width: 400px; border: 1px solid black; margin: 20px auto; padding: 20px 10px; text-align: center;">
        <div><strong>학생회장 투표</strong><br>
            * 투표 후 변경이 불가능하오니 신중한 투표 부탁드립니다.</div>
    </div>
    <div style="width: 400px; max-height: 380px; border: 1px solid black; margin: 20px auto; padding: 20px 40px; text-align: center; overflow: auto;">
        <div class="d-flex bd-highlight mb-3" style="height: 100px">
            <div class="align-self-center p-2 bd-highlight">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            </div>
            <div class="align-self-center p-2 bd-highlight">기호 1번</div>
            <div class="p-2 bd-highlight" style="width: 100px; height: 100px; border: 1px solid black;">사진</div>
        </div>
        <div class="d-flex bd-highlight mb-3" style="height: 100px">
            <div class="align-self-center p-2 bd-highlight">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            </div>
            <div class="align-self-center p-2 bd-highlight">기호 2번</div>
            <div class="p-2 bd-highlight" style="width: 100px; height: 100px; border: 1px solid black;">사진</div>
        </div>
        <div class="d-flex bd-highlight" style="height: 100px">
            <div class="align-self-center p-2 bd-highlight">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            </div>
            <div class="align-self-center p-2 bd-highlight">기호 3번</div>
            <div class="p-2 bd-highlight" style="width: 100px; height: 100px; border: 1px solid black;">사진</div>
        </div>
    </div>
    <div class="d-flex justify-content-center" style="margin: 15px">
        <button type="button" class="btn btn-primary btn-lg">투표 완료</button>
    </div>

    <%-- 9 markup  --%>
    <div style="width: 400px; margin: 0 auto;">
        <div style="border: 1px solid black; padding: 20px;">
            <p>미융대 학생회장 선거 결과</p>
            <div style="display: flex; border: 1px solid black;">
                <div style="width: 40%; height: 150px; border-right: 1px solid black;">
                    사진
                </div>
                <div style="width: 60%;">
                    설명
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
            결과는 2023.05.01까지 확인할 수 있습니다.
        </div>
    </div>
</div>
</body>
</html>