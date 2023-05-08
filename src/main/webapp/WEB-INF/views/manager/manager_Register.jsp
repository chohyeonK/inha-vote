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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
  <script src="../../../resources/js/manager.js"></script>
  <script src="../../../resources/js/common.js"></script>
<body>
<%@include file="../layout/top_menu.jsp" %>
<div class="frame">
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#reg1">투표 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#reg2">투표 결과</a>
    </li>
  </ul>

  <div class="tab-content">
    <div class="tab-pane fade show active" id="reg1">
      <div>
        <form action="/Register/vote_register" method="post" enctype="multipart/form-data">
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
          <input type="hidden" name="manager_id" value=${manager_id} />
          <div class="d-flex justify-content-end" style="margin-top: 15px;">
            <button type="button" class="btn btn-primary" onclick="nextPage()">다음</button>
          </div>
          <hr />
        </div>


        <%-- ## 3 markup --%>
        <div id="register2-2" style="display: none;">
          <div>
            <div style="margin-top: 15px;">학번 검색</div>
            <div style="width: 100%; height: 600px; border: 1px solid black; margin-top: 15px;">
              <div style="width: 50%; height: 100%; padding: 16px; border-right: 1px solid black; float: left;">
                <form class="form-inline" style="display: flex;" action="searchStudentName" method="get">
                  <input class="form-control " type="search" placeholder="Search" aria-label="Search" name="student_name">
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
                        <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
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
                        <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
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
                        <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
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
          <%--사진 입력--%>
          <input type="file" name="img" />
          <%--<h1>${err}</h1>--%>
          <div class="d-flex justify-content-end" style="margin-top: 15px;">
            <%--        <button type="button" class="btn btn-primary">투표 추가</button>--%>
            <%--<button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="location.href='Register3'">완료</button> --%>
              <button type="submit" class="btn btn-primary" style="margin-left: 10px;" onclick="onVoteSubmit()">완료</button>
          </div>
          <hr />
        </div>
        </form>
      </div>
    </div>
    <div class="tab-pane fade" id="reg2">
      <p style="margin-top: 20px;">투표 결과가 아직 집계되지 않았습니다.</p>
    </div>
  </div>
</div>

<script>
  // 캘린더 라이브러리 연동
  onDate()
</script>
</body>
</html>