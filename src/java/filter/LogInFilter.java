/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author hien
 */
public class LogInFilter implements Filter {
    private static final int US = 1;
    private static final int AD = 0;
    private static final String LOGIN_PAGE = "login.jsp";
    private static final List<String> ADMIN_FUNC = new ArrayList<>();
    private static final List<String> USER_FUNC = new ArrayList<>();
    
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public LogInFilter() {
        ADMIN_FUNC.add("loginservlet");
        ADMIN_FUNC.add("addproduct.jsp");
        ADMIN_FUNC.add(LOGIN_PAGE);
        ADMIN_FUNC.add("updateproduct.jsp");
        ADMIN_FUNC.add("updateproductservlet");
        ADMIN_FUNC.add("addnewservlet");
        ADMIN_FUNC.add("account.jsp");
        ADMIN_FUNC.add("accountservlet");
        ADMIN_FUNC.add("deleteproductservlet");
        ADMIN_FUNC.add("editaccountservlet");
        ADMIN_FUNC.add("logoutservlet");
        
        USER_FUNC.add(LOGIN_PAGE);
        USER_FUNC.add("account.jsp");
        USER_FUNC.add("accountservlet");
        USER_FUNC.add("cart.jsp");
        USER_FUNC.add("addcartservlet");
        USER_FUNC.add("editaccountservlet");
        USER_FUNC.add("process");
        USER_FUNC.add("checkoutservlet");
        USER_FUNC.add("editacc.jsp");
        USER_FUNC.add("logoutservlet");
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LogInFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LogInFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        try{
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            if (uri.endsWith(req.getContextPath()) ||uri.contains(LOGIN_PAGE) || uri.contains("allservlet") || uri.contains("homeservlet") 
                    || uri.contains("loginservlet")|| uri.contains("detailservlet")|| uri.contains("search_result.jsp")|| uri.contains("searchservlet") || uri.contains("registerservlet") || 
                    uri.contains(".css") || uri.contains(".jpg") || uri.contains(".png") || uri.contains(".webp") || uri.contains(".jpeg") || uri.endsWith(".js"))
                chain.doFilter(request, response);
            else {
                int index = uri.lastIndexOf("/");
                String resource = uri.substring(index + 1);
                HttpSession session = req.getSession();
                if ( session.getAttribute("acc") == null){
                    res.sendRedirect("homeservlet");
                } else {
                    User us = (User) session.getAttribute("acc");
                    int role = us.getRole();
                    if (US == role && USER_FUNC.contains(resource)){
                        chain.doFilter(request, response);
                    } else if (AD == role && ADMIN_FUNC.contains(resource)){
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect("homeservlet");
                    }
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("LogInFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("LogInFilter()");
        }
        StringBuffer sb = new StringBuffer("LogInFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
