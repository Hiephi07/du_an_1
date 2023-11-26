
    <!-- Slider -->
    <div class="container-fluid w-1400 mt-1">
        <div class="row">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./Public/images/banner1.png" class="d-block w-100" alt="..." height="400px" />
                    </div>
                    <div class="carousel-item">
                        <img src="./Public/images/banner2.png" class="d-block w-100" alt="..." height="400px" />
                    </div>
                    <div class="carousel-item">
                        <img src="./Public/images/banner3.png" class="d-block w-100" alt="..." height="400px" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <!-- Slider -->

        <!-- Course -->
        <main class="container-fluid w-1400 mt-5" id="main">
        <div class="course row my-4">
            <h3 class="mb-3">Khóa học nổi bật</h3>

            <?php
                foreach($featured_course as $course){
                    extract($course);
                    $link = "index.php?act=course&course_id=".$course_id;
                    $img = "./Public/images/imgCourse/".$course_image;
                    $course_price = number_format($course_price, 0, ',', '.');
                    $course_price_sale = number_format($course_price_sale, 0, ',', '.');
                    echo "
                    <div class='col-xl-3 col-12 col-sm-6'>
                        <div class='card'>
                            <a href='$link'>
                                <img src='$img' class='card-img-top' alt='...' />
                            </a>
                            <div class='card-body'>
                                <h5 class='card-title'>$course_name</h5>
                                <p class='card-text'>$course_price đ</p>
                                <p class='card-text'><small class='text-muted text-decoration-line-through'>$course_price_sale đ</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    ";
                }
            ?>

            <!-- <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div> -->
        </div>

        <div class="course row my-4">
            <h3 class="mb-3">Tất cả Khóa học</h3>

            <?php
                foreach($all_course as $course){
                    extract($course);
                    $link = "index.php?act=course&course_id=".$course_id;
                    $img = "./Public/images/imgCourse/".$course_image;
                    $course_price = number_format($course_price, 0, ',', '.');
                    $course_price_sale = number_format($course_price_sale, 0, ',', '.');
                    echo "
                    <div class='col-xl-3 col-12 col-sm-6'>
                        <div class='card'>
                            <a href='$link'>
                                <img src='$img' class='card-img-top' alt='...' />
                            </a>
                            <div class='card-body'>
                                <h5 class='card-title'>$course_name</h5>
                                <p class='card-text'>$course_price đ</p>
                                <p class='card-text'><small class='text-muted text-decoration-line-through'>$course_price_sale đ</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    ";
                }
            ?>

            <!-- <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6">
                <div class="card">
                    <a href="./Views/course.html">
                        <img src="./Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="..." />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nhập môn lập trình C/C++</h5>
                        <p class="card-text">17.888.999 đ</p>
                        <p class="card-text"><small class="text-muted text-decoration-line-through">10.000.000 đ</small>
                        </p>
                    </div>
                </div>
            </div> -->
        </div>
    </main>
    <!-- Course -->