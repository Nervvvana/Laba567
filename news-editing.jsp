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
                    break;
                case "admin":
                    break;
            }
    %>
    <head>
        <title>Редактирование ленты новостей</title>
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
                <span>Редактирование ленты новостей</span>
            </div>
        </div>
        <div id="edit-news-wrapper" class="list-wrapper">
            <div>
                <table id="edit-news">
                    <thead>
                        <tr>
                            <td>Имя</td>
                            <td>Заголовок</td>
                            <td>Содержание</td>
                            <td>Опубликовано</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String directory = DataBase.getDirectory() + "news";
                            try {
                                File[] news = new File(directory).listFiles();
                                for (int i = news.length - 1; i > -1; i--) {
                                    String name = news[i].getName().substring(0, news[i].getName().length() - 5);
                                    out.println(
                                        "<tr>" +
                                            "<td>" + name + "</td>" +
                                            "<td><textarea class='edit-heading'>" +
                                                DataBase.getNew(name).getHeading() + "</textarea><br>" +
                                                "<span class='errors'>Заголовок не может быть пустым</span></td>" +
                                            "<td><textarea class='edit-content'>" +
                                                DataBase.getNew(name).getContent() + "</textarea><br>" +
                                                "<span class='errors'>Содержимое не может быть пустым</span></td>" +
                                            "<td>" + DataBase.getNew(name).getPublished() + "</td>" +
                                            "<td><button class='save-news'>Сохранить</button><br>" +
                                                "<button class='remove-news'>Удалить</button></td>" +
                                        "</tr>"
                                    );
                                }
                            } catch (Exception e) {
                                out.println("Ошибка");
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="add-new-wrapper">
                <button id="add-new" onclick="addNew()">+ Добавить новость</button>
            </div>
            <div id="adding-new">
                <table>
                    <tr>
                        <td>
                            <label>Заголовок</label><br>
                            <textarea id="added-new-heading" class="edit-heading"></textarea><br>
                            <span id="empty-added-new-heading" class="errors">Заголовок не может быть пустым</span>
                        </td>
                        <td>
                            <label>Содержание</label><br>
                            <textarea id="added-new-content" class="edit-content"></textarea><br>
                            <span id="empty-added-new-content" class="errors">Содержание не может быть пустым</span>
                        </td>
                        <td>
                            <button class="button-add-new" onclick="enableAdding()">Добавить</button><br>
                            <button class="button-add-new" onclick="cancelAdding()">Отмена</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
        <script src="js/news-editing.js"></script>
    </body>
    <%
        session.removeAttribute("current-page");
        session.setAttribute("current-page", "/news-editing");
    %>
</html>
