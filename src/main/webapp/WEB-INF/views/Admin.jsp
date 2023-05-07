<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/04/28
  Time: 8:30 PM
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<div class="admin-frame">
    <h1>Vote Admin</h1>

    <table border="3">
        <th>번호</th>
        <th>관리자 코드</th>
        <th>투표 ID</th>
        <th>담당자명</th>
        <th>담당자 연락처</th>
        <th>투표기간</th>
        <th>투표명</th>
        <th>대상자</th>
        <th>url</th>
        <th>활성화</th>
        <tr>
            <td>1</td>
            <td>johndae</td>
            <td>vote_A12151</td>
            <td>하도영</td>
            <td>010-1234-1234</td>
            <td>2023.03.02~2023.04.01</td>
            <td>미융대 학생회장선거</td>
            <td>
                <select name="department" id="department">
                    <option>전체 과</option>
                    <option>금융투자학과</option>
                    <option>산업경영학과</option>
                    <option>소프트웨어융합공학과</option>
                    <option>메카트로닉스공학과</option>
                </select>
                <select name="grade" id="grade">
                    <option>전학년</option>
                    <option>1학년</option>
                    <option>2학년</option>
                    <option>3학년</option>
                    <option>4학년</option>
                </select>
            </td>
            <td>
                <a href="#">Link</a>
            </td>
            <td>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                </div>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>bandae</td>
            <td>vote_A25656</td>
            <td>하도영</td>
            <td>010-1234-1234</td>
            <td>2023.03.02~2023.04.01</td>
            <td>미융대 학생부회장선거</td>
            <td>
                <select name="department" id="department">
                    <option>전체 과</option>
                    <option>금융투자학과</option>
                    <option>산업경영학과</option>
                    <option>소프트웨어융합공학과</option>
                    <option>메카트로닉스공학과</option>
                </select>
                <select name="grade" id="grade">
                    <option>전학년</option>
                    <option>1학년</option>
                    <option>2학년</option>
                    <option>3학년</option>
                    <option>4학년</option>
                </select>
            </td>
            <td>
                <a href="#">Link</a>
            </td>
            <td>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                </div>
            </td>
        </tr>
    </table>
    <label class="form-label" style="margin: 10px">johndae-후보자</label>
    <table border="3">
        <th>번호</th>
        <th>사진</th>
        <th>이름</th>
        <th>학과</th>
        <th>학번</th>
        <th>학년</th>
        <th>프로필</th>
        <th>공약</th>
        <tr>
            <td>1</td>
            <td>
                <img src="...">
            </td>
            <td>문동은</td>
            <td>소프트웨어융합공학과</td>
            <td>12223440</td>
            <td>2</td>
            <td>내용</td>
            <td>내용</td>
        </tr>
        <tr>
            <td>2</td>
            <td>
                <img src="...">
            </td>
            <td>전재준</td>
            <td>소프트웨어융합공학과</td>
            <td>12223441</td>
            <td>2</td>
            <td>내용</td>
            <td>내용</td>
        </tr>
    </table>
</div>
</body>
</html>
