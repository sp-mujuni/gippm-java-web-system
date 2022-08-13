<%-- 
    Document   : human resource
    Created on : Aug 8, 2022, 10:32:44 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
      <title>GIPPM | Dashboard</title>
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
                    
                    //Strings for getting overview of company information
                    ResultSet shor = null;
                    ResultSet lon = null;
                    ResultSet mid = null;
                    ResultSet unassign = null;
                    ResultSet res=null;
                    String name=null;
                    
                    String sh = null;
                    String lo = null;
                    String md = null;
                    String none = null;
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
                   
                    res=  checkdb.executeQuery("select * from admin");

                    %>
                     <div class="logo_section">
                       <img class="logo_icon img-responsive" src="../images/logo/logo_icon.png" alt="#" />
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="../images/layout_img/admin.jpg" alt="#" /></div>
                        <div class="user_info">
                           <h6><%while(
                           
                           
                           res.next()){
                           name= res.getString(2);
                     
                            out.println(name);
                      
                    }               
                 %></h6>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>Modules</h4>
                  <ul class="list-unstyled components">
                     <li><a href="../admin.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>

                     <li class="active"><a href="#"><i class="fa fa-users orange_color"></i> <span>Human Resource</span></a></li>
                     
                     <li><a href="products.jsp"><i class="fa fa-shopping-cart green_color"></i> <span>Products and Sales</span></a></li>
                     
                     <li><a href="customers.jsp"><i class="fa fa-briefcase purple_color2"></i> <span>Customer base Tracking</span></a></li>

                     <li><a href="reports.jsp"><i class="fa fa-file-text yellow_color"></i> <span>Reports</span></a></li>
                     
                     <li><a href="../../authentication/admin_signin.jsp"><i class="fa fa-sign-out red_color"></i> <span>Sign Out</span></a></li>

                  </ul>
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
                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../images/layout_img/admin.jpg" alt="#" /><span class="name_user"><%
                       
                            out.println(name);
                      
                                 
                 %></span></a>
                                    <div class="dropdown-menu">
                                       
                                       
                                       <a class="dropdown-item" href="../../authentication/signin.jsp"><span>Sign out</span> <i class="fa fa-sign-out"></i></a>
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
               <div class="middle_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Human Resource Management</h2>
                           </div>
                        </div>
                     </div>
                          <!-- row -->
                          <div class="row column1">
                           <div class="col-md-12">
                              <div class="white_shd full margin_bottom_30">
                                 <div class="full graph_head">
                                    <div class="heading1 margin_0">
                                       <h2>Production Staff</h2>
                                    </div>
                                 </div>
                                 <div class="full price_table padding_infor_info">
                                    <div class="row">
                                       <!-- staff column --> 
                                       <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                          <div class="table_price full">
                                             <div class="inner_table_price">
                                                <div class="price_table_head blue1_bg">
                                                   <h2>Short Term</h2>
                                                </div>
                                                <div class="price_table_inner">
                                                   <div class="cont_table_price_blog">
                                                      <p class="blue1_color"><span class="price_no"><%
                        shor=  checkdb.executeQuery("select prdtn_size from production_lines where prdtn_line_name='short term'");
                    while(shor.next()){
                        sh = shor.getString("prdtn_size");
                        out.println(sh);
        }%></span></p>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <!-- end staff column -->
                                       <!-- staff column --> 
                                       <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                          <div class="table_price full">
                                             <div class="inner_table_price">
                                                <div class="price_table_head green_bg">
                                                   <h2>Mid Term</h2>
                                                </div>
                                                <div class="price_table_inner">
                                                   <div class="cont_table_price_blog">
                                                      <p class="green_color"> <span class="price_no"><%
                        mid=  checkdb.executeQuery("select prdtn_size from production_lines where prdtn_line_name='mid term'");
                    while(mid.next()){
                        md = mid.getString("prdtn_size");
                        out.println(md);
        }%></span></p>
                                                   </div>
                                                   
                                                </div>
                                                
                                             </div>
                                          </div>
                                       </div>
                                       <!-- end staff column -->
                                       <!-- staff column --> 
                                       <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                          <div class="table_price full">
                                             <div class="inner_table_price">
                                                <div class="price_table_head red_bg">
                                                   <h2>Long Term</h2>
                                                </div>
                                                <div class="price_table_inner">
                                                   <div class="cont_table_price_blog">
                                                      <p class="red_color"><span class="price_no"><%
                        lon=  checkdb.executeQuery("select prdtn_size from production_lines where prdtn_line_name='long term'");
                    while(lon.next()){
                        lo = lon.getString("prdtn_size");
                        out.println(md);
        }%></span></p>
                                                   </div>
                                                
                                                </div>
                                                
                                             </div>
                                             
                                          </div>
                                       </div>
                                       <!-- staff column --> 
                                       <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                          <div class="table_price full">
                                             <div class="inner_table_price">
                                                <div class="price_table_head yellow_bg">
                                                   <h2>Unassigned</h2>
                                                </div>
                                                <div class="price_table_inner">
                                                   <div class="cont_table_price_blog">
                                                      <p class="red_color"><span class="price_no"><%
                        unassign=  checkdb.executeQuery("select prdtn_size from production_lines where prdtn_line_name='unassigned'");
                    while(unassign.next()){
                        none = unassign.getString("prdtn_size");
                        out.println(none);
        }%></span></p>
                                                   </div>
                                                
                                                </div>
                                                
                                             </div>
                                             
                                          </div>
                                       </div>
                                       <!-- end staff column -->
                                       <div class="price_table_bottomm">
                                          <div class="center"><a class="main_bt" href="/GIPPM Dairy Enterprise/Reallocation">Reallocate staff</a></div>
                                          <div class="center-2"><a class="main_bt" href="../../authentication/add_staff.jsp">Add new staff</a></div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           
                        </div>
                        
                        <!-- end row -->

                     
                  </div>
               </div>
               
<% } catch (SQLException ex) {                    
                    out.println("Error! Failed to connect to the database because of "+ex.getMessage());
        }%>
               <!-- dashboard inner has a closing div after this comment -->
         </div>
      </div>
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