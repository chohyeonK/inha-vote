// 관리자 등록 페이지 - 모달 관련 함수
function closeModal() {
    $('#myModal').modal('hide')
    window.location.href = window.location.protocol + '//' + window.location.host + '/CreateVote'
}

// 투표 등록 페이지 관련 함수
function nextPage() {
    console.log('다음 페이지')
    const nextEl = document.getElementById('register2-2')
    const prevEl = document.getElementById('register2-1')

    nextEl.style.display = 'block';
    prevEl.style.display = 'none';
}

// 투표 등록 페이지 - 캘린더 라이브러리 연동 함수
function onDate() {
    $(function(){
        $('#datepicker').datepicker();
    })

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