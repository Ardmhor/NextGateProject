<?php
class USER
{
    private $db;
 
    function __construct($DB_con)
    {
      $this->db = $DB_con;
    }
 
    public function register($uname, $upass)
    {
       try
       {
   
           $stmt = $this->db->prepare("INSERT INTO ng_users(username, password) VALUES(:uname, :upass)");
           
		       $stmt->bindparam(":uname", $uname);
           $stmt->bindparam(":upass", $upass);            
           $stmt->execute(); 
   
           return $stmt; 
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }    
    }
 
    public function login($uname, $upass)
    {
       try
       {
          $stmt = $this->db->prepare("SELECT * FROM ng_users WHERE username=:uname AND password=:upass LIMIT 1");
          $stmt->execute(array(':uname'=>$uname, ':upass'=>$upass));
          $userRow=$stmt->fetch(PDO::FETCH_ASSOC);

          $row = $stmt->rowCount();

          if($stmt->rowCount() > 0)
          {
                
              $_SESSION['user_session'] = $userRow['ng_users_id'];
         

              return true;

          }
          else
          {
              return false;
             
          }
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }
   }
 
   public function is_loggedin()
   {
      if(isset($_SESSION['user_session']))
      {
         return true;
      }
   }
 
   public function redirect($url)
   {
       header("Location: $url");
   }
 
   public function logout()
   {
        session_destroy();
        unset($_SESSION['user_session']);
        return true;
   }
}
?>