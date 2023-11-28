<?php
// 
function featured_course(){
    $sql = "SELECT * FROM courses WHERE 1 AND course_status = 1 ORDER BY course_members DESC LIMIT 0,4";
    $courses =  pdo_query($sql);
    return $courses;
}

// 
function all_course(){
    $sql = "SELECT * FROM courses WHERE 1 AND course_status = 1 ORDER BY created_at DESC LIMIT 0,12";
    $courses =  pdo_query($sql);
    return $courses;
}

//
function load_one_sanpham($course_id){
    $sql = "SELECT * FROM courses WHERE course_id = $course_id AND course_status = 1" ;
    $course = pdo_query_one($sql);
    return $course;
}

//
function load_sanpham_cungloai($category_id){
    $sql = "SELECT * FROM courses WHERE category_id = $category_id ORDER BY course_members DESC LIMIT 0,8";
    $dssanpham_cungloai =  pdo_query($sql);
    return $dssanpham_cungloai;
}

//Khóa học của tôi
function myCourse($user_id){
    $sql = "SELECT courses.course_name, courses.course_id, courses.course_image 
            FROM `orders` JOIN `courses` on orders.course_id = courses.course_id
            WHERE user_id = $user_id AND order_status = 1";
    return pdo_query($sql);
}

//id danh sách khóa học người dùng đã mua
function course_of_user($user_id){
    $sql = "SELECT courses.course_id
            FROM `orders` JOIN `courses` on orders.course_id = courses.course_id
            WHERE user_id = $user_id";
    $course_id = pdo_query($sql);
    $uniqueCourseIds = array();
    foreach ($course_id as $course) {
        $courseId = $course["course_id"];
        $uniqueCourseIds[] = $courseId;
    }
    return $uniqueCourseIds;
}

// add cart
function add_cart($user_id, $course_id){
    $sql = "INSERT INTO carts(user_id, course_id) 
            VALUES($user_id, $course_id)";
    pdo_execute($sql);
}

//load cart
function load_cart($user_id){
    $sql = "SELECT * FROM carts 
            JOIN `courses` on carts.course_id = courses.course_id
            WHERE user_id = $user_id";
    $courses =  pdo_query($sql);
    return $courses;
}
?>