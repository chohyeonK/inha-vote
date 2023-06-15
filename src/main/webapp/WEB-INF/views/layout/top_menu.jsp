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

  window.onload = function(e) {
    // 상단 메뉴 버튼 활성화
    <% String session_page = (String) session.getAttribute("page");
       if (session_page != null) { %>
    var page = "<%= session_page %>";
    <% } %>
    console.log(page);
    var menu = document.querySelectorAll("#menu li a");
    console.log(menu)
    if (window.location.pathname == '/CreateVote') {
      menu[1].classList.add("active")
    } else if (window.location.pathname == '/') {
      // menu[0].classList.add("active")
    } else if (page=='Register') {
      menu[2].classList.add("active")
    } else if (page=='Result') {
      menu[3].classList.add("active")
    } else {
      menu[4].classList.add("active")
    }
  }
</script>

<div id="menu">
    <li>
      <a class="main-logo nav-link" aria-current="page" href="/" style="">인하투표</a>
    </li>
    <li>
      <a class="nav-link" href="CreateVote">관리자 등록</a>
    </li>
    <li>
      <a class="nav-link" href="/session?page=Register">투표 등록</a>
    </li>
    <li>
      <a class="nav-link" href="/session?page=Result">투표 결과</a>
    </li>
      <%
        String manage_id=(String) session.getAttribute("manager_id");
        if(manage_id!=null){
      %>
        <li onclick="logout()">
            <a class="nav-link"  href="" onclick="return false;">로그아웃</a>
        </li>
      <%
      }else{
      %>
    <li onclick="login()">
        <a class="nav-link"  href="" onclick="return false;">로그인</a>
    </li>
      <%}%>
</div>

