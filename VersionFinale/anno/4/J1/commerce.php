<!DOCTYPE html>
<html>
<head>
  <title>commerce</title>
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
  unlink('commerce.txt');
$data=$_POST['textdata'];
$fp = fopen('commerce.txt', 'a');
fwrite($fp, $data);
fclose($fp);
}
?>