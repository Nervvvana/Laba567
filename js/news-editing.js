document.addEventListener('DOMContentLoaded', function () {
    const buttonsRemoveNew = document.querySelectorAll('.remove-news');
    buttonsRemoveNew.forEach(button => {
        button.addEventListener('click', function () {
            var requestBody = {
                'name': button.parentNode.parentNode.firstChild.textContent,
                'typeOfNew': 'removed'
            }
            $.ajax({
                url: 'http://localhost:8080/Laba567/news-edit',
                method: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                data: requestBody,
                success: function (response) {
                    switch (response['status']) {
                        case 'ok':
                            button.parentNode.parentNode.style.display = 'none';
                            break;
                        case 'error':
                            break;
                    }

                }
            })
        });
    });

    const buttonsSaveNew = document.querySelectorAll('.save-news');
    buttonsSaveNew.forEach(button => {
        button.addEventListener('click', function () {
            var requestBody = {
                'typeOfNew': 'edited',
                'name': button.parentNode.parentNode.childNodes[0].textContent,
                'heading': button.parentNode.parentNode.childNodes[1].childNodes[0].value,
                'content': button.parentNode.parentNode.childNodes[2].childNodes[0].value,
                'published': button.parentNode.parentNode.childNodes[3].textContent
            }
            var isNotEmpty = true;
            if (requestBody['heading'] != '')
                button.parentNode.parentNode.childNodes[1].lastChild.style.display = 'none';
            else {
                button.parentNode.parentNode.childNodes[1].lastChild.style.display = 'block';
                isNotEmpty = false
            }
            if (requestBody['content'] != '')
                button.parentNode.parentNode.childNodes[2].lastChild.style.display = 'none';
            else {
                button.parentNode.parentNode.childNodes[2].lastChild.style.display = 'block';
                isNotEmpty = false
            }

            if (isNotEmpty) {
                $.ajax({
                    url: 'http://localhost:8080/Laba567/news-edit',
                    method: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: requestBody,
                    success: function (response) {
                        switch (response['status']) {
                            case 'ok':
                                pageRedirect('/news-editing')
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

function addNew() {
    document.getElementById('add-new-wrapper').style.display = 'none';
    document.getElementById('adding-new').style.display = 'block';
}

function enableAdding() {
    var requestBody = {
        'typeOfNew': 'added',
        'heading': document.getElementById('added-new-heading').value,
        'content': document.getElementById('added-new-content').value
    }
    var isNotEmpty = true;
    if (requestBody['heading'] != '')
        document.getElementById('empty-added-new-heading').style.display = 'none';
    else {
        document.getElementById('empty-added-new-heading').style.display = 'block';
        isNotEmpty = false
    }
    if (requestBody['content'] != '')
        document.getElementById('empty-added-new-content').style.display = 'none';
    else {
        document.getElementById('empty-added-new-content').style.display = 'block';
        isNotEmpty = false
    }

    if (isNotEmpty) {
        $.ajax({
            url: 'http://localhost:8080/Laba567/news-edit',
            method: 'GET',
            contentType: 'application/json',
            dataType: 'json',
            data: requestBody,
            success: function (response) {
                switch (response['status']) {
                    case 'ok':
                        pageRedirect('/news-editing');
                        break;
                    case 'error':
                        break;
                }
            }
        })
    }
}

function cancelAdding() {
    document.getElementById('add-new-wrapper').style.display = 'block';
    document.getElementById('adding-new').style.display = 'none';
    document.getElementById('added-new-heading').value = "";
    document.getElementById('added-new-content').value = "";
    document.getElementById('empty-added-new-heading').style.display = 'none';
    document.getElementById('empty-added-new-content').style.display = 'none';
}
