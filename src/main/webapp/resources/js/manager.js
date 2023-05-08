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

// 투표 등록 - 사진 등록 함수
function readFile(file) {
    if (file.files && file.files[0]) {
        var reader = new FileReader()
        reader.onload = function(e) {
            document.getElementById('fileLabel').style.display = 'none'
            document.getElementById('preview').src = e.target.result
        };
        reader.readAsDataURL(file.files[0])
    } else {
        document.getElementById('preview').src = ""
    }
}

// 투표 등록 - 투표 등록 함수
function onVoteSubmit() {
    const voteNm = document.getElementById('vote-name').value
    const voteStDt = document.getElementById('stDatePicker').value
    const voteToDt = document.getElementById('toDatePicker').value
    // const voteStDtNew = new Date(voteStDt)
    // const voteTtDtNew = new Date(voteToDt)
    const stuMajor  = document.getElementById('stu-major');
    const stuMajorValue = (stuMajor.options[stuMajor.selectedIndex].value);
    const stuGrade  = document.getElementById('stu-grade');
    const stuGradeValue = (stuGrade.options[stuGrade.selectedIndex].value);
    console.log(voteNm, voteStDt, voteToDt, stuMajorValue, stuGradeValue)
}