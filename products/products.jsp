<%-- 
    Document   : products
    Created on : Aug 8, 2022, 10:37:44 PM
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
                    
                    ResultSet stock = null;
                    String stk = null;
                    
                    ResultSet sales = null;
                    String sal = null;
                    
                    ResultSet milksales=null;
                    String milks=null;
                    
                    ResultSet milkstock=null;
                    String milkst=null;
                    
                    ResultSet gheesales=null;
                    String ghees=null;
                    
                    ResultSet gheestock=null;
                    String gheest=null;
                    
                    ResultSet buttersales=null;
                    String butters=null;
                    
                    ResultSet butterstock=null;
                    String butterst=null;
                    
                    ResultSet yorgsales=null;
                    String yorgs=null;
                    
                    ResultSet yorgstock=null;
                    String yorgst=null;
                 
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
                 
                    stock=  checkdb.executeQuery("select sum(stock) as total from products");
                    while(
                           
                           
                           stock.next()){
                           stk= stock.getString("total");
                     
                            
                      
                    }  

                    sales=  checkdb.executeQuery("select sum(sales) as amount from products");
                    while(
                           
                           
                           sales.next()){
                           sal= sales.getString("amount");
                     
                            
                      
                    } 
                    
                    milksales=  checkdb.executeQuery("select sum(sales) as ms from products where product_id='g001'");
                    while(
                           
                           
                           milksales.next()){
                           milks = milksales.getString("ms");
                     
                            
                      
                    } 

                    yorgsales=  checkdb.executeQuery("select sum(sales) as ys from products where product_id='g002'");
                    while(
                           
                           
                           yorgsales.next()){
                           yorgs = yorgsales.getString("ys");
                     
                            
                      
                    }
                    
                           gheesales=  checkdb.executeQuery("select sum(sales) as gs from products where product_id='g004'");
                    while(
                           
                           
                           gheesales.next()){
                           ghees = gheesales.getString("gs");
                     
                            
                      
                    }
                    
                    buttersales=  checkdb.executeQuery("select sum(sales) as bs from products where product_id='g003'");
                    while(
                           
                           
                           buttersales.next()){
                           butters = buttersales.getString("bs");
                     
                            
                      
                    }
                    
                    gheestock=  checkdb.executeQuery("select sum(stock) as gst from products where product_id='g004'");
                    while(
                           
                           
                           gheestock.next()){
                           gheest = gheestock.getString("gst");
                     
                            
                      
                    }
                    
                    milkstock=  checkdb.executeQuery("select sum(stock) as mst from products where product_id='g001'");
                    while(
                           
                           
                           milkstock.next()){
                           milkst = milkstock.getString("mst");
                     
                            
                      
                    }
                    
                    yorgstock=  checkdb.executeQuery("select sum(stock) as gst from products where product_id='g002'");
                    while(
                           
                           
                           yorgstock.next()){
                           yorgst = yorgstock.getString("gst");
                     
                            
                      
                    }
                    
                    butterstock=  checkdb.executeQuery("select sum(stock) as bst from products where product_id='g003'");
                    while(
                           
                           
                           butterstock.next()){
                           butterst = butterstock.getString("bst");
                     
                            
                      
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
                           <h6><%out.println(name);%></h6>
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
                     
                     <li class="active"><a href="#"><i class="fa fa-shopping-cart green_color"></i> <span>Products and Sales</span></a></li>
                     
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
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Products and Sales Management</h2>
                           </div>
                        </div>
                     </div>

                     <p>Total stock: <%out.println(stk);%></p>
                     <p>Total Sales: <%out.println(sal);%></p>
                     <!-- row -->
                     <div class="row column1 social_media_section">
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons fb margin_bottom_30">
                              <div class="social_icon">
                                 UHT Milk
                              </div>
                                       <span><strong>Production Line:</strong></span>
                                       <span>Short Term</span>
                              <div class="social_cont">
                                 <ul>
                                    <li>
                                       <span><strong><%out.println(milkst);%></strong></span>
                                       <span>Stock</span>
                                    </li>
                                    <li>
                                       <span><strong><%out.println(milks);%></strong></span>
                                       <span>Sales</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons google_p margin_bottom_30">
                              <div class="social_icon">
                                 Yoghurt
                              </div>
                                       <span><strong>Production Line:</strong></span>
                                       <span>Short Term</span>
                              <div class="social_cont">
                                 <ul>
                                    
                                    <li>
                                       <span><strong><%out.println(yorgst);%></strong></span>
                                       <span>Stock</span>
                                    </li>
                                    <li>
                                       <span><strong><%out.println(yorgs);%></strong></span>
                                       <span>Sales</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons tw margin_bottom_30">
                              <div class="social_icon">
                                 Butter
                              </div>
                                       <span><strong>Production Line:</strong></span>
                                       <span>Mid Term</span>
                              <div class="social_cont">
                                 <ul>
                                    
                                    <li>
                                       <span><strong><%out.println(butterst);%></strong></span>
                                       <span>Stock</span>
                                    </li>
                                    <li>
                                       <span><strong><%out.println(butters);%></strong></span>
                                       <span>Sales</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons linked margin_bottom_30">
                              <div class="social_icon">
                                 Ghee
                              </div>
                               <span><strong>Production Line:</strong></span>
                               <span>Long Term</span>
                              <div class="social_cont">
                                 <ul>
                                    
                                    <li>
                                       <span><strong><%out.println(gheest);%></strong></span>
                                       <span>Stock</span>
                                    </li>
                                    <li>
                                       <span><strong><%out.println(ghees);%></strong></span>
                                       <span>Sales</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="formx">
                        <form action="/GIPPM Dairy Enterprise/Add_stockSize">
                              <input type="text" name="stock" placeholder="Enter here the number of stock to add to the long term production line" size="65"/>
                              <label class="label_field hidden">hidden label</label>
                              <button class="main_bt">Add</button>
                              </div>
                        </form>
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