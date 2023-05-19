// 사용자 페이지에서 사용되는 JS

// 사용자페이지 - 인증 이메일 보내는 함수
function sendMail() {
    console.log('sendMail 함수 실행')
    var name = document.getElementById('userName').value
    var id = document.getElementById('userId').value
    var email = document.getElementById('userEmail').value + '@inha.edu'
    var voteId = document.getElementById('voteId').value

    console.log(name, id, email, voteId)

    if (name && id && email) {
        let student = {
            studentName: name,
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
            success : function(data) {
                // console.log('이메일 발송 성공')

                if(data) {
                    alert('인증 이메일이 발송되었습니다. 메일을 확인해주세요.')
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
    var voteId = document.getElementById('voteId').value

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
        success : function(data) {
            // console.log('이메일 인증 완료')

            if(data) {
                alert('인증되었습니다. 투표 페이지로 이동합니다.')
                location.href='UserVote=' + voteId
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

