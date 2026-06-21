<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.profile.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Profiles</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f0ff 0%, #ffe4ec 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #c71585;
            font-size: 28px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 25px;
            border-bottom: 2px solid #ffb6c1;
            padding-bottom: 15px;
        }
        .count-badge {
            text-align: center;
            background: #fff5f8;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 20px;
            color: #c71585;
            font-weight: bold;
        }
        .profile-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 20px;
        }
        .profile-card {
            background: #fff5f8;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s;
            border: 1px solid #ffe0e7;
        }
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #ff69b4, #c71585);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .card-header .name { font-size: 18px; font-weight: bold; }
        .card-header .id {
            font-size: 12px;
            background: rgba(255,255,255,0.2);
            padding: 4px 12px;
            border-radius: 20px;
        }
        .card-body { padding: 15px 20px; }
        .card-body .detail {
            margin: 8px 0;
            font-size: 14px;
            color: #555;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .card-body .detail i { color: #c71585; width: 20px; }
        .card-body .detail strong { color: #333; font-weight: 600; }
        .card-body .hobbies {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            margin-top: 10px;
        }
        .card-body .hobby-tag {
            background: white;
            padding: 3px 12px;
            border-radius: 20px;
            font-size: 11px;
            color: #c71585;
            border: 1px solid #ffb6c1;
        }
        .card-actions {
            display: flex;
            gap: 8px;
            margin-top: 15px;
            flex-wrap: wrap;
        }
        .btn-sm {
            padding: 6px 14px;
            border-radius: 20px;
            border: none;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s;
        }
        .btn-sm:hover { transform: scale(1.05); }
        .btn-edit { background: #ffc107; color: #333; }
        .btn-edit:hover { background: #e0a800; }
        .btn-delete { background: #dc3545; color: white; }
        .btn-delete:hover { background: #c82333; }
        .btn-view { background: #17a2b8; color: white; }
        .btn-view:hover { background: #138496; }
        .btn-home { background: #28a745; color: white; }
        .btn-home:hover { background: #218838; }
        .empty-msg {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }
        .empty-msg i {
            font-size: 40px;
            color: #ffb6c1;
            display: block;
            margin-bottom: 15px;
        }
        .actions {
            margin-top: 25px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .btn {
            padding: 12px 30px;
            border-radius: 40px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #ff69b4, #c71585);
            color: white;
        }
        .btn-primary:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(199,21,133,0.3);
        }
        .btn-search {
            background: #ff8c00;
            color: white;
        }
        .btn-search:hover {
            background: #e07b00;
            transform: scale(1.02);
        }
        .btn-home {
            background: #28a745;
            color: white;
        }
        .btn-home:hover {
            background: #218838;
            transform: scale(1.02);
        }
        .btn-viewall {
            background: #4169e1;
            color: white;
        }
        .btn-viewall:hover {
            background: #3158c7;
            transform: scale(1.02);
        }
        .success-msg {
            background: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #c3e6cb;
        }
        .error-msg {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #f5c6cb;
        }
        @media (max-width: 600px) {
            .container { margin: 20px; padding: 20px; }
            .profile-grid { grid-template-columns: 1fr; }
            h2 { font-size: 22px; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-users"></i> All Student Profiles</h2>
        <div class="subtitle"><i class="fas fa-list"></i> View and manage all profiles</div>

        <%
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");
            if (message != null) { 
        %>
            <div class="success-msg"><i class="fas fa-check-circle"></i> <%= message %></div>
        <%
            } else if (error != null) { 
        %>
            <div class="error-msg"><i class="fas fa-exclamation-circle"></i> <%= error %></div>
        <%
            }

            List<ProfileBean> profiles = (List<ProfileBean>) request.getAttribute("profiles");
            if (profiles != null && !profiles.isEmpty()) {
        %>
            <div class="count-badge">
                <i class="fas fa-user-graduate"></i> Total Profiles: <%= profiles.size() %>
            </div>
            <div class="profile-grid">
                <%
                    for (ProfileBean p : profiles) {
                %>
                    <div class="profile-card">
                        <div class="card-header">
                            <span class="name"><i class="fas fa-user"></i> <%= p.getName() %></span>
                            <span class="id"><i class="fas fa-id-card"></i> <%= p.getStudentID() %></span>
                        </div>
                        <div class="card-body">
                            <div class="detail">
                                <i class="fas fa-graduation-cap"></i>
                                <span><strong>Programme:</strong> <%= p.getProgramme() %></span>
                            </div>
                            <div class="detail">
                                <i class="fas fa-envelope"></i>
                                <span><strong>Email:</strong> <%= p.getEmail() %></span>
                            </div>
                            <div class="detail">
                                <i class="fas fa-heart"></i>
                                <span><strong>Hobbies:</strong></span>
                            </div>
                            <div class="hobbies">
                                <%
                                    String[] hobbyList = p.getHobbies().split(",\\s*");
                                    for (String hobby : hobbyList) {
                                %>
                                    <span class="hobby-tag"><i class="fas fa-tag"></i> <%= hobby.trim() %></span>
                                <%
                                    }
                                %>
                            </div>
                            <div class="detail" style="margin-top: 10px;">
                                <i class="fas fa-quote-left"></i>
                                <span style="font-style: italic; font-size: 13px;"><%= p.getIntroduction() %></span>
                            </div>

                            <div class="card-actions">
                                <a href="EditProfileServlet?studentID=<%= p.getStudentID() %>" class="btn-sm btn-edit">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <form action="DeleteProfileServlet" method="POST" style="display: inline;">
                                    <input type="hidden" name="studentID" value="<%= p.getStudentID() %>">
                                    <button type="submit" class="btn-sm btn-delete" onclick="return confirm('Delete profile for <%= p.getName() %>?')">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </form>
                                <a href="index.html" class="btn-sm btn-home">
                                    <i class="fas fa-home"></i> Home
                                </a>
                            </div>
                        </div>
                    </div>
                <%
                    }
                %>
            </div>
        <%
            } else {
        %>
            <div class="empty-msg">
                <i class="fas fa-inbox"></i>
                No profiles found in the database.<br>
                <span style="font-size: 14px;">Click "Add New Profile" to get started!</span>
            </div>
        <%
            }
        %>

        <div class="actions">
            <a href="index.html" class="btn btn-primary"><i class="fas fa-plus"></i> Add New Profile</a>
            <a href="SearchProfilesServlet" class="btn btn-search"><i class="fas fa-search"></i> Search Profiles</a>
            <a href="index.html" class="btn btn-home"><i class="fas fa-home"></i> Home</a>
        </div>

    </div>
</body>
</html>