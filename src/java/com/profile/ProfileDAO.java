package com.profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {
    
    // Insert profile
    public boolean insertProfile(ProfileBean profile) {
        String sql = "INSERT INTO Profile (studentID, name, programme, email, hobbies, introduction) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, profile.getStudentID());
            stmt.setString(2, profile.getName());
            stmt.setString(3, profile.getProgramme());
            stmt.setString(4, profile.getEmail());
            stmt.setString(5, profile.getHobbies());
            stmt.setString(6, profile.getIntroduction());
            
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows inserted: " + rowsAffected);
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all profiles
    public List<ProfileBean> getAllProfiles() {
        List<ProfileBean> profiles = new ArrayList<>();
        String sql = "SELECT * FROM Profile ORDER BY name";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(rs.getString("studentID"));
                profile.setName(rs.getString("name"));
                profile.setProgramme(rs.getString("programme"));
                profile.setEmail(rs.getString("email"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntroduction(rs.getString("introduction"));
                profiles.add(profile);
            }
            System.out.println("Profiles retrieved: " + profiles.size());
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
    
    // Search by Student ID
    public ProfileBean searchByStudentID(String studentID) {
        String sql = "SELECT * FROM Profile WHERE studentID = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, studentID);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(rs.getString("studentID"));
                profile.setName(rs.getString("name"));
                profile.setProgramme(rs.getString("programme"));
                profile.setEmail(rs.getString("email"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntroduction(rs.getString("introduction"));
                return profile;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Search by Name (partial match)
    public List<ProfileBean> searchByName(String name) {
        List<ProfileBean> profiles = new ArrayList<>();
        String sql = "SELECT * FROM Profile WHERE LOWER(name) LIKE ? ORDER BY name";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, "%" + name.toLowerCase() + "%");
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(rs.getString("studentID"));
                profile.setName(rs.getString("name"));
                profile.setProgramme(rs.getString("programme"));
                profile.setEmail(rs.getString("email"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntroduction(rs.getString("introduction"));
                profiles.add(profile);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
    
    // Update profile
    public boolean updateProfile(ProfileBean profile) {
        String sql = "UPDATE Profile SET name=?, programme=?, email=?, hobbies=?, introduction=? WHERE studentID=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, profile.getName());
            stmt.setString(2, profile.getProgramme());
            stmt.setString(3, profile.getEmail());
            stmt.setString(4, profile.getHobbies());
            stmt.setString(5, profile.getIntroduction());
            stmt.setString(6, profile.getStudentID());
            
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows updated: " + rowsAffected);
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete profile
    public boolean deleteProfile(String studentID) {
        String sql = "DELETE FROM Profile WHERE studentID = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, studentID);
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows deleted: " + rowsAffected);
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}