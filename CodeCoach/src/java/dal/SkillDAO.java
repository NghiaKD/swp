/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Roles;
import model.Skills;

/**
 *
 * @author Duy Thai
 */
public class SkillDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Skills> getAll() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Skills> getTop8() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select top 8 * from skills";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Skills> getNext8(int amount) {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills order by skillId offset ? rows fetch next 8 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        SkillDAO dao = new SkillDAO();
        List<Skills> list = dao.getNext8(5);
        for (Skills s : list) {
            System.out.println(s);
        }
    }
}
