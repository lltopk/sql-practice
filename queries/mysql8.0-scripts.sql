CREATE TABLE `user` (
	`id` BIGINT(20) NOT NULL,
	`name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`age` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


-- 递归查询
WITH RECURSIVE cte AS (
    SELECT *
    FROM dept
    WHERE id = '4'
    union ALL
    SELECT dept.*
    FROM dept,
         cte
    WHERE dept.id = cte.parent_dept_id
)
SELECT * FROM cte;

