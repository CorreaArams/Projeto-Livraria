<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                <h3>Editar Livro</h3>
            </div>
            <br>


            <form action="" method="post">

                <%
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String sql = "SELECT * FROM livro WHERE id ='"+num+"'";
                pst=conn.prepareStatement(sql);
                rs=pst.executeQuery();
                while(rs.next()){
                
                %>

                <form action="" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                    <div class="form-row">
                        <div class="col mb-3">
                            <label for="validationCustom01">Título</label>
                            <input type="text" class="form-control" id="validationCustom01" name="titulo" value='<%=rs.getString("titulo")%>' placeholder="Título da Obra" required>
                            <div class="invalid-feedback">
                                Por favor, insira o Título do livro.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">                
                        <div class="col mb-3">
                            <label for="validationCustom02">Autor</label>
                            <input type="text" class="form-control" id="validationCustom02" name="autor" value='<%=rs.getString("autor")%>' placeholder="Autor da Obra" required>
                            <div class="invalid-feedback">
                                Por favor, insira o Autor do livro.
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col mb-3">
                            <label for="validationCustom03">Ano</label>
                            <input type="text" class="form-control" id="validationCustom03" name="ano" value='<%=rs.getString("ano")%>' placeholder="Ano de publicação" required>
                            <div class="invalid-feedback">
                                Por favor, insira o ano de publicação do livro
                            </div>
                        </div>
                        <div class="col mb-3">
                            <label for="validationCustom02">Id Editora</label>
                            <input type="text" class="form-control" id="validationCustom02" name="ideditora" value='<%=rs.getString("idEditora")%>' placeholder="Id da Editora" required>
                            <div class="invalid-feedback">
                                Por favor, insira o id da Editora.
                            </div>
                        </div>
                        <div class="col mb-3">
                            <label for="validationCustom04">Preço</label>
                            <input type="text" class="form-control" id="validationCustom04" name="preco" value='<%=rs.getString("preco")%>' placeholder="valor" required>
                            <div class="invalid-feedback">
                                Por favor,  insira o valor do livro.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">                
                        <div class="col mb-3">
                            <label for="validationCustom02">Foto</label>
                            <input type="text" class="form-control" id="validationCustom02" name="foto" value='<%=rs.getString("foto")%>' placeholder="URL da imagem" required>
                            <div class="invalid-feedback">
                                Por favor, insira a URL onde a foto está hospedada.
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
                        <a href="editLivro.jsp" class="btn btn-default botao2">Voltar</a>
                    </div>
                </form>



                

                <%
                    String a = request.getParameter("id");
                    String b = request.getParameter("titulo");    
                    String c = request.getParameter("autor");
                    String d = request.getParameter("ano");    
                    String e = request.getParameter("preco");
                    String f = request.getParameter("foto");
                    String g = request.getParameter("ideditora");
                    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
                    String sql2 = "UPDATE livro SET titulo=?, autor=?, ano=?, preco=?, foto=?, idEditora=? WHERE id ='"+a+"'";
                    pst=conn.prepareStatement(sql2);
                    pst.setString(1,b);
                    pst.setString(2,c);
                    pst.setString(3,d);
                    pst.setString(4,e);
                    pst.setString(5,f);
                    pst.setString(6,g);
                    pst.executeUpdate();
                    response.sendRedirect("editLivro.jsp");
                    }
                %>

