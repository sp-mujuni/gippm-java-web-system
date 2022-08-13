/*Author: Simon Peter Mujuni*/
/*Date: 12th Auguat, 2022

/*-------------------*/
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package gippm;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "Reallocation", urlPatterns = {"/Reallocation"})

public class Reallocation extends HttpServlet {

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
        
        ResultSet sales_short=null;
        String nshorts = null;
 
        ResultSet sales_long=null;
        String nlong = null;

        ResultSet sales_mid=null;
        String nmid=null;
        
        ResultSet totalstaff=null;
        String totalString=null;
        int newgroup;

        double shortstaff;
        int newshortstaff;
        
        int longsales;
        int midsales;
        int shortsales;

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Staff Reallocation Update</title>");            
            out.println("</head>");
            out.println("<body>");
            
                try{
               Class.forName("com.mysql.jdbc.Driver"); 
               try{
                   
               Connection dbconnect=DriverManager.getConnection("jdbc:mysql://sql5.freemysqlhosting.net:3306/sql5512420", "sql5512420", "A45YfnLFQH");
               Statement checkdb=dbconnect.createStatement();
               

                 //Assuming the time taken to manufacture a given number of products in long term line
                 //is 72 hours. The size of staff in short term line needed to produce the same products
                 shortstaff=72.0*0.25;
                 newshortstaff = (int)shortstaff;
                 
                 checkdb.executeUpdate("update production_lines set prdtn_size='"+newshortstaff+"' where prdtn_line_id='1'");
                 
                 //counting number of lonterm staff
                 

               
                        //Getting total sales from each production line from database
                 sales_short= checkdb.executeQuery("select sum(sales) as sshort from products where productionline='1'");
                 while(sales_short.next()){
                        nshorts = sales_short.getString("sshort");
                        
                 }
                 
                 sales_long= checkdb.executeQuery("select sum(sales) as slong from products where productionline='3'");
                 while(sales_long.next()){
                        nlong = sales_long.getString("slong");
                        
                 }
                 
                 sales_mid= checkdb.executeQuery("select sum(sales) as smid from products where productionline='2'");
                 while(sales_mid.next()){
                        nmid = sales_mid.getString("smid");
                        
                 }

                //Comparing sales in the production lines
               longsales = parseInt(nlong);
               midsales = parseInt(nmid);
               shortsales = parseInt(nshorts);
               
               
                totalstaff=  checkdb.executeQuery("select count(staff_id) as num from staff");
                while(totalstaff.next()){
                        totalString = totalstaff.getString("num");
                        
                 }
                
                
                
                //total staff into integer. -2 is needed to show that two staff remain in the other line
                //after reallocation
                newgroup=parseInt(totalString)-2;
                
                
                 if(longsales>shortsales && longsales>midsales)
                 {
                     checkdb.executeUpdate("update staff set allocation='"+3+"' where allocation='2'");
                     checkdb.executeUpdate("update staff set allocation='"+3+"' where allocation='1'");
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+3+"' where prdtn_line_id='3'");
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+newgroup+"' where prdtn_line_id='3'");

                 }
                 else if(midsales>longsales && midsales > shortsales)
                 {
                     checkdb.executeUpdate("update staff set allocation='"+2+"' where allocation='3'");
                     checkdb.executeUpdate("update staff set allocation='"+2+"' where allocation='1'");
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+2+"' where prdtn_line_id='2'");
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+newgroup+"' where prdtn_line_id='2'");

                 }
                 else
                 {
                     out.println("Error in reallocation! ");
                 }
                 
                
                 //Emptying the unassinged production line
                checkdb.executeUpdate("update production_lines set prdtn_size='"+0+"' where prdtn_line_name='unassigned'");

                 
                 

                 
               }catch(SQLException e){
                  out.println("error"+e.getMessage());
                  out.println("Could not execute reallocation! Contact the software vendor for technical support");
               }
              
               out.println("<a href='admin/pages/human_resource.jsp'>Return to dashboard to confirm allocations</a>");

            }catch(ClassNotFoundException e ){
            out.println("Crucial Error! "+e.getMessage());
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
    }
}// </editor-fold>