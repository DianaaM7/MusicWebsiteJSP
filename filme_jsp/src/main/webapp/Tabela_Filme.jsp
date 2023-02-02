<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Filme</title>
        <link href="css/tabelaFilme.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center"> Tabela Filme:</h1>
        <form action="sterge_Film.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Idfilm:</b></td>
                    <td><b>Titlu:</b></td>
                    <td><b>An aparitie:</b></td>
                    <td><b>Regizor:</b></td>
                    <td><b>Durata minute:</b></td>
                    <td><b>Nota IMDb:</b></td>   

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("filme");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idfilm");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("titlu")%></td>
                    <td><%= rs.getString("an_aparitie")%></td>
                    <td><%= rs.getString("regizor")%></td>
                    <td><%= rs.getString("durata_minute")%></td>
                    <td><%= rs.getString("nota_imdb")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center"><a href="adauga_Film.jsp"><b>Adauga film</b></a></p>
        <p align="center"><a href="modifica_Film.jsp"><b>Modifica film</b></a></p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </div>
    </body>
</html>
