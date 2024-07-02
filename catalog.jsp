<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        if (session.getAttribute("current-user") == null)
            response.sendRedirect("/Laba567/entrance");
    %>
    <head>
        <title>Каталог</title>
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
                <button class="header_buttons" onclick="pageRedirect('/news')">Новости</button>
            </header>
            <div class="page_name">
                <span>Каталог</span>
            </div>
        </div>
        <div id="offers" class="list-wrapper">
            <ul>
                <li class="offer">
                    <img src="img/fridge.jpg" id="fridge"><br>
                    <span>Холодильник BOSCH</span><br><br>
                    <span class="offer_price">49900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/washing_machine.jpg" id="washing_machine"><br>
                    <span>Стиральная машина SAMSUNG</span><br><br>
                    <span class="offer_price">19900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/tv.jpg" id="tv"><br>
                    <span>Телевизор LG</span><br><br>
                    <span class="offer_price">23900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/vacuum_cleaner.jpg" id="vacuum_cleaner"><br>
                    <span>Пылесос BOSCH</span><br><br>
                    <span class="offer_price">9900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/stove.jpg" id="stove"><br>
                    <span>Плита GORENJE</span><br><br>
                    <span class="offer_price">28900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/fan.jpg" id="fan"><br>
                    <span>Фен PHILIPS</span><br><br>
                    <span class="offer_price">3900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/iron.jpg" id="iron"><br>
                    <span>Утюг PHILIPS</span><br><br>
                    <span class="offer_price">4900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/microwave.jpg" id="microwave"><br>
                    <span>Микроволновая печь SAMSUNG</span><br><br>
                    <span class="offer_price">8900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
                <li class="offer">
                    <img src="img/toaster.jpg" id="toaster"><br>
                    <span>Тостер Tefal</span><br><br>
                    <span class="offer_price">1900</span>
                    <button class="add_offer" onclick="pageRedirect('/buying')">Купить</button>
                </li>
            </ul>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/utils.js"></script>
    </body>
    <%
        session.removeAttribute("current-page");
        session.setAttribute("current-page", "/catalog");
    %>
</html>