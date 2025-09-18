
package com.bheemas.controller;

import com.bheemas.dao.MenuDAO;
import com.bheemas.dao.OrderDAO;
import com.bheemas.model.Order;
import com.bheemas.model.OrderItem;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order")
public class OrderController extends HttpServlet {
    private MenuDAO menuDAO;
    private OrderDAO orderDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        menuDAO = new MenuDAO();
        orderDAO = new OrderDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get all menu items for the order form
        request.setAttribute("menuItems", menuDAO.getAllMenuItems());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/order.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String customerAddress = request.getParameter("customerAddress");
        
        // Process order items
        List<OrderItem> orderItems = new ArrayList<>();
        double totalAmount = 0;
        
        String[] itemIds = request.getParameterValues("itemId");
        if (itemIds != null) {
            for (String itemId : itemIds) {
                String quantityParam = request.getParameter("quantity_" + itemId);
                if (quantityParam != null && !quantityParam.isEmpty()) {
                    int quantity = Integer.parseInt(quantityParam);
                    if (quantity > 0) {
                        com.bheemas.model.MenuItem menuItem = menuDAO.getMenuItemById(Integer.parseInt(itemId));
                        if (menuItem != null) {
                            OrderItem orderItem = new OrderItem(
                                menuItem.getId(),
                                menuItem.getName(),
                                quantity,
                                menuItem.getPrice()
                            );
                            
                            orderItems.add(orderItem);
                            totalAmount += menuItem.getPrice() * quantity;
                        }
                    }
                }
            }
        }
        
        // Create order
        Order order = new Order();
        order.setCustomerName(customerName);
        order.setCustomerPhone(customerPhone);
        order.setCustomerAddress(customerAddress);
        order.setTotalAmount(totalAmount);
        order.setItems(orderItems);
        
        int orderId = orderDAO.createOrder(order);
        
        if (orderId > 0) {
            request.setAttribute("orderId", orderId);
            request.setAttribute("totalAmount", totalAmount);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/confirmation.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to place order. Please try again.");
            request.setAttribute("menuItems", menuDAO.getAllMenuItems());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/order.jsp");
            dispatcher.forward(request, response);
        }
    }
}
