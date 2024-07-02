<%@ page import="java.io.File" %>
<%@ page import="servlets.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        if (session.getAttribute("current-user") == null)
            response.sendRedirect("/Laba567/entrance");
    %>
    <head>
        <title>Новости</title>
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
            </header>
            <div class="page_name">
                <span>Новости</span>
            </div>
            <div class="list-wrapper">
                <table id="news">
                    <%
                        String directory = DataBase.getDirectory() + "news";
                        try {
                            File[] news = new File(directory).listFiles();
                            for (int i = news.length - 1; i > -1; i--) {
                                String name = news[i].getName().substring(0, news[i].getName().length() - 5);
                                out.println("<tr><td><div class='new-heading'>" + DataBase.getNew(name).getHeading()
                                        + "</div><div class='new-content'>" + DataBase.getNew(name).getContent()
                                        + "</div><div class='new-published'>" + DataBase.getNew(name).getPublished()
                                        + "</div></td></tr>");
                            }
                        } catch (Exception e) {
                            out.println("Ошибка");
                        }
                    %>
                </table>
            </div>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
    </body>
    <%
        session.removeAttribute("current-page");
        session.setAttribute("current-page", "/news");
    %>
</html>