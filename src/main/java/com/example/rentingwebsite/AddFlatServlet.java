package com.example.rentingwebsite;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "add-flat-servlet", value = "/addflat")
public class AddFlatServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String address = request.getParameter("address");
        String square = request.getParameter("square");
        String rooms = request.getParameter("rooms");
        String price = request.getParameter("price");
        String district = request.getParameter("districtName");
        String famFr = request.getParameter("familyFriendly");
        String sec = request.getParameter("secure");
        String password = request.getParameter("passwordOwner");
        DataBase newOwner = new DataBase();
        String ownerId;
        try {
            ownerId =  newOwner.idOwner(password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            newOwner.addFlat(address, square, rooms, price, ownerId, district, famFr, sec);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        session.setAttribute("address", address);
        response.sendRedirect("added.jsp");
    }
}
