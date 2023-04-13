package com.example.rentingwebsite;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "sign-up-servlet", value = "/signup")
public class SignUpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("nameOwner");
        String surname = request.getParameter("surnameOwner");
        String phone = request.getParameter("phoneOwner");
        String password = request.getParameter("passwordOwner");
        DataBase newOwner = new DataBase();
        try {
            newOwner.addOwner(name, surname, phone, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String id;
        try {
            id = newOwner.idOwner(password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        session.setAttribute("nameOwner", name);
        session.setAttribute("id", id);
        response.sendRedirect("OwnerAfterSignUp.jsp");
    }
}
