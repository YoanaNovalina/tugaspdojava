/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tugaspbd;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author david
 */
public class Tugaspbd {

    static final String Jdbc_driver = "com.mysql.jdbc.Driver";
    static final String root = "jdbc:mysql://localhost/db_laundry";
    static final String username = "root";
    static final String password = "";

    static Connection con;
    static Statement st;
    static ResultSet rs;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        koneksi();
        try {
            if (login()) {
                tampildata();
            } else {
                System.out.println("salah");
            }
        } catch (Exception e) {
            e.getMessage();
        }
        insertdata();
    }

    static void koneksi() {
        try {
            Class.forName(Jdbc_driver);
            con = DriverManager.getConnection(root, username, password);
            st = con.createStatement();
        } catch (Exception e) {
            e.getMessage();
        }
    }

    static boolean login() {
        boolean cek;
        try {
            cek = false;
            String user = JOptionPane.showInputDialog("username");
            String pass = JOptionPane.showInputDialog("password");
            String sql = "select * from login where username='" + user + "'and password = '" + pass + "'";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                cek = true;
            }
            return cek;
        } catch (Exception e) {
            cek = false;
            return cek;
        }
    }

    static void tampildata() {
        try {
            String sql = "select * from tbl_ambil";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                System.out.print(rs.getString(1) + " | ");
                System.out.print(rs.getString(2) + " | ");
                System.out.print(rs.getString(3) + " | ");
                System.out.println(rs.getString(4));
            }
        } catch (Exception e) {
        }
    }

    static void insertdata() {

        String no_antrian = JOptionPane.showInputDialog("no_antrian");
        String nama = JOptionPane.showInputDialog("nama");
        String alamat = JOptionPane.showInputDialog("alamat");
        String jumlah = JOptionPane.showInputDialog("jumlah");
        String sql = "insert into tbl_ambil (no_antrian,nama,alamat,jumlah) values ('" + no_antrian + "','" + nama + "','" + alamat + "','" + jumlah + "')";
        try {
            st.executeUpdate(sql);
            tampildata();
        } catch (Exception e) {
            e.getMessage();
        }
    }
}
