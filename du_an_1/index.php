<?php
session_start();

date_default_timezone_set('Asia/Ho_Chi_Minh');

include "./Models/connect.php";
include "./Views/Includes/header.php";
include "./Models/course.php";
include "./Models/account.php";
include "./Models/payment.php";
include "./Models/slider.php";

$featured_course = featured_course();
$all_course = all_course();
$all_slider = getHomeSlider();

if (isset($_GET['act']) && $_GET['act'] != '') {
    $act = $_GET['act'];

    switch ($act) {
        case 'signup':
            if (isset($_POST['signUpBtn'])) {
                $email = $_POST['email'];
                $username = $_POST['username'];
                $password = sha1($_POST['password']);
                $user_name = $_POST['user_name'];

                $insert_acount = signUp($email, $username, $password, $user_name);
            }
            include "./Views/signup.php";
            break;
        case 'signin':
            if (isset($_POST['signinBtn'])) {
                $username = $_POST['username'];
                $password = sha1($_POST['password']);
                $account = signIn($username, $password);
                if (is_array($account)) {
                    $_SESSION['user'] = $account;

                    session_regenerate_id();
                    $user_session_id = session_id();

                    $query = "UPDATE users SET user_session_id = '$user_session_id' 
                            WHERE user_id = " . $account['user_id'];
                    pdo_query($query);

                    $_SESSION['user_id'] = $account['user_id'];
                    $_SESSION['user_session_id'] = $user_session_id;

                    header('location:index.php');
                } else {
                    $thongbao_dn = 'Tài khoản hoặc mật khẩu không chính xác!';
                }
            }
            include "./Views/signin.php";
            break;
        case 'forget':
            if (isset($_POST['sendEmail'])) {
                $email = $_POST['email'];
                $messEmail = sendMail($email);
            }
            include "./Views/forget.php";
            break;
        case 'logout':
            session_destroy();
            header('location:index.php');
            break;
        case 'contact':
            include "./Views/contact.php";
            break;
        case 'course':
            if (isset($_GET['course_id']) && ($_GET['course_id'] > 0)) {
                //kiểm tra xem khóa học đã được mua chưa
                if (isset($_SESSION['user']['user_id'])) {
                    $_SESSION['course_of_user'] = course_of_user($_SESSION['user']['user_id']);
                    if (in_array($_GET['course_id'], $_SESSION['course_of_user'])) {
                        header('location: index.php?act=watchLesson&course_id' . $_GET['course_id']);
                    }
                }

                $course_id = $_GET['course_id'];
                $one_course = load_one_sanpham($course_id);
                extract($one_course);
                $course_cungLoai = load_sanpham_cungloai($category_id);
                include './Views/course.php';
            } else {
                include 'view/home.php';
            }
            break;
        case "payment":
            if (!isset($_SESSION['user'])) {
                header('location: index.php?act=signin&mess');
            }
            if (isset($_GET['course_id']) && ($_GET['course_id'] > 0)) {
                $course_id = $_GET['course_id'];
                $_SESSION['order_id'] = rand(10000000, 99999999);
                $one_course = load_one_sanpham($course_id);
                extract($one_course);
                include './Views/payment.php';
            }
            break;
        case "add_cart":
            if (!isset($_SESSION['user'])) {
                header('location: index.php?act=signin&mess');
            }
            if (isset($_GET['course_id']) && ($_GET['course_id'] > 0)) {
                $course_id = $_GET['course_id'];
                add_cart($_SESSION['user']['user_id'], $course_id);
                header('location: index.php?act=cart');
            }
            break;
        case "cart":
            if (!isset($_SESSION['user'])) {
                header('location: index.php?act=signin&mess');
            }
            $load_cart = load_cart($_SESSION['user']['user_id']);
            include './Views/cart.php';
            break;
        case "order":
            if (isset($_POST['success'])) {
                $order_id = $_POST['order_id'];
                $user_id = $_SESSION['user']['user_id'];
                $course_id = $_POST['course_id'];
                $order_date = $_POST['order_date'];
                order($order_id, $user_id, $course_id, $order_date, 2);
                header('location: index.php');
            }

            if (isset($_POST['cancel'])) {
                $order_id = $_POST['order_id'];
                $user_id = $_SESSION['user']['user_id'];
                $course_id = $_POST['course_id'];
                $order_date = $_POST['order_date'];
                order($order_id, $user_id, $course_id, $order_date, 0);
                header('location: index.php');
            }
            break;
        case "profile":
            if (isset($_POST['updateAccount'])) {
                $user_id = $_POST['user_id'];
                $user_email = $_POST['user_email'];
                $user_name = $_POST['user_name'];
                $user_phone = $_POST['user_phone'];

                $user_avatar = $_FILES['user_avatar']['name'];
                $tmp_anh = $_FILES['user_avatar']['tmp_name'];
                move_uploaded_file($tmp_anh, './Public/images/avatar/' . $user_avatar);

                update_account($user_id, $user_email, $user_name, $user_phone, $user_avatar);
                $_SESSION['user'] = update_session($_SESSION['user']['user_id']);
            }
            include './Views/profile.php';
            break;
        case "changePassword":
            if (isset($_POST['changePw'])) {
                $user_id = $_POST['user_id'];
                $newPw = sha1($_POST['newPw']);
                $re_newPw = sha1($_POST['re_newPw']);
                $oldPw = sha1($_POST['oldPw']);

                if ($newPw !== $re_newPw) {
                    $messPw = "Mật khẩu không trùng khớp, hãy thử lại!";
                    include './Views/changePassword.php';
                    break;
                }
                if ($oldPw !== $_SESSION['user']['user_password']) {
                    $messPwFalse = "Mật khẩu cũ không đúng, hãy thử lại!";
                    include './Views/changePassword.php';
                    break;
                }
                $messPwTrue = "Đổi mật khẩu thành công!";
                change_password($user_id, $newPw);
                $_SESSION['user'] = update_session($_SESSION['user']['user_id']);
            }
            include './Views/changePassword.php';
            break;
        case "historypayment":
            $history = historyPayment($_SESSION['user']['user_id']);
            include './Views/historypayment.php';
            break;
        case "myCourse":
            $courses = myCourse($_SESSION['user']['user_id']);
            include './Views/myCourse.php';
            break;
        case "watchLesson":
            include './Views/watchLesson.php';
            break;
    }
} else {
    include "./Views/Includes/home.php";
}
include "./Views/Includes/footer.php";
