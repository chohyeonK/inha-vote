// 사용자 페이지에서 사용되는 JS
window.onload= function() {
    // movePage_info_list()
}

// 사용자페이지 - 인증 이메일 보내는 함수
function sendMail() {
    console.log('sendMail 함수 실행')
    // var name = document.getElementById('userName').value
    var id = document.getElementById('userId').value
    var email = document.getElementById('userEmail').value + '@inha.edu'
    var voteId = document.getElementById('voteId').value

    // console.log(id, email, voteId)

    if (id && email) {
        let student = {
            // studentName: name,
            studentId: id,
            studentEmail: email,
            voteId: voteId
        }

        $.ajax({
            cache : false,
            url : "/sendAuth",
            type : 'POST',
            data : JSON.stringify(student),
            contentType: 'application/json',
            success : function(res) {
                // console.log(res)
                if(res.resCode == 120) { // 성공
                    alert(res.resMessage)
                    return true
                } else if (res.resCode == 130) {
                    alert(res.resMessage)
                    return false
                } else if (res.resCode == 110) {
                    alert(res.resMessage)
                    return false
                } else {
                    alert(res.resMessage)
                    return false
                }
            },
            error : function(xhr, status) {
                alert('관리자에게 문의해주세요.')
                return false
            }
        });
    } else {
        alert('이름과 학번, 이메일을 확인해주세요.')
        return false
    }
}

// 사용자페이지 - 인증번호 확인하는 함수
function confirmCode() {
    var id = document.getElementById('userId').value
    var voteId = document.getElementById('voteId').value
    var code = document.getElementById('voteCode').value
    var managerId = document.getElementById('managerId').value

    let student = {
        studentId: id,
        voteId: voteId,
        confirmCode: code
    }

    $.ajax({
        cache : false,
        url : "/confirmCode",
        type : 'POST',
        data : JSON.stringify(student),
        contentType: 'application/json',
        success : function(res) {
            // console.log(res)
            if(res.resCode == 120) { // 성공
                alert(res.resMessage)
                location.href='/UserVote?manager_id=' + managerId + '&vote_id=' + voteId + '&student_id=' + id;
                return true
            } else if (res.resCode == 130) {
                alert(res.resMessage)
                return false
            } else if (res.resCode == 110) {
                alert(res.resMessage)
                return false
            } else {
                alert(res.resMessage)
                return false
            }
        },
        error : function(xhr, status) {
            alert('관리자에게 문의해주세요.')
            return false
        }
    });
}

function onVote(voteStudentId, voteId, manager_id) {
    var managerId = manager_id;
    var voteNumber = $("input[name='radioCandidate']:checked").val();

    console.log(voteStudentId, voteId, voteNumber)

    // 투표 후보자 다시 한번 확인 컨펌창 띄우기

    let studentVote = {
        student_id: voteStudentId,
        vote_id: voteId,
        vote_number: voteNumber
    }

    $.ajax({
        cache : false,
        url : "/onVote",
        type : 'POST',
        data : JSON.stringify(studentVote),
        contentType: 'application/json',
        success : function(data) {
            console.log(data)
            if(data) {
                alert('투표 완료되었습니다. 메인 페이지로 이동합니다.')
                location.href='/UserHome=' + managerId;
                return true
            } else {
                alert('확인되지 않은 사용자 입니다. 관리자에게 문의해주세요.')
                return false
            }
        },
        error : function(xhr, status) {
            alert('관리자에게 문의해주세요.')
            return false
        }
    });
}

