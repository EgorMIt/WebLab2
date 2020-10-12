<%@ page import="java.util.ArrayList" %>
<%@ page import="point.Dot" %>
<%@ page import="model.Model" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Model model = new Model();%>
<% if (!Model.Dots.isEmpty()) {  Dot dot = Model.Dots.get(Model.Dots.size()-1); %>
<circle id="point2" r="3" cx="<%= dot.getX() %>" cy="<%= dot.getY() %>" fill="red" stroke="green" visibility="visible"/>
<% } %>
