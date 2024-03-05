<%--
  Created by IntelliJ IDEA.
  User: Paulo Martin
  Date: 3/1/2024
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        function acessarEnvio(){
            window.location.href="enviamusica.jsp";
        }
    </script>
    <title>Envia Suas Músicas</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <form method="POST" action="upload-servlet" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="file" class="form-label">Arquivo:</label>
            <input type="file" class="form-control" id="file" name="file">
        </div>
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" class="form-control" id="nome" name="nome">
        </div>
        <div class="mb-3">
            <label for="artista" class="form-label">Artista:</label>
            <input type="text" class="form-control" id="artista" name="artista">
        </div>
        <div class="mb-3">
            <label for="genero" class="form-label">Gênero Musical:</label>
            <select class="form-select" id="genero" name="genero">
                <option value="rock">Rock</option>
                <option value="pop">Pop</option>
                <option value="jazz">Jazz</option>
                <option value="eletronica">Eletrônica</option>
                <option value="blues">Blues</option>
                <option value="rap">Rap</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary" name="upload" id="upload">Upload</button>
    </form>
    <div class="d-flex justify-content-center mt-3">
        <a href="." class="text-center"><button class="btn btn-primary" type="button">Retornar</button></a>
    </div>
</div>
</body>
</html>
