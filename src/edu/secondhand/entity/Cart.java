package edu.secondhand.entity;


public class Cart {

    private Integer id;
    private Integer g_id;
    private Integer quantity;
    private Integer sid;
    private Goods goods;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }


}
