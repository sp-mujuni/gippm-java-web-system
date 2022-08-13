<%-- 
    Document   : staffspace
    Created on : Aug 8, 2022, 10:35:52 PM
    Author     : HP
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
      <title>GIPPM | Staff</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="../images/favicon.ico" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../css/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="../css/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="../css/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="../css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="../css/custom.css" />
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                      <%
                    Connection db_connect; 
                    Statement checkdb;
                    ResultSet res = null;
                    ResultSet total_staff = null;
                    String name = null;
                    ResultSet daily=null;
                    int day=0;
                    int line=0;
                    String staff=null;
            try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {                    
                    out.println("Error loading driver because of "+ex.getMessage());
                    out.println(" ");
                }
            
            //2. Connecting to database. This is only successful if the JDBC driver is working
            try {    //Connecting to database 
                    db_connect = DriverManager.getConnection("jdbc:mysql://sql5.freemysqlhosting.net:3306/sql5512420", "sql5512420", "A45YfnLFQH");                
                    out.println("Database connection is successful.");

                    
            //3. If database connection is successful, we can now issue an SQL statement to verify the admin
                    checkdb = db_connect.createStatement();
                   
                    res=  checkdb.executeQuery("select * from staff where staff_id='gippm001'");
                    while(res.next()){
                      name= res.getString(1);
                      line= res.getInt(3);
                    
                    }               
               
                    total_staff=  checkdb.executeQuery("select sum(staff_id) as stafftotal from staff where allocation='1'");
                      
                      while(total_staff.next()){
                      staff= total_staff.getString("stafftotal");
                   
                    }      

                    daily=  checkdb.executeQuery("select sum(stock) as workload from products where productionline='1'");
                      
                      while(daily.next()){
                      day= daily.getInt("workload");
                   
                    }
               
                    %>
                     
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="../images/layout_img/admin.jpg" alt="#" /></div>
                        <div class="user_info">
                           <h6><%
                      out.println(name);
                                  
                 %> (Staff)</h6>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
               </div>
               
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                           <img class="img-responsive" src="../images/logo/logo.png" alt="#" />
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul class="user_profile_dd">
                                 <li>
                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../images/layout_img/admin.jpg" alt="#" /><span class="name_user">
                                            <%
                      out.println(name);
                              
                 %>
                                            
                                            (Staff)</span></a>
                                    <div class="dropdown-menu">
                                       <a class="dropdown-item" href="../../authentication/signin.jsp"><span>Sign out</span> <i class="fa fa-sign-out"></i></a>
                                       <a class="dropdown-item" href="#"><span>Contact for Support</span> <i class="fa fa-thumbs-o-up"></i></a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Staff Data</h2>
                           </div>
                        </div>
                     </div>
                     <div class="row column1">
                        <div class="col-md-6 col-lg-3">
                           <a href="#">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-cogs purple_color2"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no">
                                    <%
                      
                     
                      out.println(line);
                           
                 %>
                                    
                                    </p>
                                    <p class="head_couter">Production Line you have been assigned to</p>
                                 </div>
                              </div>
                           </div>
                           </a>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <a href="#">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-group orange_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no">
                                    
                                    <%
                      
                      out.println(staff);
                           
                 %>
                                        
                                    </p>
                                    <p class="head_couter">Number of staff in production line</p>
                                 </div>
                              </div>
                           </div>
                           </a>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <a href="#">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-shopping-cart green_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no">  <%
                      out.println(day);
                             
                 %></p>
                                    <p class="head_couter">Number of products to be produced today</p>
                                 </div>
                              </div>
                           </div>
                           </a>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <a href="#">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-money yellow_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no">UGX 5,000</p>
                                    <p class="head_couter">Hourly Wage (with UGX 1,000 bonus per item)</p>
                                 </div>
                              </div>
                           </div>
                           </a>
                        </div>
                     </div>                     
                  </div>
               </div>
               <div class="container-fluid">
                  <div class="footer">
                     <br/>
                     <div class="date-time">
                        <div id="current_date">
                           <script>
                           document.getElementById("current_date").innerHTML = Date();
                           </script>
                     </div>                                           
                  </div>
                     <p>Copyright &copy; 2022 GIPPM Dairy Enterprise<br></p>
               </div>
            </div>
         </div>
      </div>
                     <% } catch (SQLException ex) {                    
                    out.println("Error! Failed to connect to the database because of "+ex.getMessage());
        }%>
      <!-- jQuery -->
      <script src="../js/jquery.min.js"></script>
      <script src="../js/popper.min.js"></script>
      <script src="../js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="../js/animate.js"></script>
      <!-- select country -->
      <script src="../js/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="../js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="../js/Chart.min.js"></script>
      <script src="../js/Chart.bundle.min.js"></script>
      <script src="../js/utils.js"></script>
      <script src="../js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="../js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="../js/custom.js"></script>
      <script src="../js/chart_custom_style1.js"></script>
   </body>
</html>
