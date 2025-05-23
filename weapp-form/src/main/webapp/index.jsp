<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <h3>Formulario de Usuarios</h3>
    <%
        if (errores != null && errores.size() > 0) {
            out.println("<ul class='alert alert-danger mx-5 px-5'>");
            for (String error : errores.values()) {
                out.println("<li>" + error + "</li>");
            }
            out.println("</ul>");
        }
    %>
    <div class="px-5">
        <form action="registro" method="post">
            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="nombre">Nombre:</label>
                <div class="col-sm-4">
                    <input class="form-control ${errores != null && errores.containsKey("nombre") ? "is-invalid" : ""}" type="text" id="nombre" name="nombre" value="${param.nombre}">
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("nombre")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("nombre") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="apellido">Apellido:</label>
                <div class="col-sm-4">
                    <input class="form-control ${errores != null && errores.containsKey("apellido") ? "is-invalid" : ""}" type="text" id="apellido" name="apellido" value="${param.apellido}">
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("apellido")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("apellido") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-4">
                    <input class="form-control ${errores != null && errores.containsKey("email") ? "is-invalid" : ""}" type="email" id="email" name="email" value="${param.email}">
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("email")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("email") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="telefono">Teléfono:</label>
                <div class="col-sm-4">
                    <input class="form-control ${errores != null && errores.containsKey("telefono") ? "is-invalid" : ""}" type="tel" id="telefono" name="telefono" value="${param.telefono}">
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("telefono")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("telefono") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="Pais">País:</label>
                <div class="col-sm-4">
                    <select name="pais" id="pais" class="form-select ${errores != null && errores.containsKey("pais") ? "is-invalid" : ""}">
                        <option value="">Seleccione un país</option>
                        <option value="Argentina" ${param.pais.equals("Argentina") ? "selected" : ""}>Argentina</option>
                        <option value="Chile" ${param.pais.equals("Chile") ? "selected" : ""}>Chile</option>
                        <option value="Colombia" ${param.pais.equals("Colombia") ? "selected" : ""}>Colombia</option>
                        <option value="Perú" ${param.pais.equals("Perú") ? "selected" : ""}>Perú</option>
                        <option value="Uruguay" ${param.pais.equals("Uruguay") ? "selected" : ""}>Uruguay</option>
                        <option value="Nicaragua" ${param.pais.equals("Nicaragua") ? "selected" : ""}>Nicaragua</option>
                    </select>
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("pais")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("pais") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="lenguajes">Lenguajes de Programacion:</label>
                <div class="col-sm-4">
                    <select name="lenguajes" id="lenguajes" multiple class="form-select ${errores != null && errores.containsKey("lenguajes") ? "is-invalid" : ""}">
                        <option value="">Seleccione un lenguaje</option>
                        <option value="Java" ${paramValues.lenguajes.stream().anyMatch(l -> l.equals("Java")).get() ? "selected" : ""}>Java</option>
                        <option value="Python" ${paramValues.lenguajes.stream().anyMatch(l -> l.equals("Python")).get() ? "selected" : ""}>Python</option>
                        <option value="JavaScript" ${paramValues.lenguajes.stream().anyMatch(l -> l.equals("JavaScript")).get() ? "selected" : ""}>JavaScript</option>
                        <option value="C#" ${paramValues.lenguajes.stream().anyMatch(l -> l.equals("C#")).get() ? "selected" : ""}>C#</option>
                        <option value="PHP" ${paramValues.lenguajes.stream().anyMatch(l -> l.equals("PHP")).get() ? "selected" : ""}>PHP</option>
                    </select>
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("lenguajes")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("lenguajes") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2">Roles:</label>
                <div class="col-sm-10 d-flex align-items-center">
                    <div class="form-check mx-2">
                        <input type="checkbox" id="admin" name="roles" value="admin" class="form-check-input" ${paramValues.roles.stream().anyMatch(r -> r.equals("admin")).get() ? "checked" : ""}>
                        <label class="form-check-label" for="admin">Administrador</label>
                    </div>
                    <div class="form-check mx-2">
                        <input type="checkbox" id="user" name="roles" value="user" class="form-check-input" ${paramValues.roles.stream().anyMatch(r -> r.equals("user")).get() ? "checked" : ""}>
                        <label class="form-check-label" for="user">Usuario</label>
                    </div>
                    <div class="form-check mx-2">
                        <input type="checkbox" id="guest" name="roles" value="guest" class="form-check-input" ${paramValues.roles.stream().anyMatch(r -> r.equals("guest")).get() ? "checked" : ""}>
                        <label class="form-check-label" for="guest">Invitado</label>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("roles")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("roles") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2">Idioma:</label>
                <div class="col-sm-10 d-flex align-items-center">
                    <div class="form-check mx-2">
                        <input type="radio" id="espanol" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es") ? "checked" : ""} />
                        <label class="form-check-label" for="espanol">Español</label>
                    </div>
                    <div class="form-check mx-2">
                        <input type="radio" id="ingles" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en") ? "checked" : ""} />
                        <label class="form-check-label" for="ingles">Inglés</label>
                    </div>
                    <div class="form-check mx-2">
                        <input type="radio" id="frances" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr") ? "checked" : ""} />
                        <label class="form-check-label" for="frances">Francés</label>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%
                    if (errores != null && errores.containsKey("idioma")) {
                        out.println("<div class='text-danger col-sm-4 offset-sm-2'>" + errores.get("idioma") + "</div>");
                    }
                %>
            </div>

            <div class="row mb-3">
                <label class="col-form-label col-sm-2" for="habilitar">Habilitar:</label>
                <div class="form-check col-sm-4 d-flex align-items-center">
                    <input type="checkbox" id="habilitar" name="habilitar" value="true" class="form-check-input">
                </div>
            </div>

            <div class="row mb-3">
                <div>
                    <input type="submit" value="Registrar" class="btn btn-primary">
                </div>
            </div>
        </form>
    </div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</html>