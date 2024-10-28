package edu.secondhand.service.impl;

import edu.secondhand.dao.GoodsDao;
import edu.secondhand.entity.Cart;
import edu.secondhand.entity.Goods;
import edu.secondhand.entity.Items;
import edu.secondhand.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    GoodsDao dao;

    @Override
    public void addGoods(Goods goods) {
        dao.addGoods(goods);
    }

    @Override
    public List<Goods> selectGoodsList(Map<String, Object> maps) {
        return   dao.selectGoodsList(maps);
    }

    @Override
    public void deleteGoods(int id) {
        dao.deleteGoods(id);
    }

    @Override
    public Goods selectGoodsById(int id) {
        return  dao.selectGoodsById(id);
    }

    @Override
    public void updateGoods(Goods goods) {
        dao.updateGoods(goods);
    }

    @Override
    public List<Cart> selectCartList(Map<String, Object> maps) {
        return dao.selectCartList(maps);
    }

    @Override
    public Cart selectCartByUidAndGid(Cart cart) {
        return dao.selectCartByUidAndGid(cart);
    }

    @Override
    public void addCart(Cart data) {
        dao.addCart(data);
    }

    @Override
    public void updateCart(Cart data) {
        dao.updateCart(data);
    }

    @Override
    public void deleteCart(Integer id) {
        dao.deleteCart(id);
    }

    @Override
    public void updateGoodsQuantity(int i, Integer id) {
        dao.updateGoodsQuantity(i,id);
    }


}
