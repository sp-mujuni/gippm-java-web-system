<%-- 
    Document   : inde2
    Created on : Aug 8, 2022, 8:57:45 AM
    Author     : HP
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>GIPPM Dairy Enterprise | Home</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
     <%
                    Connection db_connect; 
                    Statement checkdb;
                    ResultSet tlikes = null;
                    String name = null;
                    String total=null;
            try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {                    
                    out.println("Error loading driver because of "+ex.getMessage());
          
                }
            
            //2. Connecting to database. This is only successful if the JDBC driver is working
            try {    //Connecting to database 
                    db_connect = DriverManager.getConnection("jdbc:mysql://sql5.freemysqlhosting.net:3306/sql5512420", "sql5512420", "A45YfnLFQH");
            
            //3. If database connection is successful, we can now issue an SQL statement to verify the admin
                    checkdb = db_connect.createStatement();
                   
                    tlikes=  checkdb.executeQuery("select sum(likes) as num from products");
                    while(tlikes.next()){
                        total = tlikes.getString("num");
        }
    
    %>
    
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-1 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center h-100">
                    <a class="text-body mr-3" href=""><b>You can show interest in a product by tapping the heart. To purchase a product, you need to Sign In or Register</b></a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <div class="btn-group">
                        <a href="authentication/signin.jsp" class="btn btn-sm btn-light">Sign In</button></a>
                        <a href="authentication/customer_register.jsp" class="btn btn-sm btn-light">Register</button></a>
                        <a href="#" class="btn btn-sm btn-light">Contact Us</button></a>
                    </div>
                </div>
                <div class="d-inline-flex align-items-center d-block d-lg-none">
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-heart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;"><%out.println(total);%></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">GIPPM</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">DAIRY SHOP</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                
            </div>
            <div class="col-lg-4 col-6 text-right">
                <p class="m-0">We are hiring!</p>
                <a href="#"><h5 class="m-0">Apply Now</h5></a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->

   <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">GIPPM</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Dairy</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="#" class="nav-item nav-link">We offer dairy products in the following four categories below:</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                            <a href="" class="btn px-0">
                                <i class="fas fa-heart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;"><%out.println(total);%></span>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Products Start -->
  <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/uht milk.jpg" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="authentication/signin.jsp"><i class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="/GIPPM Dairy Enterprise/Likes_milk"><i class="far fa-heart"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">UHT Full Cream Milk</a>
                        <hr/>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>UGX 1,500</h5><h6 class="text-muted ml-2"><del>UGX 2,000</del></h6>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/butter.jpg" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="authentication/signin.jsp"><i class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="/GIPPM Dairy Enterprise/Likes_butter"><i class="far fa-heart"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">Butter</a>
                        <hr/>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>UGX 13,000</h5><h6 class="text-muted ml-2"><del>UGX 15,000</del></h6>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/ghee.jpg" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="authentication/signin.jsp"><i class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="/GIPPM Dairy Enterprise/Likes_ghee"><i class="far fa-heart"></i></a>                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">Ghee</a>
                        <hr/>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>UGX 6,000</h5><h6 class="text-muted ml-2"><del>UGX 8,500</del></h6>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/yorghut.jpg" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="authentication/signin.jsp"><i class="fa fa-shopping-cart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="/GIPPM Dairy Enterprise/Likes_yoghurt"><i class="far fa-heart"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">Yoghrut</a>
                        <hr/>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>UGX 2,000</h5><h6 class="text-muted ml-2"><del>UGX 4,000</del></h6>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->

    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Products</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Delivery</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->

    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="footer">
           
            <div class="footer-a">
                <p><a href="#">&nbsp; Terms of Service &nbsp;|</a></p>
            </div>
            <div class="footer-b">
                <p><a href="#">&nbsp; Privacy Policy |</a></p>
            </div>
            <div class="footer-c">
                <p>&nbsp; Designed with inspiration from <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a></p>
            </div>
        </div>
    </div>
    <!-- Footer End -->
<% } catch (SQLException ex) {                    
                    out.println("Error! Failed to connect to the database because of "+ex.getMessage());
        }%>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>