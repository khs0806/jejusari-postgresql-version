/* DB ����� ����, ���� �ο� cmdâ���� ���� */
create user jejusari identified by 1234; /* ����� ���� */
grant resource, connect to jejusari;	 /* ���� ���� �ο� */
grant create table, create view, create procedure, create session, create sequence to jejusari; /* ���̺� ���� ���� */
conn jejusari/1234;	/*������ �������� �α���*/