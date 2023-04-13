package com.example.rentingwebsite;

import java.io.*;
import java.sql.SQLException;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "renter-servlet", value = "/renter")
public class RenterServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("nameRenter");
        String surname = request.getParameter("surnameRenter");
        String phone = request.getParameter("phoneRenter");
        DataBase newRenter = new DataBase();
        try {
            newRenter.addRenter(name, surname, phone);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        String name = request.getParameter("nameRenter");
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        session.setAttribute("name", name);
        response.sendRedirect("RenterAfterLogging.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession(true);
        String name = request.getParameter("flat");
        response.setContentType("text/html");
        session.setAttribute("flat", name);
        response.sendRedirect("ApartmentSelected.jsp");
    }
}