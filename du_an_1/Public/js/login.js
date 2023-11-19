var username = document.querySelector('input[name=username]');
var usernameNotice = document.querySelector('.username-notice');

var password = document.querySelector('input[name=password]');
var passwordNotice = document.querySelector('.password-notice');

var loginForm = document.querySelector('#login-form');

var emailRegrex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
var specialCharsRegex = /[!@#$%^&*(),.?":{}|<>]/;
var specialCharsAndSpaceRegex = /[!@#$%^&*(),.?":{}|<>\s]/;
var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

var usernameCheck = 0;
username.addEventListener('input', function () {
    if (specialCharsAndSpaceRegex.test(username.value)) {
        usernameNotice.innerText = 'Tên đăng nhập không được chứa ký tự đặc biệt hoặc khoảng trắng';
        usernameNotice.classList.add('text-danger');
        usernameCheck = 0;
    } else {
        usernameNotice.innerText = '';
        passwordNotice.classList.remove('text-danger');
        usernameCheck = 1;
    }
});

var passwordCheck = 0;
password.addEventListener('input', function () {
    if (password.value === '') {
        passwordNotice.innerText = 'Không được để trống';
        passwordNotice.classList.add('text-danger');
        passwordCheck = 0;
    } else {
        passwordNotice.innerText = '';
        passwordNotice.classList.remove('text-danger');
        passwordCheck = 1;
    }
});

loginForm.addEventListener('submit', (e) => {
    if (!(usernameCheck || passwordCheck)) {
        e.preventDefault();
        if (username.value === '') {
            usernameNotice.innerText = 'Không được để trống';
            usernameNotice.classList.add('text-danger');
        }

        if (password.value === '') {
            passwordNotice.innerText = 'Không được để trống';
            passwordNotice.classList.add('text-danger');
        }
    }
});
