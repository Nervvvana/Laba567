<%@ page import="servlets.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <%
        if (session.getAttribute("current-user") == null)
            response.sendRedirect("/Laba567/entrance");
        else
            switch ((String)session.getAttribute("role")) {
                case "user":
                    response.sendRedirect("/Laba567/user");
                    break;
                case "moder":
                    response.sendRedirect("/Laba567/moder");
                    break;
                case "admin":
                    break;
            }
    %>
    <head>
        <title>Кабинет администратора</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div>
            <header>
                <button id="text_logo">Эльдорадо 2</button>
                <button class="header_buttons" onclick="pageRedirect('/entrance')">Выход</button>
                <button class="header_buttons" onclick="pageRedirect('/catalog')">Каталог</button>
                <button class="header_buttons" onclick="pageRedirect('/news')">Новости</button>
            </header>
            <div class="page_name">
                <span>Личный кабинет</span>
            </div>
        </div>
        <div id="personal_cabinet_wrapper">
            <table id="personal_cabinet">
                <tr>
                    <td>
                        <%
                            out.println(
                                "<img id='avatar' src='img/temp/" +
                                DataBase.getUser((String)session.getAttribute("current-user")).getAvatar() + "'>"
                            );
                        %>
                    </td>
                    <td>
                        <div>
                            Здравствуйте,
                            <%=
                            DataBase.getUser((String)session.getAttribute("current-user")).getName()
                            %>
                            <div class="block">
                                Количество авторизаций:
                                <%=
                                DataBase.getUser((String)session.getAttribute("current-user")).getSign_in_count()
                                %>
                            </div><br>
                            <div class="block">
                                Вход на страницу был осуществлен в:
                                <%=
                                session.getAttribute("sign-in-time")
                                %>
                            </div>
                        </div>
                        <button id="users-editing-btn" onclick="pageRedirect('/users-editing')">
                            Редактировать пользователей</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form method="post" action="http://localhost:8080/Laba567/file-servlet" enctype="multipart/form-data">
                            <input type="file" id="photo" name="file-name"><br>
                            <button type="submit">Загрузить фото</button>
                        </form>
                    </td>
                    <td>
                        <button id="news-editing-btn" onclick="pageRedirect('/news-editing')">
                            Редактировать ленту новостей</button>
                    </td>
                </tr>
            </table>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
    </body>
    <%
        session.removeAttribute("current-page");
        session.setAttribute("current-page", "/admin");
    %>
</html>