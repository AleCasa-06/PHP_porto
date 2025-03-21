<html>
    <head>
        <title>Registrazione navi</title>
    </head>
    <body>
        <h1>Benvenuto nel form di Registrazione</h1>
        <form method="POST" formaction="index.php">
            <label for="nomeNave">Nome nave</label><br>
            <input type="text" required name="nomeNave"><br>

            <label for="dataArrivo">Data di arrivo</label><br>
            <input type="date" required name="dataArrivo"><br>

            <label for="pPrevista">Data partenza prevista</label><br>
            <input type="date" required name="pPrevista"><br>

            <label for="pEffettiva">Data partenza effettiva</label><br>
            <input type="date" required name="pEffettiva"><br>

            <label for="operazione">Scegli un operazione:</label>
            <select id="op" name="op">
                <option value="carico">Carico</option>
                <option value="scarico">Scarico</option>
                
            </select><br>

            <input type="submit" name="registra" value="Registrazione">
            

        </form>
    </body>
</html>


<?php
$pdo = new PDO("mysql:host=localhost;dbname=mare_nostrum;charset=utf8mb4", "root", "");

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $stmt = $pdo->prepare("CALL registra(?, ?, ?, ?, ?)");
    $stmt->execute([$_POST['nomeNave'], $_POST['dataArrivo'], $_POST['pPrevista'], $_POST['pEffettiva'], $_POST['op']]);



}



?>