    <!-- My Course -->
    <main class="container-fluid w-1400 mt-5" id="main">
        <div class="row mt-4">

            <h3 class="mt-3">Khóa học của tôi</h3>

            <?php
            foreach($courses as $course){
                extract($course);
                $img = "./Public/images/imgCourse/".$course_image;
                echo "
                <div class='col-xl-3 col-12 col-sm-6 mt-4'>
                    <div class='card'>
                        <a href='index.php?act=watchLesson&course_id=$course_id'>
                            <img src='$img' class='card-img-top' alt='...'>
                        </a>
                        <p class='card-text h5 mt-3 text-center'>$course_name</p>
                    </div>
                </div>
                ";
            }
            ?>

            <!-- <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="./watchLesson.html">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h5 mt-3 text-center">Nhập môn lập trình C/C++</p>
                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h5 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h5 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h5 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div>


        </div>
        <div class="row">
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h5 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h5 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h4 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div>
            <div class="col-xl-3 col-12 col-sm-6 mt-4">
                <div class="card">
                    <a href="">
                        <img src="../Public/images/63e1bcbaed1dd.png" class="card-img-top" alt="...">
                    </a>
                    <p class="card-text h4 mt-3 text-center">Nhập môn lập trình C/C++</p>

                </div>
            </div> -->


        </div>
    </main>
    <!-- My Course -->