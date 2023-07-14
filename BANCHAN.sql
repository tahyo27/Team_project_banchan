----- CREATE USER -----
-- CREATE USER BANCHAN IDENTIFIED BY HI123456;
-- GRANT CONNECT, RESOURCE TO BANCHAN;
-- GRANT CREATE VIEW TO BANCHAN;


----- DROP SEQUENCE -----
DROP SEQUENCE "SEQ_QUESTION";
DROP SEQUENCE "SEQ_ANSWER";
DROP SEQUENCE "SEQ_FAQ";
DROP SEQUENCE "SEQ_CATEGORY";
DROP SEQUENCE "SEQ_PRODUCT";
DROP SEQUENCE "SEQ_REVIEW";
DROP SEQUENCE "SEQ_POINT";
DROP SEQUENCE "SEQ_CART";
DROP SEQUENCE "SEQ_COUPON";
DROP SEQUENCE "SEQ_NOTICE";
DROP SEQUENCE "SEQ_MEMBER";
DROP SEQUENCE "SEQ_ADDRESSBOOK";
DROP SEQUENCE "SEQ_ORDER";
DROP SEQUENCE "SEQ_PAYMENT";
DROP SEQUENCE "SEQ_ASK";
DROP SEQUENCE "SEQ_ADMIN";
DROP SEQUENCE "SEQ_ORDER_DETAIL";


----- CREATE SEQUENCE -----
CREATE SEQUENCE "SEQ_QUESTION" NOCACHE;
CREATE SEQUENCE "SEQ_ANSWER" NOCACHE;
CREATE SEQUENCE "SEQ_FAQ" NOCACHE;
CREATE SEQUENCE "SEQ_CATEGORY" NOCACHE;
CREATE SEQUENCE "SEQ_PRODUCT" NOCACHE;
CREATE SEQUENCE "SEQ_REVIEW" NOCACHE;
CREATE SEQUENCE "SEQ_POINT" NOCACHE;
CREATE SEQUENCE "SEQ_CART" NOCACHE;
CREATE SEQUENCE "SEQ_COUPON" NOCACHE;
CREATE SEQUENCE "SEQ_NOTICE" NOCACHE;
CREATE SEQUENCE "SEQ_MEMBER" NOCACHE;
CREATE SEQUENCE "SEQ_ADDRESSBOOK" NOCACHE;
CREATE SEQUENCE "SEQ_ORDER" NOCACHE;
CREATE SEQUENCE "SEQ_PAYMENT" NOCACHE;
CREATE SEQUENCE "SEQ_ASK" NOCACHE;
CREATE SEQUENCE "SEQ_ADMIN" NOCACHE;
CREATE SEQUENCE "SEQ_ORDER_DETAIL" NOCACHE;


----- DROP TABLE -----
DROP TABLE "ANSWER";
DROP TABLE "QUESTION";
DROP TABLE "FAQ";
DROP TABLE "REVIEW";
DROP TABLE "CART";
DROP TABLE "NOTICE";
DROP TABLE "ADDRESSBOOK";
DROP TABLE "PAYMENT";
DROP TABLE "COUPON";
DROP TABLE "POINT";
DROP TABLE "ASK";
DROP TABLE "ADMIN";
DROP TABLE "ORDER_DETAIL";
DROP TABLE "ORDER";
DROP TABLE "PRODUCT";
DROP TABLE "CATEGORY";
DROP TABLE "MEMBER";

SELECT *
FROM TABS;


----- CREATE TABLE -----
CREATE TABLE QUESTION 
(
  QNUM NUMBER NOT NULL 
, TITLE VARCHAR2(100 BYTE) NOT NULL 
, CONTENT VARCHAR2(1000 BYTE) NOT NULL 
, WDATE DATE DEFAULT sysdate 
, WRITER VARCHAR2(20 BYTE) NOT NULL 
, VCOUNT NUMBER DEFAULT 0 
, CONSTRAINT QUESTION_PK PRIMARY KEY 
  (
    QNUM 
  )
  ENABLE 
);

CREATE TABLE ANSWER 
(
  ANUM NUMBER NOT NULL 
, QNUM NUMBER NOT NULL 
, CONTENT VARCHAR2(1000 BYTE) NOT NULL 
, WDATE DATE DEFAULT sysdate 
, WRITER VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT ANSWER_PK PRIMARY KEY 
  (
    ANUM 
  )
  ENABLE 
);

CREATE TABLE "FAQ"
(
    "NUM"      NUMBER               NOT NULL,
    "QUESTION" VARCHAR2(40)         NULL,
    "ANSWER"   VARCHAR2(40)         NULL,
    "WRITER"   VARCHAR2(40)         NULL,
    "WDATE"    DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE "CATEGORY"
(
    "NUM"           NUMBER        NOT NULL,
    "CATEGORY_NAME" VARCHAR2(100) NOT NULL
);

CREATE TABLE PRODUCT
(
    NUM             NUMBER                       NOT NULL,
    CATEGORY_NUM    NUMBER                       NOT NULL,
    PRODUCT_NAME    VARCHAR2(200 BYTE)           NOT NULL,
    PRODUCT_IMG     VARCHAR2(200 BYTE) DEFAULT 'pro_default.png',
    PRODUCT_PRICE   NUMBER                       NOT NULL,
    PRODUCT_STOCK   NUMBER             DEFAULT 1 NOT NULL,
    PRODUCT_CONTENT VARCHAR2(1000 BYTE),
    CONSTRAINT PRODUCT_PK PRIMARY KEY (NUM) ENABLE
);

CREATE TABLE REVIEW
(
    NUM            NUMBER               NOT NULL,
    PRODUCT_NUM    NUMBER               NOT NULL,
    MEMBER_ID      VARCHAR2(20 BYTE)    NOT NULL,
    WDATE          DATE DEFAULT sysdate NOT NULL,
    REVIEW_CONTENT VARCHAR2(1000 BYTE)  NOT NULL,
    CONSTRAINT REVIEW_PK PRIMARY KEY (NUM) ENABLE
);

CREATE TABLE "POINT"
(
    "NUM"             NUMBER       NOT NULL,
    "MEMBER_NUM"      NUMBER       NOT NULL,
    "WDATE"           DATE         NOT NULL,
    "POINT_CONTENT"   VARCHAR2(40) NOT NULL,
    "STATE"           VARCHAR2(40) NOT NULL,
    "AMOUNT"          NUMBER       NOT NULL,
    "EXPIRATION_DATE" DATE         NULL
);

CREATE TABLE CART
(
    NUM         NUMBER NOT NULL,
    PRODUCT_NUM NUMBER NOT NULL,
    MEMBER_ID   VARCHAR2(20 BYTE),
    AMOUNT      NUMBER NOT NULL,
    CONSTRAINT CART_PK PRIMARY KEY (NUM) ENABLE
);

CREATE TABLE "COUPON"
(
    "NUM"            NUMBER        NOT NULL,
    "NUM_MEMBER"     NUMBER        NOT NULL,
    "COUPON_NAME"    VARCHAR2(100) NOT NULL,
    "DISCOUNT_PRICE" NUMBER        NOT NULL,
    "COUPON_EDATE"   DATE          NOT NULL,
    "COUPON_IMG"     VARCHAR2(100) NOT NULL
);

CREATE TABLE "NOTICE"
(
    "NUM"        NUMBER               NOT NULL,
    "MEMBER_NUM" NUMBER               NOT NULL,
    "TITLE"      VARCHAR2(40)         NOT NULL,
    "CONTENT"    VARCHAR2(40)         NOT NULL,
    "DATE"       DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE "MEMBER"
(
    "NUM"             NUMBER                             NOT NULL,
    "MEMBER_ID"       VARCHAR2(60)                       NULL,
    "MEMBER_PW"       VARCHAR2(60)                       NOT NULL,
    "MEMBER_NAME"     VARCHAR2(20)                       NOT NULL,
    "MEMBER_EMAIL"    VARCHAR2(40)                       NOT NULL,
    "MEMBER_ZIPCODE"  VARCHAR2(10)                       NULL,
    "MEMBER_ADDRESS1" VARCHAR2(100)                      NULL,
    "MEMBER_ADDRESS2" VARCHAR2(100)                      NULL,
    "MEMBER_TEL"      VARCHAR2(20)                       NULL,
    "MEMBER_USERYN"   DATE         DEFAULT NULL          NULL,
    "MEMBER_REGDATE"  DATE         DEFAULT SYSDATE       NULL,
    "MEMBER_NICKNAME" VARCHAR2(20)                       NULL,
    "MEMBER_PROFILE"  VARCHAR2(20) DEFAULT 'default.png' NULL
);

CREATE TABLE "ADDRESSBOOK"
(
    "NUM"         NUMBER           NOT NULL,
    "MEMBER_NUM"  NUMBER           NOT NULL,
    "AB_NAME"     VARCHAR2(20)     NULL,
    "AB_ZIPCODE"  VARCHAR2(8)      NULL,
    "AB_ADDRESS1" VARCHAR2(100)    NULL,
    "AB_ADDRESS2" VARCHAR2(100)    NULL,
    "AB_TEL"      VARCHAR2(20)     NULL,
    "AB_BASE"     NUMBER DEFAULT 0 NULL
);

CREATE TABLE "ORDER"
(
    "NUM"             NUMBER                       NOT NULL,
    "MEMBER_NUM"      NUMBER                       NOT NULL,
    "ORDER_DATE"      DATE         DEFAULT SYSDATE NULL,
    "STATUS"          VARCHAR2(20) DEFAULT '배송준비중' NULL,
    "RECEIVER_NAME"   VARCHAR2(20)                 NULL,
    "TEL"             VARCHAR2(20)                 NULL,
    "ZIPCODE"         VARCHAR2(8)                  NULL,
    "ADDRESS1"        VARCHAR2(100)                NULL,
    "ADDRESS2"        VARCHAR2(100)                NULL,
    "MEMO"            VARCHAR2(100)                NULL,
    "ORDER_PRICE"     NUMBER                       NULL,
    "DELIVERY_FEE"    NUMBER       DEFAULT 3000    NULL,
    "DISCOUNT_COUPON" NUMBER                       NULL,
    "USE_POINT"       NUMBER                       NULL,
    "TOTAL_PRICE"     NUMBER                       NULL
);

CREATE TABLE "PAYMENT"
(
    "NUM"        NUMBER               NOT NULL,
    "ORDER_NUM"  NUMBER               NOT NULL,
    "PAY_METHOD" VARCHAR2(20)         NULL,
    "PAY_DATE"   DATE DEFAULT SYSDATE NULL,
    "PAY_AMOUNT" NUMBER               NULL,
    "POINT_NUM"  NUMBER               NOT NULL,
    "COUPON_NUM" NUMBER               NOT NULL
);

CREATE TABLE "ASK"
(
    "NUM"         NUMBER               NOT NULL,
    "PRODUCT_NUM" NUMBER               NOT NULL,
    "MEMBER_NUM"  NUMBER               NOT NULL,
    "WDATE"       DATE DEFAULT SYSDATE NOT NULL,
    "ASK_CONTENT" VARCHAR2(1000)       NOT NULL
);

CREATE TABLE "ADMIN"
(
    "NUM"      VARCHAR(255) NOT NULL,
    "ADMIN_ID" VARCHAR(255) NOT NULL,
    "ADMIN_PW" VARCHAR(255) NOT NULL
);

CREATE TABLE "ORDER_DETAIL"
(
    "NUM"         NUMBER NOT NULL,
    "PRODUCT_NUM" NUMBER NOT NULL,
    "ORDER_NUM"   NUMBER NOT NULL,
    "AMOUNT"      NUMBER NOT NULL,
    "PRICE"       NUMBER NULL
);



----- 제약조건 -----
-- PRIMARY KEY --
ALTER TABLE QUESTION
ADD CONSTRAINT QUESTION_FK1 FOREIGN KEY
(
  WRITER 
)
REFERENCES MEMBER
(
  MEMBER_ID 
)
ENABLE;

ALTER TABLE ANSWER
ADD CONSTRAINT ANSWER_FK1 FOREIGN KEY
(
  QNUM 
)
REFERENCES QUESTION
(
  QNUM 
)
ENABLE;

ALTER TABLE "FAQ"
    ADD CONSTRAINT "PK_FAQ" PRIMARY KEY ("NUM");

ALTER TABLE "CATEGORY"
    ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY ("NUM");

ALTER TABLE "PRODUCT"
    ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY ("NUM");

ALTER TABLE "REVIEW"
    ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("NUM");

ALTER TABLE "POINT"
    ADD CONSTRAINT "PK_POINT" PRIMARY KEY ("NUM");

ALTER TABLE "CART"
    ADD CONSTRAINT "PK_CART" PRIMARY KEY ("NUM");

ALTER TABLE "COUPON"
    ADD CONSTRAINT "PK_COUPON" PRIMARY KEY ("NUM");

ALTER TABLE "NOTICE"
    ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NUM");

ALTER TABLE "MEMBER"
    ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("NUM");

ALTER TABLE "ADDRESSBOOK"
    ADD CONSTRAINT "PK_ADDRESSBOOK" PRIMARY KEY ("NUM");

ALTER TABLE "ORDER"
    ADD CONSTRAINT "PK_ORDER" PRIMARY KEY ("NUM");

ALTER TABLE "PAYMENT"
    ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("NUM");

ALTER TABLE "ASK"
    ADD CONSTRAINT "PK_ASK" PRIMARY KEY ("NUM");

ALTER TABLE "ADMIN"
    ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY ("NUM");

ALTER TABLE "ORDER_DETAIL"
    ADD CONSTRAINT "PK_ORDER_DETAIL" PRIMARY KEY ("NUM");


-- FOREIGN KEY --
ALTER TABLE "ANSWER"
    ADD CONSTRAINT "FK_QUESTION_TO_ANSWER_1" FOREIGN KEY ("QUESTION_NUM") REFERENCES "QUESTION" ("NUM");

ALTER TABLE "REVIEW"
    ADD CONSTRAINT "FK_PRODUCT_TO_REVIEW_1" FOREIGN KEY ("PRODUCT_NUM") REFERENCES "PRODUCT" ("NUM");

ALTER TABLE "POINT"
    ADD CONSTRAINT "FK_MEMBER_TO_POINT_1" FOREIGN KEY ("MEMBER_NUM") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "CART"
    ADD CONSTRAINT "FK_PRODUCT_TO_CART_1" FOREIGN KEY ("PRODUCT_NUM") REFERENCES "PRODUCT" ("NUM");

ALTER TABLE "CART"
    ADD CONSTRAINT "FK_MEMBER_TO_CART_1" FOREIGN KEY ("MEMBER_NUM") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "COUPON"
    ADD CONSTRAINT "FK_MEMBER_TO_COUPON_1" FOREIGN KEY ("NUM_MEMBER") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "NOTICE"
    ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY ("MEMBER_NUM") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "ADDRESSBOOK"
    ADD CONSTRAINT "FK_MEMBER_TO_ADDRESSBOOK_1" FOREIGN KEY ("MEMBER_NUM") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "ORDER"
    ADD CONSTRAINT "FK_MEMBER_TO_ORDER_1" FOREIGN KEY ("MEMBER_NUM") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "PAYMENT"
    ADD CONSTRAINT "FK_ORDER_TO_PAYMENT_1" FOREIGN KEY ("ORDER_NUM") REFERENCES "ORDER" ("NUM");

ALTER TABLE "PAYMENT"
    ADD CONSTRAINT "FK_POINT_TO_PAYMENT_1" FOREIGN KEY ("POINT_NUM") REFERENCES "POINT" ("NUM");

ALTER TABLE "PAYMENT"
    ADD CONSTRAINT "FK_COUPON_TO_PAYMENT_1" FOREIGN KEY ("COUPON_NUM") REFERENCES "COUPON" ("NUM");

ALTER TABLE "ASK"
    ADD CONSTRAINT "FK_PRODUCT_TO_ASK_1" FOREIGN KEY ("PRODUCT_NUM") REFERENCES "PRODUCT" ("NUM");

ALTER TABLE "ASK"
    ADD CONSTRAINT "FK_MEMBER_TO_ASK_1" FOREIGN KEY ("MEMBER_NUM") REFERENCES "MEMBER" ("NUM");

ALTER TABLE "ORDER_DETAIL"
    ADD CONSTRAINT "FK_PRODUCT_TO_ORDER_DETAIL_1" FOREIGN KEY ("PRODUCT_NUM") REFERENCES "PRODUCT" ("NUM");

ALTER TABLE "ORDER_DETAIL"
    ADD CONSTRAINT "FK_ORDER_TO_ORDER_DETAIL_1" FOREIGN KEY ("ORDER_NUM") REFERENCES "ORDER" ("NUM");

ALTER TABLE PRODUCT
    ADD CONSTRAINT PRODUCT_FK1 FOREIGN KEY (CATEGORY_NUM) REFERENCES CATEGORY (NUM) ON DELETE CASCADE ENABLE;

ALTER TABLE REVIEW
    ADD CONSTRAINT REVIEW_FK1 FOREIGN KEY (PRODUCT_NUM) REFERENCES PRODUCT (NUM) ON DELETE CASCADE ENABLE;

ALTER TABLE CART
    ADD CONSTRAINT CART_FK1 FOREIGN KEY (PRODUCT_NUM) REFERENCES PRODUCT (NUM) ON DELETE CASCADE ENABLE;


-- CHECK --
ALTER TABLE "ADDRESSBOOK"
    ADD CONSTRAINT "CHK_ADDRESSBOOK_SBASE" CHECK ("AB_BASE" IN (0, 1));


-- UNIQUE --
ALTER TABLE "MEMBER"
    ADD CONSTRAINT "UK_MEMBER_MEMBER_ID" UNIQUE ("MEMBER_ID");


----- INSERT -----
INSERT INTO member (num, member_id, member_pw, member_name, member_tel, member_email)
VALUES (seq_member.NEXTVAL, 'user001', 'pw001', 'User001', '010-1234-01', 'user001@example.com');

INSERT INTO member (num, member_id, member_pw, member_name, member_tel, member_email)
VALUES (seq_member.NEXTVAL, 'user002', 'pw002', 'User002', '010-1234-02', 'user002@example.com');

INSERT INTO member (num, member_id, member_pw, member_name, member_tel, member_email)
VALUES (seq_member.NEXTVAL, 'user003', 'pw003', 'User003', '010-1234-03', 'user003@example.com');

INSERT INTO member (num, member_id, member_pw, member_name, member_tel, member_email)
VALUES (seq_member.NEXTVAL, 'user004', 'pw004', 'User004', '010-1234-04', 'user004@example.com');

INSERT INTO member (num, member_id, member_pw, member_name, member_tel, member_email)
VALUES (seq_member.NEXTVAL, 'user005', 'pw005', 'User005', '010-1234-05', 'user005@example.com');

INSERT INTO addressbook (num, member_num, AB_NAME, AB_ZIPCODE, AB_ADDRESS1, AB_ADDRESS2, AB_TEL)
VALUES (seq_addressbook.NEXTVAL, 1, 'kim1', '13612', '경기도 성남시 분당구 내정로 27-1', '구두수선대', '010-111-2222');

INSERT INTO addressbook (num, member_num, AB_NAME, AB_ZIPCODE, AB_ADDRESS1, AB_ADDRESS2, AB_TEL)
VALUES (seq_addressbook.NEXTVAL, 1, 'kim2', '13612', '경기도 성남시 분당구 내정로 29', '금곡프라자', '010-111-2222');

INSERT INTO addressbook (num, member_num, AB_NAME, AB_ZIPCODE, AB_ADDRESS1, AB_ADDRESS2, AB_TEL)
VALUES (seq_addressbook.NEXTVAL, 2, 'lee1', '13602', '경기도 성남시 분당구 내정로 24', '정든마을한진6단지', '010-111-2222');

INSERT INTO addressbook (num, member_num, AB_NAME, AB_ZIPCODE, AB_ADDRESS1, AB_ADDRESS2, AB_TEL)
VALUES (seq_addressbook.NEXTVAL, 2, 'lee2', '13602', '경기도 성남시 분당구 내정로 20', '탄천초등학교', '010-222-3333');

INSERT INTO addressbook (num, member_num, AB_NAME, AB_ZIPCODE, AB_ADDRESS1, AB_ADDRESS2, AB_TEL)
VALUES (seq_addressbook.NEXTVAL, 2, 'lee3', '13602', '경기도 성남시 분당구 내정로 10', '정든마을한진7단지', '010-333-4444');


------------
INSERT INTO CATEGORY (NUM, CATEGORY_NAME)
VALUES (SEQ_CATEGORY.NEXTVAL, '볶음·구이');

INSERT INTO CATEGORY (NUM, CATEGORY_NAME)
VALUES (SEQ_CATEGORY.NEXTVAL, '고기반찬');

INSERT INTO CATEGORY (NUM, CATEGORY_NAME)
VALUES (SEQ_CATEGORY.NEXTVAL, '국·탕·찌개');

INSERT INTO CATEGORY (NUM, CATEGORY_NAME)
VALUES (SEQ_CATEGORY.NEXTVAL, '김치');


------------

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 2, '떡갈비', 14000, 'img0201.png', 100, '부드럽고 담백한 떡갈비');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 2, '돈까스', 12000, 'img0202.png', 100, '아이들 한 끼로 뚝딱, 부드러운 돈까스');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 2, '치즈돈까스', 13000, 'img0203.png', 100, '부드러운 모짜렐라가 가득');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 2, '갈비찜', 16000, 'img0204.png', 100, '감칠맛 가득, 달콤한 갈비찜');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 2, '불고기', 16500, 'img0205.png', 100, '담백하고 부드러운 옛날 소 불고기');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 2, '육전', 13000, 'img0206.png', 100, '고운 달걀물을 입혀 한 장씩 구운 육전');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '돼지고기 김치찌개', 12000, 'img0301.png', 100, '맛있는 김치찌개 하나로 한 끼 뚝딱 해결');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '짬뽕탕', 13000, 'img0302.png', 100, '얼큰한 국물, 해장으로도 완벽!');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '뚝배기불고기', 14000, 'img0303.png', 100, '푸짐하고 간편하게, 누구나 좋아하는 맛');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '유부주머니', 9000, 'img0304.png', 100, '한입에 팡 터지는 고소한 맛 가득');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '밀푀유나베', 12500, 'img0306.png', 100, '간편하게 근사한 저녁 완성');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '에그인헬', 11000, 'img0307.png', 100, '미국 가정식을 우리집 식탁에');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '전복미역국', 13000, 'img0308.png', 100, '깊고 진한 감칠맛 가득');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 3, '육개장', 13000, 'img0309.png', 100, '진한 육수와 시원한 풍미');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '꽈리멸치볶음', 5500, 'img0401.png', 100, '짭쪼름하고 매콤한 맛의 조화');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '버섯볶음', 5000, 'img0402.png', 100, '쫄깃한 식감, 온 가족 반찬');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '삼색나물', 4800, 'img0403.png', 100, '비빔밥으로 즐겨도 좋은 나물 모음');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '애호박볶음', 5200, 'img0405.png', 100, '국내산 애호박, 고소한 풍미 가득');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '잡채', 5200, 'img0406.png', 100, '다양한 채소와 탱글한 당면');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '비빔밥', 8000, 'img0409.png', 100, '속을 든든하게 채워줄 비빔밥 한그릇');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 4, '꼬막비빔밥', 12000, 'img0410.png', 100, '신선한 꼬막의 탱탱한 식감');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 5, '김장포기김치', 19000, 'img0501.png', 100, '국내산 재료, 완벽한 포기김치');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 5, '백김치', 17000, 'img0502.png', 100, '시원함으로 입맛 돋우는 백김치');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 5, '깍두기', 10000, 'img0503.png', 100, '아삭한 식감이 일품, 매콤새콤');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 5, '총각김치', 16000, 'img0504.png', 100, '입맛 없는 날 간편한 반찬으로');

insert into product(num, category_num, product_name, product_price, product_img, product_stock, product_content)
values (seq_product.nextval, 5, '나박김치', 11000, 'img0506.png', 100, '시원한 단맛으로 색다른 별미 김치');


------------
INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 5, 'user001', '떡갈비 부드럽고 맛있어요~');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 5, 'user001', '떡갈비 부드럽고 맛있어요~');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 5, 'user001', '맛있어서 재구매 했습니다');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 5, 'user002', '집에서 편리하게 먹을 수 있어서 좋아요');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 5, 'user003', '그냥 그래요');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 6, 'user003', '아이들이 좋아해서 항상 구매합니다');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 6, 'user001', '집에 꼭 있어야 하는 반찬!');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 6, 'user002', '고기가 부드럽고 소스도 맛있네요');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 7, 'user004', '아이가 먹고싶어해서 구매했어요');

INSERT INTO REVIEW(NUM, PRODUCT_NUM, MEMBER_ID, REVIEW_CONTENT)
VALUES (SEQ_REVIEW.NEXTVAL, 7, 'user001', '치즈가 쭈욱 늘어나용');


-------------------------------
insert into question(qnum,title,content,writer) values(SEQ_QUESTION.nextval,'질문있습니다','구매는 어떻게하나요','user001');
insert into question(qnum,title,content,writer) values(SEQ_QUESTION.nextval,'배송질문','배송은 언제 오나요','user001');
insert into question(qnum,title,content,writer) values(SEQ_QUESTION.nextval,'주문질문','배송중인가요?','user001');
insert into question(qnum,title,content,writer) values(SEQ_QUESTION.nextval,'질문있어요','맛있나요?','user001');
insert into question(qnum,title,content,writer) values(SEQ_QUESTION.nextval,'전화번호가?','대표번호가뭐죠?','user001');

insert into answer(anum,qnum,content,writer) values(seq_answer.nextval,1,'홈페이지에서 주문해주세요~','admin');
insert into answer(anum,qnum,content,writer) values(seq_answer.nextval,2,'주문시 2~3일 걸립니다','admin');
insert into answer(anum,qnum,content,writer) values(seq_answer.nextval,3,'현재 배송준비중으로 확인됩니다','admin');
insert into answer(anum,qnum,content,writer) values(seq_answer.nextval,4,'맛있습니다!!','admin');
insert into answer(anum,qnum,content,writer) values(seq_answer.nextval,5,'010-1111-2222입니다!','admin');






