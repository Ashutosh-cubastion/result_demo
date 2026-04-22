create table vacancy_provided
(
	Post_code character varying,
	Department	character varying,
	post_name character varying,
	Medium character varying,
	SC integer,	
	ST integer,
	OBC integer,
	EWS integer,
	UR integer,
	Total integer,
	EXS integer,
	OH integer,
	HH integer,
	VH integer,
	OTHERS integer
);



select * from vacancy_provided;

select sum(sc),sum(st),sum(obc),sum(ews),sum(ur),sum(total),sum(exs),sum(oh),sum(hh),sum(vh),sum(others) from vacancy_provided;
--copy vacancy_provided from 'C:\Users\Public\vacancy_provided.csv' csv header;

select category,sum(initial) from vacancy_table group by category ;
CREATE TABLE vacancy_table (
    Post_code VARCHAR(10),
    Department VARCHAR(255),
    post_name VARCHAR(50),
    Medium VARCHAR(1),
    Category VARCHAR(10),
	Category_code VARCHAR(10),
    initial INT
);

select * from vacancy_table;

INSERT INTO vacancy_table (Post_code, Department, Post_name, Medium, Category, Category_code, initial)
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'SC' AS Category, 
	'1' AS Category_code,
    SC AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'ST' AS Category, 
	'2' AS Category_code,
    ST AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'OBC' AS Category, 
	'6' AS Category_code,
    OBC AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'EWS' AS Category, 
	'0' AS Category_code,
    EWS AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'UR' AS Category, 
	'9' AS Category_code,
    UR AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'EXS' AS Category, 
	'3' AS Category_code,
    EXS AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'OH' AS Category, 
	'4' AS Category_code,
    OH AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'HH' AS Category, 
	'5' AS Category_code,
    HH AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'VH' AS Category, 
	'7' AS Category_code,
    VH AS initial
FROM vacancy_provided
UNION ALL
SELECT 
    Post_code, 
    Department, 
    post_name, 
    Medium, 
    'OTHERS' AS Category, 
	'8' AS Category_code,
    OTHERS AS initial
FROM vacancy_provided