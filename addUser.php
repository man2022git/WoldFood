<?php
    header("content-type:text/javascript;charset=utf-8");
    error_reporting(0);
    error_reporting(E_ERROR | E_PARSE);

    $Link = mysqli_connect('localhost','root','','worldfood');

    if(!$Link){
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_error() . PHP_EOL;

        exit;
    }

    if(!$Link->set_charset("utf8")){
        printf("Error loading character set utf8: %s\n", $link->error);
        exit();
    }

    if(isset($_GET)){
        if($_GET['isAdd']=='true'){

            $Name = $_GET['Name'];
            $User = $_GET['User'];
            $Password = $_GET['Password'];
            $ChooseType = $_GET['ChooseType'];

            $sql = "INSERT INTO `usertable`(`id`, `ChooseType`, `Name`, `User`, `Password`) VALUES (Null,'$ChooseType','$Name','$User','$Password')";
            $result = mysqli_query($Link, $sql);

            if ($result) {
                echo "true";
            } else {
                echo  "false";
            }
        } else echo "Welecome Master World";
    }
    mysqli_close($link);
?>