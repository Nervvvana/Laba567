<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>Авторизация</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div>
            <header>
                <button id="text_logo">Эльдорадо 2</button>
            </header>
        </div>
        <div id="signin_signup_wrapper">
            <form id="signin_form">
                <div id="text_login_0">Вход</div>
                <input id="signin_email" placeholder="Email">
                <span id="signin_enter_email">Введите email</span>
                <input id="signin_password" type="password" placeholder="Пароль">
                <span id="signin_enter_password">Введите пароль</span>
                <button id="to_signin">Войти</button>
                <span id="signin_error">Неверный email или пароль</span>
                <div>
                    <label for="relocate_to_signup">Еще не аккаунта?</label>
                    <button type="button" id="relocate_to_signup" onclick="switch_signin_signup('sign-up')">
                        Зарегистрироваться</button>
                </div>
            </form>
            <form id="signup_form">
                <div id="text_regist">Регистрация</div>
                <input id="signup_email" placeholder="Email">
                <span id="signup_enter_email">Введите логин</span>
                <span id="signup_check_email">Email должен состоять из латинских букв, цифр, символа нижнего
                    подчеркивания и заканчиваться на '@mail.ru'</span>
                <input id="signup_name" placeholder="Имя">
                <span id="signup_enter_name">Введите имя</span>
                <span id="signup_check_name">Имя должно состоять только из латинских букв</span>
                <input id="signup_password" type="password" placeholder="Пароль">
                <span id="signup_enter_password">Введите пароль</span>
                <span id="signup_check_password">Пароль должен состоять из латинских букв, цифр, символов нижнего
                    подчеркивания и пробела, а также иметь длину не менее 6 символов</span>
                <button type="button" id="to_signup">Зарегистрироваться</button>
                <span id="server_message"></span>
                <div>
                    <label for="relocate_to_signin">Уже есть аккаунт?</label>
                    <button type="button" id="relocate_to_signin" onclick="switch_signin_signup('sign-in')">Войти</button>
                </div>
            </form>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
        <script src="js/sign-in.js"></script>
        <script src="js/sign-up.js"></script>
    </body>
    <%
        session.setAttribute("current-page", "/entrance");
    %>
</html>
