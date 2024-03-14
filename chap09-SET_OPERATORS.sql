/* SET_OPERATORS */

-- union : 두 개 이상의 SELECT문의 결과를 결합하여 중복된 레코드를 제거 후 반환alter

select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10
union ALL
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;
    
-- intersect : 두 select문의 결과 중 공통되는 레코드 만을 반환.
-- MySQL은 제공하지 않는다. 하지만 INNER JOIN 또는 IN 연산자 활용해서 구현가능.
    
-- union all : 중복된 레코드를 제거하지 않고 모두 반환.

-- inner join 이용
select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
From
	tbl_menu a
Inner JOIN (select
				menu_code,
				menu_name,
				menu_price,
                category_code,
                orderable_status
			from
				tbl_menu
			where
				menu_price < 9000) b on (a.menu_code = b. menu_code)
where
	a.category_code = 10;
    
-- IN 이용
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10 and
	menu_code in (select
					menu_code
				  from
					tbl_menu
				  where
					menu_price < 9000);
                    
-- MINUS : 첫 번째 SELECT문의 결과에서 두번째 SELECT문의 결과가 포함하는 레코드를 제외하고 반환.
-- MySQL은 MINUS를 제공하지 않음. LEFT JOIN을 활용해서 구현하는 것은 가능하다.

select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
from
	tbl_menu a
left join (select
				menu_code,
                menu_name,
                menu_price,
                category_code,
                orderable_status
			from
				tbl_menu
			where
				menu_price < 9000) b on (a.menu_code = b.menu_code)
where
    b.menu_code is null and
    a.category_code = 10;