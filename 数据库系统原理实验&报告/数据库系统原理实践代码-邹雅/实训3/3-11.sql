-- 11) 给出黄姓用户的编号、名称、办理的银行卡的数量(没有办卡的卡数量计为0),持卡数量命名为number_of_cards,
--     按办理银行卡数量降序输出,持卡数量相同的,依客户编号排序。
-- 请用一条SQL语句实现该查询：

select c_id,c_name,count(b_c_id) number_of_cards
from client left outer join bank_card on b_c_id = c_id
where c_name like '黄%'
group by c_id
order by count(b_c_id) desc,c_id;






/*  end  of  your code  */ 