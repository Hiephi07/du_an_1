var username = document.querySelector('input[name=username]');
var usernameNotice = document.querySelector('.username-notice');

var email = document.querySelector('input[name=email]');
var emailNotice = document.querySelector('.email-notice');

var tel = document.querySelector('input[name=tel]');
var telNotice = document.querySelector('.tel-notice');

var feedbackContent = document.querySelector('textarea[name=feedback-content]');
var feedbackContentNotice = document.querySelector('.feedback-content-notice');

var feedbackForm = document.querySelector('#feedback-form');

var emailRegrex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
var telRegex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;

var usernameCheck = 0;
username.addEventListener('input', function () {
    if (username.value === '') {
        usernameNotice.innerText = 'Không được để trống';
        usernameNotice.classList.add('text-danger');
        usernameCheck = 0;
    } else {
        usernameNotice.innerText = '';
        usernameNotice.classList.remove('text-danger');
        usernameCheck = 1;
    }
});

var emailCheck = 0;
email.addEventListener('input', function () {
    if (email.value === '') {
        emailNotice.innerText = 'Không được để trống';
        emailNotice.classList.add('text-danger');
        emailCheck = 0;
    } else if (!emailRegrex.test(email.value)) {
        emailNotice.innerText = 'Email không hợp lệ';
        emailNotice.classList.add('text-danger');
        emailCheck = 0;
    } else {
        emailNotice.innerText = '';
        emailNotice.classList.remove('text-danger');
        var emailCheck = 1;
    }
});

var telCheck = 0;
tel.addEventListener('input', function () {
    if (telRegex.test(tel.value)) {
        telNotice.innerText = 'Số điện thoại không hợp lệ';
        telNotice.classList.add('text-danger');
        telCheck = 0;
    } else {
        telNotice.innerText = '';
        telNotice.classList.remove('text-danger');
        telCheck = 1;
    }
});

var feedbackContentCheck = 0;
feedbackContent.addEventListener('input', function () {
    if (feedbackContent.value == '') {
        feedbackContentNotice.innerText = 'Nội dung không được để trống';
        feedbackContentNotice.classList.add('text-danger');
        feedbackContentCheck = 0;
    } else {
        feedbackContentNotice.innerText = '';
        feedbackContentNotice.classList.remove('text-danger');
        feedbackContentCheck = 1;
    }
});

feedbackForm.addEventListener('submit', (e) => {
    if (!(usernameCheck || emailCheck || telCheck || feedbackContentCheck)) {
        e.preventDefault();
        if (username.value === '') {
            usernameNotice.innerText = 'Không được để trống';
            usernameNotice.classList.add('text-danger');
        }

        if (email.value === '') {
            emailNotice.innerText = 'Không được để trống';
            emailNotice.classList.add('text-danger');
        }

        if (tel.value === '') {
            telNotice.innerText = 'Không được để trống';
            telNotice.classList.add('text-danger');
        }

        if (feedbackContent.value === '') {
            feedbackContentNotice.innerText = 'Không được để trống';
            feedbackContentNotice.classList.add('text-danger');
        }
    }
});
