<%@ page import="java.io.File" %>
<%@ page import="servlets.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        if (session.getAttribute("current-user") == null)
            response.sendRedirect("/Laba567/entrance");
        else
            switch ((String)session.getAttribute("role")) {
                case "user":
                    response.sendRedirect("/Laba567" + (String)session.getAttribute("current-page"));
                    break;
                case "moder":
                    response.sendRedirect("/Laba567" + (String)session.getAttribute("current-page"));
                    break;
                case "admin":
                    break;
            }
    %>
    <head>
        <title>Редактирование пользователей</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div>
            <header>
                <button id="text_logo">Эльдорадо 2</button>
                <button class="header_buttons" onclick="pageRedirect('/entrance')">Выход</button>
                <%=
                    "<button class='header_buttons' onclick=\"pageRedirect('/"
                        + (String) session.getAttribute("role")
                        + "')\">Личный кабинет</button>"
                %>
                <button class="header_buttons" onclick="pageRedirect('/catalog')">Каталог</button>
                <button class="header_buttons" onclick="pageRedirect('/news')">Новости</button>
            </header>
            <div class="page_name">
                <span>Редактирование пользователей</span>
            </div>
        </div>
        <div id="edit-users-wrapper" class="list-wrapper">
            <div>
                <table id="edit-users">
                    <thead>
                    <tr>
                        <td>Email</td>
                        <td>Имя</td>
                        <td>Роль</td>
                        <td>Кол-во посещений</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            String directory = DataBase.getDirectory() + "users";
                            File[] users = new File(directory).listFiles();

                            String rootRowHtml = "<tr>";
                            switch ((String)session.getAttribute("current-user")) {
                                case "admin":
                                    rootRowHtml +=
                                        "<td>admin</td>" +
                                        "<td><input type='text' class='edit-name' value='" +
                                            DataBase.getUser("admin").getName() + "'></input><br>" +
                                            "<span class='errors'>Имя не может быть пустым</span></td>" +
                                        "<td>Администратор</td>" +
                                        "<td>" + DataBase.getUser("admin").getSign_in_count() + "</td>" +
                                        "<td><button class='save-users'>Сохранить</button></td>";
                                    break;
                                default:
                                    rootRowHtml +=
                                        "<td>admin</td>" +
                                        "<td>root</td>" +
                                        "<td>Администратор</td>" +
                                        "<td>" + DataBase.getUser("admin").getSign_in_count() + "</td>" +
                                        "<td></td>";
                                    break;
                            }
                            rootRowHtml += "</tr>";
                            out.println(rootRowHtml);

                            for (int i = 0; i < users.length; i++) {
                                String email = users[i].getName().substring(0, users[i].getName().length() - 5);
                                if (!(email.equals("admin"))) {
                                    String role = DataBase.getUser(email).getRole();
                                    String changeRoleHtml = "<td><select class='edit-role'>";
                                    switch (role) {
                                        case "user":
                                            changeRoleHtml +=
                                                "<option value='user' selected>Пользователь</option>" +
                                                "<option value='moder'>Модератор</option>" +
                                                "<option value='admin'>Администратор</option>";
                                            break;
                                        case "moder":
                                            changeRoleHtml +=
                                                "<option value='user'>Пользователь</option>" +
                                                "<option value='moder' selected>Модератор</option>" +
                                                "<option value='admin'>Администратор</option>";
                                            break;
                                        case "admin":
                                            changeRoleHtml +=
                                                "<option value='user'>Пользователь</option>" +
                                                "<option value='moder'>Модератор</option>" +
                                                "<option value='admin' selected>Администратор</option>";
                                            break;
                                    }
                                    changeRoleHtml += "</select></td>";

                                    out.println(
                                        "<tr>" +
                                            "<td>" + email + "</td>" +
                                            "<td><input type='text' class='edit-name' value='" +
                                            DataBase.getUser(email).getName() + "'></input><br>" +
                                            "<span class='errors'>Имя не может быть пустым</span></td>" +
                                            changeRoleHtml +
                                            "<td>" + DataBase.getUser(email).getSign_in_count() + "</td>" +
                                            "<td><button class='save-users'>Сохранить</button><br>" +
                                            "<button class='remove-users'>Удалить</button></td>" +
                                            "</tr>"
                                    );
                                }
                            }
                        } catch (Exception e) {
                            out.println("Ошибка");
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div id="add-user-wrapper">
                <button id="add-user" onclick="addUser()">+ Добавить пользователя</button>
            </div>
            <div id="adding-user">
                <table>
                    <tr>
                        <td>
                            <input type="text" placeholder="Email" id="added-user-email" class="edit-email"><br>
                            <span id="added-user-email-error" class="errors">Пользователь с таким Email уже существует</span>
                            <span id="empty-added-user-email" class="errors">Email не может быть пустым</span>
                        </td>
                        <td>
                            <input type="text" placeholder="Имя" id="added-user-name" class="edit-name"><br>
                            <span id="empty-added-user-name" class="errors">Имя не может быть пустым</span>
                        </td>
                        <td>
                            <select id="added-user-role" class="edit-role">
                                <option value='user' selected>Пользователь</option>
                                <option value='moder'>Модератор</option>
                                <option value='admin'>Администратор</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" placeholder="Пароль" id="added-user-password" class="edit-password"><br>
                            <span id="empty-added-user-password" class="errors">Пароль не может быть пустым</span>
                        </td>
                        <td>
                            <button class="button-add-user" onclick="enableAdding()">Добавить</button><br>
                            <button class="button-add-user" onclick="cancelAdding()">Отмена</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
        <script src="js/users-editing.js"></script>
    </body>
    <%

        session.removeAttribute("current-page");
        session.setAttribute("current-page", "/users-editing");
    %>
</html>
