var email = document.querySelector('input[name=email]');
var emailNotice = document.querySelector('.email-notice');

var forgotPasswordForm = document.querySelector('#forgot-password');

var emailRegrex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

var emailCheck;
email.addEventListener('input', function () {
    emailCheck = 0;
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

forgotPasswordForm.addEventListener('submit', (e) => {
    if (!emailCheck) {
        e.preventDefault();
        if (email.value === '') {
            emailNotice.innerText = 'Không được để trống';
            emailNotice.classList.add('text-danger');
        }
    }
});
