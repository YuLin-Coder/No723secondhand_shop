package edu.secondhand.service.impl;

import edu.secondhand.dao.OrdersDao;
import edu.secondhand.entity.Items;
import edu.secondhand.entity.Orders;
import edu.secondhand.entity.Statics;
import edu.secondhand.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    OrdersDao dao;

    @Override
    public void addOrders(Orders orders) {
        dao.addOrders(orders);
    }

    @Override
    public List<Orders> selectOrdersList(Map<String, Object> maps) {
        return   dao.selectOrdersList(maps);
    }

    @Override
    public void deleteOrders(int id) {
        dao.deleteOrders(id);
    }

    @Override
    public Orders selectOrdersById(int id) {
        return  dao.selectOrdersById(id);
    }

    @Override
    public void updateOrders(Orders orders) {
        dao.updateOrders(orders);
    }

    @Override
    public List<Items> selectItemList(String order_no) {
        return  dao.selectItemList(order_no);
    }

    @Override
    public void addItems(Items items) {
        dao.addItems(items);
    }

    @Override
    public List<Items> selectItemListByMap(Map<String, Object> maps) {
        return   dao.selectItemListByMap(maps);
    }

    @Override
    public Orders selectOrdersByNo(String order_no) {
        return dao.selectOrdersByNo(order_no);
    }

    @Override
    public void deleteItems(Integer id) {
        dao.deleteItems(id);
    }

    @Override
    public List<Statics> selectInOrderStatics() {
        return dao.selectInOrderStatics();
    }

    @Override
    public List<Statics> selectStaticsTwo() {
        return dao.selectStaticsTwo();
    }

}
