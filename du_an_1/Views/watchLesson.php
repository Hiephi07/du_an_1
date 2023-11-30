        <!-- Watch Lesson -->
        <section class="container-fluid w-1400 border-5 mt-4">
            <div class="row">
                <div class="col-lg-8 col-12 col-sm-12">
                    <!-- <video width="100%" height="528" controls>
                        <source src="../Public/video/2023-11-17 14-35-51.mp4" type="video/mp4" />
                    </video> -->
                    <div class="ratio ratio-16x9">
                        <video id="myVideo" controls>
                            <source src="./Public/video/one_million.mp4" type="video/mp4">
                        </video>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <h3 class="font-monospace mt-3">Nhập môn lập trình</h3>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-12 col-sm-12">
                    <div class="accordion overflow-y-scroll" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
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
                                        <!-- <button onclick="playNextVideo()">Next Video</button> -->
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
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseTwo"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseTwo"
                                >
                                2. Môi trường, con người IT
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <ol class="list-group list-group-numbered">
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseThree"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseThree"
                                >
                                3. Phương pháp, định hướng
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <ol class="list-group list-group-numbered">
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapse4"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapse4"
                                >
                                4. Hoàn thành khóa học
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapse4" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <ol class="list-group list-group-numbered">
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                        <li class="list-group-item list-group-item-action">
                                            <a href="#" class="text-black text-decoration-none">A second link item</a>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Watch Lesson -->

        <script>
            var video = document.getElementById('myVideo');
            var isVideoCompleted = false;

            video.addEventListener('ended', function() {
                isVideoCompleted = true;
            });

            function playNextVideo() {
                if (isVideoCompleted) {
                    // Chuyển sang video tiếp theo hoặc thực hiện các hành động khác
                    alert('Chuyển sang video tiếp theo');
                    // Reset trạng thái xem video
                    isVideoCompleted = false;
                } else {
                    confirm('Bạn cần xem hết video trước!');
                }
            }
        </script>