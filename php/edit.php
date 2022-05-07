<?php

    class Edit {

        const HOST = "localhost";
        const USER = "root";
        const PASSWORD = "root";
        const DATABASE = "slippers";

        private $db;

        function __construct($username, $password) {
            $this->db = new mysqli(self::HOST, self::USER, self::PASSWORD, self::DATABASE);

            $this->testConnection();
            $this->login($username, $password);
        }

        function testConnection() {
            if ($this->db->connect_error) {
                die("&e=0");
            }
        }

        function login($username, $password) {
            $user = $this->getUser($username);
            $this->verifyPassword($password, $user);
			$escapedUsername = $this->db->real_escape_string($username);
			$newPassword = password_hash($_POST['NewPassword'], PASSWORD_DEFAULT);

            $statement = $this->db->prepare("UPDATE `users` SET `password` = ? WHERE username = ? LIMIT 1");
            $statement->bind_param("ss", $newPassword, $escapedUsername);
            $statement->execute();
			die("&e=0");
			
        }

        function getUser($username) {
            $escapedUsername = $this->db->real_escape_string($username);

            $statement = $this->db->prepare("SELECT * FROM users WHERE username = ?");
            $statement->bind_param("s", $escapedUsername);
            $statement->execute();
            $result = $statement->get_result();

            if ($result->num_rows > 0) {
                // User found
                return mysqli_fetch_assoc($result);
            }

            // User not found
            die("&e=100");
        }

        function verifyPassword($password, $user) {
            if (!password_verify($password, $user["password"])) {
                // Incorrect password
                die("&e=101");
            }
        }

        function getCrumb($user) {
            return implode("|", array(
                $user["id"],
                $user["username"],
                $user["color"],
                $user["head"],
                $user["face"],
                $user["neck"],
                $user["body"],
                $user["hand"],
                $user["feet"],
                $user["flag"],
                $user["photo"],
                "0",
				"0",
				"0",
				$user["member"],
				"0"
            ));
        }

    }

    New Edit(
        $_POST["Username"],
        $_POST["Password"]
    );

?>
