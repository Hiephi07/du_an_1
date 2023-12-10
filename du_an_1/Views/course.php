<!-- Course detail -->
<div class="container-fluid w-1400 my-4" id="course-detail">
            <div class="row">
                <div class="col-lg-6">
                    <div>
                        <img class="w-100" src="<?= "./Public/images/imgCourse/$course_image"?>" alt="" />
                    </div>

                    <div class="row my-3">
                        <?php
                        if(isset($learnNow)){
                            echo"
                            <div class='col-sm pe-sm-2 mb-2'>
                            <a class='btn btn-primary btn-lg w-100 rounded-0 border-black border-2 bg__main-color fw-bold' 
                                href='index.php?act=watchLesson&course_id=$learnNow'>Học ngay</a>
                                </div>
                            ";
                        }else{
                            echo "
                            <div class='col-sm pe-sm-2 mb-2'>
                                <a class='btn btn-primary btn-lg w-100 rounded-0 border-black border-2 bg__main-color fw-bold' 
                                    href='index.php?act=payment&course_id=$course_id'>Mua ngay</a>
                            </div>
                            <div class='col-sm ps-sm-2'>
                                <a class='btn btn-primary btn-lg w-100 rounded-0 border-black border-2 bg-light text-dark fw-bold' 
                                    href='index.php?act=add_cart&course_id=$course_id'>Thêm vào giỏ hàng</a>
                            </div>
                            ";
                        }
                        ?>
                        

                    </div>
                </div>
                <div class="col-lg-6">
                    <h1 class="fw-bolder pt-lg-3"><?= "$course_name"?></h1>
                    <p class="text-danger fw-bold fs-3 mt-3 h3"><?= number_format($course_price, 0, ',', '.')?> đ</p>
                    <p class='card-text h5 mt-3 text-decoration-line-through'><?= number_format($course_price_sale, 0, ',', '.') ?> đ</p>
                    
                    <div class="mt-4">
                        <h5 class="fw-bold mb-3">Khóa học này bao gồm:</h5>
                        <div class="row">
                            <div class="col-sm mb-3">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-check pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-check pe-2 align-content-between"></i>
                                    <span class="">15 video bài giảng chất lượng</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-check pe-2 align-content-between"></i>
                                    <span class="">Miễn phí truy cập trọn đời</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-check pe-2 align-content-between"></i>
                                    <span class="">Dành cho mọi đối tượng</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-check pe-2 align-content-between"></i>
                                    <span class="">Truy cập trên mọi thiết bị</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Course detail -->
        
        <!-- Course desc -->
        <div class="container-fluid w-1400 my-4" id="course-desc">
            <h3 class="mb-3">Mô tả</h3>
            <p class="fs-5 text-justify">
                <?php echo "$course_desc"?>
            </p>
        </div>
        <!-- Course desc -->

        <!-- Review courses -->
        <div class="container-fluid w-1400 my-5">
            <h3 class="mb-3">Đánh giá khóa học</h3>
            <div class="row mb-xl-4">
                <?php
                foreach($load_cmt as $cmt){
                    extract($cmt);
                    echo "
                    <div class='col-xl-6 col-md-12 mb-4'>
                        <div class='d-flex p-3 bg-body-secondary'>
                            <div class='d-flex'>
                                <img class='rounded-circle' src='./Public/images/Avatar/$user_avatar' width='44px' height='44px' />
                            </div>
                            <div class='ps-3'>
                                <h6 class='mb-0'>$user_name</h6>
                                <p class='my-1' style='font-size: 12px'>$review_date</p>
                            </div>
                        </div>
                        <div class='px-3 pb-3 bg-body-secondary'>
                            $review_content
                        </div>
                    </div>
                    ";
                }
                ?>
            </div>
            
            <?php
                if(isset($learnNow)){
                echo"
                <div>
                    <form action='index.php?act=sendCmt' method='POST' class='form-floating'>
                        <textarea class='form-control' placeholder='Leave a comment here' 
                        name='contentCmt' id='floatingTextarea2' style='height: 100px'></textarea>
                        <label for='floatingTextarea2'>Nhập bình luận</label>

                        <input type='hidden' value='$course_id' name='course_id'>
                        <button type='submit' name='sendCmt' class='mt-3 btn btn-primary'>Gửi</button>
                    </form>
                </div>
                ";
                }
            ?>
        </div>
        <!-- Review courses -->
        
        <!-- Relative courses -->
        <div class="container-fluid w-1400 my-4" id="relative-course">
            <h3 class="mb-3">Khóa học tương tự</h3>
            <div class='row mb-xl-4'>
                
            <?php
                foreach($featured_course as $course){
                    extract($course);
                    $link = "index.php?act=course&course_id=".$course_id;
                    $img = "./Public/images/imgCourse/".$course_image;
                    $course_price = number_format($course_price, 0, ',', '.');
                    $course_price_sale = number_format($course_price_sale, 0, ',', '.');
                    echo"
                    <div class='col-xl-3 col-md-6'>
                        <div class='card'>
                            <a href='$link'>
                                <img src='$img' class='card-img-top' alt='...' />
                            </a>
                            <div class='card-body'>
                                <h5 class='card-title'>$course_name</h5>
                                <p class='card-text'>$course_price đ</p>
                                <p class='card-text'><small class='text-muted text-decoration-line-through'>$course_price_sale đ</small></p>
                            </div>
                        </div>
                    </div>
                    ";
                }
            ?>

            </div>
        </div>
        <!-- Relative courses -->
