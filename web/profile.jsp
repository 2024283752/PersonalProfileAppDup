<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
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
            max-width: 650px;
            margin: 40px auto;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            animation: fadeIn 0.5s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            text-align: center;
            color: #c71585;
            font-size: 28px;
            margin-bottom: 10px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 25px;
            border-bottom: 2px solid #ffb6c1;
            padding-bottom: 15px;
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
        .info-card {
            background: #fff5f8;
            border-radius: 15px;
            margin-bottom: 15px;
            overflow: hidden;
            transition: all 0.2s;
        }
        .info-card:hover { transform: translateX(5px); box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
        .info-header {
            background: #ffb6c1;
            padding: 12px 18px;
            color: #c71585;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .info-header i { width: 25px; font-size: 16px; }
        .info-content { padding: 15px 18px; color: #333; font-size: 15px; line-height: 1.5; }
        .hobby-tags { padding: 15px 18px; display: flex; flex-wrap: wrap; gap: 10px; }
        .hobby-tag {
            background: white;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            color: #c71585;
            border: 1px solid #ffb6c1;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .intro-content { padding: 15px 18px; font-style: italic; line-height: 1.6; color: #555; }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        .btn {
            flex: 1;
            padding: 12px;
            text-align: center;
            border-radius: 40px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-width: 100px;
            font-size: 14px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #ff69b4, #c71585);
            color: white;
        }
        .btn-primary:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(199,21,133,0.3);
        }
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background: #5a6268;
            transform: scale(1.02);
        }
        .btn-warning {
            background: #ffc107;
            color: #333;
        }
        .btn-warning:hover {
            background: #e0a800;
            transform: scale(1.02);
        }
        .btn-success {
            background: #28a745;
            color: white;
        }
        .btn-success:hover {
            background: #218838;
            transform: scale(1.02);
        }
        .nav-links {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
            padding-top: 15px;
            border-top: 2px solid #ffb6c1;
        }
        .nav-links a {
            color: #c71585;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            border-radius: 30px;
            background: #fff5f8;
        }
        .nav-links a:hover {
            background: #ffb6c1;
            color: #c71585;
            transform: scale(1.05);
        }
        @media (max-width: 600px) {
            .container { margin: 20px; padding: 20px; }
            h2 { font-size: 22px; }
            .button-group { flex-direction: column; }
            .btn { flex: none; width: 100%; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-id-card"></i> My Personal Profile</h2>
        <div class="subtitle"><i class="fas fa-star"></i> Your profile details</div>

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

            com.profile.ProfileBean profile = (com.profile.ProfileBean) request.getAttribute("profile");
            if (profile != null) {
        %>

        <div class="info-card">
            <div class="info-header"><i class="fas fa-id-card"></i> Student ID</div>
            <div class="info-content"><%= profile.getStudentID() %></div>
        </div>

        <div class="info-card">
            <div class="info-header"><i class="fas fa-user"></i> Full Name</div>
            <div class="info-content"><%= profile.getName() %></div>
        </div>

        <div class="info-card">
            <div class="info-header"><i class="fas fa-graduation-cap"></i> Programme</div>
            <div class="info-content"><%= profile.getProgramme() %></div>
        </div>

        <div class="info-card">
            <div class="info-header"><i class="fas fa-envelope"></i> Email</div>
            <div class="info-content"><%= profile.getEmail() %></div>
        </div>

        <div class="info-card">
            <div class="info-header"><i class="fas fa-heart"></i> Hobbies</div>
            <div class="hobby-tags">
                <%
                    String[] hobbyList = profile.getHobbies().split(",\\s*");
                    for (String hobby : hobbyList) {
                %>
                    <span class="hobby-tag"><i class="fas fa-tag"></i> <%= hobby.trim() %></span>
                <%
                    }
                %>
            </div>
        </div>

        <div class="info-card">
            <div class="info-header"><i class="fas fa-comment-dots"></i> Self Introduction</div>
            <div class="intro-content"><i class="fas fa-quote-left"></i> <%= profile.getIntroduction() %> <i class="fas fa-quote-right"></i></div>
        </div>

        <!-- Action Buttons -->
        <div class="button-group">
            <a href="EditProfileServlet?studentID=<%= profile.getStudentID() %>" class="btn btn-warning">
                <i class="fas fa-edit"></i> Edit
            </a>
            <a href="index.html" class="btn btn-primary">
                <i class="fas fa-plus"></i> New
            </a>
            <a href="ViewProfilesServlet" class="btn btn-secondary">
                <i class="fas fa-list"></i> All
            </a>
            <a href="SearchProfilesServlet" class="btn btn-success">
                <i class="fas fa-search"></i> Search
            </a>
        </div>

        <%
            } else {
        %>
            <div class="error-msg"><i class="fas fa-exclamation-circle"></i> No profile data found. Please submit the form again.</div>
        <%
            }
        %>

        <div class="nav-links">
            <a href="index.html"><i class="fas fa-home"></i> Home</a>
        </div>
    </div>
</body>
</html>