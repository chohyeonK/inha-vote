<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/05/15
  Time: 9:51 PM
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
    <script src="../../../resources/js/manager.js"></script>
    <script src="../../../resources/js/common.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<body>
<%@include file="../layout/top_menu.jsp" %>
<div class="frame">
    <div class="tab-pane fade show active" id="reg1">
        <form action="/Login/result_login" method="post">
            <div class="mt-3 mb-3">
                <label for="manager-name" class="form-label">관리자 이름</label>
                <input type="text" class="form-control" id="manager-name" name="manager_name" placeholder="관리자 이름을 입력해주세요.">
            </div>
            <div class="mb-3">
                <label for="manager_id" class="form-label">관리자 코드</label>
                <input type="text" class="form-control" id="manager_id" name="manager_id" placeholder="관리자 코드를 입력해주세요.">
            </div>

            <div class="d-flex justify-content-center" style="margin: 15px">
                <button type="submit" class="btn btn-primary">로그인</button>
            </div>
        </form>
        <hr />
        <c:if test="${err == false}">
            <div class="alert alert-danger" role="alert">
                관리자 이름과 코드가 맞지 않습니다. 다시 확인해주세요.
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
