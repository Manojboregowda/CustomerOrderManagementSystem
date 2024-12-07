package in.vaish.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;

import in.vaish.dao.CustomerDAO;
import in.vaish.dao.ItemDAO;
import in.vaish.dao.OrdersDAO;
import in.vaish.entity.Customer;
import in.vaish.entity.Items;
import in.vaish.entity.Order;

@Controller
public class CustomerController {
	@Autowired
	private CustomerDAO customerDAO;

	@Autowired
	private OrdersDAO orderDAO;

	@Autowired
	private ItemDAO iteamDAO;

	@GetMapping("/reg")
	public String regPage() {
		return "register";
	}

	@PostMapping("/addCustomer")
	public String addCustomer(@ModelAttribute Customer customer, Model model) {
		String message = customerDAO.addCustomer(customer);
		model.addAttribute("msg", message);
		return "redirect:login";
	}

	@GetMapping("/login")
	public String loginCustomer(@ModelAttribute Customer cus, Model model) {
		Customer customer = customerDAO.findByEmailAndPassword(cus.getEmail(), cus.getPassword());
		System.out.println(customer);
		if (customer != null) {
			String message = "Login Successfull";
			model.addAttribute("msg", message);
			return "redirect:order";
		} else {
			String message = "Login Failed please check email and password!";
			model.addAttribute("msg", message);
			return "login";
		}
	}

	private List<Items> getAllItems() {
		System.out.println(iteamDAO.getallitem());
		return iteamDAO.getallitem();
	}

	private List<Items> availableItems = Arrays.asList(new Items(1, "Chicken Biryani", 140.0),
			new Items(2, "Muttom Biryani", 200.0), new Items(3, "Kara Pongal", 80.0),
			new Items(4, "Masala Dosa", 60.0));

	@GetMapping("/order")
	public String addOrders(Model model) {
//		List<Items> listItems = iteamDAO.getallitem();
//		model.addAttribute("items", listItems);
		model.addAttribute("items", availableItems);
		return "orderpage";
	}

	@PostMapping("/addOrder")
	public String addOrder(@RequestParam("itemIds") List<Integer> itemIds, Order order1, Model model) {
		// Find the selected items based on the itemIds
		List<Items> selectedItems = new ArrayList<>();
		for (Integer itemId : itemIds) {
			Items selectedItem = availableItems.stream().filter(item -> item.getId().equals(itemId)).findFirst()
					.orElse(null);
			if (selectedItem != null) {
				selectedItems.add(selectedItem);
			}
		}

		// Create an order with the selected items
		Order order = new Order(1, selectedItems);
		System.out.println(selectedItems);
		model.addAttribute("selectedItem", selectedItems);
		model.addAttribute("order", order);
		model.addAttribute("message", "Items added to the order!");
		System.out.println(order);
		return "orderSummary"; // Return to the order summary page
	}

	@GetMapping("/allCustomers")
	public String getCustomers(Model model) {
		List<Customer> customer = customerDAO.getAllCustomers();
		System.out.println(customer);
		model.addAttribute("customer", customer);
		return "customers";
	}

	@GetMapping("/customers/{customerId}/orders")
	public String getOrders(@PathVariable int customerId, Model model) {
		List<Order> orders = orderDAO.getOrdersByCustomerId(customerId);
		model.addAttribute("orders", orders);
		model.addAttribute("customerId", customerId);
		return "orders";
	}

	@PostMapping("/customers/{customerId}/orders")
	public String createOrder(@PathVariable int customerId, @ModelAttribute Order order) {
		order.setCustomerId(customerId);
		orderDAO.createOrder(order);
		return "redirect:/customers/" + customerId + "/orders";
	}

	@PostMapping("/orders/{orderId}")
	public String updateOrder(@PathVariable int orderId, @ModelAttribute Order order) {
		order.setId(orderId);
		orderDAO.updateOrder(order);
		return "redirect:/customers/" + order.getCustomerId() + "/orders";
	}

	@GetMapping("/orders/{orderId}/delete")
	public String deleteOrder(@PathVariable int orderId, @RequestParam int customerId) {
		orderDAO.deleteOrder(orderId);
		return "redirect:/customers/" + customerId + "/orders";
	}
}