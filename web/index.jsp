<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="pt-br">
    <html>
        <%@include file="conexaoDB.jsp"%>   
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
                  integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
            <link rel="stylesheet" href="style.css"> 

        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light row bg-primary">            
                <a class="navbar-brand text-white">Booksplace</a>
            
                <div class="col-md-7 d-flex justify-content-center">
                    <form class="form-inline form-inline my-2 my-lg-0" method="post" action="index.jsp">
                        <input class="tam2 mr-2" type="text" name="pesquisar" class="form-control" placeholder="Pesquise por titulo">
                        <button type="submit" name="save" class="btn btn-outline-light my-2 my-sm-0">Pesquisar</button>
                    </form>
                </div>



                <%                    HttpSession sessao = request.getSession();
                    if (sessao.getAttribute("logado") == null) {
                        sessao.setAttribute("logado", "false");
                    }
                    if (sessao.isNew() || sessao.getAttribute("logado").equals("false")) {

                %> 
                <div class="col-md-5 d-flex justify-content-center">
                    <form class="form-inline form-inline my-2 my-lg-0" method="post" action="Login">  
                        <input class="tam mr-2" type="text" name="usuario" class="form-control" placeholder="Nome">
                        <input class="tam mr-2" type="password" name="senha" class="form-control" placeholder="Senha">
                        <button type="submit" value="Login" class="btn btn-outline-success">Entrar</button>
                    </form>
                </div>
                <%                } else {
                %> 
                <div class="col">
                    <div class="col d-flex justify-content-end">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="navbar-brand text-white mr-5"> Bem vindo(a), <%= session.getAttribute("username")%>!!!</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white ml-5" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Menu
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="editLivro.jsp">Menu Adm</a>
                                    <div class="dropdown-divider"></div>
                                    <form action="Logout">
                                        <button type="submit" value="Logout" class="btn btn-danger text-white ml-4">Logout</button>
                                    </form>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <%
                        }
                    %>

            </nav>
        </div>



        <%
            String sql = "";
        %>


        <div class="container-fluid text-center  my-3">
            <h3 class="font-weight-light">Booksplace a Sua Livraria Online</h3>
            <div class="row d-flex justify-content-center">
                <div class="col-md-1">
                </div>

                <%
                    String pesquisar = request.getParameter("pesquisar");
                    

                    if (pesquisar != null) {

                        sql = "select * from livro where titulo like '%" + pesquisar + "%'";
                    } else {
                        sql = "select * from livro";
                    }

                    pst = conn.prepareStatement(sql);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                    %>


                <div class="col-md-2 mt-3 mb-3">
                    <div class="card card-body">
                        <div class="mt-3">
                            <a href="<%=rs.getString("foto")%>"><img src="<%=rs.getString("foto")%> "style="width: 140px; height: 200px"></a>
                        </div>

                        <h6><b><%=rs.getString("titulo")%></b></h6> 
                        Autor: <%=rs.getString("autor")%><br>
                        Código: <%=rs.getString("id")%><br>
                        Editora: <%=rs.getString("idEditora")%><br>
                        Ano: <%=rs.getString("ano")%><br>
                        Preço: R$<%=rs.getString("preco")%>0<br>


                    </div>
                </div>


                <%
                    }
                %>
                <div class="col-md-1">
                </div>

            </div>

        </div>
                <br>
             
                <div class="text-center bg-primary">

                <a class="text-white">© 2020 Todos os direitos reservados: Lucas Corrêa</a>
            </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
                integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>


        <script>
            function pergunta() {
                // retorna true se confirmado, ou false se cancelado
                return confirm('Tem certeza que quer excluir este livro? Esta ação é Irreversível');
            }

            $(document).ready(function () {
                $(".dropdown-toggle").dropdown();
            });



        </script>

    </head>   
</html>
