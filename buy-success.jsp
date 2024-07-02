<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        if (session.getAttribute("current-user") == null)
            response.sendRedirect("/Laba567/entrance");
    %>
    <head>
        <meta charset="UTF-8">
        <title>Покупка совершена</title>
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
        </div>
        <div id="buying">
            <div id="buying_success">Покупка совершена!</div>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
    </body>
    <%
        session.removeAttribute("current-page");
        session.setAttribute("current-page", "/buying");
    %>
</html>