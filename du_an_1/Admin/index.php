<?php
session_start();
include '../Models/connect.php';
include '../Models/account.php';
include '../Models/thong_ke.php';
include '../Models/course.php';

if (isset($_GET['act']) && $_GET['act'] != '') {
    $act = $_GET['act'];

    switch ($act) {
        case 'signin':
            if (isset($_POST['signinBtn'])) {
                $username = $_POST['username'];
                $password = sha1($_POST['password']);
                $account = loginAdmin($username, $password);
                if (is_array($account)) {
                    // $_SESSION['user'] = $account;

                    // session_regenerate_id();
                    // $user_session_id = session_id();

                    // $query = "UPDATE users SET user_session_id = '$user_session_id' 
                    //         WHERE user_id = " . $account['user_id'];
                    // pdo_query($query);

                    // $_SESSION['user_id'] = $account['user_id'];
                    // $_SESSION['user_session_id'] = $user_session_id;

                    header('location:index.php?act=dashboard');
                } else {
                    $messLogin = 'Tài khoản hoặc mật khẩu không chính xác!';
                    include "./Views/login.php";
                }
            }
        break;
        case 'logout':
            session_destroy();
            header('location:index.php');
            break;
        case'dashboard':
            $totalUser = allUser();
            $soldCourse = soldCourse();
            $totalRevenue = revenue();
            $allCourse = allCourse();
            $orderAwaiting = orderAwaiting();
            $category = countCategoty();
            include './Views/dashboard.php';
            break;
        case'baoCao':
            $courses = featured_course();
            include './Views/baoCao.php';
    }
} else {
    include "./Views/login.php";
}
