function movePage_info_list(vote_id) {
    //console.log(vote_id)
    $.ajax({
        url: '/UserInfo_list={manager_id}?vote_id='+vote_id,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            var candidates=JSON.stringify(data.candidate_list);
            var candidatesList = JSON.parse(candidates)
            var vote_name=JSON.stringify(data.name);

            console.log(candidates)

            var listGroupDiv = document.getElementById('list-group-div')

            for(var i = 0; i < candidatesList.length; i++) {
                let listGroupItem = document.createElement('div');
                listGroupItem.innerHTML = '<a class="list-group-item list-group-item-action" style="padding: 30px" onclick="movePage_info_candidate(' + candidatesList[i].studentid + ', ' + candidatesList[i].voteid + ')">\n' +
                    '                    <div class="d-flex w-100 justify-content-between">\n' +
                    '                        <h5 class="mb-1">기호' + (i+1) + '번 ' + candidatesList[i].studentname + '</h5>\n' +
                    '                    </div>\n' +
                    '                </a>'
                listGroupItem.append(listGroupDiv)
            }


            // JSP 파일의 candidates 변수에 값을 할당
            // document.getElementById("userinfo_2").setAttribute("candidates", candidates);
            // document.getElementById("userinfo_2").setAttribute("var_name", vote_name);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ': ' + errorThrown);
        }
    });
}
function movePage_info_candidate(student_id,vote_id){

    $.ajax({
        url: '/UserInfo_candidate={manager_id}?vote_id='+vote_id+'student_id='+student_id,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log("3:"+data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ': ' + errorThrown);
        }
    });
}

