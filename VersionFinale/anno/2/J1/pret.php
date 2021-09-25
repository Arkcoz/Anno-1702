<!DOCTYPE html>
<html>
<head>
  <title>pret</title>
</head>
<body>
  <form method="post">
    <input type="text" name="textdata"><br>
    <input type="submit" name="submit">
    
  </form>
</body>
</html>


<!-- Enregistre le contenu du form dans un fichier texte -->
<?php


              
if(isset($_POST['textdata']))
{
  unlink('pret.txt');
$data=$_POST['textdata'];
$fp = fopen('pret.txt', 'a');
fwrite($fp, $data);
fclose($fp);
}
?>