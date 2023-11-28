    <!-- Cart -->
    <main class="container-fluid w-1400 mt-5" id="main" style="min-height: 100vh;">
        <div class="row mt-4">
            <h3 class="my-3">Giỏ hàng của tôi</h3>
            <div class="col-md-9 col-12  text-wrap">
                <table class="table align-middle table-responsive">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Khóa học</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody id="showCourse">
                        <?php
                        $user_id = $_SESSION['user']['user_id'];
                        foreach($load_cart as $course){
                            extract($course);
                            $img = "./Public/images/imgCourse/".$course_image;
                            $course_price = number_format($course_price, 0, ',', '.');
                            echo"
                            <tr>
                                <th scope='row'><input class='form-check-input' type='checkbox' name='nameCourse'></th>
                                <td>
                                    <div class='card d-flex flex-wrap '>
                                        <img src='$img' alt='error' width='120px' height='68px'>
                                            <div class='mt-2'>
                                                <h6 class='card-title fs-lg'>$course_name</h6>
                                            </div>
                                    </div>
                                </td>
                                <td class='fw-bold h6'>$course_price đ</td>
                                <td><button value='$course_id' id='removeCourse' onclick='removeCourse(this.value, $user_id)' type='button' class='btn btn-outline-danger'>Xóa</button></td>
                            </tr>
                            ";
                        }
                        ?>
                        <!-- <tr>
                            <th scope="row" class=" " ><input class="form-check-input" type="checkbox" name="nameCourse"></th>
                            <td>
                                <div class="card d-flex flex-wrap ">
                                    <img src="../Public/images/63e1bcbaed1dd.png" class="" alt="error"  width="120px" height="68px">
                                        <div class="mt-2">
                                            <h6 class="card-title fs-lg">Nhập môn lập trình</h6>
                                        </div>
                                </div>
                            </td>
                            <td class="fw-bold h6">9.000.000đ</td>
                            <td><button type="button" class="btn btn-link text-danger">Xóa</button></td>
                        </tr>
                        <tr>
                            <th scope="row" class=" " ><input class="form-check-input" type="checkbox" name="nameCourse"></th>
                            <td>
                                <div class="card d-flex flex-wrap ">
                                        <img src="../Public/images/63e1bcbaed1dd.png" class="" alt="error"  width="120px" height="68px">
                                        <div class="mt-2">
                                            <h6 class="card-title fs-lg">Nhập môn lập trình</h6>
                                        </div>
                                </div>
                            </td>
                            <td class="fw-bold h6">9.000.000đ</td>
                            <td><button type="button" class="btn btn-link text-danger">Xóa</button></td>
                        </tr>
                        <tr>
                            <th scope="row" class=" " ><input class="form-check-input" type="checkbox" name="nameCourse"></th>
                            <td>
                                <div class="card d-flex flex-wrap ">
                                        <img src="../Public/images/63e1bcbaed1dd.png" class="" alt="error"  width="120px" height="68px">
                                        <div class="mt-2">
                                            <h6 class="card-title fs-lg">Nhập môn lập trình</h6>
                                        </div>
                                </div>
                            </td>
                            <td class="fw-bold h6">9.000.000đ</td>
                            <td><button type="button" class="btn btn-link text-danger">Xóa</button></td>
                        </tr> -->

                    </tbody>
                </table>

            </div>
            <div class="col-md-3 col-12 ">
                <div class="card">
                    <h5 class="card-header">Tổng</h5>
                    <div class="card-body">
                        <h5 class="card-title my-3">0 đ</h5>
                        <a href="./payment.html" class="btn btn-warning text-white">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Cart -->

    <script>
        // 8h
        // console.log("ok");
        let showCourse = document.getElementById('showCourse');
        function removeCourse(value, user_id) {
                let xmlHttp = new XMLHttpRequest();
                xmlHttp.onload = function () {
                    showCourse.innerHTML = xmlHttp.responseText;
                }

                xmlHttp.open('POST', './Models/removeCourse.php');
                xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlHttp.send(`course_id=${value}&user_id=${<?= $_SESSION['user']['user_id']?>}`);
        }
        console.log(showCourse);
    </script>