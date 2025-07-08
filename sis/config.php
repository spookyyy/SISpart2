<?php
ob_start();
ini_set('date.timezone','Asia/Manila');
date_default_timezone_set('Asia/Manila');
session_start();

if(!defined('DB_SERVER')) define('DB_SERVER',"10.0.0.54");
if(!defined('DB_USERNAME')) define('DB_USERNAME',"admin");
if(!defined('DB_PASSWORD')) define('DB_PASSWORD',"admin126!"); // ˅ Replace with real password
if(!defined('DB_NAME')) define('DB_NAME',"sis_db");
if(!defined('base_url')) define('base_url','http://'.$_SERVER['HTTP_HOST'].'/sis/');


require_once('initialize.php');
require_once('classes/DBConnection.php');
require_once('classes/SystemSettings.php');
$db = new DBConnection;
$conn = $db->conn;

function redirect($url=''){
	if(!empty($url))
	echo '<script>location.href="'.base_url .$url.'"</script>';
}

function validate_image($file){
    if(!empty($file)){
        $ex = explode('?', $file);
        $file = $ex[0];
        $param = isset($ex[1]) ? '?'.$ex[1] : '';
        
        $file_path = $_SERVER['DOCUMENT_ROOT'] . '/sis/' . $file;
        
        if(file_exists($file_path)){
            return 'http://'.$_SERVER['HTTP_HOST'].'/sis/'.$file.$param;
        } else {
            return 'http://'.$_SERVER['HTTP_HOST'].'/sis/dist/img/no-image-available.png';
        }
    } else {
        return 'http://'.$_SERVER['HTTP_HOST'].'/sis/dist/img/no-image-available.png';
    }
}

function isMobileDevice(){
    $aMobileUA = array(

        '/webos/i' => 'Mobile'
    );

    //Return true if Mobile User Agent is detected
    foreach($aMobileUA as $sMobileKey => $sMobileOS){
        if(preg_match($sMobileKey, $_SERVER['HTTP_USER_AGENT'])){
            return true;
        }
    }
    //Otherwise return false..  
    return false;
}
ob_end_flush();
?>


