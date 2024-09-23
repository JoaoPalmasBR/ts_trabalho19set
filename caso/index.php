<?php
    include "../connect.php";
    $idCaso = $_GET['caso'];
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
                <a class="navbar-brand" href="../">Inicio</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../casos/">Casos de Teste</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col">

                </div>
                <div class="col-6">

                <?php
            $queryCaso = "SELECT * FROM casodeteste where id=$idCaso;";
            if($resultCaso = $mysqli->query($queryCaso)) {
                while ($rowCaso = $resultCaso->fetch_assoc()){
                    print_r("
<table class=\"table table-sm table-bordered border-primary\">
                        <thead>
                        <tr>
                            <th class=\"table-dark\" scope=\"col\" colspan=\"3\">CT-".$rowCaso['id']."</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class=\"table-dark\">DESCRIÇÃO</td>
                            <td colspan=\"2\">".$rowCaso['descricao']."</td>
                        </tr>
                        <tr>
                            <td class=\"table-dark\">ENTRADA</td>
                            <td colspan=\"2\">".$rowCaso['entrada']."</td>
                        </tr>
                        <tr>
                            <td class=\"table-dark\">SAIDA</td>
                            <td colspan=\"2\">".$rowCaso['saida']."</td>
                        </tr>
                        <tr>
                            <td class=\"table-dark\">AMBIENTE</td>
                            <td colspan=\"2\">".$rowCaso['ambiente']."</td>
                        </tr>
                        <tr>
                            <td class=\"table-dark\">EXIGENCIAS ESPECIAIS</td>
                            <td colspan=\"2\">".$rowCaso['exigenciasespeciais']."</td>
                        </tr>
                        <tr>
                            <td class=\"table-dark\">PRE-CONDIÇÕES</td>
                            <td colspan=\"2\">".$rowCaso['precondicoes']."</td>
                        </tr>
                        <tr class=\"table-dark\">
                            <td>PROCEDIMENTOS</td>
                            <td>AÇÕES</td>
                            <td>RESULTADO ESPERADO</td>
                        </tr>");
                $queryProcedimento = "SELECT * FROM procedimento where caso=$idCaso;";
                if($resultProcedimento = $mysqli->query($queryProcedimento)) {
                    while ($rowProcedimento = $resultProcedimento->fetch_assoc()) {
                        print_r("<tr>
                            <td></td >
                            <td>".$rowProcedimento['acao']."</td >
                            <td>".$rowProcedimento['resultadoesperado']."</td >
                        </tr>");
                        }
                }
                    print_r("
                        <tr>
                            <td class=\"table-dark\">PÓS-CONDIÇÕES</td>
                            <td colspan=\"2\">".$rowCaso['poscondicoes']."</td>
                        </tr>
                        </tbody>
                    </table>                    
                    ");
                }
            }
            ?>

                </div>
                <div class="col">

                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
