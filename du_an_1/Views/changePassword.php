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
                        <a href="index.php?act=profile" class="list-group-item list-group-item-action rounded-0 border-start-0 border-end-0 " aria-current="true">
                            <div class="d-inline-block text-end me-2" style="width: 25px">
                                <i class="fa-solid fa-user fa-lg"></i>
                            </div>
                            <span>Thông tin tài khoản</span>
                        </a>
                        <a href="" class="list-group-item list-group-item-action border-start-0 border-end-0 active__list-item">
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

                <!-- Profile: Change password -->
                <div class="col-lg-9 col-12 px-lg-5">
                    <h1 class="mt-4 mt-lg-0 mb-3">Đổi mật khẩu</h1>
                    
                    <div class="container">
                        <div class="row ">
                            <form action="index.php?act=changePassword" method="post">
                                <div class="row mb-lg-3 mb-2">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Mật khẩu cũ</label>
                                        <div class="col-lg-8">
                                            <input type="password" class="form-control" name="oldPw" id="inputEmail3" required/>
                                        </div>
                                    </div>
                                    <div class="row mb-lg-3 mb-2">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Mật khẩu mới</label>
                                        <div class="col-lg-8">
                                            <input type="password" class="form-control" name="newPw" id="inputEmail3" required/>
                                        </div>
                                    </div>
                                    <div class="row mb-lg-3 mb-3">
                                        <label for="inputEmail3" class="col-lg-4 text-lg-end mb-2 fw-semibold">Xác nhận mật khẩu mới</label>
                                        <div class="col-lg-8">
                                            <input type="password" class="form-control" name="re_newPw" id="inputEmail3" required/>
                                        </div>
                                    </div>
                                    <input type="hidden" name="user_id" value="<?= $user_id?>">
                                    <div class="d-flex justify-content-between">
                                        <p class="text-danger"><?= isset($messPw) ? $messPw : (isset($messPwFalse)?$messPwFalse: (isset($messPwTrue)?$messPwTrue: "")) ?> </p>

                                        <button type="submit" name="changePw" class="btn bg__main-color rounded-0 text-light fw-bold rounded-1" data-bs-target="#modal__updateAccount" data-bs-toggle="modal">
                                            Đổi mật khẩu
                                        </button>
                                    </div>
                                <!-- Modal: Change password -->
                                <!-- <div class="modal fade" id="modal__updateAccount" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <p class="fw-semibold fs-3 text-center">Thay đổi mật khẩu thành công</p>
                                                <div class="text-center mb-3">
                                                    <i class="fa-solid fa-circle-check" style="color: #149f42; font-size: 50px"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                                <!-- Modal: Change password -->
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Profile: Change password -->
            </div>
        </div>
        <!-- Profile -->