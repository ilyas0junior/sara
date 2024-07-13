<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recherche de Véhicules</title>
    <style>
        form {
            max-width: 600px;
            margin: auto;
            padding: 1em;
            border: 1px solid #ccc;
            border-radius: 1em;
        }
        div + div {
            margin-top: 1em;
        }
        label {
            display: inline-block;
            width: 150px;
            text-align: right;
        }
        input {
            font: 1em sans-serif;
            width: 300px;
            box-sizing: border-box;
            border: 1px solid #999;
        }
        input:focus {
            border-color: #000;
        }
        input[type="submit"], button {
            padding: 0.7em;
            border: 1px solid #000;
            border-radius: 1em;
            background: #000;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover, button:hover {
            background: #444;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<h1>Recherche de Véhicules</h1>

<form action="recherche.php" method="post">
    <div>
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>
    </div>
    <div>
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required>
    </div>
    <div>
        <input type="submit" value="Rechercher">
        <button type="button" onclick="window.location.href='index.php';">Annuler</button>
    </div>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $servername = "nom_serveur";
    $username = "nom_utilisateur";
    $password = "mot_de_passe";
    $dbname = "nom_base_de_donnees";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connexion échouée : " . $conn->connect_error);
    }

    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];

    $sql = "SELECT v.matricule, v.marque, v.modele, v.puissance, v.carburant
            FROM proprietaire p
            JOIN voiture v ON p.matricule = v.matricule
            WHERE p.nom = '$nom' AND p.prenom = '$prenom'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table>";
        echo "<thead>";
        echo "<tr><th>Matricule</th><th>Marque</th><th>Modèle</th><th>Puissance</th><th>Carburant</th></tr>";
        echo "</thead>";
        echo "<tbody>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["matricule"] . "</td>";
            echo "<td>" . $row["marque"] . "</td>";
            echo "<td>" . $row["modele"] . "</td>";
            echo "<td>" . $row["puissance"] . "</td>";
            echo "<td>" . $row["carburant"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody>";
        echo "</table>";
    } else {
        echo "Aucun véhicule trouvé pour cette personne.";
    }

    $conn->close();
}
?>

</body>
</html>
