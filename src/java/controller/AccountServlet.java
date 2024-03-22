/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.User;

/**
 *
 * @author hien
 */
public class AccountServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderHistory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderHistory at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        OrderDAO da = new OrderDAO();
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("acc");
        String uid = us.getUsId();
        ArrayList<Order> allOrder = da.getOrder();
        ArrayList<Order> ord_by_us = da.getOrderByUser(uid);
        
        int page1, perPage1 = 5;
        int numPage1 = allOrder.size() % perPage1 == 0 ? allOrder.size()/perPage1 : allOrder.size()/perPage1 + 1;
        String pageid = request.getParameter("page");
        if (pageid == null) page1 = 1;
        else {
            page1 = Integer.parseInt(pageid);
        }
        int first1 = (page1 - 1) * perPage1;
        int last1 = Math.min(page1 * perPage1, allOrder.size()) - 1;
        
        request.setAttribute("first1", first1);
        request.setAttribute("last1", last1);
        request.setAttribute("num1", numPage1);
        
        int page2, perPage2 = 5;
        int numPage2 = ord_by_us.size() % perPage2 == 0 ? ord_by_us.size()/perPage2 : ord_by_us.size()/perPage2 + 1;
        if (pageid == null) page2 = 1;
        else {
            page2 = Integer.parseInt(pageid);
        }
        int first2 = (page2 - 1) * perPage2;
        int last2 = Math.min(page2 * perPage2, ord_by_us.size()) - 1;
        
        request.setAttribute("first2", first2);
        request.setAttribute("last2", last2);
        request.setAttribute("num2", numPage2);
        
        session.setAttribute("ords", allOrder);
        session.setAttribute("orderListByUser", ord_by_us);
        request.getRequestDispatcher("account.jsp").forward(request, response);
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
