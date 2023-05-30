<%--
  Created by IntelliJ IDEA.
  User: lsh99
  Date: 2023-05-12
  Time: 오후 8:53
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<div class="frame">
  <div style="width: 400px; margin: 0 auto;">
    <div style="border: 1px solid black; padding: 20px;">
      <p>${vote_name} 결과</p>
      <div style="display: flex; border: 1px solid black;">
        <div style="width: 40%; height: 150px; border-right: 1px solid black;">
          ${img_path}
        </div>
        <div style="width: 60%;">
          ${student_name}<br>
        </div>
      </div>
      <div>
        <div style="margin-top: 10px;">득표수 ${vote_counter}</div>
        <div class="progress">
          <div class="progress-bar" role="progressbar" style="width: ${vote_rate}%;" aria-valuenow="${vote_rate}" aria-valuemin="0" aria-valuemax="100">${vote_rate}%</div>
        </div>
        <div style="float: right">${vote_counter}/${total_vote_count}</div>
      </div>
    </div>
<%--    <canvas id="myChart"></canvas>--%>
    <div style="border: 1px solid black; color: red; margin-top: 15px; text-align: center; padding: 20px;">
      결과는 ${end_date}까지 확인할 수 있습니다.
    </div>
  </div>
</div>
<%--<script>--%>
<%--  var ctx = document.getElementById('myChart').getContext('2d');--%>
<%--  var chart = new Chart(ctx, {--%>
<%--    type: 'bar', //--%>
<%--    data: {--%>
<%--      labels: ['${student_name}', '${student_name}', '${student_name}'],--%>
<%--      datasets: [{--%>
<%--        label: '득표수',--%>
<%--        backgroundColor: 'rgb(0, 123, 255)',--%>
<%--        borderColor: 'rgb(0, 123, 255)',--%>
<%--        data: [${vote_counter}, ${vote_counter}, ${vote_counter}]--%>
<%--      }]--%>
<%--    },--%>
<%--    options: {--%>
<%--      scales: {--%>
<%--        yAxes: [{--%>
<%--          ticks: {--%>
<%--            beginAtZero: true--%>
<%--          }--%>
<%--        }]--%>
<%--      }--%>
<%--    }--%>
<%--  });--%>
<%--</script>--%>
<%--<script>
  var ctx = document.getElementById('myChart').getContext('2d');
  var chart = new Chart(ctx, {
    type: 'bar', //
    data: {
      labels: ['${student_name_0}', '${student_name_1}', '${student_name_2}'],
      datasets: [{
        label: '득표수',
        backgroundColor: 'rgb(0, 123, 255)',
        borderColor: 'rgb(0, 123, 255)',
        data: [${vote_counter_0}, ${vote_counter_1}, ${vote_counter_2}]
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });
</script>--%>
</body>
</html>
