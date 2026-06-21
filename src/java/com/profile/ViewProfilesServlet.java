package com.profile;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewProfilesServlet")
public class ViewProfilesServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProfileDAO dao = new ProfileDAO();
        List<ProfileBean> profiles = dao.getAllProfiles();
        
        request.setAttribute("profiles", profiles);
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }
}