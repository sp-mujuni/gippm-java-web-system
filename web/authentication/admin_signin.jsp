<%-- 
    Document   : admin_signin
    Created on : Aug 8, 2022, 11:28:17 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>GIPPM | Sign in</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="../img/favicon.ico" type="icon" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../admin/css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../admin/style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../admin/css/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="../admin/css/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="../admin/css/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="../admin/css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="../admin/css/custom.css" />
      <!-- calendar file css -->
      <link rel="stylesheet" href="../admin/js/semantic.min.css" />
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body class="inner_page login">
      <div class="full_container">
         <div class="container">
            <div class="center verticle_center full_height">
               <div class="login_section">
                  <div class="logo_login">
                     <div class="center">
                        <img width="210" src="../admin/images/logo/logo.png" alt="#" /><span class="user-type"><b>Admin</b></span>
                     </div>
                  </div>
                   <%
                    Connection db_connect; 
                    Statement checkdb;
                    ResultSet res = null;
            try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {                    
                    out.println("Error loading driver because of "+ex.getMessage());
                    out.println(" ");
                }
            
            //2. Connecting to database. This is only successful if the JDBC driver is working
            try {    //Connecting to database 
                    db_connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/gippm_db", "root", "");                
                    

                    
            //3. If database connection is successful, we can now issue an SQL statement to verify the admin
                    checkdb = db_connect.createStatement();
                    String id = request.getParameter("identity");
                    String password = request.getParameter("password");
                    res=  checkdb.executeQuery("select * from admin where admin_id='"+request.getParameter("identity")+"'");
                    while(res.next()){
                      id= res.getString(3);
                      password= res.getString(3);
                      
                      out.println(id);
                      out.println(password);


                    }               
                 %>
                  <div class="login_form">
                     <form action="../admin/admin.jsp">
                        <fieldset>
                           <div class="field">
                              <label class="label_field">Admin ID</label>
                              <input type="text" name="identity" required/>
                           </div>
                           <div class="field">
                              <label class="label_field">Password</label>
                              <input type="password" name="password" required/>
                           </div>
                           <div class="field margin_0">
                              <label class="label_field hidden">hidden label</label>
                              <button class="main_bt">Sign In</button>
                           </div>
                        </fieldset>
                     </form>
                     <a href="signin.jsp"><p>Not an Admin? Click here to return to Sign in Options page</p></a>
                  </div>
                  <% } catch (SQLException ex) {                    
                    out.println("Error! Failed to connect to the database because of "+ex.getMessage());
        }%>
                   
               </div>
            </div>
         </div>
      </div>
      <!-- jQuery -->
      <script src="../admin/js/jquery.min.js"></script>
      <script src="../admin/js/popper.min.js"></script>
      <script src="../admin/js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="../admin/js/animate.js"></script>
      <!-- select country -->
      <script src="../admin/js/bootstrap-select.js"></script>
      <!-- nice scrollbar -->
      <script src="../admin/js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="../admin/js/custom.js"></script>
   </body>
</html>
