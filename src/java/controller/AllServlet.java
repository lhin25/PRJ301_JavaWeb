/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OriginDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Origin;
import model.Product;

/**
 *
 * @author hien
 */
public class AllServlet extends HttpServlet {

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
            out.println("<title>Servlet AllServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AllServlet at " + request.getContextPath() + "</h1>");
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
        String org = request.getParameter("org");
        ProductDAO dao = new ProductDAO();
        OriginDAO dao1 = new OriginDAO();
        Origin ori = dao1.selectOrgin(org);
        ArrayList<Origin> orgList = dao1.getAllOrigin();
        ArrayList<Product> procList = null;
        HttpSession session = request.getSession();
        if (org.equals("all")) {
            procList = dao.getAllProduct();
            session.setAttribute("orgn", "All");
        } else {
            procList = dao.getProductbyOrigin(ori.getOrgId());
            session.setAttribute("orgn", ori.getOrgName());
        }
        
        int page, perPage = 9;
        int numPage = procList.size() % perPage == 0 ? procList.size()/perPage : procList.size()/perPage + 1;
        String pageid = request.getParameter("page");
        if (pageid == null) page = 1;
        else {
            page = Integer.parseInt(pageid);
        }
        int first = (page - 1) * perPage;
        int last = Math.min(page * perPage, procList.size()) - 1;
        
        request.setAttribute("first", first);
        request.setAttribute("last", last);
        request.setAttribute("num", numPage);
        session.setAttribute("proclist", procList);
        request.getRequestDispatcher("allproduct.jsp?org=" + org + "&page=" + page).forward(request, response);
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
