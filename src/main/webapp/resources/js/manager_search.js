// 관리자페이지 - 후보자 검색 관련 함수들 따로 뺌
// 전역 변수 선언
var cnt = 1

// 후보자 등록 함수
function createCandidate(name, id, grade, major, index) {
    console.log(name, id, grade, major, index)
    const divAccordian = document.getElementById('accordion')
    let divCard = document.createElement('div');
    divCard.setAttribute('class', 'first-div')
    divCard.innerHTML = '<div class="card-header" id="heading-' + cnt + '">\n' +
        '                      <h5 class="mb-0">\n' +
        '                        <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapse-' + cnt + '" aria-expanded="true" aria-controls="collapse-' + cnt + '">\n' +
        '                          기호' + cnt + '번 ' + major + ' ' + grade + '학년 ' + name +'\n' +
        '<i class="bi bi-x-circle" onclick="removeCandidate('+ `this` + ',' + cnt +')"></i>' +
        '                        </button>\n' +
        '                      </h5>'
    divAccordian.append(divCard)

    let divCollapse = document.createElement('div');
    divCollapse.setAttribute('id', 'collapse-' + cnt)
    divCollapse.setAttribute('class', 'collapse show')
    divCollapse.setAttribute('aria-labelledby', 'heading-' + cnt)
    divCollapse.setAttribute('data-parent', '#accordion')
    divCollapse.innerHTML = '<div class="card-body">\n' +
        '                        <div style="display: flex; border: 1px solid black;">\n' +
        '                          <div style="width: 45%; height: 170px; overflow: hidden; border-right: 1px solid black;">\n' +
        '                            <div style="width: 130px; height: 100%;">\n' +
        '                              <label for="file' +cnt + '" id="fileLabel'+ cnt + '">\n' +
        '                                <div style="width: 130px; height: 100%; background-color: #DCEDEB;">사진 등록</div>\n' +
        '                              </label>\n' +
        '                              <input type="file" name="file' +cnt + '" id="file' + cnt + '" accept=".jpg, .png" onchange="readFile(this, '+ cnt + ');" />\n' +
        '                              <img id="preview' + cnt + '" style="width: 100%; height: auto;"/>\n' +
        '                            </div>\n' +
        '                          </div>\n' +
        '                          <div style="width: 55%;">\n' +
        '                            <textarea id="spec' + cnt+ '" placeholder="설명" style="resize: none;"></textarea>\n' +
        '                          </div>\n' +
        '                        </div>\n' +
        '                        <div style="margin-top: 15px; height: 120px; border: 1px solid black;">\n' +
        '                          <textarea id="promise' + cnt + '" placeholder="공약" style="resize: none;"></textarea>\n' +
        '                        </div>\n' +
        '                      </div>\n' +
        '                    </div>'

    divAccordian.append(divCollapse)

    var student = new Object()
    student.name = name
    student.grade = grade
    student.studentid = id
    student.major = major
    student.candidate_spec = ''
    student.candidatepromise = ''
    candidates.push(student)

    cnt++ // 기호 번호 카운팅
}

// 후보자 리스트에서 삭제하는 함수
function removeCandidate(e, index) {
    console.log(e, index)
    var number = index - 1

    // html 요소 삭제
    let parent = e.closest('.first-div')
    parent.innerHTML = ''

    // 후보자 배열 요소 삭제
    candidates.splice(number, 1);
    console.log(candidates)

    --cnt
}

// 후보자 검색 함수
function studentSearch() {
    let word = document.getElementById('student_name').value
    console.log(word)

    $.ajax({
        url: '/Register/search?param1='+word,
        type: 'GET',
        dataType: 'text',
        success: function(data) {
            var studentAll = document.getElementById('studentAll')
            studentAll.style.display = 'none'

            var searchList = document.getElementById('searchList')
            searchList.style.display = 'block'

            var json = JSON.parse(data)
            // console.log(json)
            if(json.length == 0) {
                studentAll.innerText = '검색 결과가 없습니다.'
            }

            searchList.replaceChildren()

            for(var i = 0; i < json.length; i++) {
                var studentgrade = json[i].studentgrade
                var studentid = json[i].studentid
                var studentmajor = json[i].studentmajor
                var studentname = json[i].studentname
                // console.log(studentgrade, studentid, studentmajor, studentname)
                let item = document.createElement('div');
                item.innerHTML = '<div style="border-bottom: 1px solid black;" onclick="createCandidate(`' + studentname +'`, `' + studentid + '`, `' + studentgrade + '`, `' + studentmajor + '`, `' + cnt + '`)">\n' +
                    '                        ' + studentname + ' ' + studentid + ' ' + studentgrade + '학년 ' + studentmajor + '\n' +
                    '                    </div>'
                searchList.append(item)
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ': ' + errorThrown);
        }
    });
}

// 검색 시 엔터키로 가능하도록 하는 함수
function keyDown(event) {
    console.log(event)
    if(event.keyCode == 13){
        studentSearch()
        return;
    } else {
        let word = document.getElementById('student_name').value
        console.log('word', word)
        if (word == '') {
            console.log('아무것도 없음')
            studentSearch()
        }
    }
}