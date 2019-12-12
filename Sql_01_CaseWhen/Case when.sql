-- Case 表达式
CREATE TABLE `poptbl` (
  `pid` int(2) NOT NULL AUTO_INCREMENT,
  `pre_name` varchar(50) NOT NULL,
	`sex` int(1) NOT NULL,
  `population` int(2) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `poptbl` (`pid`, `pre_name`, `sex`, `population`) VALUES
(1, '德岛', 1, 60),
(2, '香川', 2, 100),
(3, '爱媛', 1, 100),
(4, '高知', 2, 100),
(5, '福冈', 1, 100),
(6, '佐贺', 2, 20),
(7, '长崎', 1, 125),
(8, '东京', 2, 250),
(9, '群马', 1, 50),
(10, '德岛', 2, 40),
(11, '香川', 1, 100),
(12, '爱媛', 2, 50),
(13, '高知', 1, 100),
(14, '福冈', 2, 200),
(15, '佐贺', 1, 80),
(16, '长崎', 2, 125),
(17, '东京', 1, 250),
(18, '群马', 2, 50);

-- “四国”对应的是表 PopTbl 中的“德岛、香川、爱媛、高知 ”，“九 州”对应的是表 PopTbl 中的“福冈、佐贺、长崎”

-- 把县编号转换成地区编号(1)
SELECT CASE pre_name
WHEN '德岛' THEN '四国'
WHEN '香川' THEN '四国'
WHEN '爱媛' THEN '四国'
WHEN '高知' THEN '四国'
WHEN '福冈' THEN '九州'
WHEN '佐贺' THEN '九州'
WHEN '长崎' THEN '九州'
ELSE '其他' END AS district,
SUM(population)
FROM PopTbl
GROUP BY CASE pre_name
WHEN '德岛' THEN '四国'
WHEN '香川' THEN '四国'
WHEN '爱媛' THEN '四国'
WHEN '高知' THEN '四国'
WHEN '福冈' THEN '九州'
WHEN '佐贺' THEN '九州'
WHEN '长崎' THEN '九州'
ELSE '其他' END;

-- group by 后边变量用 district 代替，虽然由于groupby要先于 select 执行，在某些 sql 语言会造成错误，但是 mysql 中可以并且方便，但是还是不推荐
SELECT CASE pre_name
WHEN '德岛' THEN '四国'
WHEN '香川' THEN '四国'
WHEN '爱媛' THEN '四国'
WHEN '高知' THEN '四国'
WHEN '福冈' THEN '九州'
WHEN '佐贺' THEN '九州'
WHEN '长崎' THEN '九州'
ELSE '其他' END AS district,
SUM(population)
FROM PopTbl
GROUP BY district;

-- 男性人口
SELECT pre_name,
SUM(population)
FROM poptbl
WHERE sex = 1
GROUP BY pre_name;

-- 女性人口
SELECT pre_name,
SUM(population)
FROM poptbl
WHERE sex = 2
GROUP BY pre_name;

-- 男女分组的 Case When 写法，将数据结果转化为 二维表
select 
pre_name,
sum(case when sex=1 then population else 0 end) as '男',
sum(case when sex=2 then population else 0 end) as '女'
from poptbl
GROUP BY pre_name;


