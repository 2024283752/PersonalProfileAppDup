package com.profile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String studentID = request.getParameter("studentID");
        
        ProfileDAO dao = new ProfileDAO();
        ProfileBean profile = dao.searchByStudentID(studentID);
        
        if (profile != null) {
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Profile not found!");
            request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
        }
    }
    
    // POST - Update profile
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String studentID = request.getParameter("studentID");
        String name = request.getParameter("name");
        String programme = request.getParameter("programme");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String introduction = request.getParameter("introduction");
        
        ProfileBean profile = new ProfileBean();
        profile.setStudentID(studentID);
        profile.setName(name);
        profile.setProgramme(programme);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntroduction(introduction);
        
        ProfileDAO dao = new ProfileDAO();
        boolean updated = dao.updateProfile(profile);
        
        if (updated) {
            request.setAttribute("message", "Profile updated successfully!");
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to update profile.");
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        }
    }
}