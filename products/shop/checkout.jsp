<%-- 
    Document   : checkout
    Created on : Aug 9, 2022, 9:45:23 PM
    Author     : HP
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>GIPPM | Checkout</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-1 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <%
                    Connection db_connect; 
                    Statement checkdb;
                    ResultSet details = null;
                    ResultSet order = null;
                    String fname = null;
                    String lname=null;
                    String address=null;
                    String region=null;
                    String tel=null;
                    
                    String id=null;
                    String milk=null;
                    String butter=null;
                    String ghee=null;
                    String yoghurt=null;
                    
                   
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
                   
                    details=  checkdb.executeQuery("select * from customers where customer_id='"+67+"'");
                    while(details.next()){
                        fname = details.getString("firstName");
                        lname = details.getString("lastName");
                        address = details.getString("address");
                        region = details.getString("region");
                        tel = details.getString("telephone");
        }
                    order=  checkdb.executeQuery("select * from orders where customer_id='"+67+"'");
                    while(order.next()){
                        id = order.getString("customer_id");
                        milk = order.getString("milk");
                        butter = order.getString("butter");
                        ghee = order.getString("ghee");
                        yoghurt = order.getString("yoghurt");
                        total = order.getString("total");
                        
        }        
    %>
                
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <div class="btn-group">
                        <a href="../index.jsp" class="btn btn-sm btn-light">Sign Out</button></a>
                        <a href="#" class="btn btn-sm btn-light">Contact Us</button></a>
                    </div>
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
                            <a href="#" class="nav-item nav-link">Confirm and place your order:</a>
                        </div>
                        
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

     

    <!-- Checkout Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Delivery details</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text" placeholder="<%out.println(fname);%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text" placeholder="<%out.println(lname);%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input class="form-control" type="text" placeholder="<%out.println(address);%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <input class="form-control" type="text" placeholder="<%out.println(tel);%>">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Region</label>
                            <input class="form-control" type="text" placeholder="<%out.println(region);%>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Products</h6>
                        <div class="d-flex justify-content-between">
                            <p>UHT Full Cream Milk</p>
                            <p><%out.println(milk);%></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Butter</p>
                            <p><%out.println(butter);%></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Ghee</p>
                            <p><%out.println(ghee);%></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Yorghut</p>
                            <p><%out.println(yoghurt);%></p>
                        </div>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6><%out.println(total);%></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Delivery (Free)</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5><%out.println(total);%></h5>
                        </div>
                    </div>
                </div>
                <form action="/GIPPM Dairy Enterprise/Checkout">
                    <div class="checkout">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment Mode</span></h5>
                        <div class="bg-light p-30">
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <p>Choose one:</p>
                                    <ul>
                                        <li>Mobile money</li>
                                        <li>Cash</li>
                                        <li>Visa</li>
                                        <li>Shopping Voucher</li>
                                        <li>Shopping points</li>
                                    </ul>
                                    <input type="text" size="30" name="payment" placeholder="Type your payment mode here">
                                </div>
                            </div>
                            <button class="btn btn-block btn-primary font-weight-bold py-3" value="submit">Place Order</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Checkout End -->
    
    <% } catch (SQLException ex) {                    
                    out.println("Error! Failed to connect to the database because of "+ex.getMessage());
        }%>
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
                <p><a href="#">Contact Us &nbsp;|</a></p>
            </div>
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

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>

</html>