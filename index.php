<?php
    include "connect.php";
?>
<!doctype html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cenarios e Casos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="./">Inicio</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="./casos/">Casos de Teste</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Requisito</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Casos de Teste</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $queryCenarios = "SELECT * FROM cenarios";
                    if($resultCenarios = $mysqli->query($queryCenarios)) {
                        while ($rowCenarios = $resultCenarios->fetch_assoc()){
                            print_r("<tr>");
                                print_r("<th scope=\"row\">".$rowCenarios['id']."</th>");
                                print_r("<td>".$rowCenarios['requisito']."</td>");
                                print_r("<td>".$rowCenarios['descricao']."</td>");
                                print_r("<td>");

                                $queryCasos = "SELECT * FROM casodeteste where cenario = ".$rowCenarios['id'];
                                if($resultCasos = $mysqli->query($queryCasos)) {
                                    while ($rowCasos = $resultCasos->fetch_assoc()) {
                                        print_r("<a href=\"./caso/?caso=".$rowCasos['id']."\"> CT-".$rowCasos['id']."<br>");
                                    }
                                }
                            print_r("</td>");

                            print_r("</tr>");
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
