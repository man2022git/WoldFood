<?php

    // $Link = mysqli_connect('localhost','root','root@2565','worldfood');
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

            $sql = "INSERT INTO `usertable`(`id`, `Name`, `User`, `Password`, `ChooseType`) VALUES (Null,'$Name','$User','$Password','$ChooseType')";
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