<?php include 'db.php'; ?>
<!DOCTYPE html>
<html>
<head>
<title>Gaming Zone</title>
<style>
body{margin:0;font-family:Arial;background:#0f0f0f;color:#fff;text-align:center}
.container{max-width:500px;margin:60px auto;padding:30px;background:#1b1b1b;border-radius:15px;box-shadow:0 0 20px #00ffcc}
h1{color:#00ffcc}
input{width:90%;padding:12px;margin:10px;border:none;border-radius:8px}
button{padding:12px 30px;background:#00ffcc;border:none;border-radius:8px;font-weight:bold;cursor:pointer}
button:hover{background:#00ccaa}
.msg{margin-top:15px;color:#00ffcc}
</style>
</head>
<body>
<div class='container'>
<h1>🎮 Gaming Zone</h1>
<p>Enter Player Details</p>
<form method='post'>
<input type='text' name='name' placeholder='Player Name' required>
<input type='email' name='email' placeholder='Email' required>
<button type='submit'>Save Data</button>
</form>
<?php
if($_POST){
$n=$_POST['name'];
$e=$_POST['email'];
$conn->query("INSERT INTO users(name,email) VALUES('$n','$e')");
echo "<div class='msg'>✅ Data Saved Successfully!</div>";
}
?>
</div>
</body>
</html>