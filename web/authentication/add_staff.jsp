<%-- 
    Document   : newjsp
    Created on : Aug 8, 2022, 9:39:11 PM
    Author     : HP
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
      <title>GIPPM | Register</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="../img/favicon.ico" type="image/png" />
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
                        <img width="210" src="../admin/images/logo/logo.png" alt="#" /><span class="user-type">New Staff</span>
                     </div>
                  </div>
                 
                   <div class="login_form">
                     <form action="/Food Shelf/Add_staff">
                        <fieldset>
                           <div class="field">
                              <label class="label_field">Staff Name</label>
                              <input type="text" name="name" required/>
                           </div>
                           <div class="field">
                              <label class="label_field">Staff ID</label>
                              <input type="text" name="id" placeholder="the ID must start with gippm i.e. gippm643" required/>
                           </div>
                           <div class="field margin_0">
                              <label class="label_field hidden">hidden label</label>
                              <button class="main_bt">Add</button>
                           </div>
                        </fieldset>
                     </form>
                  </div> 
                 
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
      <!-- nice scrollbar -->
      <script src="../admin/js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="../admin/js/custom.js"></script>
   </body>
</html>