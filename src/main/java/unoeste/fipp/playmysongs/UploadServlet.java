package unoeste.fipp.playmysongs;

import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,    // 1MB *
        maxFileSize=1024*1024*100,      // 100MB **
        maxRequestSize=1024*1024*10*10  // 100MB ***
)
@WebServlet(name = "uploadServlet", value = "/upload-servlet")
public class UploadServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        try
        {
            response.setContentType("text/html;charset=UTF-8");
            File pastaMusicas = new File(getServletContext().getRealPath("/"), "musicas");
            if (!pastaMusicas.exists()) {
                pastaMusicas.mkdir();
            }
            String nome = request.getParameter("nome").replaceAll("\\s+", "");;
            String genero = request.getParameter("genero");
            String artista = request.getParameter("artista").replaceAll("\\s+", "");;
            Pattern pattern = Pattern.compile("^[a-zA-Z0-9]*$");
            Matcher matcherNome = pattern.matcher(nome);
            Matcher matcherArtista = pattern.matcher(artista);
            if(matcherNome.matches() && matcherArtista.matches()) {
                // Lê o arquivo de upload
                Part filePart = request.getPart("file");
                String fileName = nome + "_" + genero + "_" + artista + ".mp3"; // Define o novo nome do arquivo

                OutputStream out = null;
                InputStream filecontent = null;
                //criando a pasta
                out = new FileOutputStream(new File(pastaMusicas.getAbsolutePath() + "/" + fileName));
                filecontent = filePart.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
                //out.close(); filecontent.close();  writer.close();
                response.sendRedirect("enviamusica.jsp");
                return;
            }else{
                response.sendRedirect("enviamusica.jsp");
                return;
            }
        }
        catch (Exception fne)
        { writer.println("Erro ao receber o arquivo");
            writer.println("<br/> ERRO: " + fne.getMessage());
        }
    }
}