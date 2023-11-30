<?php
ob_start(); // Start output buffering
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./Public/css/css_bootstrap.min.css" />
    <link rel="stylesheet" href="./Public/css/style.css" />
    <script src="./Public/js/js_bootstrap.bundle.min.js" defer></script>
    <script src="./Public/js/jquery-3.7.1.min.js" defer></script>
    <link rel="stylesheet" href="./Public/fontawesome-free-6.4.2-web/css/all.css" />
    <link rel="shortcut icon" type="image/png" href="./favicon.png" />

    <title>PolyUni</title>
</head>

<body>
    <!-- Header -->
    <header class="d-flex justify-content-between align-items-center flex-wrap px-2 d-none d-md-flex" id="header">
        <div class="logo d-flex align-content-center flex-wrap">
            <a href="./index.php">
                <img src="./favicon.png" alt="error" width="38px" height="38px" class="ms-3" />
            </a>
            <h4 class="logoHeading">PolyUni</h4>
        </div>
        <form action="" method="POST" class="d-flex flex-row align-items-center" style="position: relative;">
            <div class="mx-2">
                <select class="form-select" id="category" style="width: auto !important;">
                    <option value="1">BackEnd</option>
                    <option value="2">FrontEnd</option>
                    <option value="3">Devops</option>
                </select>
            </div>

            <div class="input-group position-relative">

                <i class="fa-solid fa-magnifying-glass fa-sm text-secondary position-absolute top-50 translate-middle" style="left: 20px; z-index: 100"></i>
                <input type="search" class="form-control rounded-4" id="search" oninput="timKiem()" style="width: 256px; font-size: 14px; padding-left: 38px;" placeholder="Tìm kiếm khóa học..." />
            </div>

            <div class="list-group" id="showData" style="position: absolute; top: 48px; left: 8px; width: 99%;">
                <!-- <a href="#" class="list-group-item list-group-item-action">The current link item</a>
                <a href="#" class="list-group-item list-group-item-action">A second link item</a>
                <a href="#" class="list-group-item list-group-item-action">A third link item</a>
                <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
            </div>
        </form>

        <div class="login d-flex flex-wrap align-content-center">
                <!--  -->
                <!-- kiểm tra xem session Login hay chưa?  -->
                <!--  -->
                <?php 
                    if(!isset($_SESSION['user'])){
                        echo"
                        <i class='fa-regular fa-circle-user fa-lg p-2 ms-1 pointer' data-bs-toggle='dropdown' aria-expanded='false'></i>
                        <ul class='dropdown-menu dropdown-menu-end mt-2 me-2 rounded-1 py-0'>
                            <li>
                                <a href='index.php?act=signin' class='dropdown-item rounded-top-2'>Đăng nhập</a>
                            </li>
                            <li>
                                <a href='index.php?act=signup' class='dropdown-item rounded-bottom-2'>Đăng ký</a>
                            </li>
                        </ul>
                        ";
                    }else{
                        extract($_SESSION['user']);

                        echo"
                        <i class='fa-regular fa-circle-user fa-lg p-2 ms-1 pointer text-warning' data-bs-toggle='dropdown' aria-expanded='false'></i>

                        <div class='dropdown-menu p-0 rounded-0 mt-2 me-2'>
                            <div class='card'>
                                <div class='card-body p-0'>
                                    <div class='d-flex bg-body-secondary p-3'>
                                        <div class='d-flex align-items-center'>
                                            <img class='rounded-circle' src='./Public/images/avatar/$user_avatar' width='40px' height='38px' alt='' />
                                        </div>
                                        <div class='ps-3'>
                                            <h5 class='mb-1'>$user_name</h5>
                                            <p class='mb-0' style='font-size: 14px'>$user_email</p>
                                        </div>
                                    </div>
                                    <div class='list-group'>
                                        <a href='index.php?act=cart' class='list-group-item list-group-item-action rounded-0 border-0 p-2' aria-current='true'>
                                            <div class='d-inline-block text-end me-2' style='width: 25px'>
                                                <i class='fa-solid fa-cart-arrow-down'></i>
                                            </div>
                                            <span>Giỏ hàng của tôi</span>
                                        </a>
                                        <a href='index.php?act=myCourse' class='list-group-item list-group-item-action rounded-0 border-0 p-2' aria-current='true'>
                                            <div class='d-inline-block text-end me-2' style='width: 25px'>
                                                <i class='fa-solid fa-video'></i>
                                            </div>
                                            <span>Khóa học của tôi</span>
                                        </a>
                                        <a href='index.php?act=profile' class='list-group-item list-group-item-action border-0 p-2'>
                                            <div class='d-inline-block text-end me-2' style='width: 25px'>
                                                <i class='fa-solid fa-pen-to-square'></i>
                                            </div>
                                            <span>Chỉnh sửa hồ sơ</span>
                                        </a>
                                        <a href='index.php?act=changePassword' class='list-group-item list-group-item-action border-0 p-2'>
                                            <div class='d-inline-block text-end me-2' style='width: 25px'>
                                                <i class='fa-solid fa-key'></i>
                                            </div>
                                            <span>Đổi mật khẩu</span>
                                        </a>
                                        <a href='index.php?act=historypayment' class='list-group-item list-group-item-action rounded-0 border-0 p-2'>
                                            <div class='d-inline-block text-end me-2' style='width: 25px'>
                                                <i class='fa-solid fa-clock-rotate-left'></i>
                                            </div>
                                            <span>Lịch sử thanh toán</span>
                                        </a>
                                        <a href='index.php?act=logout' class='list-group-item list-group-item-action rounded-0 border-0 p-2'>
                                            <div class='d-inline-block text-end me-2' style='width: 25px'>
                                                <i class='fa-solid fa-arrow-right-from-bracket'></i>
                                            </div>
                                            <span>Đăng xuất</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        ";
                    }
                
                ?>


            <!-- Dropdown box -->
            <!-- <div class="dropdown-menu p-0 rounded-0 mt-2 me-2">
                <div class="card">
                    <div class="card-body p-0">
                        <div class="d-flex bg-body-secondary p-3">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="../Public/images/avatar.png" width="40px" alt="" />
                            </div>
                            <div class="ps-3">
                                <h5 class="mb-1">Nam Nguyễn</h5>
                                <p class="mb-0" style="font-size: 14px">namnguyen@gmail.com</p>
                            </div>
                        </div>
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action rounded-0 border-0 p-2" aria-current="true">
                                <div class="d-inline-block text-end me-2" style="width: 25px">
                                    <i class="fa-solid fa-video"></i>
                                </div>
                                <span>Khóa học của tôi</span>
                            </a>
                            <a href="taikhoan.html" class="list-group-item list-group-item-action border-0 p-2">
                                <div class="d-inline-block text-end me-2" style="width: 25px">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </div>
                                <span>Chỉnh sửa hồ sơ</span>
                            </a>
                            <a href="baomattaikhoan.html" class="list-group-item list-group-item-action border-0 p-2">
                                <div class="d-inline-block text-end me-2" style="width: 25px">
                                    <i class="fa-solid fa-key"></i>
                                </div>
                                <span>Đổi mật khẩu</span>
                            </a>
                            <a href="historypayment.html" class="list-group-item list-group-item-action rounded-0 border-0 p-2">
                                <div class="d-inline-block text-end me-2" style="width: 25px">
                                    <i class="fa-solid fa-clock-rotate-left"></i>
                                </div>
                                <span>Lịch sử thanh toán</span>
                            </a>
                            <a href="home.html" class="list-group-item list-group-item-action rounded-0 border-0 p-2">
                                <div class="d-inline-block text-end me-2" style="width: 25px">
                                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                </div>
                                <span>Đăng xuất</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- Dropdown box -->
        </div>
    </header>
    <!-- Header -->

    <!-- Header mobile -->
    <header class="navbar navbar-expand-lg d-block d-md-none" id="header">
        <div class="container-fluid p-0 pt-1">
            <div class="logo d-flex align-content-center flex-wrap">
                <a href="./home.html">
                    <img src="./favicon.png" alt="error" width="38px" height="38px" class="ms-3" />
                </a>
                <h4 class="logoHeading">PolyUni</h4>
            </div>

            <button class="navbar-toggler me-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse bg-white px-3 pt-2 pb-2 mt-2 border vw-100 rounded-bottom-3 border-top-0" id="navbarSupportedContent">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm khóa học..." aria-label="Search" />
                    <button class="btn btn-outline-primary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
                <ul class="list-group list-group-flush mt-2">
                    <li class="list-group-item p-2 border-0">
                        <a href="#" class="text-decoration-none text-secondary">Giỏ hàng <span class="bg-danger py-1 px-2 fw-bold text-white rounded-2 ms-1">10</span></a>
                    </li>
                    <li class="list-group-item p-2 border-0">
                        <a href="dangnhap.html" class="text-decoration-none text-secondary">Đăng nhập</a>
                    </li>
                    <li class="list-group-item p-2">
                        <a href="dangky.html" class="text-decoration-none text-secondary">Đăng ký</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!-- Header mobile -->

    <script>
        // 8h
        // console.log("ok");
        function timKiem() {
            let category_id = document.getElementById('category').value;
            console.log(category_id);
            let search = document.getElementById('search').value;
            let showData = document.getElementById('showData');
            console.log(search);

            if(search != ""){
                let xmlHttp = new XMLHttpRequest();
                xmlHttp.onload = function () {
                    showData.innerHTML = xmlHttp.responseText;
                }

                xmlHttp.open('POST', './Models/search.php');
                xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlHttp.send(`search=${search}&category_id=${category_id}`);
            }else{
                showData.innerHTML = "";
            }
        }

        document.getElementById('search').addEventListener('focus',function() {
            document.getElementById('showData').style.display = "block";
        })
    </script>
