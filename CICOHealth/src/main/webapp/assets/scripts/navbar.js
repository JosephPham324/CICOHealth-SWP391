function displayDiv() {
    var x = document.getElementById("nav-content");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
};

window.addEventListener("load", function () {
    if (window.innerWidth > 1010) {
        document.getElementById("nav-content").style.display = "block";
    } else {
        document.getElementById("nav-content").style.display = "none";
    }
});

window.addEventListener("resize", function () {
    if (window.innerWidth > 1010) {
        document.getElementById("nav-content").style.display = "block";
    } else {
        document.getElementById("nav-content").style.display = "none";
    }
});

document.getElementById("menu-hamburger").addEventListener("click", displayDiv);