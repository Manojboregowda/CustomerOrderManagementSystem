package in.vaish.entity;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
	private int id;
    private Date orderDate;
    private double totalAmount;
    private int customerId;
    
    private List<Items> items; // List of items in the order

    // Constructor, Getters and Setters
    public Order(int id, List<Items> items) {
        this.id = id;
        this.items = items;
        this.totalAmount = calculateTotal();
    }
    
    // Calculate total amount of the order
    private Double calculateTotal() {
        return items.stream().mapToDouble(Items::getPrice).sum();
    }
}
