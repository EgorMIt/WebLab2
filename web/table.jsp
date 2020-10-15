<%@ page import="model.Point" %>
<%@ page import="model.Model" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Model model = new Model();%>
<% if (!Model.points.isEmpty()) {  Point dot = Model.points.get(Model.points.size()-1); %>
<circle id="point2" r="3" cx="<%= dot.getX() %>" cy="<%= dot.getY() %>" fill="red" stroke="green" visibility="visible"></circle>
<% } %>
