package com.example.rentingwebsite;

import java.sql.*;
import java.util.Objects;

public class DataBase {
    static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/renting?serverTimezone=Europe/Kiev";
    static final String DB_USER = "root";
    static final String DB_PASSWORD = "1356";

    static Connection conn;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    ;

    public void addRenter(String name, String surname, String phone) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("INSERT INTO Clients (name, surname, phone) VALUES(?, ?, ?)");
        try {
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, phone);
            ps.executeUpdate(); // for INSERT, UPDATE & DELETE
        } finally {
            ps.close();
        }
    }

    public void addOwner(String name, String surname, String phone, String password) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("INSERT INTO Owners (name, surname, phone, password) VALUES(?, ?, ?, ?)");
        try {
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, phone);
            ps.setString(4, password);
            ps.executeUpdate(); // for INSERT, UPDATE & DELETE
        } finally {
            ps.close();
        }
    }

    public boolean checkPassword(String password) throws SQLException {
        boolean preReturn = false;
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM Owners")) {
            String passDb;
            try (ResultSet rs = ps.executeQuery()) {
                ResultSetMetaData md = rs.getMetaData();
                while (rs.next()) {
                    passDb = rs.getString("password");
                    if (Objects.equals(passDb, password)) {
                        preReturn = true;
                        break;
                    }
                }
            }
            return preReturn;
        }
    }

    public String ownerName(String password) throws SQLException {
        String nameReturn;
        try (PreparedStatement ps = conn.prepareStatement("SELECT name FROM Owners WHERE password = ?")) {
            ps.setString( 1, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()){
                    nameReturn = rs.getString(1);
                }
                else{
                    nameReturn = "error!!";
                }
            }
        }
        return nameReturn;
    }
    public String idOwner (String password) throws SQLException {
        String idReturn;
        try (PreparedStatement ps = conn.prepareStatement("SELECT idOwners FROM Owners WHERE password = ?")) {
            ps.setString( 1, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()){
                    idReturn= rs.getString(1);
                }
                else{
                    idReturn = "error!!";
                }
            }
        }
        return idReturn;
    }
    public void addFlat(String address, String square, String sRooms, String sPrice, String sOwnerId,
                        String district, String famFr, String sec) throws SQLException{

        int price = Integer.parseInt(sPrice);
        int rooms = Integer.parseInt(sRooms);
        int ownerId= Integer.parseInt(sOwnerId);
        try(PreparedStatement ps = conn.prepareStatement("INSERT INTO Districts (districtName, isFamilyFriendly, " +
                "ownerId, secure) VALUES(?, ?, ?, ?)")) {
            ps.setString(1, district);
            ps.setString(2, famFr);
            ps.setInt(3, ownerId);
            ps.setString(4, sec);
            ps.executeUpdate(); // for INSERT, UPDATE & DELETE
        }
        int districtId;
        try (PreparedStatement pd = conn.prepareStatement("SELECT * FROM Districts WHERE ownerId = ?");){
            pd.setInt(1, ownerId);
            try (ResultSet rs = pd.executeQuery()) {
                if (rs.next()){
                    districtId = Integer.parseInt(rs.getString(1));
                }
                else{
                    districtId = 0;
                }
            }
        }
        try (PreparedStatement pf = conn.prepareStatement("INSERT INTO Flats (district, address, square, " +
                "rooms, price, owner) VALUES(?, ?, ?, ?, ?, ?)")) {
            pf.setInt(1, districtId);
            pf.setString(2, address);
            pf.setString(3, square);
            pf.setInt(4, rooms);
            pf.setInt(5, price);
            pf.setInt(6, ownerId);
            pf.executeUpdate(); // for INSERT, UPDATE & DELETE
        }
    }
    public void deleteFlat(String id) throws SQLException {
        int idFinal = Integer.parseInt(id);
        PreparedStatement ps = conn.prepareStatement("DELETE FROM Flats WHERE idFlats = ?");
        try {
            ps.setInt(1, idFinal);
            ps.executeUpdate(); // for INSERT, UPDATE & DELETE
        } finally {
            ps.close();
        }
    }
}
