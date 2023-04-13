package com.example.rentingwebsite;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "owner-servlet", value = "/owner")
public class OwnerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("nameOwner");
        String surname = request.getParameter("surnameOwner");
        String phone = request.getParameter("phoneOwner");

//        String name = request.getParameter("nameRenter");
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        session.setAttribute("name", name);
        response.sendRedirect("OwnerAfterLogging.jsp");
    }
}
