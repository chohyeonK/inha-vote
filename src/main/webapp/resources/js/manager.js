function nextPage() {
    console.log('다음 페이지')
    const nextEl = document.getElementById('register2-2')
    const prevEl = document.getElementById('register2-1')

    nextEl.style.display = 'block';
    prevEl.style.display = 'none';
}

function closeModal() {
    $('#myModal').modal('hide')
    window.location.href = 'localhost:8080/createVote'
}
