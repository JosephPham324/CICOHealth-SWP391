/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import bean.User;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@WebFilter(filterName = "RequestFilter", urlPatterns = {"/*"})
public class RequestFilter implements Filter {

    /**
     *
     */
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    /**
     *
     */
    private FilterConfig filterConfig = null;

    /**
     *
     */
    public RequestFilter() {
    }

    /**
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RequestFilter:DoBeforeProcessing");
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

    /**
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RequestFilter:DoAfterProcessing");
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
     * Determines whether a given URL path is protected or not.
     *
     * @param pathParts the array of path parts extracted from the requested URL
     * @return true if the requested URL is protected, false otherwise
     */
    private boolean isProtectedUrl(String[] pathParts) {
        // Check if the requested URL is protected
        if (pathParts.length >= 2) {
            String section = pathParts[1];
            return section.equals("user") || section.equals("admin") || section.equals("exercise-programs") || section.equals("faq");
        } else {
            return false;
        }
    }

    /**
     * Determines if a user is authorized to access a given URL.
     *
     * @param httpRequest the HttpServletRequest object for the current request
     * @param pathParts an array of String objects containing the parts of the
     * URL path
     * @return a boolean indicating whether the user is authorized to access the
     * requested URL
     */
    private boolean isUserAuthorized(HttpServletRequest httpRequest, String[] pathParts) {
        Object user = httpRequest.getSession().getAttribute("user");
        // Check if the user is authorized to access the requested URL
        String userType = user == null ? null : ((User) user).getUserRole();

        if (userType == null) {
            // If the user is not logged in, only allow access to the public pages
            return isPublicUrl(pathParts);
        } else if (userType.equals("ME")) {
            // If the user is a member, allow access to member pages and public pages
            return isPublicUrl(pathParts) || isMemberUrl(pathParts);
        } else if (userType.equals("FE")) {
            // If the user is a fitness expert, allow access to fitness expert pages, member pages, and public pages
            return isPublicUrl(pathParts) || isMemberUrl(pathParts) || isFitnessExpertUrl(pathParts);
        } else if (userType.equals("AD")) {
            // If the user is an administrator, allow access to all pages
            return true;
        } else {
            // If the user type is not recognized, deny access
            return false;
        }
    }

    /**
     *
     *
     * Determines whether the requested URL is a public page or not.
     *
     * @param pathParts an array of path parts that make up the requested URL
     * @return true if the URL is a public page, false otherwise
     */
    private boolean isPublicUrl(String[] pathParts) {
        // Check if the requested URL is a public page
        if (pathParts.length >= 2) {
            String section = pathParts[1];
            return section.equals("utilities") || section.equals("food-search") || section.equals("exercise-search") || (section.equals("faq") && pathParts.length == 2
                    || section.equals("faq") && pathParts.length > 2 && pathParts[2].equals("answers"));
        } else {

            return false;
        }
    }

    /**
     *
     * Check if the requested URL is a member page.
     *
     * @param pathParts an array of path parts parsed from the request URL
     * @return true if the requested URL is a member page, false otherwise
     */
    private boolean isMemberUrl(String[] pathParts) {
        // Check if the requested URL is a member page
        if (pathParts.length >= 2) {
            String section = pathParts[1];
            if (section.equals("user")) {
                return true;
            }
            if (section.equals("exercise-programs")) {
                if (pathParts.length == 2) {
                    return true;
                } else if (pathParts.length == 3) {
                    String action = pathParts[2];
                    return action.equals("detail");
                }
            }
        }
        return false;
    }

    /**
     * Determines if the requested URL is a fitness expert page.
     *
     * @param pathParts an array of path segments that make up the requested URL
     * @return true if the requested URL is a fitness expert page, false
     * otherwise
     */
    private boolean isFitnessExpertUrl(String[] pathParts) {
        // Check if the requested URL is a fitness expert page
        if (pathParts.length >= 3) {
            String section = pathParts[1];
            String action = pathParts[2];
            return section.equals("exercise-programs") && (action.equals("create") || action.equals("edit"));
        } else {
            return false;
        }
    }
//    private boolean isAdminUrl(String[] pathParts){
//    }

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

        if (debug) {
            log("RequestFilter:doFilter()");
        }
        doBeforeProcessing(request, response);
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestedUrl = httpRequest.getRequestURI().substring(1);
        String contextPath = httpRequest.getContextPath();
        String[] pathParts = requestedUrl.split("/");
        // Check if the requested URL is protected
        Throwable problem = null;

        if (isProtectedUrl(pathParts)) {
            // Check if the user is authorized to access the requested URL
            if (isUserAuthorized(httpRequest, pathParts)) {

                // If the user is authorized, forward the request to the requested URL
                try {
                    chain.doFilter(request, response);
                } catch (Throwable t) {
                    // If an exception is thrown somewhere down the filter chain,
                    // we still want to execute our after processing, and then
                    // rethrow the problem after that.
                    problem = t;
                    t.printStackTrace();
                }
            } else {
                // If the user is not authorized, redirect to the unauthorized error page
                httpResponse.sendError(403);
                return;
            }
        } else {            // If the requested URL is not protected, just forward the request
            //But check if user is logged in to prevent accessing login and register page
            if (httpRequest.getSession().getAttribute("user") != null) {
                if (pathParts.length > 1 && (pathParts[1].equals("login") || pathParts[1].equals("register"))) {
                    httpResponse.sendRedirect(contextPath + "/");
                    return;
                }
            }
            try {
                chain.doFilter(request, response);
            } catch (Throwable t) {
                // If an exception is thrown somewhere down the filter chain,
                // we still want to execute our after processing, and then
                // rethrow the problem after that.
                problem = t;
                t.printStackTrace();
            }
        }
        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
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
     *
     * @param filterConfig
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("RequestFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("RequestFilter()");
        }
        StringBuffer sb = new StringBuffer("RequestFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    /**
     *
     * @param t
     * @param response
     */
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

    /**
     *
     * @param t
     * @return
     */
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

    /**
     *
     * @param msg
     */
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
