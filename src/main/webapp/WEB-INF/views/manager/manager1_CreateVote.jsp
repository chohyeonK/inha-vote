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
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="../../../resources/js/manager.js"></script>
    <script src="../../../resources/js/common.js"></script>
</head>
<body>
<!--class="modal fade"-->
<%--<div id="myModal" tabindex="-1" role="dialog">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">관리자 등록 완료</h5>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <p id="managerId">${manager_id}</p>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">닫기</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">관리자 등록 완료</h5>
            </div>
            <div class="modal-body">
                <h3 id="managerId">${manager_id}</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">닫기</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../layout/top_menu.jsp" %>
<div class="frame">
    <form action="/CreateVote" method="post">
        <div class="mb-3">
            <label for="manager-name" class="form-label">담당자명</label>
            <input type="text" class="form-control" id="manager-name" name="manager_name">
        </div>
        <div class="mb-3">
          <label for="manager-tel" class="form-label">연락처</label>
          <input type="text" class="form-control" id="manager-tel" name="manager_tel">
        </div>
        <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-primary">생성하기</button>
        </div>
    </form>
    <div class="form-floating mnr-zone">
        <textarea class="form-control mnr-guide" id="floatingTextarea2" disabled readonly>관리자 코드를 분실하실 경우 관리자에게 문의하십시오.</textarea>
    </div>
</div>
<script>
    const managerId = document.getElementById('managerId').innerText
    if (managerId) {
        $('#myModal').modal('show')
    }
</script>
</body>
</html>