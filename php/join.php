<?php

    class Join_ {

        const HOST = "localhost";
        const USER = "root";
        const PASSWORD = "root";
        const DATABASE = "slippers";

        private $db;

        function __construct($username, $password) {
            $this->db = new mysqli(self::HOST, self::USER, self::PASSWORD, self::DATABASE);
            $this->testConnection();
			$AffiliateId = $_POST['AffiliateId'];
			
			switch($AffiliateId){
				case 0:
				    $this->checkUser($username);
					$this->createAccount($username, $password, $_POST['Email'], $_POST['Colour'], $_POST['IsSafeMode'], $_POST['AgeGroup']);
					break;
			}
        }

        function testConnection() {
            if ($this->db->connect_error) {
                die("&e=0");
            }
        }
		
		function checkUser($username) {
            $escapedUsername = $this->db->real_escape_string($username);

            $statement = $this->db->prepare("SELECT `username` FROM users WHERE username = ?");
            $statement->bind_param("s", $escapedUsername);
            $statement->execute();
            $result = $statement->get_result();

            if ($result->num_rows > 0) {
                // User found
                die("&e=1");
            }
        }

        function createAccount($username, $password, $email, $color, $ageGroup, $safeMode) {
            $user = $this->checkUser($username);
			$key = "0";
			$newPassword = password_hash($_POST['Password'], PASSWORD_DEFAULT);
            $statement = $this->db->prepare("INSERT INTO `users` (`username`, `loginkey`, `password`, `color`, `email`, `agegroup`, `safemode`) VALUES (?,?,?,?,?,?,?)");
            $statement->bind_param("sssssss", $username, $key, $newPassword, $color, $email, $ageGroup, $safeMode);
			$statement->execute();
			die("&e=0");
        }

    }

    New Join_(
        $_POST["Username"],
        $_POST["Password"]
    );

?>
