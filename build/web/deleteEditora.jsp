<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

    <%@include file="conexaoDB.jsp"%>
<%
    
    String id = request.getParameter("d");
    int no = Integer.parseInt(id);
    String sql3 = "DELETE FROM editora WHERE id='"+no+"'";
    pst=conn.prepareStatement(sql3);
    pst.executeUpdate();
    response.sendRedirect("listaEditoras.jsp");
%>
    