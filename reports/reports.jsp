<%-- 
    Document   : reports
    Created on : Aug 8, 2022, 10:37:05 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSetMetaData"%>
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
                    ResultSet res = null;
                    String name = null;
                    
                    //ResultSet command for customers table
                    ResultSet customers=null;
                    ResultSetMetaData customerstable= null;
                            
                    //ResultSet command for orders table
                    ResultSet orders=null;
                    ResultSetMetaData orderstable= null;
                    
                    //ResultSet command for staff table
                    ResultSet staff=null;
                    ResultSetMetaData stafftable= null;
                    
                    //ResultSet command for products table
                    ResultSet products=null;
                    ResultSetMetaData productstable= null;
                 
            try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {                    
                    out.println("Error loading driver because of "+ex.getMessage());
                    out.println(" ");
                }
            
            //2. Connecting to database. This is only successful if the JDBC driver is working
            try {    //Connecting to database 
                    db_connect = DriverManager.getConnection("jdbc:mysql://localhost:8000/gippm_db", "root", "password");                
                    out.println("Database connection is successful.");

                    
            //3. If database connection is successful, we can now issue an SQL statement to verify the admin
                    checkdb = db_connect.createStatement();
                   
                    res=  checkdb.executeQuery("select * from admin");
                   while(
                           res.next()){
                           name= res.getString(2);
                    }
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
                           <h6><%
                     
                            out.println(name);
                            
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

                     <li><a href="human_resource.jsp"><i class="fa fa-users orange_color"></i> <span>Human Resource</span></a></li>
                     
                     <li><a href="products.jsp"><i class="fa fa-shopping-cart green_color"></i> <span>Products and Sales</span></a></li>
                     
                     <li><a href="customers.jsp"><i class="fa fa-briefcase purple_color2"></i> <span>Customer base Tracking</span></a></li>

                     <li class="active"><a href="#"><i class="fa fa-file-text yellow_color"></i> <span>Reports</span></a></li>
                     
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
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                               <h3>
                              GIPPM Dairy Enterprise
                              </h3>
                              <h2>
                              <div id="current_date">
                              <script>
                              document.getElementById("current_date").innerHTML = Date();
                              </script>
                        </div>   
                              </h2>
                               <hr/>
                               <h4>
                              Live Company Reports
                              </h4>
                               <hr/>
                               <p>
                                 To print these reports, press Ctrl+P on your computer
                              </p>
                           </div>
                        </div>
                     </div>

                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Pending Orders</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <%
                                    
                                    orders = checkdb.executeQuery("select customer_id, total, payment, status, date from orders");
                                    orderstable = orders.getMetaData();
                                    int ordersColumns = orderstable.getColumnCount();
                                    
                                    while(orders.next()){
                                        for(int o=1; o<= ordersColumns; o++) {
                                    
                                     if(o > 1) out.println("");
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                     String columnValue = orders.getString(o);
                                          out.println(orderstable.getColumnName(o));
                                          %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                       }
                                       %>
                                      
                                    <hr/>
                                    <hr/>
                                   <%
                               while(orders.next()){

                                       %>

                                       <br/>

                                <%
                                   for(int c=1; c<= ordersColumns; c++) {

                                     if(c > 1) out.println("");

                                     String columnValue = orders.getString(c);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                          out.println(columnValue);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <%
                                       }

                                       %>
                                              
                                <hr/>

                                <%     }
                                       out.println("<b>Refresh your browser window to get the latest updates</b>");





                                    
                                    %>
                                 </div>
                              </div>
                           </div>
                        </div>
                      
                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Customers</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <%
                                    
                                    customers = checkdb.executeQuery("select customer_id, firstName, lastName, gender, address, region, telephone from customers");
                                    customerstable = customers.getMetaData();
                                    int customerColumns = customerstable.getColumnCount();
                                    
                                    while(customers.next()){
                                        for(int c=1; c<= customerColumns; c++) {
                                    
                                     if(c > 1) out.println("");
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                     String columnValue = customers.getString(c);
                                          out.println(customerstable.getColumnName(c));
                                          %>&nbsp;&nbsp;&nbsp;<%
                                       }
                                       %>
                                      
                                    <hr/>
                                    <hr/>
                                   <%
                               while(customers.next()){

                                       %>

                                       <br/>

                                <%
                                   for(int c=1; c<= customerColumns; c++) {

                                     if(c > 1) out.println("");

                                     String columnValue = customers.getString(c);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                          out.println(columnValue);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                       }

                                       %>
                                              
                                <hr/>

                                <%     }
                                       out.println("<b>Refresh your browser window to get the latest updates</b>");
                                    %>
                                 </div>
                              </div>
                           </div>
                        </div>
                      
                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Products</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <%
                                    
                                    products = checkdb.executeQuery("select * from products");
                                    productstable = products.getMetaData();
                                    int productsColumns = productstable.getColumnCount();
                                    
                                    while(products.next()){
                                        for(int p=1; p<= productsColumns; p++) {
                                    
                                     if(p > 1) out.println("");
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;<%
                                     String columnValue = products.getString(p);
                                          out.println(productstable.getColumnName(p));
                                          %>&nbsp;&nbsp;&nbsp;&nbsp;<%
                                       }
                                       %>
                                      
                                    <hr/>
                                    <hr/>
                                   <%
                               while(products.next()){

                                       %>

                                       <br/>

                                <%
                                   for(int c=1; c<= productsColumns; c++) {

                                     if(c > 1) out.println("");

                                     String columnValue = products.getString(c);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                          out.println(columnValue);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <%
                                       }

                                       %>
                                              
                                <hr/>

                                <%     }
                                       out.println("<b>Refresh your browser window to get the latest updates</b>");
                                    %>
                                 </div>
                              </div>
                           </div>
                        </div>
                      
                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Staff</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <%
                                    
                                    staff = checkdb.executeQuery("select * from staff");
                                    stafftable = staff.getMetaData();
                                    int staffColumns = stafftable.getColumnCount();
                                    
                                    while(staff.next()){
                                        for(int st=1; st<= staffColumns; st++) {
                                    
                                     if(st > 1) out.println("");
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;<%
                                     String columnValue = staff.getString(st);
                                          out.println(stafftable.getColumnName(st));
                                          %>&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;<%
                                       }
                                       %>
                                      
                                    <hr/>
                                    <hr/>
                                   <%
                               while(staff.next()){

                                       %>

                                       <br/>

                                <%
                                   for(int st=1; st<= staffColumns; st++) {

                                     if(st > 1) out.println("");

                                     String columnValue = staff.getString(st);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                          out.println(columnValue);
                                     %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                     <%
                                       }

                                       %>
                                              
                                <hr/>

                                <%     }
                                       out.println("<b>Refresh your browser window to get the latest updates</b>");
                                    %>
                                 </div>
                              </div>
                           </div>
                        </div>

                     
                  </div>
               </div>
               <% 
                   }
                   }
                   }
                   }
                   } catch (SQLException ex) {                    
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