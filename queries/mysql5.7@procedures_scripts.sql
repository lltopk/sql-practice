-- 小表驱动大表构造
-- 1. 主表：店铺（小表，约 100 行）
CREATE TABLE shop (
    shop_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺ID',
    shop_name VARCHAR(100) NOT NULL COMMENT '店铺名称',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (shop_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺表';

-- 2. 子表：订单（中等表，约 10万~100万行）
CREATE TABLE orders (
    order_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    shop_id BIGINT UNSIGNED NOT NULL COMMENT '所属店铺ID',
    customer_id BIGINT UNSIGNED NOT NULL COMMENT '客户ID',
    order_status TINYINT NOT NULL DEFAULT 1 COMMENT '订单状态: 1-待支付, 2-已支付, 3-已发货...',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (order_id),
    KEY idx_shop_id (shop_id),               -- 关键：用于JOIN shop
    KEY idx_created_at (created_at),
    CONSTRAINT fk_orders_shop FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 3. 子子表：订单明细（大表，千万级以上）
CREATE TABLE order_items (
    item_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '明细ID',
    order_id BIGINT UNSIGNED NOT NULL COMMENT '订单ID',
    product_id BIGINT UNSIGNED NOT NULL COMMENT '商品ID',
    quantity INT NOT NULL DEFAULT 1 COMMENT '数量',
    unit_price DECIMAL(10,2) NOT NULL COMMENT '单价',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (item_id),
    KEY idx_order_id (order_id),             -- 关键：用于JOIN orders
    CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单明细表';

-- 存储过程给上述三张表初始化大数据
-- CALL AddNumbers(5, 10);
CALL GenerateOrderTestData();
CALL GenerateOrdersOnly();
SELECT COUNT(*) from shop s ;
SELECT COUNT(*) from orders s ;
SELECT COUNT(*) from order_items oi ;

DELETE from shop WHERE shop_id > '100';
DELETE from orders WHERE id > '500000';
DELETE from orders ;
-- 小表驱动大表（高效）
EXPLAIN
SELECT *
FROM shop s
LEFT JOIN orders o ON s.shop_id = o.shop_id;



-- 大表驱动小表（低效）
EXPLAIN
SELECT *
FROM orders o 
LEFT JOIN shop s ON o.shop_id = s.shop_id;




