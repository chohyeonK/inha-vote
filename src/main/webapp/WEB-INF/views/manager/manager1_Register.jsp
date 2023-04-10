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
  <script src="../../../resources/js/common.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<%@include file="../layout/top_menu.jsp" %>
<div class="frame">
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active">투표 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link">투표 결과</a>
    </li>
  </ul>
  <%-- ## 1 markup --%>
  <div>
    <div class="input-group" style="">
      <span class="input-group-text">관리자 코드</span>
      <input type="text" class="form-control"/>
    </div>
    <div class="d-flex justify-content-center" style="margin: 15px">
      <button type="button" class="btn btn-primary">로그인</button>
    </div>
    <hr />
  </div>

  <%-- ## 2 markup --%>
  <div>
    <div>
      <div class="btn btn-primary" style="width: 80px; border-radius: 150px;">
        투표 1
      </div>
      <div class="btn" style="border: 1px solid black; width: 80px; border-radius: 150px;">
        투표 2
      </div>
    </div>
    <div class="d-flex form-group" style="margin-top: 15px;">
      <label for="staticEmail1" class="col-form-label" style="width: 80px;">투표명: </label>
      <div class="" style="margin-left: 15px;">
        <input type="text" class="form-control" id="staticEmail1" value="투표명을 입력해주세요.">
      </div>
    </div>
    <div class="d-flex form-group" style="margin-top: 15px;">
      <label for="staticEmail2" class="col-form-label" style="width: 80px;">투표 기간: </label>
      <div class="" style="margin-left: 15px;">
        <input type="text" class="form-control" id="staticEmail2" value="투표 기간을 입력해주세요.">
      </div>
    </div>
    <div class="d-flex form-group" style="margin-top: 15px;">
      <label class="col-form-label" style="width: 80px;">대상자: </label>
      <div class="col-form-label" style="margin-left: 15px;">
        <select class="custom-select">
          <option selected>전체</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
        <select class="custom-select">
          <option selected>전체</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
    </div>
    <div class="d-flex justify-content-end" style="margin-top: 15px;">
      <button type="button" class="btn btn-primary">다음</button>
    </div>
    <hr />
  </div>

  <%-- ## 3 markup --%>
  <div>
    <div>
      <div class="btn btn-primary" style="width: 80px; border-radius: 150px;">
        투표 1
      </div>
      <div class="btn" style="border: 1px solid black; width: 80px; border-radius: 150px;">
        투표 2
      </div>
    </div>

    <div>
      <div style="margin-top: 15px;">학번 검색</div>
      <div style="width: 100%; height: 600px; border: 1px solid black; margin-top: 15px;">
        <div style="width: 50%; height: 100%; padding: 16px; border-right: 1px solid black; float: left;">
          <%--<nav class="navbar">
            <form class="form-inline">
              <input class="form-control " type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
            </form>
          </nav>--%>
          <form class="form-inline" style="display: flex;">
            <input class="form-control " type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
          </form>
          <div style="border: 1px solid black;">
            <div style="border-bottom: 1px solid black;">
              소프트웨어융합공학과 2학년 문동은
            </div>
            <div>
              소프트웨어융합공학과 2학년 전재준
            </div>
          </div>
        </div>
        <div style="width: 50%; height: 100%; overflow: auto; float: left;">
          <div id="accordion">
            <div class="card">
              <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                  <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    기호1번 소프트웨어융합공학과 2학년 문동은
                  </button>
                </h5>
              </div>

              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">
                  <div style="display: flex; border: 1px solid black;">
                    <div style="width: 40%; height: 150px; border-right: 1px solid black;">
                      사진
                    </div>
                    <div style="width: 60%;">
                      설명
                    </div>
                  </div>
                  <div style="margin-top: 15px; height: 120px; border: 1px solid black;">
                    공약
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    기호 2번 소프트웨어융합공학과 2학년 전재준
                  </button>
                </h5>
              </div>
              <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                <div class="card-body">
                  <div style="display: flex; border: 1px solid black;">
                    <div style="width: 40%; height: 150px; border-right: 1px solid black;">
                      사진
                    </div>
                    <div style="width: 60%;">
                      설명
                    </div>
                  </div>
                  <div style="margin-top: 15px; height: 120px; border: 1px solid black;">
                    공약
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    기호 3번 소프트웨어융합공학과 2학년 주여정
                  </button>
                </h5>
              </div>
              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                <div class="card-body">
                  <div class="card-body">
                    <div style="display: flex; border: 1px solid black;">
                      <div style="width: 40%; height: 150px; border-right: 1px solid black;">
                        사진
                      </div>
                      <div style="width: 60%;">
                        설명
                      </div>
                    </div>
                    <div style="margin-top: 15px; height: 120px; border: 1px solid black;">
                      공약
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="d-flex justify-content-end" style="margin-top: 15px;">
      <button type="button" class="btn btn-primary">투표 추가</button>
      <button type="button" class="btn btn-primary" style="margin-left: 10px;">완료</button>
    </div>
    <hr />
  </div>

  <%-- ## 4 markup --%>
  <div>
    생성된 url: https://vote/user-johndoe
    <div class="form-floating mnr-zone">
      <textarea class="form-control mnr-guide" id="floatingTextarea2"disabled readonly></textarea>
      <label for="floatingTextarea2">관리자 코드를 분실하실 경우 관리자에게 문의하십시오.</label>
    </div>
    <hr />
  </div>

  <ul class="nav nav-tabs" style="max-width: 800px; margin: 20px auto;">
    <li class="nav-item">
      <a class="nav-link">투표 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active">투표 결과</a>
    </li>
  </ul>

  <%-- ## 5 markup --%>
  <div>
    <div>
      <div class="btn btn-primary" style="width: 80px; border-radius: 150px;">
        투표 1
      </div>
      <div class="btn" style="border: 1px solid black; width: 80px; border-radius: 150px;">
        투표 2
      </div>

      <div>
        <div style="margin-top: 15px;">
          전체참여율
          <div style="border: 1px solid black; width: 50%; height: 80px; margin-top: 15px;">
            그래프 자리
          </div>
        </div>
        <div style="margin-top: 15px;">
          <select class="custom-select">
            <option selected>학년별</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
          <div style="border: 1px solid black; width: 50%; height: 250px; margin-top: 15px;">
            그래프 자리
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>