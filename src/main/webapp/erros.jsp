<%--
  Created by IntelliJ IDEA.
  User: Paulo Martin
  Date: 20/02/2024
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>CONTROLE DE ERROS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div>
        <p>
            Ops... algo deu errado.
        </p>
        <p>Entre em contato com o setor de desenvolvimento!</p>
        <p>
            <%
                out.println(exception.getMessage());
            %>
        </p>
        <a href="." class="text-center"><button class="btn btn-primary" type="button">Retornar</button></a>
    </div>
</body>
</html>
