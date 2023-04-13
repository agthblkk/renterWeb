package com.example.rentingwebsite;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "login-servlet", value = "/login")
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String password = request.getParameter("passwordOwner");
        DataBase newOwner = new DataBase();
        String name;
        String id = null;
        try {
            id = newOwner.idOwner(password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession(true);
        try {
            if (newOwner.checkPassword(password)) {
                name = newOwner.ownerName(password);
                session.setAttribute("nameOwner", name);
                session.setAttribute("id", id);
                response.sendRedirect("OwnerAfterLogging.jsp");
            } else {
                response.sendRedirect("wrongPassword.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
