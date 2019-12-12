-- 创建 CourseMaster 表以及导入数据
CREATE TABLE CourseMaster (
course_id int(1) auto_increment,
course_name varchar(12),
primary key (course_id)
)engine = INNODB DEFAULT charset=gbk;

insert into CourseMaster (course_id, course_name) values
(1, '会计入门'),
(2, '财务知识'),
(3, '簿记考试'),
(4, '税务师');

-- 创建 OpenCourses 表以及导入数据
CREATE TABLE OpenCourses (
course_month int(6),
course_id int(1)
)engine = INNODB DEFAULT charset=gbk;

insert into OpenCourses (course_month, course_id) values
(201706, 1),
(201706, 3),
(201706, 4),
(201707, 4),
(201708, 2),
(201708, 4)

select 
b.Course_name,
case when a.course_month = 201706 then count(b.course_id) else 0 end as '6月',
case when a.course_month = 201707 then count(b.course_id) else 0 end as '7月',
case when a.course_month = 201708 then count(b.course_id) else 0 end as '8月'
from OpenCourses a
join CourseMaster b
on a.course_id = b.course_id
GROUP BY b.Course_name

-- 表的匹配：使用IN 谓词
select 
Course_name,
case when course_id in 
(select course_id from OpenCourses where course_month = 201706) then 'o'
else 'x' end as '6月',
case when course_id in 
(select course_id from OpenCourses where course_month = 201707) then 'o'
else 'x' end as '7月',
case when course_id in 
(select course_id from OpenCourses where course_month = 201708) then 'o'
else 'x' end as '8月'
from CourseMaster;

-- 表的匹配：使用EXISTS 谓词
SELECT CM.course_name,
CASE WHEN EXISTS
(SELECT course_id FROM OpenCourses OC
WHERE course_month = 201706
AND OC.course_id = CM.course_id) THEN '○'
ELSE '×' END AS "6月",
CASE WHEN EXISTS
(SELECT course_id FROM OpenCourses OC
WHERE course_month = 201707
AND OC.course_id = CM.course_id) THEN '○'
ELSE '×' END AS "7月",
CASE WHEN EXISTS
(SELECT course_id FROM OpenCourses OC
WHERE course_month = 201708
AND OC.course_id = CM.course_id) THEN '○'
ELSE '×' END AS "8月"
FROM CourseMaster CM;

-- 通过 EXISTS 进行的子查询能够用到“course_month,course_id ”这样的主键索引，因此尤其是当表 OpenCourses 里数据比较多的时候更有优势。