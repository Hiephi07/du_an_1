    <!-- Payment -->
    <section class="container-fluid w-1400 mt-4">
        <form action="index.php?act=order" method="post">
        <div class="row justify-content-center align-content-center">

            <h3 class="">Thanh toán đơn hàng</h3>

            <div class="col-xl-4 col-10 col-md-6 mt-4">
                <div class="card">
                    <div class="card-header h5">
                        Thông tin đơn hàng
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <p><small class="text-body-secondary">Nhà cung cấp</small></p>
                            
                            <div class="logo d-flex align-content-center flex-wrap flex-grow-1">
                                <div>
                                    <img src="./favicon.png" alt="" width="32px">
                                </div>
                                <p class="h6 mx-2 mb-0">Công ty TNHH Giáo dục PolyUni</p>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <p><small class="text-body-secondary">Số tài khoản</small></p>
                            <p class="h6 mb-0">1001122667755</p>
                            <?php date_default_timezone_set('Asia/Ho_Chi_Minh');?>
                        </li>
                        <li class="list-group-item">
                            <p><small class="text-body-secondary">Tên khóa học</small></p>
                            <p class="h6 mb-0"><?= $course_name?></p>
                            <input type="hidden" name="course_id" value="<?=$course_id?>">
                        </li>
                        <li class="list-group-item">
                            <p><small class="text-body-secondary">Số tiền</small></p>
                            <p class="h6 mb-0"><?= number_format($course_price, 0, ',', '.') ?></p>
                            <input type="hidden" name="order_date" value="<?=date('Y-m-d H:i:s')?>">
                        </li>
                        <li class="list-group-item">
                            <p><small class="text-body-secondary">Mã đơn hàng</small></p>
                            <p class="h6 mb-0"><?= $_SESSION['order_id']?></p>
                            <input type="hidden" name="order_id" value="<?= $_SESSION['order_id']?>">
                        </li>
                    </ul>
                    <div class="d-flex align-content-between flex-wrap justify-content-between mt-3 flex-column">
                        <button type="submit" name="cancel" onclick="return confirm('Bạn có chắc chắn hủy thanh toán không ?');" 
                        class="btn btn-danger w-100">Hủy thanh toán</button>

                        <button type="submit" name="success" onclick="return confirm('Đã xác nhận thanh toán, vui lòng chờ Admin xác nhận !');" 
                        class="btn btn-primary w-100 mt-3">Đã thanh toán</button>

                        <!-- <a href="#" class="btn btn-primary w-100 mt-3">Đã thanh toán</a> -->
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
    </section>
    <!-- Payment -->