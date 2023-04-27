/* 공통으로 사용되는 JS 정의 */
window.onload = function(e) {
    // 상단 메뉴 버튼 활성화
    var menu = document.querySelectorAll("#menubar li a");
    if (window.location.pathname == '/CreateVote') {
        menu[1].classList.add("active")
    } else if (window.location.pathname == '/Register' || window.location.pathname == '/Register2' || window.location.pathname == '/Register3') {
        menu[2].classList.add("active")
    } else if (window.location.pathname == '/Help') {
        menu[3].classList.add("active")
    } else {
        menu[0].classList.add("active")
    }
}