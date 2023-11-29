<?php 
    ob_start();
?>
<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');
include "../Models/connect.php";
include "../Models/course.php";
include "../Models/account.php";
include "../Models/payment.php";

include "Views/layouts/header.php";
include "Views/layouts/navbar.php";
include "Views/layouts/sidebar.php";


if (isset($_GET['act']) && $_GET['act'] != '') {
    $act = $_GET['act'];

    switch ($act) {
        case 'listCourses':
            $listCourses = all_course2();
            include "Views/list-course.php";
            break;
        case 'add-course':
            if (isset($_POST['insertCourseBtn'])) {
                if ($_POST['course_name'] == "" || $_POST['course_price'] == "" || $_POST['course_desc'] == "") {
                    $_SESSION['notice__insertCourse']['state'] = "alert-danger";
                    $_SESSION['notice__insertCourse']['msg'] = "Bạn phải điền đầy đủ thông tin khóa học";
                } else {
                    if ($_POST['category_id'] != 0) {
                        $courseName = $_POST['course_name'];
                        $coursePrice = $_POST['course_price'];
                        $courseDesc = $_POST['course_desc'];
                        $category_id = $_POST['category_id'];
                        if ($_FILES['course_image']['name'] != "") {
                            $courseImage= $_FILES['course_image']['name'];
                            $tmp_courseImage=$_FILES['course_image']['tmp_name'];
                            $size_ccourseImage=$_FILES['course_image']['size'];
                            $type_courseImage=$_FILES['course_image']['type'];
                            
                            $sqlCheckCourseAvailable = "SELECT * FROM courses WHERE course_name='$courseName'";
                            if (pdo_query($sqlCheckCourseAvailable)) {
                                $_SESSION['notice__insertCourse']['state'] = "alert-danger";
                                $_SESSION['notice__insertCourse']['msg'] = "Khóa học đã tồn tại";
                            } else {
                                if (insertCourse($courseName, $coursePrice, $courseImage, $category_id) && move_uploaded_file($tmp_courseImage, "../Public/images/imgCourse/".$courseImage)) {
                                    $_SESSION['notice__insertCourse']['state'] = "alert-success";
                                    $_SESSION['notice__insertCourse']['msg'] = "Thêm khóa học thành công";
                                    unset($_POST); 
                                } else {
                                    $_SESSION['notice__insertCourse']['state'] = "alert-danger";
                                    $_SESSION['notice__insertCourse']['msg'] = "Có lỗi xảy ra, xin thử lại sau";
                                }
                            }
                        } else {
                            $_SESSION['notice__insertCourse']['state'] = "alert-danger";
                            $_SESSION['notice__insertCourse']['msg'] = "Bạn phải lựa chọn hình ảnh đại diện cho khóa học";
                        }
                    } else {
                        $_SESSION['notice__insertCourse']['state'] = "alert-danger";
                        $_SESSION['notice__insertCourse']['msg'] = "Bạn phải lựa chọn danh mục khóa học";
                    }
                }
            }
            $listCategory = getAllCategories();
            include "Views/add-course.php";
            break;
        case 'hideCourse':
            if (isset($_GET['courseId'])) {
                $courseId = $_GET['courseId'];
                $courseName = getCourseName($courseId);
                if (changeCourseStatus($courseId, 0)) {
                    $_SESSION['notice__courseAction']['state'] = "alert-success";
                    $_SESSION['notice__courseAction']['msg'] = "Khóa học '$courseName' đã được ẩn";
                } else {
                    $_SESSION['notice__courseAction']['state'] = "alert-danger";
                    $_SESSION['notice__courseAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                } 
            }
            header("Location: index.php?act=listCourses");
            break;
        case 'showCourse':
            if (isset($_GET['courseId'])) {
                $courseId = $_GET['courseId'];
                $courseName = getCourseName($courseId);
                if (changeCourseStatus($courseId, 1)) {
                    $_SESSION['notice__courseAction']['state'] = "alert-success";
                    $_SESSION['notice__courseAction']['msg'] = "Khóa học '$courseName' đã được hiển thị";
                } else {
                    $_SESSION['notice__courseAction']['state'] = "alert-danger";
                    $_SESSION['notice__courseAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                } 
            }
            header("Location: index.php?act=listCourses");
            break;
        case 'deleteCourse':
            if (isset($_GET['courseId'])) {
                $courseId = $_GET['courseId'];
                $courseName = getCourseName($courseId);
                if (deleteCourse($courseId)) {
                    $_SESSION['notice__courseAction']['state'] = "alert-success";
                    $_SESSION['notice__courseAction']['msg'] = "Khóa học '$courseName' đã được xóa";
                } else {
                    $_SESSION['notice__courseAction']['state'] = "alert-danger";
                    $_SESSION['notice__courseAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                }
            }
            header("Location: index.php?act=listCourses");
            break;
        case 'deleteManyCourse':
            if (isset($_POST['deleteSelectedCourseBtn']) && isset($_POST['checkbox'])) {
                    $deleteList = [];
                    $deleteList = $_POST['checkbox'];
                    foreach ($deleteList as $deleteItem) {
                        deleteCourse($deleteItem);
                    }
                }
                header("Location: index.php?act=listCourses");
            break;
        case 'editCourse':
            $courseId;
            if (isset($_GET['courseId'])) {
                $courseId = $_GET['courseId'];
            }
            $listCategory = getAllCategories();
            $courseToEdit = getCourse($courseId);

            $courseImage;
            if (isset($_POST['editCourseBtn'])) {
                if ($_POST['course_name'] == "" || $_POST['course_price'] == "" || $_POST['course_desc'] == "") {
                    $_SESSION['notice__editCourse']['state'] = "alert-danger";
                    $_SESSION['notice__editCourse']['msg'] = "Bạn phải điền đầy đủ thông tin khóa học";
                } else {
                    if (getCourseNameAvailable($_POST['course_name']) && $courseToEdit['course_name'] != $_POST['course_name']) {
                        $_SESSION['notice__editCourse']['state'] = "alert-danger";
                        $_SESSION['notice__editCourse']['msg'] = "Khóa học đã tồn tại";
                    } else {
                        if ($_POST['category_id'] != 0) {
                            $courseId = $_POST['course_id'];
                            $courseName = $_POST['course_name'];
                            $coursePrice = $_POST['course_price'];
                            $courseDesc = $_POST['course_desc'];
                            $category_id = $_POST['category_id'];
                            
                            $courseImage= $_FILES['course_image']['name'];
                            $tmp_courseImage=$_FILES['course_image']['tmp_name'];
                            $size_ccourseImage=$_FILES['course_image']['size'];
                            $type_courseImage=$_FILES['course_image']['type'];
                            
                            if ($courseImage != "") {
                                if (editCourse($courseId ,$courseName, $coursePrice, $courseImage, $courseDesc, $category_id) && move_uploaded_file($tmp_courseImage, "../Public/images/imgCourse/$courseImage")) {
                                    $_SESSION['notice__editCourse']['state'] = "alert-success";
                                    $_SESSION['notice__editCourse']['msg'] = "Cập nhật khóa học thành công";
                                    unset($_POST); 
                                } else {
                                    $_SESSION['notice__editCourse']['state'] = "alert-danger";
                                    $_SESSION['notice__editCourse']['msg'] = "Có lỗi xảy ra, xin thử lại sau";
                                }
                            } else {
                                if (editCourse($courseId ,$courseName, $coursePrice, $courseImage, $courseDesc, $category_id)) {
                                    $_SESSION['notice__editCourse']['state'] = "alert-success";
                                    $_SESSION['notice__editCourse']['msg'] = "Cập nhật khóa học thành công";
                                    unset($_POST); 
                                } else {
                                    $_SESSION['notice__editCourse']['state'] = "alert-danger";
                                    $_SESSION['notice__editCourse']['msg'] = "Có lỗi xảy ra, xin thử lại sau";
                                }
                            }
                        } else {
                            $_SESSION['notice__editCourse']['state'] = "balert-danger";
                            $_SESSION['notice__editCourse']['msg'] = "Bạn phải lựa chọn danh mục khóa học";
                        }
                    }
                }
            }

            $listCategory = getAllCategories();
            $courseToEdit = getCourse($courseId);
            include "Views/edit-course.php";
            break;
        case 'listChapters':
            $listChapters = getAllChapters();
            include "Views/list-chapter.php";
            break;
        case 'addChapter':
            if (isset($_POST['insertChapterBtn'])) {
                if ($_POST['chapter_order'] == "" || $_POST['chapter_name'] == "" || $_POST['chapter_desc'] == "" || $_POST['course_id'] == 0) {
                    $_SESSION['notice__insertChapter']['state'] = "alert-danger";
                    $_SESSION['notice__insertChapter']['msg'] = "Bạn phải điền đầy đủ thông tin chương học";
                } else {
                    if (getChapterOrderAvailable($_POST['chapter_order'], $_POST['course_id'])) {
                        $_SESSION['notice__insertChapter']['state'] = "alert-danger";
                        $_SESSION['notice__insertChapter']['msg'] = "Thứ tự chương học đã tồn tại";
                    } else {
                        if (getChapterNameAvailable($_POST['chapter_name'], $_POST['course_id'])) {
                            $_SESSION['notice__insertChapter']['state'] = "alert-danger";
                            $_SESSION['notice__insertChapter']['msg'] = "Chương học đã tồn tại trong khóa học";
                        } else {
                            $chapterOrder = $_POST['chapter_order'];
                            $chapterName = $_POST['chapter_name'];
                            $chaperDesc = $_POST['chapter_desc'];
                            $courseId = $_POST['course_id'];
                            if (insertChapter($chapterOrder, $chapterName, $chaperDesc, $courseId)) {
                                $_SESSION['notice__insertChapter']['state'] = "alert-success";
                                $_SESSION['notice__insertChapter']['msg'] = "Thêm chương học thành công";
                                unset($_POST);
                            } else {
                                $_SESSION['notice__insertChapter']['state'] = "alert-danger";
                                $_SESSION['notice__insertChapter']['msg'] = "Đã có lỗi xảy ra, vui lòng thử lại sau";
                            }
                        }
                    }
                }
            }
            $listChapters = getAllChapters();
            $listCourses = all_course2();
            include "Views/add-chapter.php";
            break;
        case 'editChapter';
            $chapterId;
            if (isset($_GET['chapterId'])) {
                $chapterId = $_GET['chapterId'];
            }
            $listCourses = all_course2();
            $chapterToEdit = getChapter($chapterId);
            if (isset($_POST['editChapterBtn'])) {
                if ($_POST['chapter_order'] == "" || $_POST['chapter_name'] == "" || $_POST['chapter_desc'] == "" || $_POST['course_id'] == 0) {
                    $_SESSION['notice__editChapter']['state'] = "alert-danger";
                    $_SESSION['notice__editChapter']['msg'] = "Bạn phải điền đầy đủ thông tin chương học";
                } else {
                    if (getChapterOrderAvailable($_POST['chapter_order'], $_POST['course_id']) && $_POST['chapter_order'] != $chapterToEdit['chapter_order']) {
                        $_SESSION['notice__editChapter']['state'] = "alert-danger";
                        $_SESSION['notice__editChapter']['msg'] = "Thứ tự chương học đã tồn tại";
                    } else {
                        if (getChapterNameAvailable($_POST['chapter_name'], $_POST['course_id']) && $_POST['chapter_name'] != $chapterToEdit['chapter_name']) {
                            $_SESSION['notice__editChapter']['state'] = "alert-danger";
                            $_SESSION['notice__editChapter']['msg'] = "Chương học đã tồn tại trong khóa học";
                        } else {
                            $chapterId = $_GET['chapterId'];
                            $chapterOrder = $_POST['chapter_order'];
                            $chapterName = $_POST['chapter_name'];
                            $chaperDesc = $_POST['chapter_desc'];
                            $courseId = $_POST['course_id'];
                            
                            editChapter($chapterId, $chapterOrder, $chapterName, $chaperDesc, $courseId);
                            unset($_POST);
                            $_SESSION['notice__editChapter']['state'] = "alert-success";
                            $_SESSION['notice__editChapter']['msg'] = "Cập nhật chương học thành công";
                        }
                    }
                }
            }
            $chapterToEdit = getChapter($chapterId);
            include "Views/edit-chapter.php";
            break;
        case 'deleteChapter':
            if (isset($_GET['chapterId'])) {
                $chapterId = $_GET['chapterId'];
                $chapterName = getChapter($chapterId)['chapter_name'];
                if (deleteChapter($chapterId)) {
                    $_SESSION['notice__chapterAction']['state'] = "alert-success";
                    $_SESSION['notice__chapterAction']['msg'] = "Chương học '$chapterName' đã được xóa";
                } else {
                    $_SESSION['notice__chapterAction']['state'] = "alert-danger";
                    $_SESSION['notice__chapterAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                }
            }
            header("Location: index.php?act=listChapters");
            break;
        case 'deleteManyChapter':
            if (isset($_POST['deleteSelectedChapterBtn']) && isset($_POST['checkbox'])) {
                    $deleteList = [];
                    $deleteList = $_POST['checkbox'];
                    foreach ($deleteList as $deleteItem) {
                        deleteChapter($deleteItem);
                    }
            }
            header("Location: index.php?act=listChapters");
            break;
        case 'hideChapter':
            if (isset($_GET['chapterId'])) {
                $chapterId = $_GET['chapterId'];
                $chapterName = getChapter($chapterId)['chapter_name'];
                if (changeChapterStatus($chapterId, 0)) {
                    $_SESSION['notice__chapterAction']['state'] = "alert-success";
                    $_SESSION['notice__chapterAction']['msg'] = "Chương học '$chapterName' đã được ẩn";
                } else {
                    $_SESSION['notice__chapterAction']['state'] = "alert-danger";
                    $_SESSION['notice__chapterAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                } 
            }
            header("Location: index.php?act=listChapters");
            break;
        case 'showChapter':
            if (isset($_GET['chapterId'])) {
                $chapterId = $_GET['chapterId'];
                $chapterName = getChapter($chapterId)['chapter_name'];
                if (changeChapterStatus($chapterId, 1)) {
                    $_SESSION['notice__chapterAction']['state'] = "alert-success";
                    $_SESSION['notice__chapterAction']['msg'] = "Chương học '$chapterName' đã được hiển thị";
                } else {
                    $_SESSION['notice__chapterAction']['state'] = "alert-danger";
                    $_SESSION['notice__chapterAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                } 
            }
            header("Location: index.php?act=listChapters");
            break;
        case 'listLessons':
            $listCourses = all_course2();
            include "Views/list-lesson.php";
            break;
        case 'deleteLesson':
            if (isset($_GET['lessonId'])) {
                $lessonId = $_GET['lessonId'];
                $lessonName = getLesson($lessonId)['lesson_name'];
                if (deleteLesson($lessonId)) {
                    $_SESSION['notice__lessonAction']['state'] = "alert-success";
                    $_SESSION['notice__lessonAction']['msg'] = "Bài học '$lessonName' đã được xóa";
                } else {
                    $_SESSION['notice__lessonAction']['state'] = "alert-danger";
                    $_SESSION['notice__lessonAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                }
            }
            header("Location: index.php?act=listLessons");
            break;
        case 'deleteManyLesson':
            if (isset($_POST['deleteSelectedLessonBtn']) && isset($_POST['checkbox'])) {
                    $deleteList = [];
                    $deleteList = $_POST['checkbox'];
                    foreach ($deleteList as $deleteItem) {
                        deleteLesson($deleteItem);
                    }
            }
            header("Location: index.php?act=listChapters");
            break;
        case 'hideLesson':
            if (isset($_GET['lessonId'])) {
                $lessonId = $_GET['lessonId'];
                $lessonName = getLesson($lessonId)['lesson_name'];
                if (changeLessonStatus($lessonId, 0)) {
                    $_SESSION['notice__lessonAction']['state'] = "alert-success";
                    $_SESSION['notice__lessonAction']['msg'] = "Bài học '$lessonName' đã được ẩn";
                } else {
                    $_SESSION['notice__lessonAction']['state'] = "alert-danger";
                    $_SESSION['notice__lessonAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                } 
            }
            header("Location: index.php?act=listLessons");
            break;
        case 'showLesson':
            if (isset($_GET['lessonId'])) {
                $lessonId = $_GET['lessonId'];
                $lessonName = getLesson($lessonId)['lesson_name'];
                if (changeLessonStatus($lessonId, 1)) {
                    $_SESSION['notice__lessonAction']['state'] = "alert-success";
                    $_SESSION['notice__lessonAction']['msg'] = "Bài học '$lessonName' đã hiển thị";
                } else {
                    $_SESSION['notice__lessonAction']['state'] = "alert-danger";
                    $_SESSION['notice__lessonAction']['msg'] = "Đã xảy ra lỗi, vui lòng thử lại sau";
                } 
            }
            header("Location: index.php?act=listLessons");
            break;
        case 'addLessonToCourse':
            $listCourses = all_course2();
            if (isset($_POST['course_id'])) {
                $courseId = $_POST['course_id'];
                header("Location: index.php?act=addLesson&course_id=$courseId");
            }
            include "Views/add-lesson-to-course.php";
            break;
        case 'addLesson':
            if (isset($_GET['course_id'])) {
                $courseId = $_GET['course_id'];
            } else {
                $courseId = $_POST['course_id'];
            }
            
            $listChapter = getchapterListByOrder($courseId);
            if (isset($_POST['insertLessonBtn'])) {
                if ($_POST['lesson_order'] == "" || $_POST['lesson_name'] == "") {
                    $_SESSION['notice__insertLesson']['state'] = "alert-danger";
                    $_SESSION['notice__insertLesson']['msg'] = "Bạn phải điền đầy đủ thông tin bài học";
                } else {
                    if (getLessonOrderAvailable($_POST['lesson_order'], $_POST['chapter_id'])) {
                        $_SESSION['notice__insertLesson']['state'] = "alert-danger";
                        $_SESSION['notice__insertLesson']['msg'] = "Thứ tự bài học đã tồn tại";
                    } else {
                        if ($_POST['chapter_id'] != 0) {
                            $lessonOrder = $_POST['lesson_order'];
                            $lessonName = $_POST['lesson_name'];
                            $chapterId = $_POST['chapter_id'];

                            if ($_FILES['lesson_video']['name'] != "") {
                                $lessonPath= $_FILES['lesson_video']['name'];
                                $tmp_lessonVideo=$_FILES['lesson_video']['tmp_name'];

                                if (getLessonNameAvailable($lessonName, $chapterId)) {
                                    $_SESSION['notice__insertLesson']['state'] = "alert-danger";
                                    $_SESSION['notice__insertLesson']['msg'] = "Bài học đã tồn tại";
                                } else {
                                    if (insertLesson($lessonOrder, $lessonName, $lessonPath, $chapterId) && move_uploaded_file($tmp_lessonVideo, "../Public/video/".$lessonPath)) {
                                        $_SESSION['notice__insertLesson']['state'] = "alert-success";
                                        $_SESSION['notice__insertLesson']['msg'] = "Thêm bài học thành công";
                                        unset($_POST); 
                                    } else {
                                        $_SESSION['notice__insertLesson']['state'] = "alert-danger";
                                        $_SESSION['notice__insertLesson']['msg'] = "Đã có lỗi xảy ra, vui lòng thử lại sau";
                                    }
                                }
                            } else {
                                $_SESSION['notice__insertLesson']['state'] = "alert-danger";
                                $_SESSION['notice__insertLesson']['msg'] = "Bạn phải upload video bài học";
                            }
                        } else {
                            $_SESSION['notice__insertLesson']['state'] = "alert-danger";
                            $_SESSION['notice__insertLesson']['msg'] = "Bạn phải lựa chọn chương học";
                        }
                    }
                }
            }
            
            include "Views/add-lesson.php";
            break;
        case 'editLesson':
            $lesson;
            $chapterId;
            if (isset($_GET['lessonId'])) {
                $lesson = getLesson($_GET['lessonId']);
                $chapterId = $lesson['chapter_id'];
            }

            if (isset($_POST['editLessonBtn'])) {
                if ($_POST['lesson_order'] == "" || $_POST['lesson_name'] == "") {
                    $_SESSION['notice__editLesson']['state'] = "alert-danger";
                    $_SESSION['notice__editLesson']['msg'] = "Bạn phải điền đầy đủ thông tin bài học";
                } else {
                    if (getLessonOrderAvailable($_POST['lesson_order'], $chapterId) && $_POST['lesson_order'] != $lesson['lesson_order']) {
                        $_SESSION['notice__editLesson']['state'] = "alert-danger";
                        $_SESSION['notice__editLesson']['msg'] = "Thứ tự bài học đã tồn tại";
                    } else {
                        if (getLessonNameAvailable($_POST['lesson_name'], $chapterId) && $_POST['lesson_name'] != $lesson['lesson_name']) {
                            $_SESSION['notice__editLesson']['state'] = "alert-danger";
                            $_SESSION['notice__editLesson']['msg'] = "Bài học đã tồn tại";
                        } else {
                            $lessonId = $lesson['lesson_id'];
                            $lessonOrder = $_POST['lesson_order'];
                            $lessonName = $_POST['lesson_name'];
                            $lessonPath= $_FILES['lesson_video']['name'];
                            $tmp_lessonVideo=$_FILES['lesson_video']['tmp_name'];

                            if ($lessonPath != "") {
                                if (editLesson($lessonOrder, $lessonName, $lessonPath, $lessonId) && move_uploaded_file($tmp_lessonVideo, "../Public/video/".$lessonPath)) {
                                    $_SESSION['notice__editLesson']['state'] = "alert-success";
                                    $_SESSION['notice__editLesson']['msg'] = "Cập nhật bài học thành công";
                                    unset($_POST); 
                                } else {
                                    $_SESSION['notice__editLesson']['state'] = "alert-danger";
                                    $_SESSION['notice__editLesson']['msg'] = "Đã có lỗi xảy ra, vui lòng thử lại sau";
                                }
                            } else {
                                if (editLesson($lessonOrder, $lessonName, $lessonPath, $lessonId)) {
                                    $_SESSION['notice__editLesson']['state'] = "alert-success";
                                    $_SESSION['notice__editLesson']['msg'] = "Cập nhật bài học thành công";
                                    unset($_POST); 
                                } else {
                                    $_SESSION['notice__editLesson']['state'] = "alert-danger";
                                    $_SESSION['notice__editLesson']['msg'] = "Đã có lỗi xảy ra, vui lòng thử lại sau";
                                }
                            }
                        }
                    }
                }
            }
            $lesson = getLesson($_GET['lessonId']);
            $chapterId = $lesson['chapter_id'];
            include 'Views/edit-lesson.php';
            break;
        default:
            include "Views/dashboard.php";
            break;
        
    }
} else {
    include "Views/dashboard.php";
}

include "Views/layouts/footer.php";

?>

<?php 
    ob_end_flush(); 
?>