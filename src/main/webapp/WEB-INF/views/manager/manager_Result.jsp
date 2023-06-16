<%--
  Created by IntelliJ IDEA.
  User: isangho
  Date: 2023/05/15
  Time: 9:51 PM
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
    <link href="../../../resources/css/user.css" rel="stylesheet">
    <script src="../../../resources/js/manager.js"></script>
<%--    <script src="../../../resources/js/common.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<div class="sub-banner">
    <%@include file="../layout/top_menu.jsp" %>
    <div class="sub-txt">
        투표 결과
    </div>
</div>


<div class="frame sub-content">
    <div class="sub-result-content">
        <div class="sub-result-content-l">
            <p class="sub-result-head">${vote_name} 결과</p>
            <div class="sub-result-l">
                <div style="width: 40%; height: 150px;">
<%--
                    <img src="<c:url value="/home/pi/img/${imgPath}"/>"class="img-fluid rounded-start" alt="...">
--%>
                    <img src="<c:url value="/resources/img/candidate_img/${imgPath}"/>"class="img-fluid rounded-start" alt="...">
                </div>
                <div style="width: 60%; padding-left: 30px;">
                    <div style="font-size: 20px;">
                        당선인
                    </div>
                    <div style="font-size: 30px;">
                        <div class="highlight">${student_name}</div>
                    </div>
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
        <div class="sub-result-content-r">
            <p class="sub-result-head">${vote_name} 참여율</p>
            <form>
                <select class = "ChartSelect" name = "ChartSelect" id="ChartSelect" onchange="showChart()">
                    <option value = "Grade" data-value="Grade" selected>학년별</option>
                    <option value = "Major" data-value="Major">학과별</option>
                </select>
            </form>
            <div style="margin-top: 30px;">
                <canvas id="voteRateChart"></canvas>
            </div>
        </div>
    </div>
    <div class="user-description">
        결과는 ${end_date}까지 확인할 수 있습니다.
    </div>
</div>

<%@include file="../layout/footer.jsp" %>

<script>
    var ChartSelect = document.getElementById('ChartSelect');
    var ctx = document.getElementById('voteRateChart').getContext('2d');
    var selected = ChartSelect.options[ChartSelect.selectedIndex].value;
    if ( selected === "Grade")
    {
        var chart1 = new Chart(ctx, {
            type: 'bar', //
            data: {
                labels: ['1학년', '2학년', '3학년', '4학년'],
                datasets: [{
                    label: '학년별 투표율',
                    backgroundColor: 'rgb(0, 123, 255)',
                    borderColor: 'rgb(0, 123, 255)',
                    data: [${user_vote_rate_byGrade1}, ${user_vote_rate_byGrade2}, ${user_vote_rate_byGrade3}, ${user_vote_rate_byGrade4}]
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
    }
    function showChart()
    {
        var selected = ChartSelect.options[ChartSelect.selectedIndex].value;
        if ( selected === "Grade")
        {
            var chart1 = new Chart(ctx, {
                type: 'bar', //
                data: {
                    labels: ['1학년', '2학년', '3학년', '4학년'],
                    datasets: [{
                        label: '학년별 투표율',
                        backgroundColor: 'rgb(0, 123, 255)',
                        borderColor: 'rgb(0, 123, 255)',
                        data: [${user_vote_rate_byGrade1}, ${user_vote_rate_byGrade2}, ${user_vote_rate_byGrade3}, ${user_vote_rate_byGrade4}]
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
        }
        else if ( selected === "Major" )
        {
            var chart2 = new Chart(ctx, {
                type: 'bar', //
                data: {
                    labels: ['소용', '메카', '산경', '금투'],
                    datasets: [{
                        label: '학과별 투표율',
                        backgroundColor: 'rgb(0, 123, 255)',
                        borderColor: 'rgb(0, 123, 255)',
                        data: [${user_vote_rate_byMajorA}, ${user_vote_rate_byMajorB}, ${user_vote_rate_byMajorC}, ${user_vote_rate_byMajorD}]
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
        }
    }
</script>
</body>
</html>
