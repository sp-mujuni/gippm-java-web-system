<%-- 
    Document   : cart
    Created on : Aug 9, 2022, 9:46:11 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>GIPPM | Shopping Cart</title>
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
                            <a href="#" class="nav-item nav-link">Shopping cart details:</a>
                        </div>
                        
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

    
<!-- Cart Start -->
    <div class="container-fluid">
        <form action="/GIPPM Dairy Enterprise/Cart">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <p><b>The cart shows all products on sale. Kindly fill the quantity for those you want to buy and put zero in the rest</b></p>

                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                               
                        </tr>
                    </thead>
                    
                    <tbody class="align-middle">
                        
                            <tr>
                                <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> UHT Full Cream Milk</td>
                                <td class="align-middle">UGX 1,500</td>
                                <td class="align-middle">
                                    <input type="text" name="q_milk" size="14" placeholder="Enter quantity">
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="align-middle"><img src="img/product-2.jpg" alt="" style="width: 50px;"> Butter</td>
                                <td class="align-middle">UGX 13,000</td>
                                <td class="align-middle">
                                  <input type="text" name="q_butter" size="14" placeholder="Enter quantity">
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="align-middle"><img src="img/product-2.jpg" alt="" style="width: 50px;"> Ghee</td>
                                <td class="align-middle">UGX 6,000</td>
                                <td class="align-middle">
                                  <input type="text" name="q_ghee" size="14" placeholder="Enter quantity">
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="align-middle"><img src="img/product-5.jpg" alt="" style="width: 50px;"> Yorghut</td>
                                <td class="align-middle">UGX 2,000</td>
                                <td class="align-middle">
                                    <input type="text" name="q_yoghurt" size="14" placeholder="Enter quantity">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                </form>
                <br>
                <br>
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Updating your cart...</h5>
                            <h5></h5>
                        </div>
                        <button class="btn btn-block btn-primary font-weight-bold my-3 py-3" value="submit">Click here to refresh Shopping Cart</button></a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    </div>
    <!-- Cart End -->

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