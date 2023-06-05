<%--
  Created by IntelliJ IDEA.
  User: kimchohyeon
  Date: 2023/03/27
  Time: 8:53 PM
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
  <script src="../../../resources/js/manager.js"></script>
  <script src="../../../resources/js/common.js"></script>
  <script src="../../../resources/js/manager_search.js"></script>
<body>
<%@include file="../layout/top_menu.jsp" %>
<div class="frame">
  <div class="tab-content">
    <div class="tab-pane fade show active" id="reg1">
      <div>
        <form method="post" enctype="multipart/form-data">
        <div id="register2-1">
          <div class="mt-3 mb-3">
            <label for="vote-name" class="form-label">투표명</label>
            <input type="text" class="form-control" id="vote-name" name="vote_name" placeholder="투표명을 입력해주세요.">
          </div>
          <div class="mb-3">
            <label for="stDatePicker" class="form-label">투표 기간</label>
            <div class="d-flex">
              <input type="text" class="form-control mr-3" id="stDatePicker" name="start_date" placeholder="시작 날짜를 입력해주세요.">
              <input type="text" class="form-control" id="toDatePicker" name="end_date" placeholder="종료 날짜를 입력해주세요.">
            </div>

          </div>
          <div class="mb-3">
            <label for="stu-major" class="form-label">대상자</label>
            <div class="d-flex">
                <select id="stu-major" class="custom-select mr-3" name="student_major">
                  <option value="모든과" selected>전체</option>
                  <option value="금융투자학과">금융투자학과</option>
                  <option value="산업경영학과">산업경영학과</option>
                  <option value="소프트웨어융합공학과">소프트웨어융합공학과</option>
                  <option value="메카트로닉스공학과">메카트로닉스공학과</option>
                </select>
                <select id="stu-grade" class="custom-select" name="student_grade">
                  <option value="0" selected>전체</option>
                  <option value="1">1학년</option>
                  <option value="2">2학년</option>
                  <option value="3">3학년</option>
                  <option value="4">4학년</option>
                </select>
            </div>
          </div>
          <input type="hidden" name="manager_id" id="manager_id" value=${manager_id} />
          <div class="d-flex justify-content-end" style="margin-top: 15px;">
            <button type="button" class="btn btn-primary" onclick="nextPage()">다음</button>
          </div>
          <hr />
        </div>


        <%-- ## 3 markup --%>
        <div id="register2-2" style="display: none;">
          <div>
            <div style="width: 100%; height: 600px; border: 1px solid black; margin-top: 15px;">
              <div style="width: 55%; height: 100%; padding: 16px; border-right: 1px solid black; float: left;">
                <form class="form-inline" method="get">
                  <input class="form-control " type="text" placeholder="Search" aria-label="Search" name="student_name" id="student_name" onkeydown="keyDown(event)" style="width: 80%; float: left;">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="studentSearch()">검색</button>
                </form>
                <div id="studentAll" style="border: 1px solid black; height: calc(100% - 40px); overflow: auto;">
                  <!-- 반복문을 이용하여 리스트 출력 -->
                  <c:forEach var="student" items="${student_list}" varStatus="status">
                    <div style="border-bottom: 1px solid black;" >
                        ${student.studentname} ${student.studentid} ${student.studentgrade}학년 ${student.studentmajor}
                          <i class="bi bi-plus-circle"  onclick="createCandidate('${student.studentname}', '${student.studentid}', '${student.studentgrade}', '${student.studentmajor}')"></i>
                    </div>
                  </c:forEach>
                </div>
                  <div id="searchList" style="display: none; border: 1px solid black; height: calc(100% - 40px); overflow: auto;">

                  </div>
              </div>
              <div style="width: 45%; height: 100%; overflow: auto; float: left;">
                <div id="accordion">

                </div>
              </div>
            </div>
          </div>
          <div>
          </div>
          <%--<h1>${err}</h1>--%>
          <div class="d-flex justify-content-end" style="margin-top: 15px;">
            <%--        <button type="button" class="btn btn-primary">투표 추가</button>--%>
            <%--<button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="location.href='Register3'">완료</button> --%>
              <button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="onVoteSubmit()">완료</button>
          </div>
          <hr />
        </div>
        </form>
      </div>
    </div>
  </div>
</div>

<%--로딩 스피너 구현--%>
<div id="overlay">
  <span class="loader"></span>
</div>
<script>
  // 캘린더 라이브러리 연동
  onDate()
</script>
</body>
</html>