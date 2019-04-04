function show1Aula() {
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
