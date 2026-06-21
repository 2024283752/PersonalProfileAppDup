<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
            max-width: 600px;
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
        }
        .subtitle {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 25px;
            border-bottom: 2px solid #ffb6c1;
            padding-bottom: 15px;
        }
        .form-group { margin-bottom: 20px; }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #c71585;
            font-size: 14px;
        }
        label i { margin-right: 8px; color: #ff69b4; }
        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #ffe0e7;
            border-radius: 12px;
            font-size: 14px;
            font-family: inherit;
            transition: all 0.3s;
        }
        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #ff69b4;
            box-shadow: 0 0 0 3px rgba(255,105,180,0.1);
        }
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }
        .btn {
            flex: 1;
            padding: 14px;
            border-radius: 40px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
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
            .btn-group { flex-direction: column; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-edit"></i> Edit Profile</h2>
        <div class="subtitle"><i class="fas fa-pencil-alt"></i> Update profile information</div>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) { 
        %>
            <div class="error-msg"><i class="fas fa-exclamation-circle"></i> <%= error %></div>
        <%
            }
            
            com.profile.ProfileBean profile = (com.profile.ProfileBean) request.getAttribute("profile");
            if (profile != null) {
        %>

        <form action="EditProfileServlet" method="POST">
            <input type="hidden" name="studentID" value="<%= profile.getStudentID() %>">
            
            <div class="form-group">
                <label><i class="fas fa-id-card"></i> Student ID</label>
                <input type="text" value="<%= profile.getStudentID() %>" disabled style="background: #f0f0f0;">
            </div>

            <div class="form-group">
                <label><i class="fas fa-user"></i> Full Name</label>
                <input type="text" name="name" value="<%= profile.getName() %>" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-graduation-cap"></i> Programme</label>
                <select name="programme" required>
                    <option value="Computer Science" <%= profile.getProgramme().equals("Computer Science") ? "selected" : "" %>>Computer Science</option>
                    <option value="Information Technology" <%= profile.getProgramme().equals("Information Technology") ? "selected" : "" %>>Information Technology</option>
                    <option value="Software Engineering" <%= profile.getProgramme().equals("Software Engineering") ? "selected" : "" %>>Software Engineering</option>
                    <option value="Data Science" <%= profile.getProgramme().equals("Data Science") ? "selected" : "" %>>Data Science</option>
                </select>
            </div>

            <div class="form-group">
                <label><i class="fas fa-envelope"></i> Email</label>
                <input type="email" name="email" value="<%= profile.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-heart"></i> Hobbies</label>
                <input type="text" name="hobbies" value="<%= profile.getHobbies() %>" placeholder="e.g. Reading, Music, Sports">
            </div>

            <div class="form-group">
                <label><i class="fas fa-comment"></i> Self Introduction</label>
                <textarea name="introduction" rows="4" required><%= profile.getIntroduction() %></textarea>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Update Profile</button>
                <a href="ViewProfilesServlet" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</a>
            </div>
        </form>

        <% } else { %>
            <div class="error-msg"><i class="fas fa-exclamation-circle"></i> No profile found to edit.</div>
        <% } %>
    </div>
</body>
</html>