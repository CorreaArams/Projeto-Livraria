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
        <title>Cadastro Usuario</title>
    <br>
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div class="d-flex justify-content-center mt-5 mb-5">
                <h3>Cadastro de Usuário</h3>
            </div>

            <br>     

            <form action="" method="post" class="needs-validation" novalidate>

                <div class="form-row">
                    <div class="col mb-3">
                        <label for="validationCustom01">Nome Completo</label>
                        <input type="text" class="form-control" id="validationCustom01" name="nome" placeholder="Nome completo" required>
                        <div class="invalid-feedback">
                            Por favor, insira seu nome.
                        </div>
                    </div>
                </div>
                <div class="form-row">                
                    <div class="col mb-3">
                        <label for="validationCustom02">Senha</label>
                        <input type="password" class="form-control" id="validationCustom02" name="senha" placeholder="Autor da Obra" required>
                        <div class="invalid-feedback">
                            Por favor, insira uma senha.
                        </div>
                    </div>
                </div>


                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn botao1 mr-2">Adicionar</button>
                    <a href="listaUsuarios.jsp" class="btn botao2">Cancelar</a>
                </div>
            </form>
        </div>
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
  
    String a = request.getParameter("nome");    
    String b = request.getParameter("senha");
                
    if(a!=null && b!=null){
    String sql = "INSERT INTO usuario(nome,senha)VALUES(?,?)";
    pst=conn.prepareStatement(sql);
    pst.setString(1,a);
    pst.setString(2,b);
    pst.execute();
    response.sendRedirect("listaUsuarios.jsp");
    }
%>