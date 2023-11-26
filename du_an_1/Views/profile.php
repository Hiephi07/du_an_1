        <!-- Profile -->
        <div class="container-fluid w-1400 my-5" id="profile">
            <div class="row px-3">
                <!-- Profile: Sidebar -->
                <?php extract($_SESSION['user']);?>
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
                        <a href="" class="list-group-item list-group-item-action rounded-0 border-start-0 border-end-0 active__list-item" aria-current="true">
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
                        <a href="index.php?act=historypayment" class="list-group-item list-group-item-action border-start-0 border-end-0 rounded-0">
                            <div class="d-inline-block text-end me-2" style="width: 25px">
                                <i class="fa-solid fa-clock-rotate-left fa-lg"></i>
                            </div>
                            <span>Lịch sử thanh toán</span>
                        </a>
                    </div>
                </div>
                <!-- Profile: Sidebar -->

                <!-- Profile: Account infor -->
                <form action="index.php?act=profile" method="post" enctype="multipart/form-data" class="col-lg-9 col-12 px-lg-5">
                    <h1 class="mt-4 mt-lg-0 mb-lg-3">Thông tin tài khoản</h1>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-3 col-12 mt-2 mb-4 my-lg-0 text-center">
                                <img class="rounded-2 img-fluid" id="avatar-img" src="./Public/images/avatar/<?= $user_avatar?>" alt="" />
                                <div class="mt-2">
                                    <input class="d-none" required type="file" name="user_avatar" id="user_avatar" />
                                    <div class="btn btn-outline-secondary rounded-0 w-100 mb-lg-3" id="btn__upload-avatar">
                                        <i class="fa-solid fa-upload pointer"></i>
                                        <label class="pointer" for="user_avatar">Tải ảnh lên</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-9 col-12 ps-xl-5">
                                <h4 class="mb-xl-4 mb-2 mb-lg-3">Thông tin cá nhân</h4>
                                <!-- <form> -->
                                    <div class="row mb-lg-3 mb-2">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Tên đăng nhập</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="username" value="<?= $username?>" disabled />
                                        </div>
                                    </div>
                                    <div class="row mb-lg-3 mb-2">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Tên</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="user_name" value="<?= $user_name?>" />
                                        </div>
                                    </div>
                                    <div class="row mb-lg-3 mb-2">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Số điện thoại</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="user_phone" value="<?= $user_phone?>" />
                                        </div>
                                    </div>
                                    <div class="row mb-lg-3 mb-3">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Email</label>
                                        <div class="col-lg-8">
                                            <input type="email" class="form-control" name="user_email" value="<?= $user_email?>" />
                                        </div>
                                    </div>
                                    <input type="hidden" name="user_id" value="<?= $user_id?>">
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" name="updateAccount" class="btn bg__main-color rounded-0 text-light fw-bold rounded-1" data-bs-target="#modal__updateAccount" data-bs-toggle="modal">
                                            Cập nhật thông tin
                                        </button>
                                    </div>

                                    <!-- Modal: Update account -->
                                    <div class="modal fade" id="modal__updateAccount" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <p class="fw-semibold fs-3 text-center">Cập nhật thông tin thành công</p>
                                                    <div class="text-center mb-3">
                                                        <i class="fa-solid fa-circle-check" style="color: #149f42; font-size: 50px"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal: Update account -->
                                <!-- </form> -->
                            </div>
                        </div>
                    </div>
                </form>
                <!-- Profile: Account infor -->
            </div>
        </div>
        <!-- Profile -->