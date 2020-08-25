--------------------------------------------------------
--  
--------------------------------------------------------
--REM INSERTING into MEMBER
--SET DEFINE OFF;
Insert into MEMBER (MEMBER_ID,MEMBER_NUMBER,MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_LEVEL,MEMBER_REGISTER_DATE) values ('kke',1,'김경은','kke@naver.com','010-1234-1234','BR',to_date('20/08/07','RR/MM/DD'));
Insert into MEMBER (MEMBER_ID,MEMBER_NUMBER,MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_LEVEL,MEMBER_REGISTER_DATE) values ('khs',2,'김현수','khs@naver.com','010-1234-1235','BR',to_date('20/08/08','RR/MM/DD'));
Insert into MEMBER (MEMBER_ID,MEMBER_NUMBER,MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_LEVEL,MEMBER_REGISTER_DATE) values ('lsh',3,'이상후','kke@naver.com','010-1234-1236','BR',to_date('20/08/09','RR/MM/DD'));
Insert into MEMBER (MEMBER_ID,MEMBER_NUMBER,MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_LEVEL,MEMBER_REGISTER_DATE) values ('cuj',4,'최윤정','kke@naver.com','010-1234-1237','BR',to_date('20/08/10','RR/MM/DD'));
Insert into MEMBER (MEMBER_ID,MEMBER_NUMBER,MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_LEVEL,MEMBER_REGISTER_DATE) values ('yji',5,'임정인','kke@naver.com','010-1234-1238','BR',to_date('20/08/11','RR/MM/DD'));
INSERT INTO member(member_id, member_number, member_name, member_email, member_phone, member_level, member_register_date) VALUES('admin',6,'admin','admin@naver.com','010-0000-0000','admin',sysdate);