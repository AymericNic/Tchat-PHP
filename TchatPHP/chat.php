<?php
session_start();
if(!isset($_SESSION["pseudo"]))
{
    header("location:onePage.php");
}
include "connect.php";
$pseudo = $_SESSION["pseudo"];
if(isset($_POST["bout"])){
    
    if(!isset($_POST["message"]) || $_POST["message"]==""){
        $erreur2 = "Veuillez entrer votre message!.";
    }
    if(isset($_POST["message"]) && $_POST["message"]!=""){
        $destinataire = $_POST["destinataire"];
        $message = mysqli_real_escape_string($id,$_POST["message"]);
        $req = "insert into messages values (null, '$pseudo','$message',now(),'$destinataire')";
        mysqli_query($id,$req);

    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="container">
        <header>
            <h1>Bonjour <?=$_SESSION["pseudo"]?> Chattez'en direct! Chatbox...... <a href="deconnexion.php">Deconnexion</a></h1>
        </header>
        <div class="messages">
            <ul>
                <?php
                
                $req = "select * from messages 
                        where destinataire = '$pseudo'
                        or destinataire = 'tous'
                        order by date desc";
                $res = mysqli_query($id, $req);
                while($ligne = mysqli_fetch_assoc($res)){ 
                echo "<li class='message'><span class='date'>".$ligne["date"]."</span> - <span class='expediteur'>" 
                                            .$ligne["pseudo"]."</span> - <span class='message'>"
                                            . $ligne["message"].".</span> </li>";
                }
                ?>
            </ul>
        </div>
        <?php if(isset($erreur1)) echo "<div class='erreur'>$erreur1</div>";?>
        <?php if(isset($erreur2)) echo "<div class='erreur'>$erreur2</div>";?>
        <div class="formu">
            <form action="" method="post">
                <input type="text" name="message" placeholder="Entrez votre message :">
              Destinataire :   
              <select name="destinataire">
                    <option value="tous" selected> Tous </option>
                    <?php
                        $req = "select * from users order by pseudo";
                        $resultat = mysqli_query($id,$req);
                        while($ligne = mysqli_fetch_assoc($resultat))
                        {
                            echo "<option> ".$ligne["pseudo"]." </option>";
                        }
                    ?>
                </select>
                <br>
                <input class="bout" type="submit" value="Envoyer" name="bout">
            </form>

        </div>
    </div>
</body>
</html>