package edu.secondhand.service;


import edu.secondhand.entity.Items;
import edu.secondhand.entity.Orders;
import edu.secondhand.entity.Statics;

import java.util.List;
import java.util.Map;

public interface OrdersService {
    void addOrders(Orders orders);

    List<Orders> selectOrdersList(Map<String, Object> maps);

    void deleteOrders(int id);

    Orders selectOrdersById(int id);

    void updateOrders(Orders orders);

    List<Items> selectItemList(String order_no);

    void addItems(Items items);

    List<Items> selectItemListByMap(Map<String, Object> maps);

    Orders selectOrdersByNo(String order_no);

    void deleteItems(Integer id);

    List<Statics> selectInOrderStatics();

    List<Statics> selectStaticsTwo();
}
