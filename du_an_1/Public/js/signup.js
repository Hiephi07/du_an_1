
var username = document.querySelector('input[name=username]');
var usernameNotice = document.querySelector('.username-notice');
var usernameBorderNotice = document.querySelector('.username-notice:focus');

var email = document.querySelector('input[name=email]');
var emailNotice = document.querySelector('.email-notice');

var password = document.querySelector('input[name=password]');
var passwordNotice = document.querySelector('.password-notice');

var repassword = document.querySelector('input[name=repassword]');
var rePasswordNotice = document.querySelector('.repassword-notice');

var signUpForm = document.querySelector('#signup-form');
var formNotice = document.querySelector('.form-notice');
var signUpBtn = document.querySelector('#signUpBtn');

var emailRegrex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
var specialCharsRegex = /[!@#$%^&*(),.?":{}|<>]/;
var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;


var usernameCheck = 0;
username.addEventListener('input', function() {
    if (username.value === "") {
        usernameNotice.innerText = "Không được để trống";
        usernameNotice.classList.add("text-danger");
    } else if (specialCharsRegex.test(username.value)) { 
        usernameNotice.innerText = "Tên đăng nhập không được chứa ký tự đặc biệt";
        usernameNotice.classList.add("text-danger");
    } else if ((username.value).length <= 6 ) {
        usernameNotice.innerText = 'Tên đăng nhập phải lớn hơn 6 ký tự';
        usernameNotice.classList.add('text-danger');
    } else {
        usernameNotice.innerText = "Tên đăng nhập hợp lệ";
        usernameNotice.classList.remove('text-danger');
        usernameNotice.classList.add('text-success');
        usernameCheck = 1;
    }
});

var emailCheck = 0;
email.addEventListener('input', function () {
    if (email.value === '') {
        emailNotice.innerText = 'Không được để trống';
        emailNotice.classList.add('text-danger');
    } else if (!emailRegrex.test(email.value)) {
        emailNotice.innerText = 'Email không hợp lệ';
        emailNotice.classList.add('text-danger');
    } else {
        emailNotice.innerText = 'Email hợp lệ';
        emailNotice.classList.remove('text-danger');
        emailNotice.classList.add('text-success');
        var emailCheck = 1;
    }
});

var passwordCheck = 0;
password.addEventListener('input', function () {
    if (password.value === '') {
        passwordNotice.innerText = 'Không được để trống';
        passwordNotice.classList.add('text-danger');
    } else if (!passwordRegex.test(password.value)) {
        passwordNotice.innerText = 'Mật khẩu tối thiểu 8 ký tự, ít nhất một chữ cái viết hoa, một chữ cái viết thường và một số';
        passwordNotice.classList.add('text-danger');
    } else {
        passwordNotice.innerText = 'Mật khẩu hợp lệ';
        passwordNotice.classList.remove('text-danger');
        passwordNotice.classList.add('text-success');
        passwordCheck = 1;
    }
});

var repasswordCheck = 0;
repassword.addEventListener('input', function () {
    if (repassword.value === '') {
        rePasswordNotice.innerText = 'Không được để trống';
        rePasswordNotice.classList.add('text-danger');
    } else if (repassword.value != password.value) {
        rePasswordNotice.innerText = 'Mật khẩu nhập lại phải giống với mật khẩu đã nhập';
        rePasswordNotice.classList.add('text-danger');
    } else {
        rePasswordNotice.innerText = 'Mật khẩu nhập lại hợp lệ';
        rePasswordNotice.classList.remove('text-danger');
        rePasswordNotice.classList.add('text-success');
        repasswordCheck = 1;
    }
});


signUpForm.addEventListener('submit', (e) => {
    if (!(usernameCheck && emailCheck && passwordCheck && repasswordCheck)) {
        e.preventDefault();
        formNotice.innerText = 'Thông tin đăng ký không hợp lệ';
        formNotice.classList.add('text-danger');
    } {
        formNotice.innerText = 'Thông tin đăng ký hợp lệ';
        formNotice.classList.remove('text-danger');
        formNotice.classList.add('text-success');
    }
});


function checkEmpty(input) {
    if (input.value == "") {
        return "Không được để trống"
    }
}

function checkLength(inputField, inputName, length) {
    if (inputField.value <= length) {
        return `${inputName} phải lớn hơn ${legnth} ký tự`;
    }
}

