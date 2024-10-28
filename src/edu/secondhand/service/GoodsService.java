package edu.secondhand.service;


import edu.secondhand.entity.Cart;
import edu.secondhand.entity.Goods;
import edu.secondhand.entity.Items;

import java.util.List;
import java.util.Map;

public interface GoodsService {
    void addGoods(Goods goods);

    List<Goods> selectGoodsList(Map<String, Object> maps);

    void deleteGoods(int id);

    Goods selectGoodsById(int id);

    void updateGoods(Goods goods);

    List<Cart> selectCartList(Map<String, Object> maps);

    Cart selectCartByUidAndGid(Cart cart);

    void addCart(Cart cart);

    void updateCart(Cart data);

    void deleteCart(Integer id);

    void updateGoodsQuantity(int i, Integer id);
}
