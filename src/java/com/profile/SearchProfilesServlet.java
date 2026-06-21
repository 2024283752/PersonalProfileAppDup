package com.profile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchProfilesServlet")
public class SearchProfilesServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String searchType = request.getParameter("searchType");
        String keyword = request.getParameter("keyword");
        
        ProfileDAO dao = new ProfileDAO();
        List<ProfileBean> results = null;
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            if ("studentID".equals(searchType)) {
                ProfileBean profile = dao.searchByStudentID(keyword);
                if (profile != null) {
                    results = new ArrayList<>();
                    results.add(profile);
                }
            } else if ("name".equals(searchType)) {
                results = dao.searchByName(keyword);
            }
        }
        
        request.setAttribute("results", results);
        request.setAttribute("keyword", keyword);
        request.setAttribute("searchType", searchType);
        request.getRequestDispatcher("searchProfiles.jsp").forward(request, response);
    }
}