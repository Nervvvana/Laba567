document.addEventListener('DOMContentLoaded', function () {
    const buttonsRemoveUser = document.querySelectorAll('.remove-users');
    buttonsRemoveUser.forEach(button => {
        button.addEventListener('click', function () {
            var requestBody = {
                'typeOfUser': 'removed',
                'email': button.parentNode.parentNode.firstChild.textContent
            };
            $.ajax({
                url: 'http://localhost:8080/Laba567/users-edit',
                method: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: requestBody,
                success: function (response) {
                    switch (response['status']) {
                    case 'ok':
                        pageRedirect('/users-editing');
                        break;
                    case 'error':
                        break;
                    }
                }
            })
        });
    });

    const buttonsSaveUser = document.querySelectorAll('.save-users');
    buttonsSaveUser.forEach(button => {
        button.addEventListener('click', function () {
            var userRole = "";
            if (button.parentNode.parentNode.childNodes[0].textContent == 'admin') {
                userRole = 'admin';
            } else {
                var roleList = button.parentNode.parentNode.childNodes[2].childNodes[0].childNodes;
                roleList.forEach(option => {
                    if (option.selected) userRole = option.value;
                })
            }
            var requestBody = {
                'typeOfUser': 'edited',
                'email': button.parentNode.parentNode.childNodes[0].textContent,
                'name': button.parentNode.parentNode.childNodes[1].childNodes[0].value,
                'role': userRole
            }
            var isNotEmpty = true;
            if (requestBody['name'] != '')
                button.parentNode.parentNode.childNodes[1].lastChild.style.display = 'none';
            else {
                button.parentNode.parentNode.childNodes[1].lastChild.style.display = 'block';
                isNotEmpty = false
            }

            if (isNotEmpty) {
                $.ajax({
                    url: 'http://localhost:8080/Laba567/users-edit',
                    method: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: requestBody,
                    success: function (response) {
                        switch (response['status']) {
                            case 'ok':
                                pageRedirect('/users-editing');
                                break;
                            case 'error':
                                break;
                        }
                    }
                })
            }
        });
    });
});

function addUser() {
    document.getElementById('added-user-email-error').style.display = 'none';
    document.getElementById('add-user-wrapper').style.display = 'none';
    document.getElementById('adding-user').style.display = 'block';
}

function enableAdding() {
    var userRole = "";
    var roleList = document.getElementById('adding-user').querySelectorAll('option');
    roleList.forEach(option => {
        if (option.selected) userRole = option.value;
    })
    var requestBody = {
        'typeOfUser': 'added',
        'email': document.getElementById('added-user-email').value,
        'name': document.getElementById('added-user-name').value,
        'role': userRole,
        'password': document.getElementById('added-user-password').value,
        'sign-in-count': '0'
    }
    var isNotEmpty = true;
    if (requestBody['email'] != '')
        document.getElementById('empty-added-user-email').style.display = 'none';
    else {
        document.getElementById('empty-added-user-email').style.display = 'block';
        isNotEmpty = false
    }
    if (requestBody['name'] != '')
        document.getElementById('empty-added-user-name').style.display = 'none';
    else {
        document.getElementById('empty-added-user-name').style.display = 'block';
        isNotEmpty = false
    }
    if (requestBody['password'] != '')
        document.getElementById('empty-added-user-password').style.display = 'none';
    else {
        document.getElementById('empty-added-user-password').style.display = 'block';
        isNotEmpty = false
    }

    if (isNotEmpty) {
        $.ajax({
            url: 'http://localhost:8080/Laba567/users-edit',
            method: 'GET',
            contentType: 'application/json',
            dataType: 'json',
            data: requestBody,
            success: function (response) {
                switch (response['status']) {
                    case 'ok':
                        document.getElementById('added-user-email-error').style.display = 'none';
                        pageRedirect('/users-editing');
                        break;
                    case 'error':
                        document.getElementById('added-user-email-error').style.display = 'block';
                        break;
                }
            }
        })
    }
}

function cancelAdding() {
    document.getElementById('add-user-wrapper').style.display = 'block';
    document.getElementById('adding-user').style.display = 'none';
    document.getElementById('added-user-email').value = "";
    document.getElementById('added-user-name').value = "";
    document.getElementById('added-user-role').getElementsByTagName('option')[0].selected = true;
    document.getElementById('added-user-password').value = "";
    document.getElementById('empty-added-user-email').style.display = 'none';
    document.getElementById('empty-added-user-name').style.display = 'none';
    document.getElementById('empty-added-user-password').style.display = 'none';
}
