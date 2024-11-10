package MVC;

/*The RestaurantBean class is a JavaBean that represents a "data object" for restaurant information, 
 * which includes details like the customer ID, item name, price of the item, and feedback provided by the customer.*/

public class RestaurantBean {
    private String c_id;
    private String c_item;
    private String price;
    private String feedback;
    
    //In your RestaurantBean class, the instance variables (e.g., c_id, c_item, price, feedback) are private, 
    //meaning they can't be accessed directly outside of the class. 
    //Instead, we use public getter and setter methods to provide controlled access to these private variables.

    public String getC_id() {
        return c_id;
    }
    public void setC_id(String c_id) {
        this.c_id = c_id;
    }
    public String getC_item() {
        return c_item;
    }
    public void setC_item(String c_item) {
        this.c_item = c_item;
    }
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    public String getFeedback() {
        return feedback;
    }
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    @Override
    public String toString() {
        return "RestaurantBean [c_id=" + c_id + ", c_item=" + c_item + ", price=" + price + ", feedback=" + feedback + "]";
    }
}
