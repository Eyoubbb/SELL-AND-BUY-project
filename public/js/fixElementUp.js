const elem = document.querySelector('.fixElementUp');

console.log(elem);

window.addEventListener("scroll", function() {
    if (window.scrollY == 0) {
        elem.classList.remove('fix');
    } else if (window.scrollY > 60) {
        elem.classList.add('fix');
    }
}, false);