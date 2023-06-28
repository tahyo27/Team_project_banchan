----- DROP SEQUENCE -----
DROP SEQUENCE "seq_QUESTION";
DROP SEQUENCE "seq_ANSWER";
DROP SEQUENCE "seq_FAQ";
DROP SEQUENCE "seq_CATEGORY";
DROP SEQUENCE "seq_PRODUCT";
DROP SEQUENCE "seq_REVIEW";
DROP SEQUENCE "seq_POINT";
DROP SEQUENCE "seq_CART";
DROP SEQUENCE "seq_COUPON";
DROP SEQUENCE "seq_NOTICE";
DROP SEQUENCE "seq_Member";
DROP SEQUENCE "seq_AddressBook";
DROP SEQUENCE "seq_ORDER";
DROP SEQUENCE "seq_payment";
DROP SEQUENCE "seq_ask";
DROP SEQUENCE "seq_Admin";
DROP SEQUENCE "seq_order_detail";


----- CREATE SEQUENCE -----
CREATE SEQUENCE "seq_QUESTION" NOCACHE;
CREATE SEQUENCE "seq_ANSWER" NOCACHE;
CREATE SEQUENCE "seq_FAQ" NOCACHE;
CREATE SEQUENCE "seq_CATEGORY" NOCACHE;
CREATE SEQUENCE "seq_PRODUCT" NOCACHE;
CREATE SEQUENCE "seq_REVIEW" NOCACHE;
CREATE SEQUENCE "seq_POINT" NOCACHE;
CREATE SEQUENCE "seq_CART" NOCACHE;
CREATE SEQUENCE "seq_COUPON" NOCACHE;
CREATE SEQUENCE "seq_NOTICE" NOCACHE;
CREATE SEQUENCE "seq_Member" NOCACHE;
CREATE SEQUENCE "seq_AddressBook" NOCACHE;
CREATE SEQUENCE "seq_ORDER" NOCACHE;
CREATE SEQUENCE "seq_payment" NOCACHE;
CREATE SEQUENCE "seq_ask" NOCACHE;
CREATE SEQUENCE "seq_Admin" NOCACHE;
CREATE SEQUENCE "seq_order_detail" NOCACHE;


----- DROP TABLE -----
DROP TABLE "QUESTION";
DROP TABLE "ANSWER";
DROP TABLE "FAQ";
DROP TABLE "CATEGORY";
DROP TABLE "PRODUCT";
DROP TABLE "REVIEW";
DROP TABLE "POINT";
DROP TABLE "CART";
DROP TABLE "COUPON";
DROP TABLE "NOTICE";
DROP TABLE "Member";
DROP TABLE "AddressBook";
DROP TABLE "ORDER";
DROP TABLE "payment";
DROP TABLE "ask";
DROP TABLE "Admin";
DROP TABLE "order_detail";

select * from tabs;


----- CREATE TABLE -----
CREATE TABLE "QUESTION" (
	"num"	NUMBER		NOT NULL,
	"title"	VARCHAR		NOT NULL,
	"wdate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"content"	VARCHAR		NOT NULL,
	"id"	VARCHAR		NOT NULL
);


CREATE TABLE "ANSWER" (
	"num"	NUMBER		NOT NULL,
	"content"	VARCHAR		NOT NULL,
	"wdate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"question_num"	NUMBER		NOT NULL
);


CREATE TABLE "FAQ" (
	"num"	NUMBER		NOT NULL,
	"question"	VARCHAR		NULL,
	"answer"	VARCHAR		NULL,
	"writer"	VARCHAR		NULL,
	"wdate"	DATE	DEFAULT SYSDATE	NOT NULL
);


CREATE TABLE "CATEGORY" (
	"num"	Number		NOT NULL,
	"category_name"	varchar2(100)		NOT NULL
);


CREATE TABLE "PRODUCT" (
	"num"	Number		NOT NULL,
	"category_num"	Number		NOT NULL,
	"product_name"	varchar2(200)		NOT NULL,
	"product_img"	varchar2(200)		NOT NULL,
	"product_price"	Number		NOT NULL,
	"product_stock"	Number	DEFAULT 0	NOT NULL,
	"product_content"	varchar2(1000)		NULL
);


CREATE TABLE "REVIEW" (
	"num"	Number		NOT NULL,
	"product_num"	Number		NOT NULL,
	"review_writer"	varchar2(20)		NOT NULL,
	"wdate"	DATE	DEFAULT sysdate	NOT NULL,
	"review_content"	varchar2(1000)		NOT NULL,
	"review_photo"	varchar2(100)		NULL
);


CREATE TABLE "POINT" (
	"num"	Number		NOT NULL,
	"member_num"	number		NOT NULL,
	"wdate"	DATE		NOT NULL,
	"point_content"	VARCHAR2		NOT NULL,
	"state"	VARCHAR2		NOT NULL,
	"amount"	NUMBER		NOT NULL,
	"expiration_date"	DATE		NULL
);



CREATE TABLE "CART" (
	"num"	Number		NOT NULL,
	"product_num"	Number		NOT NULL,
	"member_num"	number		NOT NULL,
	"amount"	NUMBER		NOT NULL
);



CREATE TABLE "COUPON" (
	"num"	Number		NOT NULL,
	"num_member"	Number		NOT NULL,
	"coupon_name"	varchar2(100)		NOT NULL,
	"discount_price"	Number		NOT NULL,
	"coupon_edate"	Date		NOT NULL,
	"coupon_img"	varchar2(100)		NOT NULL
);



CREATE TABLE "NOTICE" (
	"num"	number		NOT NULL,
	"member_num"	number		NOT NULL,
	"TITLE"	VARCHAR2		NOT NULL,
	"CONTENT"	VARCHAR2		NOT NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);



CREATE TABLE "Member" (
	"num"	number		NOT NULL,
	"member_id"	varchar2(20)		NOT NULL,
	"member_pw"	varchar2(20)		NOT NULL,
	"member_name"	varchar2(20)		NOT NULL,
	"member_email"	varchar2(40)		NOT NULL,
	"member_zipcode"	varchar2(10)		NULL,
	"member_address1"	varchar2(100)		NULL,
	"memeber_address2"	varchar2(100)		NULL,
	"member_tel"	varchar2(20)		NULL,
	"member_useryn"	date	DEFAULT default:null 탈퇴시:탈퇴일	NULL,
	"member_regdate"	date	DEFAULT sysdate	NULL,
	"member_nickname"	varchar2(20)		NULL,
	"member_profile"	varchar2(20)		NULL
);




CREATE TABLE "AddressBook" (
	"anum"	number		NOT NULL,
	"mnum"	number		NOT NULL,
	"aname"	varchar2(20)		NULL,
	"azipcode"	varchar2(8)		NULL,
	"aaddress1"	varchar2(100)		NULL,
	"aaddress2"	varchar2(100)		NULL,
	"aphone"	varchar2(20)		NULL,
	"sbase"	number	DEFAULT 1:O 2:X	NULL
);



CREATE TABLE "ORDER" (
	"num"	number		NOT NULL,
	"order_cus"	number		NOT NULL,
	"order_date"	date	DEFAULT sysdate	NULL,
	"order_status"	varchar2(20)	DEFAULT 배송준비중	NULL,
	"order_cs"	varchar2(20)		NULL,
	"order_quantity"	number	DEFAULT 1	NULL,
	"order_amount"	number		NULL,
	"order_del"	number	DEFAULT 3000	NULL,
	"order_total"	number		NULL
);





CREATE TABLE "payment" (
	"pay_num"	number		NOT NULL,
	"order_num"	number		NOT NULL,
	"pay_method"	varchar2(20)		NULL,
	"pay_date"	date	DEFAULT sysdate	NULL,
	"pay_amount"	number		NULL,
	"point_num"	Number		NOT NULL,
	"coupon_num"	Number		NOT NULL
);


CREATE TABLE "ask" (
	"num"	Number		NOT NULL,
	"product_num"	Number		NOT NULL,
	"member_num"	Number		NOT NULL,
	"wdate"	Date	DEFAULT sysdate	NOT NULL,
	"ask_content"	varchar2(1000)		NOT NULL
);



CREATE TABLE "Admin" (
	"num"	VARCHAR(255)		NOT NULL,
	"admin_id"	VARCHAR(255)		NOT NULL,
	"admin_pw"	VARCHAR(255)		NOT NULL
);


CREATE TABLE "order_detail" (
	"num"	Number		NOT NULL,
	"product_num"	Number		NOT NULL,
	"order_num"	number		NOT NULL,
	"amount"	NUMBER		NOT NULL,
	"price"	number		NULL
);


----- 제약조건 -----
-- PRIMARY KEY --
ALTER TABLE "QUESTION" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY ("num");
ALTER TABLE "ANSWER" ADD CONSTRAINT "PK_ANSWER" PRIMARY KEY ("num");
ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY ("num");
ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY ("num");
ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY ("num");
ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("num");
ALTER TABLE "POINT" ADD CONSTRAINT "PK_POINT" PRIMARY KEY ("num");
ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY ("num");
ALTER TABLE "COUPON" ADD CONSTRAINT "PK_COUPON" PRIMARY KEY ("num");
ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("num");
ALTER TABLE "Member" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("num");
ALTER TABLE "AddressBook" ADD CONSTRAINT "PK_ADDRESSBOOK" PRIMARY KEY ("anum");
ALTER TABLE "ORDER" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY ("num");
ALTER TABLE "payment" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("pay_num");
ALTER TABLE "ask" ADD CONSTRAINT "PK_ASK" PRIMARY KEY ("num");
ALTER TABLE "Admin" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY ("num");
ALTER TABLE "order_detail" ADD CONSTRAINT "PK_ORDER_DETAIL" PRIMARY KEY ("num");

-- FOREIGN KEY --
ALTER TABLE "ANSWER" ADD CONSTRAINT "FK_QUESTION_TO_ANSWER_1" FOREIGN KEY ("question_num") REFERENCES "QUESTION" ("num");
ALTER TABLE "PRODUCT" ADD CONSTRAINT "FK_CATEGORY_TO_PRODUCT_1" FOREIGN KEY ("category_num") REFERENCES "CATEGORY" ("num");
ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_PRODUCT_TO_REVIEW_1" FOREIGN KEY ("product_num") REFERENCES "PRODUCT" ("num");
ALTER TABLE "POINT" ADD CONSTRAINT "FK_Member_TO_POINT_1" FOREIGN KEY ("member_num") REFERENCES "Member" ("num");
ALTER TABLE "CART" ADD CONSTRAINT "FK_PRODUCT_TO_CART_1" FOREIGN KEY ("product_num") REFERENCES "PRODUCT" ("num");
ALTER TABLE "CART" ADD CONSTRAINT "FK_Member_TO_CART_1" FOREIGN KEY ("member_num") REFERENCES "Member" ("num");
ALTER TABLE "COUPON" ADD CONSTRAINT "FK_Member_TO_COUPON_1" FOREIGN KEY ("num_member") REFERENCES "Member" ("num");
ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_Member_TO_NOTICE_1" FOREIGN KEY ("member_num") REFERENCES "Member" ("num");
ALTER TABLE "AddressBook" ADD CONSTRAINT "FK_Member_TO_AddressBook_1" FOREIGN KEY ("mnum") REFERENCES "Member" ("num");
ALTER TABLE "ORDER" ADD CONSTRAINT "FK_Member_TO_ORDER_1" FOREIGN KEY ("order_cus") REFERENCES "Member" ("num");
ALTER TABLE "payment" ADD CONSTRAINT "FK_ORDER_TO_payment_1" FOREIGN KEY ("order_num") REFERENCES "ORDER" ("num");
ALTER TABLE "payment" ADD CONSTRAINT "FK_POINT_TO_payment_1" FOREIGN KEY ("point_num") REFERENCES "POINT" ("num");
ALTER TABLE "payment" ADD CONSTRAINT "FK_COUPON_TO_payment_1" FOREIGN KEY ("coupon_num") REFERENCES "COUPON" ("num");
ALTER TABLE "ask" ADD CONSTRAINT "FK_PRODUCT_TO_ask_1" FOREIGN KEY ("product_num") REFERENCES "PRODUCT" ("num");
ALTER TABLE "ask" ADD CONSTRAINT "FK_Member_TO_ask_1" FOREIGN KEY ("member_num") REFERENCES "Member" ("num");
ALTER TABLE "order_detail" ADD CONSTRAINT "FK_PRODUCT_TO_order_detail_1" FOREIGN KEY ("product_num") REFERENCES "PRODUCT" ("num");
ALTER TABLE "order_detail" ADD CONSTRAINT "FK_ORDER_TO_order_detail_1" FOREIGN KEY ("order_num") REFERENCES "ORDER" ("num");
