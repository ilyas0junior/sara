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

    // Récupération des données du formulaire
    $marque = $_POST["marque"];
    $modele = $_POST["modele"];
    $puissance = $_POST["puissance"];
    $carburant = $_POST["carburant"];

    // Insertion des données dans la table modele
    $sql = "INSERT INTO modele (marque, modele, puissance, carburant) VALUES ('$marque', '$modele', '$puissance', '$carburant')";

    if ($conn->query($sql) === TRUE) {
        echo "Nouveau modèle ajouté avec succès.";
    } else {
        echo "Erreur : " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>