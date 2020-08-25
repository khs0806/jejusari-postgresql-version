/* DB 사용자 생성, 권한 부여 cmd창에서 실행 */
create user jejusari identified by 1234; /* 사용자 생성 */
grant resource, connect to jejusari;	 /* 접속 권한 부여 */
grant create table, create view, create procedure, create session, create sequence to jejusari; /* 테이블 생성 권한 */
conn jejusari/1234;	/*생성한 계정으로 로그인*/