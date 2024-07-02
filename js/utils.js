function pageRedirect(pageUrl) {
    switch (pageUrl) {
        case '/entrance':
            $.ajax({
                url: 'http://localhost:8080/Laba567/sign-out',
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    switch (response['status']) {
                        case 'ok':
                            window.location.href = 'http://localhost:8080/Laba567' + pageUrl;
                            break;
                        case 'error':
                            break;
                    }
                }
            });
            break;
        default:
            window.location.href = 'http://localhost:8080/Laba567' + pageUrl;
            break;
    }
}

function switch_signin_signup(name){
    switch (name) {
        case "sign-up":
            document.getElementById("signin_form").style.display = "none";
            document.getElementById("signup_form").style.display = "block";
            clear_input();
            break;
        case "sign-in":
            document.getElementById("signin_form").style.display = "block";
            document.getElementById("signup_form").style.display = "none";
            clear_input();
            break;
    }
}

function clear_input(){
    var input = document.getElementsByTagName("input");
    for (var i = 0; i < input.length; i++){
        input[i].value = "";
    }

    var span = document.getElementsByTagName("span");
    for (var i = 0; i < span.length; i++){
        span[i].style.display = "none";
    }
}