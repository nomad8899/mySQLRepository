-- LiMIT
-- SELECT 문의 결과 집합에서 반환할 행의 수를 제한하는데 사용된다.
/*
select
	select_list
from
	table_name
limit offset, row_count;

offset : 시작할 행의 번호(인덱스 체계)
row_count : 이후 행부터 반환 받을 행의 개수
*/
select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc;-- 
    
select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc
limit 1,4;

select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc
   -- menu_name ASC
limit 5;		-- 상위 다섯줄의 행만 조회