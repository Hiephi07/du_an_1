        <!-- Signup box -->
        <div id="signup-box" class="container-fluid w-1400 my-4 d-flex justify-content-center">
            <div class="row w-100 justify-content-center p-3">
                <div class="border border-1 rounded-2 p-4" style="max-width: 460px">
                    <h1 class="text__main-color text-center mb-3 ">Đăng ký</h1>
                    <form action="index.php?act=signup" method="POST" id="signup-form">

                        <div class="text-danger mb-3 position-relative"><?= $insert_acount??"" ?></div>

                        <div class="mb-4 position-relative">
                            <label for="user_name" class="form-label fw-semibold mb-1">Họ tên của bạn</label>
                            <input type="text" class="form-control" id="user_name" name="user_name" required/>
                            <div class="form-text user_name-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>
                        </div>
                        <div class="mb-3 position-relative ">
                            <label for="username" class="form-label fw-semibold  mb-1">Tên đăng nhập</label>
                            <input type="text" class="form-control" id="username" name="username" required/>
                            <div class="form-text username-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>
                        </div>
                        <div class="mb-3 position-relative">
                            <label for="exampleInputPassword1" class="form-label fw-semibold mb-1">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required/>
                            <div class="form-text email-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>
                        </div>
                        <div class="mb-3 position-relative">
                            <label for="exampleInputPassword1" class="form-label fw-semibold mb-1">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password" required/>
                            <div class="form-text password-notice position-absolute ms-2" style="bottom: -18px; font-size: 11px;"></div>
                        </div>
                        <!-- <div class="mb-3">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="accepted-terms"/>
                            <label class="form-check-label" for="exampleCheck1">Tôi đồng ý với những <a href="#" class="text-decoration-none">điều khoản sử dụng</a> </label>
                            
                        </div> -->
                        <div class="d-grid gap-2">
                            <button class="btn bg-warning fw-bold text-white " type="submit" name="signUpBtn" id="signUpBtn" >Đăng ký</button>
                        </div>
                    </form>
                    <hr>
                    <div class="text-end  my-2">
                        <p class="mb-0 text-center">Tôi đã có tài khoản? <a href="index.php?act=signin" class="text-decoration-none fw-semibold ">Đăng nhập</a></p>
                    </div>
                </div>
            </div>
        </div>