        <!-- Course detail -->
        <div class="container-fluid w-1400 my-4" id="course-detail">
            <div class="row">
                <div class="col-lg-6">
                    <div>
                        <img class="w-100" src="<?= "./Public/images/imgCourse/$course_image"?>" alt="" />
                    </div>

                    <div class="row my-3">
                        <div class="col-sm pe-sm-2 mb-2">
                            <a class="btn btn-primary btn-lg w-100 rounded-0 border-black border-2 bg__main-color fw-bold" 
                                href="<?= "index.php?act=payment&course_id=".$course_id ?>">Mua ngay</a>
                        </div>
                        <div class="col-sm ps-sm-2">
                            <a class="btn btn-primary btn-lg w-100 rounded-0 border-black border-2 bg-light text-dark fw-bold" 
                                href="<?= "index.php?act=add_cart&course_id=".$course_id ?>">Thêm vào giỏ hàng</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <h1 class="fw-bolder pt-lg-3"><?= "$course_name"?></h1>
                    <p class="text-danger fw-bold fs-3 mt-3 h3"><?= number_format($course_price, 0, ',', '.')?> đ</p>
                    <p class='card-text h5 mt-3 text-decoration-line-through'><?= number_format($course_price_sale, 0, ',', '.') ?> đ</p>
                    <!-- <div>
                        <h5 class="fw-bold mb-3">Khóa học này bao gồm:</h5>
                        <div class="row ps-3">
                            <div class="col-sm mb-3">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fa-solid fa-video fa-lg pe-2 align-content-between"></i>
                                    <span class="">56,5 giờ video theo yêu cầu</span>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
        <!-- Course detail -->

        <!-- Course desc -->
        <div class="container-fluid w-1400 my-4" id="course-desc">
            <h3 class="mb-3">Mô tả</h3>
            <p class="fs-5 text-justify">
                <!-- React.JS là một thư viện, framework giúp xây dựng một website hiện đại, có tính mở rộng và hiệu năng cực lớn. Các sản phẩm tiêu biểu sử dụng React có thể kể đến như Facebook và
                Instagram.<br /><br />

                Được Facebook chống lưng, cũng như đầu tư mạnh mẽ, cộng với một cộng đồng đông đảo sử dụng, React chính là thư viện Frontend phổ biến nhất hiện nay, bỏ xa Vue và Angular. Với tên gọi
                React ULTIMATE - mục tiêu đề ra của khóa học, đấy chính là nó là phiên bản cuối cùng, là thứ DUY NHẤT các bạn cần, cũng như cập nhật MỚI NHẤT & ĐẦY ĐỦ NHẤT cho người mới bắt đầu, muốn
                có một góc nhìn "thực sự chính xác" về React.JS.<br /><br />

                Ngoài ra, khi kết thúc khóa học, các bạn mới bắt đầu sẽ có đủ tự tin để làm chủ React, cũng như hiểu được, nắm vững được những kiến thức cốt lõi nhất để có thể xây dựng, phát triển một
                website thực tế với React.JS Khóa học sẽ thực sự bổ ích cũng như mang lại rất nhiều kiến thức cho các bạn mới bắt đầu. Với phương châm, học đi đôi với thực hành, chúng ta chỉ học "vừa
                đủ", chỉ học những kiến thức code lỗi nhất, hi vọng các bạn sẽ học hỏi được nhiều kiến thức, cũng như tự tin sử dụng React cho công việc của mình.<br /><br /> -->

                <?php echo "$course_desc"?>
            </p>
        </div>
        <!-- Course desc -->

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
            <!-- Row 1 -->
            <!-- <div class="row mb-xl-4">
                <div class="col-xl-3 col-md-6">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
            </div> -->

            <!-- Row 2 -->
            <!-- <div class="row">
                <div class="col-xl-3 d-none d-xl-block">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 d-none d-xl-block">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 d-none d-xl-block">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 d-none d-xl-block">
                    <div class="card">
                        <a href="course.html">
                            <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                            <p class="card-text">17.888.999 đ</p>
                            <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small></p>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
        <!-- Relative courses -->