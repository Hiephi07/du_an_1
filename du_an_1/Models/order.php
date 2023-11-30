<?php

function getAllOrder() {
    $sql = "SELECT * FROM orders JOIN users ON orders.user_id=users.user_id ORDER BY order_date DESC";
    return pdo_query($sql);
}

function getOrder($orderId) {
    $sql = "SELECT * FROM orders WHERE order_id=$orderId";
    return pdo_query_one($sql);
}

function changeOrderStatus($orderStatus, $orderId) {
    $sql = "UPDATE orders SET order_status='$orderStatus' WHERE order_id=$orderId";
    return pdo_checkStatusSql($sql);
}

function checkUserCourseAvailable($userId, $courseId) {
    $sql = "SELECT * FROM user_courses WHERE user_id=$userId AND course_id=$courseId";
    return pdo_query_one($sql);
}

function activeCourse($userId, $courseId) {
    $sql = "INSERT INTO user_courses(user_id, course_id) VALUES('$userId', '$courseId')";
    return pdo_checkStatusSql($sql);
}

function removeCourseUser($userId, $courseId) {
    $sql = "DELETE FROM user_courses WHERE user_id=$userId AND course_id=$courseId";
    return pdo_checkStatusSql($sql);
}

?>