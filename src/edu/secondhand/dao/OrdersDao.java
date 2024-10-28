package edu.secondhand.dao;

import edu.secondhand.entity.Items;
import edu.secondhand.entity.Orders;
import edu.secondhand.entity.Statics;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrdersDao {
    void updateOrders(@Param("Orders") Orders orders);

    Orders selectOrdersById(@Param("id") int id);

    void deleteOrders(@Param("id") int id);

    List<Orders> selectOrdersList(@Param("map") Map<String, Object> maps);

    void addOrders(@Param("Orders") Orders orders);

    List<Items> selectItemList(@Param("order_no") String order_no);

    void addItems(@Param("items") Items items);

    List<Items> selectItemListByMap(@Param("map") Map<String, Object> maps);

    Orders selectOrdersByNo(@Param("order_no") String order_no);

    void deleteItems(@Param("id") Integer id);

    List<Statics> selectInOrderStatics();

    List<Statics> selectStaticsTwo();
}
