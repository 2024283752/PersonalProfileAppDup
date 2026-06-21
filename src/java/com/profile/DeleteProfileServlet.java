package com.profile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String studentID = request.getParameter("studentID");
        
        ProfileDAO dao = new ProfileDAO();
        boolean deleted = dao.deleteProfile(studentID);
        
        if (deleted) {
            request.setAttribute("message", "Profile deleted successfully!");
        } else {
            request.setAttribute("error", "Failed to delete profile.");
        }
        
        request.setAttribute("profiles", dao.getAllProfiles());
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }
}