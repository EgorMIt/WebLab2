<%@ page import="model.Model" %><%--
  Created by IntelliJ IDEA.
  User: EgorMit
  Date: 09.10.2020
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lab2</title>

    <style>
        <%@include file='css/style.css' %>
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<div class="content">
    <form id="form" method="GET">

        <div class="graphic card">
            <p style="visibility: hidden">maybe grafic is here</p>
            <%@ include file="graficc.html" %>
            <circle id="point" r="3" cx="125" cy="125" fill="white" stroke="#641AD5" visibility="visible"></circle>
            <jsp:include page="table.jsp" />
            </svg>
        </div>

        <div class="input-pole card">
            <p class="textx" style="margin-left: 20px; margin-top: 10px; font-family: 'Arial'">Введите X </p>
            <section class="check-values x">
                <input type="checkbox" id="q" name="x" value="-2" class="check-box">-2<Br>
                <input type="checkbox" id="w" name="x" value="-1.5" class="check-box">-1.5<Br>
                <input type="checkbox" id="e" name="x" value="-1" class="check-box">-1<Br>
                <input type="checkbox" id="r" name="x" value="-0.5" class="check-box">-0.5</p>
                <input type="checkbox" id="t" name="x" value="0" class="check-box">0<Br>
                <input type="checkbox" id="y" name="x" value="0.5" class="check-box">0.5<Br>
                <input type="checkbox" id="u" name="x" value="1" class="check-box">1<Br>
                <input type="checkbox" id="i" name="x" value="1.5" class="check-box">1.5</p>
                <input type="checkbox" id="o" name="x" value="2" class="check-box">2<Br>

            </section>

            <div class="Y_coordinate">
                <span style="margin-left: 20px"> Y: </span>
                <input type="text" name="Y" id="Y_field" placeholder="[-3..5] " class="qw">
            </div>

            <div class="Y_coordinate">
                <span style="margin-left: 20px"> R: </span>
                <input type="text" name="R" id="R_field" placeholder="[2..5] " class="qw2">
            </div>

            <div class="X_coordinate">
                <input name="Xgr" id="X_field" type="hidden">
            </div>

            <button type="submit" class="button" id="submit"
                    style="margin-top: 20px ; margin-left: 20px; font-family: Arial; border-radius: 2px"> Отправить
            </button>
            <button type="submit" id="submit2" style="display: none; "></button>

        </div>
        <div class="table-data card">

            <table border="1px" class="result-table" style="margin-top: 10px; color: antiquewhite; box-shadow: #db2d2d;font-family: 'Arial Black';font-size: 20px">
                <thead>
                <td id="tbX"> X</td>
                <td id="longY"> Y</td>
                <td id="tbR"> R</td>
                <td style="  width: 60px;"> RESULT</td>

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
    </form>
</div>
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
