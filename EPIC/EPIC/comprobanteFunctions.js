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
    var dato1 = document.getElementById("cedulaFactura");
    var dato2 = document.getElementById("nombreFactura");
    var dato3 = document.getElementById("telefonoFactura");
    var dato4 = document.getElementById("correoFactura");
    var dato5 = document.getElementById("direccionFactura");

    if (check0.checked) {
        dato1.style.display = "block";
        dato2.style.display = "block";
        dato3.style.display = "block";
        dato4.style.display = "block";
        dato5.style.display = "block";
    } else {
        dato1.style.display = "none";
        dato2.style.display = "none";
        dato3.style.display = "none";
        dato4.style.display = "none";
        dato5.style.display = "none";
    }
}
