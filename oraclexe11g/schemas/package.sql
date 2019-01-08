CREATE TABLE "package"
(
    "package_id" VARCHAR(20) NOT NULL PRIMARY KEY
    ,"package_name" VARCHAR(4000)
    ,"package_kana" VARCHAR(4000)
    ,"package_english" VARCHAR(4000)
    ,"product_type" CHAR(5)
    ,"public_flag" NUMBER(1)
    ,"score" NUMBER(5, 2)
    ,"created_on" DATE DEFAULT SYSDATE
    ,"modified_on" DATE DEFAULT SYSDATE
    ,"deleted_on" DATE DEFAULT SYSDATE
    ,"memo" LONG
)
;
