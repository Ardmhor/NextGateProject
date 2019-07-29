<?php

session_start();

$DB_host = "localhost";
$DB_user = "NG_User";
$DB_pass = "NG_Password";
$DB_name = "ng_music";

try
{
     $DB_con = new PDO("mysql:host=$DB_host;dbname=$DB_name",$DB_user,$DB_pass);
     $DB_con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
     echo $e->getMessage();
}


include_once 'Class.User.php';
$user = new USER($DB_con);