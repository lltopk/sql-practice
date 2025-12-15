-- RR测试
-- MySQL 的默认自动提交（autocommit）是开启的。如果你不手动开启事务，每条语句都会自动提交，不在同一个事务里。
START TRANSACTION;
INSERT INTO `user`(name, age) VALUES ('handson commit...', 30); 
SELECT SLEEP(10) ;
COMMIT;

-- RR测试RR
-- MySQL 的默认自动提交（autocommit）是开启的。如果你不手动开启事务，每条语句都会自动提交，不在同一个事务里。
START TRANSACTION;
INSERT INTO `user`(name, age) VALUES ('handson commit...', 30); 
SELECT SLEEP(10) ;
SELECT * from `user` u WHERE name = 'handson commit...';
SELECT * from `user` u WHERE name = 'handson commit...';
COMMIT;


