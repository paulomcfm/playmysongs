package unoeste.fipp.playmysongs;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import unoeste.fipp.playmysongs.security.User;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login = request.getParameter("login");
        if(login!=null){
            String senha = request.getParameter("pswd");
            if(senha!=null){
                Pattern pattern = Pattern.compile( "^[a-zA-Z0-9_+&*-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$");
                Matcher matcher = pattern.matcher(login);
                if(matcher.matches()){
                    String[] parts = login.split("@");
                    if(senha.equals(parts[0])){
                        User usuario = new User(login);
                        HttpSession session = request.getSession();
                        session.setAttribute("user",usuario);
                        response.sendRedirect(".");
                        return;
                    }
                }
            }
        }
        response.sendRedirect(".");
        return;
    }

}