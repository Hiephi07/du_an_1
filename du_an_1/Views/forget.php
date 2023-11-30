        <!-- ForgetPassword -->
        <div id="forgot-password" class="container-fluid w-1400 my-4 d-flex justify-content-center">
            <div class="row w-100 justify-content-center p-3">
                <div class="border border-1 rounded-2 p-4" style="max-width: 460px">
                    <h1 class="text-center mb-3 text__main-color">Quên mật khẩu</h1>
                    <form action="index.php?act=forget" method="post" id="forgot-password">
                        <div class="mb-4 position-relative">
                            <label for="exampleInputEmail1" class="form-label fw-semibold mb-1">Email</label>
                            <input type="email" class="form-control rounded-1 " id="exampleInputEmail1" 
                            value="<?= isset($_POST['email']) ? $_POST['email'] : '';?>" name="email" required/>

                            <div class="form-text email-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>
                        </div>
                        <p class="text-danger"><?= $messEmail??"" ?></p>
                        <div class="d-grid gap-2">
                            <button class="btn bg__main-color fw-bold text-white rounded-1 " type="submit" name="sendEmail">Gửi mật khẩu mới</button>
                        </div>
                    </form>
                    <hr>
                    <div class="text-center mt-3">
                        <p class="mb-0">hoặc <a href="index.php?act=signin" class="text-decoration-none fw-semibold">Đăng nhập</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- ForgetPassword -->

        <script>
            // bỏ lưu trữ $_POST khi reload trang => không bị gửi lại email khi reload trang.
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>