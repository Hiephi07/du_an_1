<?php
//get all User
function allUser(){
    $sql = "SELECT COUNT(*) AS totalUser FROM `users` WHERE roles = 3";
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

//
function loadDoanhThu(){
    $dateStart = date("Y");
    $dateEnd = date("Y-m-d H:i:s");
    $sql = "SELECT o.order_id, u.user_name, c.course_name, o.order_date, c.course_price
            FROM `orders` as o 
            JOIN users as u ON o.user_id = u.user_id
            JOIN courses as c on c.course_id = o.course_id
            WHERE order_status = 1
            AND order_date BETWEEN '$dateStart' AND '$dateEnd'
            ORDER BY order_date DESC;
    ";
    return pdo_query($sql);
}
?>