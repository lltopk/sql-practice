--
CREATE TABLE IF NOT EXISTS stocks (
    id BIGINT NOT NULL AUTO_INCREMENT,
    product_code VARCHAR(255) NOT NULL,
    stock BIGINT NOT NULL,
    PRIMARY KEY (id)
);

--
SELECT * ,t2.quantity as quantity from t1_quantity t1
left join t2_quantity t2 on t1.id = t2.t1_id  ;


-- 连接查询
select * from customer c left join `order` o on c.order_id  = o.id ;

select * from customer c right join `order` o on c.order_id  = o.id ;

select * from customer c join `order` o on c.order_id  = o.id ;

select * from customer c inner join `order` o on c.order_id  = o.id ;

-- 隐式连接(纯笛卡尔集)
select * from customer,`order`;

-- nullorderby
INSERT INTO nullorderby (id, code) VALUES (1, 'a');
INSERT INTO nullorderby (id, code) VALUES (2, 'b');
INSERT INTO nullorderby (id, code) VALUES (3, 'c');
INSERT INTO nullorderby (id, code) VALUES (4, NULL);
INSERT INTO nullorderby (id, code) VALUES (5, NULL);
SELECT * FROM nullorderby n WHERE code is not null;
SELECT * FROM nullorderby n WHERE code is null;
SELECT * FROM nullorderby n ORDER BY code DESC;
SELECT * FROM nullorderby n ORDER BY COALESCE (code,'e') DESC;

-- case when
select a.id ,a.name,
case 
when a.sex = '0' then '男'
when a.sex = '1' then '女'
else '人妖'
end as sex
from user a;





