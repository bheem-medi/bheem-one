package com.bheemas.controller;

import com.bheemas.dao.MenuDAO;
import com.bheemas.model.MenuItem;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuController extends HttpServlet {
    private MenuDAO menuDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        menuDAO = new MenuDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String category = request.getParameter("category");
        List<MenuItem> menuItems;
        
        if (category != null && !category.isEmpty()) {
            menuItems = menuDAO.getMenuItemsByCategory(category);
        } else {
            menuItems = menuDAO.getAllMenuItems();
        }
        
        request.setAttribute("menuItems", menuItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/menu.jsp");
        dispatcher.forward(request, response);
    }
}
