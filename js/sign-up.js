document.getElementById('to_signup').addEventListener('click', function(e) {
    e.preventDefault()

    var requestBody = {
        "email": document.getElementById('signup_email').value,
        "name": document.getElementById('signup_name').value,
        "password": document.getElementById('signup_password').value
    }
    var isNotEmpty = true
    var isValid = true
    var emailRegex = /^([A-Za-z0-9_]+)(@mail\.ru)$/
    var nameRegex = /^[A-Za-z]+$/
    var passwordRegex = /^[A-Za-z0-9_\s]+$/

    if (requestBody['email'] != '') {
        document.getElementById('signup_enter_email').style.display = 'none'
        if (emailRegex.test(requestBody['email']))
            document.getElementById('signup_check_email').style.display = 'none'
        else {
            document.getElementById('signup_check_email').style.display = 'block'
            isValid = false
        }
    } else {
        document.getElementById('signup_enter_email').style.display = 'block'
        document.getElementById('signup_check_email').style.display = 'none'
        isNotEmpty = false
    }

    if (requestBody['name'] != '') {
        document.getElementById('signup_enter_name').style.display = 'none'
        if (nameRegex.test(requestBody['name']))
            document.getElementById('signup_check_name').style.display = 'none'
        else {
            document.getElementById('signup_check_name').style.display = 'block'
            isValid = false
        }
    } else {
        document.getElementById('signup_enter_name').style.display = 'block'
        document.getElementById('signup_check_name').style.display = 'none'
        isNotEmpty = false
    }

    if (requestBody['password'] != '') {
        document.getElementById('signup_enter_password').style.display = 'none'
        if (passwordRegex.test(requestBody['password']) && requestBody['password'].length >= 6)
            document.getElementById('signup_check_password').style.display = 'none'
        else {
            document.getElementById('signup_check_password').style.display = 'block'
            isValid = false
        }
    } else {
        document.getElementById('signup_enter_password').style.display = 'block'
        document.getElementById('signup_check_password').style.display = 'none'
        isNotEmpty = false
    }

    if (isNotEmpty && isValid) {
        $.ajax({
            url: 'http://localhost:8080/Laba567/sign-up',
            method: 'POST',
            dataType: 'json',
            data: requestBody,
            success: function (response) {
                document.getElementById('server_message').style.display = 'block';
                switch (response['status']) {
                    case 'ok':
                        document.getElementById('server_message').style.color = '#00FF00';
                        document.getElementById('server_message').textContent = response['message'];
                        break;
                    case 'error':
                        document.getElementById('server_message').style.color = '#FF0000';
                        document.getElementById('server_message').textContent = response['message'];
                        break;
                }
            }
        })
    }
})