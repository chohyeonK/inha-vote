// 투표 등록 페이지 관련 함수
function nextPage() {
    console.log('다음 페이지')
    const nextEl = document.getElementById('register2-2')
    const prevEl = document.getElementById('register2-1')

    nextEl.style.display = 'block';
    prevEl.style.display = 'none';
}

// 관리자 등록 페이지 - 모달 관련 함수
function closeModal() {
    $('#myModal').modal('hide')
    window.location.href = window.location.protocol + '//' + window.location.host + '/CreateVote'
}