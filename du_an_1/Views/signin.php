        <!-- Login box -->
        <div id="login-box" class="container-fluid w-1400 my-4 d-flex justify-content-center">
            <div class="row w-100 justify-content-center p-3">
                <div class="border border-1 rounded-2 p-4" style="max-width: 460px">
                    <h1 class="text-center mb-3 text__main-color">Đăng nhập</h1>
                    <p class="text-center text-danger"><?= isset($_GET['mess'])?"Bạn cần đăng nhập trước khi mua khóa học!": ""; ?></p>
                    <form action="index.php?act=signin" method="POST" id="login-form">
                        <div class="text-danger mb-3 position-relative"><?= $thongbao_dn??"" ?></div>

                        <div class="mb-3 position-relative">
                            <label for="username" class="form-label fw-semibold mb-1">Tên đăng nhập hoặc Email</label>
                            <input type="text" class="form-control" id="username" name="username" required/>
                            <div class="form-text username-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>

                        </div>
                        <div class="mb-4 position-relative">
                            <label for="password" class="form-label fw-semibold mb-1">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password" required/>
                            <div class="form-text password-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>
                        </div>
                        <div class="mb-3 form-check d-flex justify-content-between">
                            <div>
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                                <label class="form-check-label" for="exampleCheck1" name="remember-login">Ghi nhớ đăng nhập</label>
                            </div>
                            <a href="index.php?act=forget" class="text-decoration-none">Quên mật khẩu</a>
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn bg__main-color fw-bold text-white" type="submit" name="signinBtn" id="loginBtn">Đăng nhập</button>
                        </div>
                    </form>
                    <div class="text-center mt-3">
                        <p class="mb-0">Bạn chưa có tài khoản? <a href="index.php?act=signup" class="text-decoration-none fw-semibold ">Đăng ký</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login box -->