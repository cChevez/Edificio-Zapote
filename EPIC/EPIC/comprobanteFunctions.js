function showImage() {
    var file = document.getElementById("fileUploader").files[0];
    var reader = new FileReader();
    if (file) {
        reader.readAsDataURL(file);
        reader.onloadend = function () {
            document.getElementById("image").src = reader.result;
        }
    }
}

function solicitudFactura() {
    var check0 = document.getElementById("factura");
    var dato0 = document.getElementById("facturaElec");

    if (check0.checked) {
        dato0.style.display = "block";
    } else {
        dato0.style.display = "none";
    }
}