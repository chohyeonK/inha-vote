<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/04/11
  Time: 12:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사용자-투표 정보</title>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/manager.css" rel="stylesheet">
    <script src="../../../resources/js/manager.js"></script>
    <script src="../../../resources/js/common.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="frame">
    <div id="userinfo_1">
        <div style="border: 1px solid black; padding: 10px;">${vote_name}<br>
            투표 시작 : ${start_date}<br>
            투표 종료 : ${end_date}</div>
        <div class="d-flex justify-content-center" style="margin: 15px;">
            <button type="button" class="btn btn-primary btn-block" onclick="toList(2)">학생회장 후보</button>
        </div>
        <div class="d-flex justify-content-center" style="margin: 15px">
            <button type="button" class="btn btn-primary btn-block">학생부회장 후보</button>
        </div>
    </div>

    <div id="userinfo_2" style="display: none;">
        <div style="border: 1px solid black; padding: 10px;"><br>${vote_name}<br><br></div>
        <div class="list-group" style="margin-top: 15px">
            <a class="list-group-item list-group-item-action" style="padding: 30px" onclick="toList(3)">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">기호 1번</h5>
                </div>
            </a>
            <a class="list-group-item list-group-item-action" style="padding: 30px">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">기호 2번</h5>
                </div>
            </a>
            <a class="list-group-item list-group-item-action" style="padding: 30px">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">기호 3번</h5>
                </div>
            </a>
        </div>
    </div>

    <div id="userinfo_3" style="display: none;">
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="${img_path}" class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">${student_name}</h5>
                        <p class="card-text">${candidate_spec}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card text-center" style="margin-top: 10px">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills">
                    <li class="nav-item">
                        <a class="nav-link active">공약</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <p class="card-text">${student_promise}</p>
            </div>
        </div>
    </div>
</div>

<script>
    function toList(Destination)
    {
        const page1 = document.getElementById('userinfo_1')
        const page2 = document.getElementById('userinfo_2')
        const page3 = document.getElementById('userinfo_3')

        if(Destination == 2) {
            page2.style.display = 'block';
            page1.style.display = 'none';
        } else if(Destination == 3) {
            page3.style.display = 'block';
            page2.style.display = 'none';
        }


        return true
    }
</script>
</body>
</html>
