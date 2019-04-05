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

var myform = $("form#facturaElec");
myform.submit(function (event) {
    event.preventDefault();

    var params = myform.serializeArray().reduce(function (obj, item) {
        obj[item.name] = item.value;
        return obj;
    }, {});

    // Change to your service ID, or keep using the default service
    var service_id = "default_service";

    var template_id = "facturaelectronica";
    myform.find("button").text("Enviando...");
    emailjs.send(service_id, template_id, params)
        .then(function () {
            alert("Enviado!");
            myform.find("button").text("Send");
        }, function (err) {
            alert("Send email failed!\r\n Response:\n " + JSON.stringify(err));
            myform.find("button").text("Send");
        });

    return false;
});