        <!-- Watch Lesson -->
        <section class="container-fluid w-1400 border-5 mt-4">
            <div class="row">
                <div class="col-lg-8 col-12 col-sm-12">
                    <!-- <video width="100%" height="528" controls>
                        <source src="../Public/video/2023-11-17 14-35-51.mp4" type="video/mp4" />
                    </video> -->
                    <div class="ratio ratio-16x9 border">
                        <video id="myVideo" controls autoplay>
                            <source id="videoSource" src="./Public/video/one_million.mp4" type="video/mp4">
                        </video>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <h3 class=" mt-3"><?= $getNameCourse['course_name']; ?></h3>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-12 col-sm-12">
                    <div class="accordion overflow-y-scroll" id="accordionPanelsStayOpenExample">
                        <!-- <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button fw-bold"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseOne"
                                    aria-expanded="true"
                                    aria-controls="panelsStayOpen-collapseOne"
                                >
                                1. Khái niệm kỹ thuật cần biết
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                                <div class="accordion-body">
                                    <ol class="list-group list-group-numbered">
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none text-decoration-none">Mô hình Client - Server là gì?</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="hi" onclick="playNextVideo()" class="text-black text-decoration-none">Domain là gì? Tên miền là gì?</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">Hosting là gì?</a>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div> -->
                        <?php
                            foreach($getChapterCourse as $chapter){
                                $cc_chapter_id = $chapter['chapter_id'];
                                extract($chapter);
                                echo"
                                <div class='accordion-item'>
                                <h2 class='accordion-header'>
                                    <button
                                        class='accordion-button fw-bold'
                                        type='button'
                                        data-bs-toggle='collapse'
                                        data-bs-target='#panelsStayOpen-collapseOne'
                                        aria-expanded='true'
                                        aria-controls=''
                                    >
                                    $chapter_name
                                    </button>
                                </h2>
                                <div id='' class='accordion-collapse collapse show'>
                                    <div class='accordion-body'>
                                        <ol class='list-group list-group-numbered'>";
                                            foreach($getLessonCourse as $lesson){
                                            extract($lesson);
                                            if($cc_chapter_id == $chapter_id){
                                                echo"
                                                <li class='list-group-item list-group-item-action'>
                                                    <a href='#' onclick="."changeVideo('./Public/video/$lesson_path') 
                                                    class='text-black text-decoration-none text-decoration-none'>$lesson_name</a>
                                                </li>
                                                ";
                                            };
                                            }
                                    echo"</ol>
                                    </div>
                                </div>
                            </div>
                                ";
                            }
                        ?>
                    </div>
                </div>
            </div>
        </section>
        <!-- Watch Lesson -->

        <script>
            function changeVideo(newSource) {
                // Thay đổi đường dẫn của thẻ video
                document.getElementById('videoSource').src = newSource;

                // Nạp lại nguồn video để áp dụng thay đổi
                document.getElementById('myVideo').load();

                // Ngăn chặn hành động mặc định của thẻ a (tránh load lại trang)
                event.preventDefault();
            }

        </script>