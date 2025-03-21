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
            <input type="data" required name="dataArrivo"><br>

            <label for="pPrevista">Data partenza prevista</label><br>
            <input type="data" required name="pPrevista"><br>

            <label for="pEffettiva">Data partenza effettiva</label><br>
            <input type="data" required name="pEffettiva"><br>

            <label for="operazione">Scegli un operazione:</label>
            <select id="op" name="op">
                <option value="carico">Carico</option>
                <option value="scarico">Scarico</option>
                
            </select><br>
            

        </form>
    </body>
</html>


<?php
$pdo = new PDO("mysql:host=localhost;dbname=mare_nostrum;charset=utf8mb4", "root", "");

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    


}



?>