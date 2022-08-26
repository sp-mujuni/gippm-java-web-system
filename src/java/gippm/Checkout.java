/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package gippm;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpResponse;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;


/**
 *
 * @author HP
 */
@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})

public class Checkout extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
           //String variable to alert admin of customer's payment mode
        String pay;
        pay = request.getParameter("payment");
        

        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Checkout Update</title>");            
            out.println("</head>");
            out.println("<body>");
 
                try{
               Class.forName("com.mysql.jdbc.Driver"); 
               try{
                   
               Connection dbconnect=DriverManager.getConnection("jdbc:mysql://localhost:3306/gippm_db", "root", "");
               Statement checkdb=dbconnect.createStatement();
                checkdb.executeUpdate("update orders set payment='"+pay+"' where customer_id='"+67+"'");
                
                //MTN MoMo Integration
                if(!"mobile money".equals(pay)){
                    out.println("Your order is being processed. You'll be contacted shortly....To view your receipt, click");
                    out.println("<a href='shop/receipt.jsp'>Here</a>");
                }
                
                else {
                    
                    CloseableHttpClient httpclient = HttpClients.createDefault();
                    
                    try
                        {
                            URIBuilder builder = new URIBuilder("https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay");


                            URI uri = builder.build();
                            HttpPost payrequest = new HttpPost(uri);
                            payrequest.setHeader("Authorization", "");
                            payrequest.setHeader("X-Callback-Url", "");
                            payrequest.setHeader("X-Reference-Id", "");
                            payrequest.setHeader("X-Target-Environment", "");
                            payrequest.setHeader("Content-Type", "application/json");
                            payrequest.setHeader("Ocp-Apim-Subscription-Key", "{subscription key}");


                            // Request body
                            StringEntity reqEntity = new StringEntity("{body}");
                            payrequest.setEntity(reqEntity);

                            CloseableHttpResponse payresponse = httpclient.execute(payrequest);
                            HttpEntity entity = payresponse.getEntity();

                            if (entity != null) 
                            {
                                System.out.println(EntityUtils.toString(entity));
                            }
                        }
                        catch (Exception e)
                        {
                            System.out.println(e.getMessage());
                        }
                }
                
                
               }catch(SQLException e){
                  out.println("error"+e.getMessage()); 
               }
              
            }catch(ClassNotFoundException e ){
            out.println("error"+e.getMessage());
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
