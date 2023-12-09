<?php
    function insert_binhluan($review_content, $user_id, $course_id){
        $sql = "INSERT INTO comments(review_content, user_id, course_id) 
                VALUES('$review_content', '$user_id', '$course_id')";
        pdo_execute($sql);
    }

    function load_cmt($course_id){
        $sql = "SELECT u.user_name, u.user_avatar, cmt.review_content, cmt.review_date
                FROM `comments` AS cmt JOIN users AS u 
                ON u.user_id = cmt.user_id
                JOIN courses as c ON c.course_id = cmt.course_id
                WHERE c.course_id = $course_id AND comment_status = 1
                ORDER BY cmt.review_date DESC
                ";
        return pdo_query($sql);
    }

    function load_all_cmt(){
        $sql = "SELECT *
                FROM `comments` AS cmt JOIN users AS u 
                ON u.user_id = cmt.user_id
                JOIN courses as c ON c.course_id = cmt.course_id
                ORDER BY cmt.review_date DESC
                ";
        return pdo_query($sql);
    }

    function delete_cmt($review_id){
        $sql = "DELETE FROM comments WHERE review_id = $review_id";
        pdo_execute($sql);
    }

    function status_cmt($review_id, $status){
        $sql = "UPDATE comments SET comment_status = $status WHERE review_id = $review_id";
        pdo_execute($sql);
    }
?>