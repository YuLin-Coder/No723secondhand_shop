package edu.secondhand.entity;


import java.util.List;

public class Orders {

    private Integer id;
    private String order_no;
    private String pay_way;
    private Integer quantity;
    private Integer total_price;
    private Integer sid;
    private String create_time;
    private List<Items> items;
    private Student student;

    public List<Items> getItems() {
        return items;
    }

    public void setItems(List<Items> items) {
        this.items = items;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getPay_way() {
        return pay_way;
    }

    public void setPay_way(String pay_way) {
        this.pay_way = pay_way;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Integer total_price) {
        this.total_price = total_price;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
}
