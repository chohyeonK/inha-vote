// 전역 변수 선언
//var cnt = 1
var candidates = new Array();
var imgArr= new Array();


// 관리자 등록 - 모달 관련 함수
function closeModal() {
    $('#myModal').modal('hide')
    window.location.href = window.location.protocol + '//' + window.location.host + '/CreateVote'
}

// 관리자 등록 - 연락처 자동 하이픈 생성 함수
function inputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

// 투표 등록 관련 함수
function nextPage() {
    // 필수 입력값 체크
    const voteNm = document.getElementById('vote-name').value
    const voteStDt = document.getElementById('stDatePicker').value
    const voteToDt = document.getElementById('toDatePicker').value

    if(voteNm && voteStDt && voteToDt) {
        const nextEl = document.getElementById('register2-2')
        const prevEl = document.getElementById('register2-1')

        nextEl.style.display = 'block';
        prevEl.style.display = 'none';

        return true
    } else {
        alert('투표명과 투표기간을 입력해주세요.')
        return false
    }
}

// 투표 등록 - 캘린더 라이브러리 연동 함수
function onDate() {
    $(function(){
        $('#stDatePicker').datepicker({
            dateFormat: 'yy-mm-dd',
            minDate: 0,
            onClose: function (selectedDate) {
                $('#toDatePicker').datepicker({
                    dateFormat: 'yy-mm-dd',
                    minDate: new Date(selectedDate)
                });
            }
        });
    })

    // $("#stDatePicker").datepicker('getDate')
    // 한글 세팅
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
}
//
// function createCandidate(name, id, grade, major, index) {
//     console.log(name, id, grade, major, index)
//     const divAccordian = document.getElementById('accordion')
//     let divCard = document.createElement('div');
//     divCard.innerHTML = '<div class="card-header" id="heading-' + index + '>\n' +
//         '                      <h5 class="mb-0">\n' +
//         '                        <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapse' + index + '" aria-expanded="true" aria-controls="collapse' + index + '">\n' +
//         '                          기호' + cnt + '번 ' + major + ' ' + grade + '학년 ' + name +'\n' +
//         '                        </button>\n' +
//         '                      </h5>'
//     divAccordian.append(divCard)
//
//     let divCollapse = document.createElement('div');
//     divCollapse.setAttribute('id', 'collapse' + cnt)
//     divCollapse.setAttribute('class', 'collapse show')
//     divCollapse.setAttribute('aria-labelledby', 'heading' + cnt)
//     divCollapse.setAttribute('data-parent', '#accordion')
//     divCollapse.innerHTML = '<div class="card-body">\n' +
//         '                        <div style="display: flex; border: 1px solid black;">\n' +
//         '                          <div style="width: 45%; height: 170px; overflow: hidden; border-right: 1px solid black;">\n' +
//         '                            <div style="width: 130px; height: 100%;">\n' +
//         '                              <label for="file' +cnt + '" id="fileLabel'+ cnt + '">\n' +
//         '                                <div style="width: 130px; height: 100%; background-color: #DCEDEB;">사진 등록</div>\n' +
//         '                              </label>\n' +
//         '                              <input type="file" name="file' +cnt + '" id="file' + cnt + '" accept=".jpg, .png" onchange="readFile(this, '+ index + ');" />\n' +
//         '                              <img id="preview' + cnt + '" style="width: 100%; height: auto;"/>\n' +
//         '                            </div>\n' +
//         '                          </div>\n' +
//         '                          <div style="width: 55%;">\n' +
//         '                            <textarea id="spec' + cnt+ '" placeholder="설명" style="resize: none;"></textarea>\n' +
//         '                          </div>\n' +
//         '                        </div>\n' +
//         '                        <div style="margin-top: 15px; height: 120px; border: 1px solid black;">\n' +
//         '                          <textarea id="promise' + cnt + '" placeholder="공약" style="resize: none;"></textarea>\n' +
//         '                        </div>\n' +
//         '                      </div>\n' +
//         '                    </div>'
//
//     divAccordian.append(divCollapse)
//
//     var student = new Object()
//
//     student.studentid = id
//     student.candidatespec = ''
//     student.candidatepromise = ''
//     candidates.push(student)
//
//     console.log(candidates)
//
//     cnt++ // 기호 번호 카운팅
// }

// 투표 등록 - 사진 등록 함수
function readFile(file, cnt) {
    if (file.files && file.files[0]) {
        var reader = new FileReader()
        reader.onload = function(e) {

            document.getElementById('fileLabel'+cnt).style.display = 'none';
            document.getElementById('preview'+cnt ).src = e.target.result;
        };
        reader.readAsDataURL(file.files[0]);
        imgArr.push(file);
    } else {
        document.getElementById('preview'+cnt).src = ""
    }
    console.log("imgArr:"+imgArr);
}

// 투표 등록 - 투표 등록 함수
function onVoteSubmit() {
    const manager_id = document.getElementById('manager_id').value
    const vote_name = document.getElementById('vote-name').value
    const voteStDt = document.getElementById('stDatePicker').value
    const voteToDt = document.getElementById('toDatePicker').value
     const start_date = new Date(voteStDt+" 09:00:00")
     const end_date = new Date(voteToDt+" 18:00:00")
    const stuMajor  = document.getElementById('stu-major');
    const student_major = (stuMajor.options[stuMajor.selectedIndex].value);
    const stuGrade  = document.getElementById('stu-grade');
    const student_grade = (stuGrade.options[stuGrade.selectedIndex].value);

    // 후보자 스펙, 공약 저장
    for (var i = 0; i < candidates.length; i++) {
        candidates[i].candidatespec = document.getElementById('spec' + (i+1).toString()).value;
        candidates[i].candidatepromise = document.getElementById('promise' + (i+1).toString()).value;
    }

    const dataArr = {
        manager_id: manager_id,
        vote_name: vote_name,
        student_major: student_major,
        student_grade: student_grade,
        start_date: start_date,
        end_date: end_date,
        candidates: candidates
    };
    var formData=new FormData();
    formData.append("dataArr",new Blob([JSON.stringify(dataArr)],{type:"application/json"}));

    for (let i = 0; i < imgArr.length; i++) {
        formData.append("imgArr", imgArr[i].files[0]);
        //console.log(imgArr[i]);
    }

    console.log("dataArr:"+formData);

    $.ajax({
        cache : false,
        url : "/Register/vote_register", // 요기에
        type : 'POST',
        data : formData,
        processData: false,
        contentType: false,
        success : function(data) {
            console.log(data)
            window.location.href="http://localhost:8080/manager/manager_URL="+data;
        }, // success

        error : function(xhr, status) {
            alert(xhr + " : " + status);
        }
    }); // $.ajax */

}