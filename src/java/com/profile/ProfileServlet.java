package com.profile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get form data
        String studentID = request.getParameter("studentId");
        String name = request.getParameter("name");
        String programme = request.getParameter("program");
        String email = request.getParameter("email");
        String intro = request.getParameter("intro");
        
        // Get hobbies (multiple values)
        String[] hobbiesArray = request.getParameterValues("hobbies");
        String hobbies = "";
        if (hobbiesArray != null) {
            for (int i = 0; i < hobbiesArray.length; i++) {
                hobbies += hobbiesArray[i];
                if (i < hobbiesArray.length - 1) {
                    hobbies += ", ";
                }
            }
        } else {
            hobbies = "None";
        }
        
        // Create ProfileBean
        ProfileBean profile = new ProfileBean();
        profile.setStudentID(studentID);
        profile.setName(name);
        profile.setProgramme(programme);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntroduction(intro);
        
        // Save to database
        ProfileDAO dao = new ProfileDAO();
        boolean saved = dao.insertProfile(profile);
        
        if (saved) {
            request.setAttribute("profile", profile);
            request.setAttribute("message", "Profile saved successfully!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            request.setAttribute("profile", profile);
            request.setAttribute("error", "Failed to save profile. Student ID may already exist.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }
}