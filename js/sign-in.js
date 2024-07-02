document.getElementById('to_signin').addEventListener('click', function (e) {
    e.preventDefault();

    var requestBody = {
        'email': document.getElementById('signin_email').value,
        'password': document.getElementById('signin_password').value
    }
    var isNotEmpty = true;

    if (requestBody['email'] != '')
        document.getElementById('signin_enter_email').style.display = 'none';
    else {
        document.getElementById('signin_enter_email').style.display = 'block';
        isNotEmpty = false
    }
    if (requestBody['password'] != '')
        document.getElementById('signin_enter_password').style.display = 'none';
    else {
        document.getElementById('signin_enter_password').style.display = 'block';
        isNotEmpty = false
    }

    if (isNotEmpty) {
        $.ajax({
            url: 'http://localhost:8080/Laba567/sign-in',
            method: 'POST',
            dataType: 'json',
            data: requestBody,
            success: function (response) {
                switch (response['status']) {
                    case 'ok':
                        document.getElementById('signin_error').style.display = 'none';
                        pageRedirect('/' + response['role']);
                        break;
                    case 'notFound':
                        document.getElementById('signin_error').style.display = 'block';
                        break;
                }
            }
        })
    }
})