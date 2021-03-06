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
        <title>Cadastro Editora</title>
    <br>
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div class="d-flex justify-content-center mt-5 mb-5">
                <h3>Cadastro de Editora</h3>
            </div>

            <br>     

            <form action="" method="post" class="needs-validation" novalidate>

                <div class="form-row">
                    <div class="col mb-3">
                        <label for="validationCustom01">Nome</label>
                        <input type="text" class="form-control" id="validationCustom01" name="nome" placeholder="Nome da Editora" required>
                        <div class="invalid-feedback">
                            Por favor, insira o nome da editora.
                        </div>
                    </div>
                </div>
                <div class="form-row">                
                    <div class="col mb-3">
                        <label for="validationCustom02">Cidade</label>
                        <input type="text" class="form-control" id="validationCustom02" name="cidade" placeholder="Cidade da editora" required>
                        <div class="invalid-feedback">
                            Por favor, insira a cidade da editora.
                        </div>
                    </div>
                </div>


                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn botao1 mr-2">Adicionar</button>
                    <a href="listaEditoras.jsp" class="btn botao2">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
    <script>
        // Exemplo de JavaScript inicial para desativar envios de formul??rio, se houver campos inv??lidos.
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Pega todos os formul??rios que n??s queremos aplicar estilos de valida????o Bootstrap personalizados.
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
    String b = request.getParameter("cidade");
                
    if(a!=null && b!=null){
    String sql = "INSERT INTO editora(nome,cidade)VALUES(?,?)";
    pst=conn.prepareStatement(sql);
    pst.setString(1,a);
    pst.setString(2,b);
    pst.execute();
    response.sendRedirect("listaEditoras.jsp");
    }
%>