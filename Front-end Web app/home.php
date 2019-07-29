<?php
$result;
$value = "";   
include_once 'dbconfig.php';
if(!$user->is_loggedin())
{
 $user->redirect('index.php');
}

$ng_users_id = $_SESSION['user_session'];
$stmt = $DB_con->prepare("SELECT * FROM ng_users WHERE ng_users_id=:ng_users_id");
$stmt->execute(array(":ng_users_id"=>$ng_users_id));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);

?>

<?php
function search($uinput)
{

      $uinput = $_POST['userinput'];

      
          $stmt = $this->db->prepare("SELECT * FROM ng_albums WHERE album_name =:uinput");
          $stmt->execute(array(':uinput'=>$uinput));
          

          $row=$stmt->fetch(PDO::FETCH_ASSOC);
              
              return $result = $row['album_name'];
              
      
          
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"  />
<link rel="stylesheet" href="style.css" type="text/css"  />
<title>welcome - <?php print($userRow['username']); ?></title>
<div class="content">
welcome : <?php print($userRow['username']); ?>
<div class="container">
     <div class="form-container">
        <form method="post">
            <h2>Search.</h2><hr />
            <?php
            if(isset($error))
            {
                  ?>
                  <div class="alert alert-danger">
                      <i class="glyphicon glyphicon-warning-sign"></i> &nbsp; <?php echo $error; ?> !
                  </div>
                  <?php
            }
            ?>
            <div class="form-group">
             <input type="text" class="form-control" name="userinput" placeholder="Enter your Text" required />
            </div>
            <div class="clearfix"></div><hr />
            <div class="form-group">
             <button type="submit" name="btn-login" class="btn btn-block btn-primary">
                 <i class="glyphicon glyphicon-log-in"></i>&nbsp;Search
                </button>
            </div>
            <br />
           
        </form>
       </div>

</div>
 


<ul>
    <?php
    if($results($value)){
      foreach ($result as $value) { ?>
     
      <li> <?php echo $value; ?> </li>

      <?php
      }
       } ?> 
</ul>
</div>


</body>

</html>