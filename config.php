<?php
// config.php - Database configuration
define('DB_HOST', 'localhost');
define('DB_NAME', 'family_budget_db');
define('DB_USER', 'root');
define('DB_PASS', '');

// db_connection.php - Database connection
class Database {
    private $host = DB_HOST;
    private $db_name = DB_NAME;
    private $username = DB_USER;
    private $password = DB_PASS;
    public $conn;

    public function getConnection() {
        $this->conn = null;
        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        } catch(PDOException $exception) {
            echo "Connection error: " . $exception->getMessage();
        }
        return $this->conn;
    }
}

// user.php - User model
class User {
    private $conn;
    private $table_name = "users";

    public $id;
    public $email;
    public $password;
    public $full_name;
    public $role;
    public $family_id;
    public $is_active;
    public $created_at;
    public $updated_at;

    public function __construct($db) {
        $this->conn = $db;
    }

    function create() {
        $query = "INSERT INTO " . $this->table_name . "
                SET email=:email, password=:password, full_name=:full_name, 
                role=:role, family_id=:family_id, is_active=:is_active";
        
        $stmt = $this->conn->prepare($query);
        
        // sanitize
        $this->email = htmlspecialchars(strip_tags($this->email));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->full_name = htmlspecialchars(strip_tags($this->full_name));
        $this->role = htmlspecialchars(strip_tags($this->role));
        $this->family_id = htmlspecialchars(strip_tags($this->family_id));
        $this->is_active = htmlspecialchars(strip_tags($this->is_active));
        
        // bind values
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":full_name", $this->full_name);
        $stmt->bindParam(":role", $this->role);
        $stmt->bindParam(":family_id", $this->family_id);
        $stmt->bindParam(":is_active", $this->is_active);
        
        // hash the password before saving to database
        $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
        $stmt->bindParam(":password", $password_hash);
        
        if($stmt->execute()) {
            return true;
        }
        return false;
    }

    function emailExists() {
        $query = "SELECT id, full_name, password, role, family_id, is_active
                FROM " . $this->table_name . "
                WHERE email = ?
                LIMIT 0,1";
        
        $stmt = $this->conn->prepare($query);
        $this->email = htmlspecialchars(strip_tags($this->email));
        $stmt->bindParam(1, $this->email);
        $stmt->execute();
        $num = $stmt->rowCount();
        
        if($num > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->id = $row['id'];
            $this->full_name = $row['full_name'];
            $this->password = $row['password'];
            $this->role = $row['role'];
            $this->family_id = $row['family_id'];
            $this->is_active = $row['is_active'];
            return true;
        }
        return false;
    }
}

// register.php - User registration endpoint
include_once 'config.php';
include_once 'db_connection.php';
include_once 'user.php';

$database = new Database();
$db = $database->getConnection();

$user = new User($db);

if($_POST){
    $user->email = $_POST['email'];
    $user->password = $_POST['password'];
    $user->full_name = $_POST['full_name'];
    $user->role = $_POST['role'];
    $user->family_id = isset($_POST['family_id']) ? $_POST['family_id'] : NULL;
    $user->is_active = 1;
    
    if($user->create()){
        http_response_code(200);
        echo json_encode(array("message" => "User was created."));
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Unable to create user."));
    }
}

// login.php - User login endpoint
include_once 'config.php';
include_once 'db_connection.php';
include_once 'user.php';

$database = new Database();
$db = $database->getConnection();

$user = new User($db);

$data = json_decode(file_get_contents("php://input"));

if(!empty($data->email) && !empty($data->password)){
    $user->email = $data->email;
    $email_exists = $user->emailExists();
    
    if($email_exists && password_verify($data->password, $user->password)){
        if($user->is_active){
            session_start();
            $_SESSION['user_id'] = $user->id;
            $_SESSION['email'] = $user->email;
            $_SESSION['full_name'] = $user->full_name;
            $_SESSION['role'] = $user->role;
            $_SESSION['family_id'] = $user->family_id;
            
            http_response_code(200);
            echo json_encode(
                array(
                    "message" => "Login successful.",
                    "user_id" => $user->id,
                    "email" => $user->email,
                    "full_name" => $user->full_name,
                    "role" => $user->role,
                    "family_id" => $user->family_id
                )
            );
        } else {
            http_response_code(401);
            echo json_encode(array("message" => "Your account is deactivated."));
        }
    } else {
        http_response_code(401);
        echo json_encode(array("message" => "Login failed."));
    }
}
?>