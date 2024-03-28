--------------------------------------------------------
--  ÆÄÀÏÀÌ »ý¼ºµÊ - ¿ù¿äÀÏ-3¿ù-25-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "C##TEST123"."MEMBER" 
   (	"NO" NUMBER(*,0), 
	"ID" VARCHAR2(20 BYTE), 
	"PW" VARCHAR2(300 BYTE), 
	"NAME" VARCHAR2(100 BYTE), 
	"BIRTH" TIMESTAMP (6), 
	"EMAIL" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C##TEST123.MEMBER
SET DEFINE OFF;
Insert into C##TEST123.MEMBER (NO,ID,PW,NAME,BIRTH,EMAIL) values (1,'kwon','1234','±Ç¹ÎÁö',to_timestamp('01/08/20 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'kwon@gmail.com');
Insert into C##TEST123.MEMBER (NO,ID,PW,NAME,BIRTH,EMAIL) values (2,'mong','4321','¸ùÀÌ',to_timestamp('03/07/10 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'mong@gmail.com');
Insert into C##TEST123.MEMBER (NO,ID,PW,NAME,BIRTH,EMAIL) values (3,'pidon','pass','ÇÇÄ«Ãò',to_timestamp('93/11/09 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'pidon@gmail.com');
Insert into C##TEST123.MEMBER (NO,ID,PW,NAME,BIRTH,EMAIL) values (4,'manbozam','0000','Àá¸¸º¸',to_timestamp('99/12/25 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'mabozam@naver.com');
Insert into C##TEST123.MEMBER (NO,ID,PW,NAME,BIRTH,EMAIL) values (5,'pengsu','9999','Æë¼ö',to_timestamp('01/02/03 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'pengsu@naver.com');
--------------------------------------------------------
--  DDL for Index SYS_C008317
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEST123"."SYS_C008317" ON "C##TEST123"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "C##TEST123"."MEMBER" MODIFY ("NO" NOT NULL ENABLE);
  ALTER TABLE "C##TEST123"."MEMBER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
