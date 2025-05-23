package org.ktreminio.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.*;

@WebServlet("/registro")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        String pais = req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");
        String idioma = req.getParameter("idioma");
        String habilitar = req.getParameter("habilitar");

        Map<String, String> errores = new HashMap<>();

        if (nombre == null || nombre.isBlank()) {
            errores.put("nombre", "El campo nombre es obligatorio.");
        }
        if (apellido == null || apellido.isBlank()) {
            errores.put("apellido", "El campo apellido es obligatorio.");
        }
        if (email == null || email.isBlank() || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            errores.put("email", "El campo email es obligatorio.");
        }
        if (telefono == null || telefono.isBlank()) {
            errores.put("telefono", "El campo teléfono es obligatorio.");
        }
        if (pais == null || pais.isEmpty()) {
            errores.put("pais", "El campo país es obligatorio.");
        }
        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes", "Debe seleccionar al menos un lenguaje.");
        }
        if (roles == null || roles.length == 0) {
            errores.put("roles", "Debe seleccionar al menos un rol.");
        }
        if (idioma == null || idioma.isBlank()) {
            errores.put("idioma", "El campo idioma es obligatorio.");
        }

        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("   <head>");
                out.println("       <meta charset=\"UTF-8\">");
                out.println("       <title>Resultado Form</title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("       <h1>Resultado Form</h1>");
                out.println("       <ul>");
                out.println("           <li>Nombre: " + nombre + "</li>");
                out.println("           <li>Apellido: " + apellido + "</li>");
                out.println("           <li>Email: " + email + "</li>");
                out.println("           <li>Teléfono: " + telefono + "</li>");
                out.println("           <li>País: " + pais + "</li>");
                out.println("           <li>Lenguajes: ");
                out.println("           <ul>");
                Arrays.asList(lenguajes).forEach(l -> {
                    out.println("               <li>" + l + "</li>");
                });
                out.println("           </ul>");
                out.println("           </li>");
                out.println("           <li>Roles: ");
                out.println("           <ul>");
                Arrays.asList(roles).forEach(r -> {
                    out.println("               <li>" + r + "</li>");
                });
                out.println("           </ul>");
                out.println("           </li>");
                out.println("           <li>Idioma: " + idioma + "</li>");
                out.println("           <li>Habilitar: " + (habilitar != null ? "Sí" : "No") + "</li>");
                out.println("       </ul>");
                out.println("   </body>");
                out.println("</html>");
            }
        } else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
