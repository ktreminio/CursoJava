package org.ktreminio.webapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/parametros/url-get")
public class ParametrosGetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String saludo = request.getParameter("saludo");
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("   <head>");
        out.println("       <meta charset=\"UTF-8\">");
        out.println("       <title>Parametros Get de la url</title>");
        out.println("   </head>");
        out.println("   <body>");
        out.println("       <h1>Parametros Get de la url!</h1>");
        out.println("       <p>El saludo es: " + saludo + "</p>");
        out.println("   </body>");
        out.println("</html>");
        out.close();
    }
}
