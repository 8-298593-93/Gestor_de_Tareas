<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="java.util.ArrayList"%>
<% 
    if(session.getAttribute("listatarea")==null){
        ArrayList<Tarea>lisaux=new ArrayList<Tarea>();
        session.setAttribute("listatarea", lisaux);
    }
    ArrayList<Tarea>lista=(ArrayList<Tarea>)session.getAttribute("listatarea");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            th{
                color: #FF5733;
            }
            .nuevo{
                color:#FEFFFF;
                padding-top:15px;
                padding-bottom:15px;
                padding-left:40px;
                padding-right:40px;
                background-color:#2ECC71;
                border-color: #2ECC71;
                border-width: 3px;
                border-style: solid;
                border-radius:10px;
                text-decoration: none;
                padding: 10px;
                font-size: 20px;
                
            }
            .nombre{
                color:#FFD27D;
                font-size: 30px;
                padding: 6px;
                font-family: "Lucida Console", Courier, monoespacio;
            }
        </style>
    </head>
    <body>
    <center>
       <h1>Gestor de Tareas</h1>
       <p class="nombre"><b>Nombre:</b> German Miranda Condori</p>
        <a class="nuevo" href="MainServlet?op=nuevo">Nuevo registro</a>
        <br> <br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th colspan="2">Acciones</th>
                
            </tr>
            <%
                if(lista !=null){
                    for(Tarea item: lista){ 
            %>
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getTarea()%></td>
                <td> 
                    <input type="checkbox" disabled <%if(item.getCompletado().equals("si")){%> checked="checked" <%}%> />
                </td>
                <td>
                    <a href="MainServlet?op=editar&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%=item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                </td>
            </tr>
            <%  
                    }
                }
            %>
        </table>
        
        </center>
    </body>
</html>
