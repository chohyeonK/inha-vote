<%--
  Created by IntelliJ IDEA.
  User: kimchohyeon
  Date: 2023/03/27
  Time: 8:53 PM
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
<%--  <script src="../../../resources/js/common.js"></script>--%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<body>

<div class="sub-banner">
  <%@include file="../layout/top_menu.jsp" %>
  <div class="sub-txt">
    투표 등록 완료
  </div>
</div>

<div class="frame sub-content">
  <div class="tab-content">
    <div class="tab-pane fade show active" id="reg1">
      <div>
        <div style="margin-top: 20px;">
          생성된 url:
          <a href="http://inha-vote.duckdns.org/UserHome=${manager_id}" target="_blank"> http://inha-vote.duckdns.org/UserHome=${manager_id}</a>
          <div class="form-floating mnr-zone">
            <textarea class="form-control mnr-guide" id="floatingTextarea2"disabled readonly>관리자 코드를 분실하실 경우 관리자에게 문의하십시오.</textarea>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="../layout/footer.jsp" %>
</body>
</html>