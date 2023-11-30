<?php
//get all User
function allUser(){
    $sql = "SELECT COUNT(*) AS totalUser FROM `users` WHERE roles = 1";
    return pdo_query_one($sql);
}

//số khóa học đã bán
function soldCourse(){
    $sql = "SELECT COUNT(*) AS sold FROM `orders` WHERE order_status = 1";
    return pdo_query_one($sql);
}

//doanh thu
function revenue(){
    $sql = "SELECT SUM(courses.course_price) AS totalRevenue FROM `orders` JOIN courses on orders.course_id = courses.course_id 
            WHERE order_status = 1;";
    return pdo_query_one($sql);
}

// //get all Course
function allCourse(){
    $sql = "SELECT COUNT(*) AS courses FROM `courses` ";
    return pdo_query_one($sql);
}

//khoá học chờ xác nhận
function orderAwaiting(){
    $sql = "SELECT COUNT(*) AS awating FROM `orders` WHERE order_status = 2";
    return pdo_query_one($sql);
}

//số danh mục khóa học
function countCategoty(){
    $sql = "SELECT COUNT(*) AS countCategoty FROM `category` ";
    return pdo_query_one($sql);
}
?>