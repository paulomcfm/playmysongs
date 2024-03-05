<%@ page import="unoeste.fipp.playmysongs.security.User" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        User user = (User) session.getAttribute("user");
        boolean usuarioLogado = user != null && user.isAutenticado();
    %>
    <script>
        function acessarEnvio(){
            window.location.href="enviamusica.jsp";
        }
    </script>
    <title>Play My Songs</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="logo.png" alt="Logo" class="img-fluid" style="max-height: 50px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <% if (!usuarioLogado) { %>
            <form method="post" action="login-servlet" class="d-flex ms-auto">
                <input class="form-control me-2" type="text" placeholder="Login" name="login">
                <input class="form-control me-2" type="text" placeholder="Senha" name="pswd">
                <button class="btn btn-primary" type="submit">Logar</button>
            </form>
            <% } else { %>
            <form method="post" action="logout-servlet" class="d-flex ms-auto">
                <button class="btn btn-primary" type="submit">Deslogar</button>
            </form>
            <% } %>
        </div>
    </div>
</nav>
<div class="mb-3"></div>
<div class="input-group mb-3 position-absolute top-50 start-50 translate-middle" style="width: 50%;">
    <input type="text" class="form-control" placeholder="Digite sua busca" aria-label="Digite sua busca" aria-describedby="button-buscar">
    <button class="btn btn-primary" type="button" id="button-buscar">Buscar</button>
    <%
        File pastaweb=new File(request.getServletContext().getRealPath("")+"/musicas");
        for (File file : pastaweb.listFiles())
            if(file.isFile()) {
    %>
                <audio controls>
                    <source src="<%file.getName();%>" type="audio/mpeg">
                </audio>
    <%
            }
    %>

</div>



<% if (usuarioLogado) { %>
<button onclick="acessarEnvio()" class="btn btn-primary" type="button">Enviar Música</button>
<% } %>

</body>
</html>
