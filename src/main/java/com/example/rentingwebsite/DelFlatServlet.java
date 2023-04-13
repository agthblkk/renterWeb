package com.example.rentingwebsite;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "del-flat-servlet", value = "/delflat")
public class DelFlatServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        DataBase newOwner = new DataBase();
        try {
            newOwner.deleteFlat(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");

        response.sendRedirect("deleted.jsp");
    }
}
