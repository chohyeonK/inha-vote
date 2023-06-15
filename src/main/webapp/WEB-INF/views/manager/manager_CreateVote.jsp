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
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">관리자 등록 완료</h5>
            </div>
            <div class="modal-body">
                <h3 id="managerId">${managerid}</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">닫기</button>
            </div>
        </div>
    </div>
</div>

<div style="padding: 0px 20px 50px 20px; width: 100%; height: 300px; background-color: #117DFF;">
    <%@include file="../layout/top_menu.jsp" %>
    <div style="display: flex; max-width: 790px; height: auto; margin: 0 auto; position: relative; top: 50px; justify-content: center;">
        <div class="NanumSquareNeo-Variable" style="color: white; font-size: 38px; font-weight: bold;">
            관리자 등록
        </div>
    </div>
</div>

<div class="frame sub-div" style="box-shadow: 5px 8.7px 20px 0 rgba(0, 0, 0, 0.2); position: relative; top: -80px; border: 2px solid #EEEEEE; background-color: white; border-radius: 15px;">
    <form action="/CreateVote" method="post" onsubmit="return onSubmit()">
        <% String manager_id = (String) session.getAttribute("manager_id");
            if (manager_id != null) { %>
            <div class="mt-3 mb-3">
                <label for="manager-name" class="form-label">담당자명</label>
                <input type="text" class="form-control" id="manager-name" name="manager_name" placeholder="담당자명을 입력해주세요." disabled>
            </div>
            <div class="mb-3">
              <label for="manager-tel" class="form-label">연락처</label>
              <input type="text" class="form-control" id="manager-tel" name="manager_tel" placeholder="연락처를 입력해주세요." maxlength="13" oninput="inputPhone(this)" disabled>
            </div>
        <% } else{%>
            <div class="mt-3 mb-3">
                <label for="manager-name" class="form-label">담당자명</label>
                <input type="text" class="form-control" id="manager-name" name="manager_name" placeholder="담당자명을 입력해주세요." >
            </div>
            <div class="mb-3">
                <label for="manager-tel" class="form-label">연락처</label>
                <input type="text" class="form-control" id="manager-tel" name="manager_tel" placeholder="연락처를 입력해주세요." maxlength="13" oninput="inputPhone(this)" >
            </div>
        <% } %>
        <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-primary">생성하기</button>
        </div>
    </form>
    <div class="form-floating mnr-zone">
        <% if (manager_id != null) { %>
            <textarea class="form-control mnr-guide" id="floatingTextarea2" disabled readonly>재등록을 원하시는 경우 로그아웃 후 다시 이용해주세요.</textarea>
        <% } else {%>
            <textarea class="form-control mnr-guide" id="floatingTextarea2" disabled readonly>관리자 코드를 분실하실 경우 관리자에게 문의하십시오.</textarea>
        <% } %>
    </div>
</div>

<%@include file="../layout/footer.jsp" %>

<%--로딩 스피너 구현--%>
<div id="overlay">
    <span class="loader"></span>
</div>
<script>
    // 값 전송 받은 후 모달창 띄우는 함수
    const managerId = document.getElementById('managerId').innerText
    console.log(managerId)
    if (managerId) {
        $('#myModal').modal('show')
    }

    // 값 체크하는 함수
    function onSubmit() {
        const managerName = document.getElementById('manager-name').value
        const managerTel = document.getElementById('manager-tel').value
        if (managerName && managerTel) {
            document.getElementById('overlay').style.display = 'block'

            return true
        } else {
            alert('담당자명 또는 담당자 연락처를 입력하여주세요.')
            return false
        }
    }
</script>
</body>
</html>