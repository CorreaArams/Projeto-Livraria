<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="conexaoDB.jsp"%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"> 
    <title>Atualizar</title>
    <br>
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div class="d-flex justify-content-center mt-5 mb-5">
                <h3>Editar Usuario</h3>
            </div>
            <br>


            <form action="" method="post">

                <%
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String sql = "SELECT * FROM usuario WHERE id ='"+num+"'";
                pst=conn.prepareStatement(sql);
                rs=pst.executeQuery();
                while(rs.next()){
                
                %>

                <form action="" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                    <div class="form-row">
                        <div class="col mb-3">
                            <label for="validationCustom01">Nome</label>
                            <input type="text" class="form-control" id="validationCustom01" name="nome" value='<%=rs.getString("nome")%>' placeholder="nome" required>
                            <div class="invalid-feedback">
                                Por favor, um nome.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">                
                        <div class="col mb-3">
                            <label for="validationCustom02">senha</label>
                            <input type="text" class="form-control" id="validationCustom02" name="senha" value='<%=rs.getString("senha")%>' placeholder="Senha" required>
                            <div class="invalid-feedback">
                                Por favor, uma senha.
                            </div>
                        </div>
                    </div>

                    </div>
                    </div>
                    <%
                    }    
                    %>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-warning botao1 mr-2">Atualizar</button>
                        <a href="listaUsuarios.jsp" class="btn btn-default botao2">Voltar</a>
                    </div>
                </form>



                </html>

                <%
                    String a = request.getParameter("id");
                    String b = request.getParameter("nome");    
                    String c = request.getParameter("senha");
                 
                    if(a!=null && b!=null && c!=null){
                    String sql2 = "UPDATE usuario SET nome=?, senha=? WHERE id ='"+a+"'";
                    pst=conn.prepareStatement(sql2);
                    pst.setString(1,b);
                    pst.setString(2,c);
                    pst.executeUpdate();
                    response.sendRedirect("listaUsuarios.jsp");
                    }
                %>


