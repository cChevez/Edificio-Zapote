function showAula() {
    var radio0 = document.getElementById("0aulaCheck");
    var radio1 = document.getElementById("1aulaCheck");
    var radio2 = document.getElementById("2aulaCheck");
    var radio3 = document.getElementById("3aulaCheck");
    var aula1 = document.getElementById("1aula");
    var aula2 = document.getElementById("2aula");
    var aula3 = document.getElementById("3aula");

    if (radio0.checked) {
        aula1.style.display = "none";
        aula2.style.display = "none";
        aula3.style.display = "none";
    } else if (radio1.checked) {
        aula1.style.display = "block";
        aula2.style.display = "none";
        aula3.style.display = "none";
    } else if (radio2.checked) {
        aula1.style.display = "none";
        aula2.style.display = "block";
        aula3.style.display = "none";
    } else if (radio3.checked) {
        aula1.style.display = "none";
        aula2.style.display = "none";
        aula3.style.display = "block";
    }
}

function showLab() {
    var radio0 = document.getElementById("0labCheck");
    var radio1 = document.getElementById("B1labCheck");
    var radio2 = document.getElementById("B2labCheck");
    var radio3 = document.getElementById("2labCheck");
    var labB1 = document.getElementById("B1lab");
    var labB2 = document.getElementById("B2lab");
    var lab2 = document.getElementById("2lab");

    if (radio0.checked) {
        labB1.style.display = "none";
        labB2.style.display = "none";
        lab2.style.display = "none";
    } else if (radio1.checked) {
        labB1.style.display = "block";
        labB2.style.display = "none";
        lab2.style.display = "none";
    } else if (radio2.checked) {
        labB1.style.display = "none";
        labB2.style.display = "block";
        lab2.style.display = "none";
    } else if (radio3.checked) {
        labB1.style.display = "none";
        labB2.style.display = "none";
        lab2.style.display = "block";
    }
}

function addDate() {
    var newRow = fechas.insertRow(fechas.length);
    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);

    var dia = document.getElementsByName("dia").values;
    var day, month, year;


    var dFecha = dia.value;
    var inicio = document.getElementsByName("horaInicioDia").value;
    var final = document.getElementsByName("horaFinalDia").value;

    //Console.Write("Your");

    cell1.innerHTML = dFecha;
    cell2.innerHTML = inicio;
    cell3.innerHTML = final;
}

window.onload = function() {
    var fecha = new Date(); //Fecha actual
    var mes = fecha.getMonth() + 1; //obteniendo mes
    var dia = fecha.getDate(); //obteniendo dia
    var ano = fecha.getFullYear(); //obteniendo año
    if (dia < 10)
        dia = '0' + dia; //agrega cero si el menor de 10
    if (mes < 10)
        mes = '0' + mes //agrega cero si el menor de 10
    document.getElementById('fechaActual').value = ano + "-" + mes + "-" + dia;
}