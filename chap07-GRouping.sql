-- GRouping
-- group by 절은 특정 열의 값에 따라 그룹화하는데 사용된다.
-- having은 group by 절과 함께 사용해야 하며 그룹에 대한 조건을 적용하는데 사용된다.

select
	category_code
from
	tbl_menu
Group by category_code;

select
	category_code,
    count(*)
from
	tbl_menu
Group by category_code;

select
	category_code,
    SUm(menu_price)
from
	tbl_menu
group by category_code;

select
	category_code,
    AVG(menu_price)
from
	tbl_menu
group by category_code;

select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code;
    
select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code
having			-- Where 절은 그룹화 전의 개별 행에 대한 조건 지정
				-- HAving절은 그룹화 후의 집계 결과에 대한 조건 지정
	category_code >= 5 and category_code <= 8;
    
select
	category_code,
    Sum(menu_price)
from
	tbl_menu
group by
	category_code
With Rollup;

select
	menu_price,
    category_code,
    Sum(menu_price)
from
	tbl_menu
group by
	menu_price,
    category_code
with rollup;