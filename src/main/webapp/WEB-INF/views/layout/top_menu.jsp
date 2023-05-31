<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-04-07
  Time: 오후 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script>
  function logout() {
    alert("로그아웃 되었습니다.");
    window.location.href = "/session_out"; // 홈으로 이동하는 URL을 입력하세요
  }
  function login() {
    //alert("로그아웃 되었습니다.");
    window.location.href = "/Login"; // 홈으로 이동하는 URL을 입력하세요
  }
</script>
<div style="background-color: lightgray" align="right">
  <div >
  <%
    String manage_id=(String) session.getAttribute("manager_id");
    if(manage_id!=null){
  %>
    <button class="btn btn-primary" type="button" onclick="logout()">로그아웃</button>
  <%
    }else{
  %>
    <button class="btn btn-primary" type="button" onclick="login()">로그인</button>
  <%}%>

  </div>
</div>


<div >
  <ul id="menubar" class="nav nav-pills nav-fill">
    <li class="nav-item">
      <a class="nav-link" aria-current="page" href="/">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="CreateVote">관리자 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/session?page=Register">투표 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/session?page=Result">투표 결과</a>
    </li>
  </ul>
</div>

