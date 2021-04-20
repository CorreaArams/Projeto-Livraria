<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="conexaoDB.jsp"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css"> 
        <title>Administrar Livros</title>
    <br>
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div class="d-flex justify-content-center mt-5 mb-5">
                <h3>Adicionar Livro</h3>
            </div>
 
            <br>     

            <form action="" method="post" class="needs-validation" novalidate>

                <div class="form-row">
                    <div class="col mb-3">
                        <label for="validationCustom01">Título</label>
                        <input type="text" class="form-control" id="validationCustom01" name="titulo" placeholder="Título da Obra" required>
                        <div class="invalid-feedback">
                            Por favor, insira o Título do livro.
                        </div>
                    </div>
                </div>
                <div class="form-row">                
                    <div class="col mb-3">
                        <label for="validationCustom02">Autor</label>
                        <input type="text" class="form-control" id="validationCustom02" name="autor" placeholder="Autor da Obra" required>
                        <div class="invalid-feedback">
                            Por favor, insira o Autor do livro.
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col mb-3">
                        <label for="validationCustom03">Ano</label>
                        <input type="text" class="form-control" id="validationCustom03" name="ano" placeholder="Ano de publicação" required>
                        <div class="invalid-feedback">
                            Por favor, insira o ano de publicação do livro
                        </div>
                    </div>
                    <div class="col mb-3">
                        <label for="validationCustom02">Id Editora</label>
                        <input type="text" class="form-control" id="validationCustom02" name="ideditora" placeholder="Id da Editora" required>
                        <div class="invalid-feedback">
                            Por favor, insira o id da Editora.
                        </div>
                    </div>
                    <div class="col mb-3">
                        <label for="validationCustom04">Preço</label>
                        <input type="text" class="form-control" id="validationCustom04" name="preco" placeholder="valor" required>
                        <div class="invalid-feedback">
                            Por favor,  insira o valor do livro.
                        </div>
                    </div>
                </div>
                <div class="form-row">                
                    <div class="col mb-3">
                        <label for="validationCustom02">Foto</label>
                        <input type="text" class="form-control" id="validationCustom02" name="foto" placeholder="URL da imagem" required>
                        <div class="invalid-feedback">
                            Por favor, insira a URL onde a foto está hospedada.
                        </div>
                    </div>
                </div>
              
               <div class="d-flex justify-content-center">
                <button type="submit" class="btn botao1 mr-2">Adicionar</button>
                <a href="editLivro.jsp" class="btn botao2">Cancelar</a>
            </div>
            </form>
            </div>

            <script>
                // Exemplo de JavaScript inicial para desativar envios de formulário, se houver campos inválidos.
                (function () {
                    'use strict';
                    window.addEventListener('load', function () {
                        // Pega todos os formulários que nós queremos aplicar estilos de validação Bootstrap personalizados.
                        var forms = document.getElementsByClassName('needs-validation');
                        // Faz um loop neles e evita o envio
                        var validation = Array.prototype.filter.call(forms, function (form) {
                            form.addEventListener('submit', function (event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();
            </script>

          
            </head>
            </html>
            <%
  
                String a = request.getParameter("titulo");    
                String b = request.getParameter("autor");
                String c = request.getParameter("ano");    
                String d = request.getParameter("preco");
                String e = request.getParameter("foto");    
                String f = request.getParameter("ideditora");
                if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
                String sql = "INSERT INTO livro(titulo,autor,ano,preco,foto,idEditora)VALUES(?,?,?,?,?,?)";
                pst=conn.prepareStatement(sql);
                pst.setString(1,a);
                pst.setString(2,b);
                pst.setString(3,c);
                pst.setString(4,d);
                pst.setString(5,e);
                pst.setString(6,f);
                pst.execute();
                response.sendRedirect("editLivro.jsp");
                }
            %>