-- 测试RR快照读，永远读的上个版本NULL
SELECT * from `user` u WHERE name = 'handson commit...';
SELECT * from `user` u WHERE name = 'handson commit...';

-- 测试RR支持RR能力, T2事务更新操作被阻塞
update `user` SET age = '40' WHERE name = 'handson commit...';