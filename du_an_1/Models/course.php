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

function all_course2(){
    $sql = "SELECT * FROM courses ORDER BY created_at DESC";
    $courses = pdo_query($sql);
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
            WHERE user_id = $user_id";
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


/** Function for COURSE */
function totalChapterInCourse($courseId) {
    $sql = "SELECT * FROM course_chapters WHERE course_id=$courseId";
    return pdo_get_rows($sql);
}

function totalLessonInCourse($courseId) {
    $sql = "SELECT * FROM course_chapters WHERE course_id=$courseId";
    $chapterList = pdo_query($sql);

    $courseInLesson = 0;
    foreach ($chapterList as $chapter) {
        $chapterId = $chapter['chapter_id'];
        $sqlCountLessonInChapter = "SELECT * FROM course_lessons WHERE chapter_id=$chapterId";

        $courseInLesson+=pdo_get_rows($sqlCountLessonInChapter);
    }
    return $courseInLesson;
}

function getAllCategories() {
    $sql = "SELECT * FROM category";
    return pdo_query($sql);
}

function insertCourse($courseName, $coursePrice, $courseImage, $categoryId ) {
    $sql = "INSERT INTO courses(course_name, course_price, course_image, category_id) VALUES('$courseName', $coursePrice, '$courseImage', '$categoryId')";
    return pdo_checkStatusSql($sql);
}

function editCourse($courseId ,$courseName, $coursePrice, $courseImage, $courseDesc, $categoryId) {
    if ($courseImage != "") {
        $sql = "UPDATE courses SET course_name='$courseName', course_price='$coursePrice', course_image='$courseImage', course_desc='$courseDesc', category_id=$categoryId  WHERE course_id='$courseId'";
    } else {
        $sql = "UPDATE courses SET course_name='$courseName', course_price='$coursePrice', course_desc='$courseDesc', category_id='$categoryId' WHERE course_id='$courseId'";
    }
    return pdo_checkStatusSql($sql);
}

function changeCourseStatus($courseId, $courseStatus) {
    $sql = "UPDATE courses SET course_status=$courseStatus WHERE course_id=$courseId";
    return pdo_checkStatusSql($sql);
}

function getCourseName($courseId) {
    $sql = "SELECT course_name FROM courses WHERE course_id=$courseId";
    return pdo_query_value($sql);
}

function getCourseNameAvailable($courseName) {
    $sql = "SELECT * FROM courses WHERE course_name='$courseName'";
    return pdo_query($sql);
}

function getCourse($courseId) {
    $sql = "SELECT * FROM courses WHERE course_id=$courseId";
    return pdo_query_one($sql);
}

function deleteCourse($courseId) {
    $sql = "DELETE FROM courses where course_id=$courseId";
    return pdo_checkStatusSql($sql);
}


/** Function for CHAPTER */
function getAllChapters() {
    $sql = "SELECT * FROM course_chapters ORDER BY course_id";
    $chapters = pdo_query($sql);
    return $chapters;
}

function totalLessonsInChapter($chapterId) {
    $sql = "SELECT * FROM course_lessons WHERE chapter_id=$chapterId";
    return pdo_get_rows($sql);
}

function getChapterOrderAvailable($chapterOrder, $courseId) {
    $sql = "SELECT * FROM course_chapters WHERE course_id=$courseId AND chapter_order=$chapterOrder";
    return pdo_query($sql);
}

function getChapterNameAvailable($chapterName, $courseId) {
    $sql = "SELECT * FROM course_chapters WHERE chapter_name='$chapterName' AND course_id='$courseId'";
    return pdo_query($sql);
}

function insertChapter($chapterOrder, $chapterName, $chapterDesc, $courseId) {
    $sql = "INSERT INTO course_chapters(chapter_order, chapter_name, chapter_desc, course_id) VALUES('$chapterOrder', '$chapterName', '$chapterDesc', '$courseId')";
    return pdo_checkStatusSql($sql);
}

function getChapter($chapterId) {
    $sql = "SELECT * FROM course_chapters WHERE chapter_id=$chapterId";
    return pdo_query_one($sql);
}

function editChapter($chapterId, $chapterOrder, $chapterName, $chapterDesc, $courseId) {
    $sql = "UPDATE course_chapters SET chapter_order='$chapterOrder', chapter_name='$chapterName', chapter_desc='$chapterDesc', course_id='$courseId' WHERE chapter_id='$chapterId'";
    return pdo_execute($sql);
}

function editChapter2($chapterId, $chapterOrder, $chapterName, $chapterDesc, $courseId) {
    $sql = "UPDATE course_chapters SET chapter_order='$chapterOrder', chapter_name='$chapterName', chapter_desc='$chapterDesc', course_id='$courseId' WHERE chapter_id='$chapterId'";
    return pdo_showSQL($sql);
}

function getChapterOrderAvailableToEdit($courseId, $chapterOrder) {
    $sql = "SELECT * FROM course_chapters WHERE course_id=$courseId AND chapter_order=$chapterOrder";
    return pdo_query($sql);
}

function deleteChapter($chapterId) {
    $sql = "DELETE FROM course_chapters where chapter_id=$chapterId";
    return pdo_checkStatusSql($sql);
}

function changeChapterStatus($chaperId, $chapterStatus) {
    $sql = "UPDATE course_chapters SET chapter_status=$chapterStatus WHERE chapter_id=$chaperId";
    return pdo_checkStatusSql($sql);
}

/** Function for Lesson */
function getchapterListByOrder($courseId) {
    $sql = "SELECT * FROM course_chapters WHERE course_id=$courseId ORDER BY chapter_order ASC";
    return pdo_query($sql);
}

function getLessonListByOrder($chapterId) {
    $sql = "SELECT * FROM course_lessons WHERE chapter_id=$chapterId ORDER BY lesson_order ASC";
    return pdo_query($sql);
}

function getLesson($lessonId) {
    $sql = "SELECT * FROM course_lessons WHERE lesson_id=$lessonId";
    return pdo_query_one($sql);
}

function deleteLesson($lessonId) {
    $sql = "DELETE FROM course_lessons where lesson_id=$lessonId";
    return pdo_checkStatusSql($sql);
}

function changeLessonStatus($lessonId, $lessonStatus) {
    $sql = "UPDATE course_lessons SET lesson_status=$lessonStatus WHERE lesson_id=$lessonId";
    return pdo_checkStatusSql($sql);
}

function insertLesson($lessonOrder, $lessonName, $lessonPath, $chapterId) {
    $sql = "INSERT INTO course_lessons(lesson_order, lesson_name, lesson_path, chapter_id) VALUES('$lessonOrder', '$lessonName', '$lessonPath', '$chapterId')";
    return pdo_checkStatusSql($sql);
}

function getLessonOrderAvailable($lessonOrder, $chapterId) {
    $sql = "SELECT * FROM course_lessons WHERE chapter_id=$chapterId AND lesson_order=$lessonOrder";
    return pdo_query($sql);
}

function getLessonNameAvailable($lessonName, $chapterId) {
    $sql = "SELECT * FROM course_lessons WHERE chapter_id=$chapterId AND lesson_name='$lessonName'";
    return pdo_query($sql);
}

function editLesson($lessonOrder, $lessonName, $lessonPath, $lesson_id) {
    if ($lessonPath != "") {
        $sql = "UPDATE course_lessons SET lesson_order='$lessonOrder', lesson_name='$lessonName', lesson_path='$lessonPath' WHERE lesson_id='$lesson_id'";
    } else {
        $sql = "UPDATE course_lessons SET lesson_order='$lessonOrder', lesson_name='$lessonName' WHERE lesson_id='$lesson_id'";
    }
    return pdo_checkStatusSql($sql);
}


?>