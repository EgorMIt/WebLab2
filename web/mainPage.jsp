<%@ page import="model.Model" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Lab2</title>
    <style>
        <%@include file='css/style.css' %>
    </style>
    <link rel="shortcut icon" href="smorc.png" type="image/png">

</head>
<body bgcolor="#931C14" background="space.jpg">
<form id="form" method="GET">
    <table class="table">
        <thead>
        <tr>
            <th colspan="2" class="table"> <!-- заголовок -->
                <div class="header-text">Митрофанов Егор Юрьевич, P3214, вариант 13421 </div>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr class="plot"> <!-- здесь будет график -->
            <td class="plot" colspan="2">
                <div class="graphic card">
                    <p style="visibility: hidden">grafic</p>
                    <%@ include file="graficc.html" %>
                    <circle id="point" r="3" cx="125" cy="125" fill="white" stroke="#641AD5" visibility="visible"></circle>
                    <jsp:include page="table.jsp" />
                    </svg>
                </div>
            </td>
        </tr>
        <tr> <!-- здесь будет выбор из списка X -->
            <td class="table">
                <div id="label_x">Введите X</div>
            </td>
            <td class="table">
                <section class="check-values x">
                    <input type="checkbox" id="q" name="x" value="-3" class="check-box">-3<Br>
                    <input type="checkbox" id="w" name="x" value="-2" class="check-box">-2<Br>
                    <input type="checkbox" id="e" name="x" value="-1" class="check-box">-1<Br>
                    <input type="checkbox" id="r" name="x" value="0" class="check-box">0</p>
                    <input type="checkbox" id="t" name="x" value="1" class="check-box">1<Br>
                    <input type="checkbox" id="y" name="x" value="2" class="check-box">2<Br>
                    <input type="checkbox" id="u" name="x" value="3" class="check-box">3<Br>
                    <input type="checkbox" id="i" name="x" value="4" class="check-box">4</p>
                    <input type="checkbox" id="o" name="x" value="5" class="check-box">5<Br>
                </section>
            </td>
        </tr>

        <tr> <!-- здесь будет ввод Y -->
            <td class="table">
                <div id="label_y">Y:</div>
            </td>
            <td class="table">
                <input type="text" name="Y" id="Y_field" placeholder="[-5..3] " class="qw">
            </td>
        </tr>

        <tr> <!-- здесь будет выбор по кнопке R -->
            <td class="table">
                <div id="label_r">R:</div>
            </td>
            <td class="table">
                <input type="text" name="R" id="R_field" placeholder="[1..4] " class="qw2">
            </td>
        </tr>

        <div class="X_coordinate">
            <input name="Xgr" id="X_field" type="hidden">
        </div>

        <tr> <!-- здесь будет кнопка подтверждения -->
            <td class="table">
                <label>Ввод значений</label>
            </td>
            <td>
                <form action="server_checking.php" method="GET">
                    <button type="submit" class="button" id="submit"
                            style="margin-top: 20px ; margin-left: 20px; font-family: Arial; border-radius: 2px"> Отправить
                    </button>
                    <button type="submit" id="submit2" style="display: none; "></button>
                </form>
            </td>
        </tr>

        <tr>
            <div class="table-data card">
                <p style="text-align: center; font-size: 20px;  font-family: 'Arial Black'; color: blanchedalmond; margin-top: 5px;" >Здесь будет таблица</p>
                <table border="1px" class="result-table" style="margin-top: 10px; color: antiquewhite; box-shadow: #db2d2d;font-family: 'Arial Black';font-size: 20px">
                    <thead>
                    <td id="tbX"> X</td>
                    <td id="longY"> Y</td>
                    <td id="tbR"> R</td>
                    <td style="  width: 60px;"> RESULT </td>

                    </thead>
                    <tbody id="table_out">
                    <ul>
                        <%
                            if (!Model.Dots.isEmpty()) {
                                for (int i = Model.Dots.size()-1; i >= 0; i--) {
                                    out.println(Model.Dots.get(i).toString());
                                }
                            }
                        %>
                    </ul>
                    </tbody>
                </table>
            </div>
        </tr>
        </tbody>
    </table>
</form>
<script type="text/javascript">
    <%@include file="/valid/validation.js"%>
</script>

<script type="text/javascript">
    <%@include file="/valid/send_get.js"%>
</script>
<script type="text/javascript">
    <%@include file="/valid/click.js"%>
</script>
</body>
</html>