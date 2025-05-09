<?php
session_start();
if (!isset($_SESSION['admin'])) {
    //header("Location: admin_login.php");
    exit();
}
?>
<h2>Admin Dashboard</h2>
<ul>
    <li><a href="cat.php">Manage Categories</a></li>
    <li><a href="ques.php">Manage Questions</a></li>
    <li><a href="ans.php">Manage Answers</a></li>

</ul>