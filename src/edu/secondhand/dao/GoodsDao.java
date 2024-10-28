package edu.secondhand.dao;

import edu.secondhand.entity.Cart;
import edu.secondhand.entity.Goods;
import edu.secondhand.entity.Items;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GoodsDao {
    void updateGoods(@Param("Goods") Goods goods);

    Goods selectGoodsById(@Param("id") int id);

    void deleteGoods(@Param("id") int id);

    List<Goods> selectGoodsList(@Param("map") Map<String, Object> maps);

    void addGoods(@Param("Goods") Goods goods);

    List<Cart> selectCartList(@Param("map") Map<String, Object> maps);

    Cart selectCartByUidAndGid(@Param("cart")  Cart cart);

    void addCart(@Param("data") Cart data);

    void updateCart(@Param("data") Cart data);

    void deleteCart(@Param("id") Integer id);

    void updateGoodsQuantity(@Param("stock")int i,@Param("id") Integer id);
}
