        <!-- Profile -->
        <div class="container-fluid w-1400 my-5" id="profile">
            <div class="row px-3">
                <!-- Profile: Sidebar -->
                <div class="col-lg-3 col-12 border border-secondary px-0 rounded-1" id="account__side-bar">
                    <div class="d-flex px-3 pt-3 mb-4">
                        <div>
                            <img class="rounded-2" src="./Public/images/avatar/<?= $user_avatar?>" alt="" width="100px" height="80px" />
                        </div>
                        <div class="px-3 align-self-center">
                            <span>Tài khoản của</span>
                            <span class="d-block fw-bold fs-5"><?= $user_name?></span>
                        </div>
                    </div>
                    <div class="list-group">
                        <a href="index.php?act=profile" class="list-group-item list-group-item-action rounded-0 border-start-0 border-end-0 " aria-current="true">
                            <div class="d-inline-block text-end me-2" style="width: 25px">
                                <i class="fa-solid fa-user fa-lg"></i>
                            </div>
                            <span>Thông tin tài khoản</span>
                        </a>
                        <a href="index.php?act=changePassword" class="list-group-item list-group-item-action border-start-0 border-end-0">
                            <div class="d-inline-block text-end me-2" style="width: 25px">
                                <i class="fa-solid fa-key fa-lg"></i>
                            </div>
                            <span>Đổi mật khẩu</span>
                        </a>
                        <a href="" class="list-group-item list-group-item-action border-start-0 border-end-0 rounded-0  active__list-item">
                            <div class="d-inline-block text-end me-2" style="width: 25px">
                                <i class="fa-solid fa-clock-rotate-left fa-lg"></i>
                            </div>
                            <span>Lịch sử thanh toán</span>
                        </a>
                    </div>
                </div>
                <!-- Profile: Sidebar -->

                <!-- Profile: Payment history -->
                <div class="col-lg-9 col-12 px-lg-5">
                    <h1 class="mb-3 mt-4 mt-lg-0">Lịch sử thanh toán</h1>
                    <div class="container">
                        <div class="row">
                            <div class="overflow-auto">
                                <table class="table table-hover" style="min-width: 585px">
                                    <thead>
                                        <tr>
                                            <th scope="col">STT</th>
                                            <th scope="col">Tên khóa học</th>
                                            <th scope="col">Mã đơn hàng</th>
                                            <th scope="col">Ngày mua</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $i = 0;
                                        // var_dump($history);
                                        foreach($history as $his){
                                            extract($his);
                                            $course_price = number_format($course_price, 0, ',', '.');

                                            if($order_status == 0) $order_status = "<td class='text-danger fw-bold'>Đã hủy</td>";
                                            if($order_status == 1) $order_status = "<td class='text-success fw-bold'>Đã thanh toán</td>";
                                            if($order_status == 2) $order_status = "<td class='text-warning fw-bold'>Chờ xác nhận</td>";

                                            echo"
                                            <tr>
                                                <th scope='row'>".++$i."</th>
                                                <td>$course_name</td>
                                                <td>#$order_id</td>
                                                <td>$order_date</td>
                                                <td>$course_price đ</td>
                                                $order_status
                                            </tr>
                                            ";
                                        }
                                        ?>
                                        <!-- <tr>
                                            <th scope="row">1</th>
                                            <td>HTML & CSS</td>
                                            <td>#39978</td>
                                            <td>10/11/2023</td>
                                            <td>500,000 đ</td>
                                            <td class="text-success fw-bold">Đã thanh toán</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Javascript</td>
                                            <td>#39977</td>
                                            <td>10/11/2023</td>
                                            <td>500,000 đ</td>
                                            <td class="text-success fw-bold">Đã thanh toán</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>PHP cơ bản</td>
                                            <td>#39976</td>
                                            <td>10/11/2023</td>
                                            <td>500,000 đ</td>
                                            <td class="text-danger fw-bold">Thanh toán lỗi</td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Profile: Payment history -->
            </div>
        </div>
        <!-- End: Profile -->