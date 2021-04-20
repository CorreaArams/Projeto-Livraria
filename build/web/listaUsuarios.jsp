<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <html>
        <%@include file="conexaoDB.jsp"%>   
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
                  integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
            <%@include file="menuAdm.jsp"%>  

            <title>Catalogo</title>
        <br>
        <div class="row">
            <div class="col-md-1">
            </div> 
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-10">
                        <h4 class="font-weight-light">Lista de Usuários - Edição</h4>
                    </div>
                    <div class="col-md-1 ml-2">
                        <a href="cadastroUsuario.jsp" class="btn btn-primary">Adicionar usuário</a> 
                    </div>

                </div>    
            </div>
        </div>
        <p></p>

        <div class="row">
            <div class="col-md-4">
            </div> 
            <div class="col-md-4">
                <table class="table table-sm table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nome</th>
                            <th>Senha</th>
                            <th class="text-center">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            String sql = "SELECT * FROM usuario ORDER BY id ASC";
                            pst = conn.prepareStatement(sql);
                            rs = pst.executeQuery();
                            while (rs.next()) {

                        %>
                        <tr>
                            <td><%=rs.getString("id")%></td>
                            <td><%=rs.getString("nome")%></td>
                            <td><%=rs.getString("senha")%></td>
                            <td class="text-center">

                                <a href='updateUsuario.jsp?u=<%=rs.getString("id")%>' class="btn btn-success mr-2">Editar</a>
                                <a href='deleteUsuario.jsp?d=<%=rs.getString("id")%>' class="btn btn-danger" onclick='return pergunta();'>Excluir</a>

                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>  
        </div>  
        <script>
            function pergunta() {
                // retorna true se confirmado, ou false se cancelado
                return confirm('Tem certeza que quer excluir este usuario? Esta ação é Irreversível');
            }
        </script>
    </head>   
</html>
