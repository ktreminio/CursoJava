package org.ktreminio.webapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/hola-mundo")
public class HolaMundoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("   <head>");
        out.println("       <meta charset=\"UTF-8\">");
        out.println("       <title>Hola Mundo Servlet</title>");
        out.println("   </head>");
        out.println("   <body>");
        out.println("       <h1>Hola Mundo desde un Servlet!</h1>");
        out.println("       <p>Este es un ejemplo de un servlet que responde con HTML.</p>");
        out.println("   </body>");
        out.println("</html>");
        out.close();
    }
}
