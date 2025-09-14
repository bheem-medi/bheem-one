package com.bheemas.dao;

import com.bheemas.model.Order;
import com.bheemas.model.OrderItem;
import com.bheemas.util.DatabaseUtil;
import java.sql.*;
import java.util.List;

public class OrderDAO {
    
    public int createOrder(Order order) {
        String orderSql = "INSERT INTO orders (customer_name, customer_phone, customer_address, total_amount) " +
                         "VALUES (?, ?, ?, ?)";
        String itemSql = "INSERT INTO order_items (order_id, menu_item_id, quantity, price) " +
                        "VALUES (?, ?, ?, ?)";
        
        int orderId = 0;
        
        try (Connection conn = DatabaseUtil.getConnection()) {
            conn.setAutoCommit(false);
            
            // Insert order
            try (PreparedStatement pstmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                pstmt.setString(1, order.getCustomerName());
                pstmt.setString(2, order.getCustomerPhone());
                pstmt.setString(3, order.getCustomerAddress());
                pstmt.setDouble(4, order.getTotalAmount());
                
                int affectedRows = pstmt.executeUpdate();
                
                if (affectedRows > 0) {
                    try (ResultSet rs = pstmt.getGeneratedKeys()) {
                        if (rs.next()) {
                            orderId = rs.getInt(1);
                        }
                    }
                }
            }
            
            // Insert order items
            if (orderId > 0) {
                List<OrderItem> items = order.getItems();
                try (PreparedStatement pstmt = conn.prepareStatement(itemSql)) {
                    for (OrderItem item : items) {
                        pstmt.setInt(1, orderId);
                        pstmt.setInt(2, item.getMenuItemId());
                        pstmt.setInt(3, item.getQuantity());
                        pstmt.setDouble(4, item.getPrice());
                        pstmt.addBatch();
                    }
                    pstmt.executeBatch();
                }
                
                conn.commit();
            } else {
                conn.rollback();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return orderId;
    }
}
