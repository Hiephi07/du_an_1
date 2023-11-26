<?php
//trạng thái thanh toán
function order($order_id, $user_id, $course_id, $order_date, $order_status){
    $sql = "INSERT INTO orders(order_id, user_id, course_id, order_date, order_status) 
            VALUES($order_id, $user_id, $course_id, '$order_date', $order_status)";
    pdo_execute($sql);
}

//lịch sử thanh toán
function historyPayment($user_id){
    $sql = "SELECT courses.course_name, order_id, order_date, courses.course_price, order_status 
            FROM `orders` JOIN `courses` on orders.course_id = courses.course_id
            WHERE user_id = $user_id";
    return pdo_query($sql);
}
?>