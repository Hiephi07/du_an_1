<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active">
                <a href="#"><b>Danh sách bài học</b></a>
            </li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <form action="index.php?act=deleteManyLesson" method="POST">
            <div class="tile">
                <?php
                    if (isset($_SESSION['notice__lessonAction'])) {
                        $state = $_SESSION['notice__lessonAction']['state'];
                        $msg = $_SESSION['notice__lessonAction']['msg'];
                        echo 
                            '
                                <div class="'.$state.' rounded-2  text-center p-2 mb-3 w-100 " role="alert">
                                    '.$msg.'
                                </div>
                            ';
                        unset($_SESSION['notice__lessonAction']);
                    }
                ?>
                <div class="d-flex justify-content-between align-items-center mb-2 ">
                    <div>
                        <input type="submit" class="btn btn-primary btn-sm trash" name="deleteSelectedLessonBtn" id="deleteAllSelectedBtn" value="Xóa các mục đã chọn">
                    </div>
                    <a href="index.php?act=addLessonToCourse" class="btn btn-primary"><i class="fa-solid fa-plus me-2" ></i>Thêm bài học</a>
                </div>
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                            <tr>
                                <th width="10">
                                    <input type="checkbox" onchange="checkAll(this)" id="all" />
                                </th>
                                <th class="text-center">Tên bài học</th>
                                <th class="text-center">Thứ tự bài học</th>
                                <th class="text-center">Thuộc chương học</th>
                                <th class="text-center">Thuộc khóa học</th>
                                <th class="text-center">Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                foreach ($listCourses as $course) {
                                    $listChapterByOrder = getchapterListByOrder($course['course_id']);
                                    foreach ($listChapterByOrder as $chapter) {
                                        $listLessonByOrder = getLessonListByOrder($chapter['chapter_id']);
                                        foreach($listLessonByOrder as $lesson) {
                                            ?>
                                                <tr>
                                                    <td class="text-center" width="10">
                                                        <input type="checkbox" name="checkbox[]" value="<?=$lesson['lesson_id']?>" />
                                                    </td>
                                                    <td class="text-center">
                                                        <?=$lesson['lesson_name']?>
                                                    </td>
                                                    <td class="text-center">
                                                        <?=$lesson['lesson_order']?>
                                                    </td>
                                                    <td class="text-center">
                                                        <?=$chapter['chapter_name']?>
                                                    </td>
                                                    <td class="text-center">
                                                        <?=$course['course_name']?>
                                                    </td>
                                                    <td class="text-center">
                                                        <?php
                                                            if ($_SESSION['admin']['role'] == 1) {
                                                                ?>
                                                                    <a href="index.php?act=deleteLesson&lessonId=<?=$lesson['lesson_id']?>" class="btn btn-primary btn-sm trash deleteItem" type="button" title="Xóa">
                                                                        <i class="fas fa-trash-alt"></i>
                                                                    </a>
                                                                <?php
                                                            }
                                                        ?>
                                                        
                                                        <?php 
                                                            if ($lesson['lesson_status'] == 1) {
                                                                ?>
                                                                    <a href="index.php?act=hideLesson&lessonId=<?=$lesson['lesson_id']?>" class="btn btn-warning btn-sm haha" type="button" title="Ẩn" id="show-emp" data-toggle="" data-target=""><i class="fas fa-eye"></i></a>
                                                                <?php
                                                            } else {
                                                                ?>
                                                                    <a href="index.php?act=showLesson&lessonId=<?=$lesson['lesson_id']?>" class="btn btn-warning btn-sm haha" type="button" title="Ẩn" id="show-emp" data-toggle="" data-target=""><i class="fas fa-eye-slash"></i></a>
                                                                <?php
                                                            }
                                                        ?>
                                                        
                                                        
                                                        <a href="index.php?act=editLesson&lessonId=<?=$lesson['lesson_id']?>" class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#ModalUP">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                                
                                                    </td>
                                                </tr>
                                            <?php
                                        }
                                    }
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            </form>
            
        </div>
    </div>
</main>

<!--
  MODAL
-->
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group col-md-12">
                        <span class="thong-tin-thanh-toan">
                            <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                        </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID khoá học</label>
                        <input class="form-control" type="number" value="71309005" disabled />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên khóa học</label>
                        <input class="form-control" type="text" required value="Bàn ăn gỗ Theresa" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Ảnh</label>
                        <input class="form-control" type="file" required value="20" />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleSelect1" class="control-label">Danh mục</label>
                        <select class="form-control" id="exampleSelect1">
                            <option>Backend</option>
                            <option>Frontend</option>
                            <option>Devops</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Giá Sales</label>
                        <input class="form-control" type="text" value="4.000.000" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Giá bán</label>
                        <input class="form-control" type="text" value="2.600.000" />
                    </div>
                </div>
                <BR />
                <BR />
                <BR />
                <button class="btn btn-save" type="button">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR />
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<!--
MODAL
-->

<script type="text/javascript">
    var checkboxes = document.querySelectorAll("input[type='checkbox']");

    function checkAll(myCheckbox) {
        if (myCheckbox.checked == true) {
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = true;
            });
        } else {
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = false;
            });
        }
    }

    var deleteItemBtn = document.querySelectorAll('.deleteItem');
    deleteItemBtn.forEach((element) => {
        element.addEventListener('click', (event) => {
            if (!confirm('Bạn có muốn xóa bài học này không?')) {
                event.preventDefault();
            }
        })
    })

    var deleteAllSelectedBtn = document.querySelector('#deleteAllSelectedBtn');
    deleteAllSelectedBtn.addEventListener('click', (event) => {
        if (!confirm('Bạn có muốn xóa các mục đã chọn không?')) {
            event.preventDefault();
        }
    })
</script>
