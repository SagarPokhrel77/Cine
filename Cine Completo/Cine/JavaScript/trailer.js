function openTrailer() {
    var modal = document.getElementById("trailerModal");
    var frame = document.getElementById("trailerFrame");

    if (TRAILER_URL === "") {
        alert("Esta película no tiene trailer");
        return;
    }

    frame.src = TRAILER_URL + "?autoplay=1";
    modal.classList.add("show");
}

function closeTrailer() {
    var modal = document.getElementById("trailerModal");
    var frame = document.getElementById("trailerFrame");

    frame.src = "";
    modal.classList.remove("show");
}
