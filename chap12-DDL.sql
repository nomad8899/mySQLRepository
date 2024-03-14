/* DDL(Data Definition Language) 
데이터베이스의 스키마를 정의하거나 수정하는데 사용되는 SQL의 한 부분이다. */

-- 1. create : 테이블 생성을 위한 구문
/*컬럼 설정 방법
  column_name data_type(length) [NOT NULL] [DEAULT value] [AUTO_INCREMENT] column_constraint */
create table IF not exists tb1 (
	pk int primary key,
    fk int,
    col1 varchar(255),
    check(col1 in ('Y','N'))
) engine = INNODB;

DESCRIBE tb1;

insert INTO tb1 values (1,10,'Y');
select*FROm tb1;

-- 2. AUTO_INCREMENT
-- INSERT 시 PRIMARY키에 해당하는 컬럼에 자동으로 중복되지 않는 번호를 발생시켜 저장할 수 있다.
create table if not exists tb2 (
	pk INT auto_increment primary key,
    fk INT,
    col1 varchar(255),
    check(col1 IN ('Y','N'))
) engine = INNODB;

insert into tb2 values( null,10,'Y');
INSERT INTO tb2 values(NULL,20,'Y');

-- 3. alter
-- 테이블에 추가/변경/수정/삭제하는 모든 것은 ALTER 명령어를 사용해 적용한다.

-- 열추가
-- ALTER TABLE 테이블명 ADD 컬럼명 컬럼정의
-- col2 컬럼 추가 (INT형, NOT NULL 제약조건 존재)
ALTER table tb2
ADD col2 INT NOT NULL;
select*FROm tb2;

describe tb2;

-- 열 삭제
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명
alter table tb2
DROp COLUMN col2;

describe tb2;

-- 열이름 밒 데이터 형식 변경
-- ALTER TABLE 테이블명 CHANGE COLUMN 기존 컬럼명 바꿀컬럼명 컬럼정의
-- fk 컬럼을 change fk 컬럼으로 변경(NOT NULL 제약조건 존재)
alter table tb2 change COLUMN fk change_fk int not null;

-- 열 제약 조건 추가 및 삭제 (이후 쳅터에서 가룰 내용)
-- ALTER table 테이블명 DROP 제약조건
-- tb2 테이블의 PRIMARY KEY 제약조건 제거
alter TABLE tb2 drop primary key; -- 에러 발생
/* AUTO_INCREMENT 가 걸려있는 컬럼은 PRIMARY KEY 제거가 안되므로
AUTO_INCRIMENT를 MODIFY(컬럼의 정의를 바꿈) 명령어로 제거한다. */

alter table tb2
modify pk INT;

describe tb2;

alter table tb2
drop primary key;

-- 다시 PRIMARY KEY 제약조건 추가
alter table tb2
ADD PRIMARY KEY(pk);

-- 컬럼 여러개 추가하기
alter TABLE TB2
ADD col3 date not null,
add col4 tinyint not null; -- 1292 에러 발생

select @@GLOBAL.sql_mode;  -- MySQL 데이터베이스 서버의 전역 SQL모드 설정을 조회 (No_ZERO_IN_DATE)
					       -- root 계정에서 모드 설정을 비워준 후 workbench 껏다가 킨 후에 다시 data형 컬럼 추가
                           
describe tb2;

-- 4. DROP : 테이블을 삭제하기 위한 구문
-- tb3 테이블 생성
CREATE TABLE IF NOT exists tb3 (
	pk INT auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in ('Y','N'))
) engine = InnoDB;

-- tb3 테이블 삭제
DROP TABLE IF EXISTS tb4;

-- 5. TRUNCATE : 
/*전체 테이블의 모든 행을 삭제하고 테이블을 새로 생성한다.
  삭제할 행에 대한 로그를 남기지 않아서, 되돌릴 수 없다.*/
  
create table if not exists tb4 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in('Y','N'))
) engine = INNODB;


insert INTO tb4 values (null, 10,'Y');
insert INTO tb4 values (null, 20,'Y');
insert INTO tb4 values (null, 30,'Y');
insert INTO tb4 values (null, 40,'Y');

select * from tb4;

-- 테이블 초기화 하기
truncate TABLE TB4;
-- truncate tb4; : TABLE 키워드 생략 가능