/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/10/2022 11:03:03                      */
/*==============================================================*/


DROP TABLE IF EXISTS ADMINS;

DROP TABLE IF EXISTS CARTS;

DROP TABLE IF EXISTS CATEGORIES;

DROP TABLE IF EXISTS CATEGORYTAGCATEGORIES;

DROP TABLE IF EXISTS COMMENTS;

DROP TABLE IF EXISTS CREATORS;

DROP TABLE IF EXISTS FAVORITES;

DROP TABLE IF EXISTS PRODUCTS;

DROP TABLE IF EXISTS PRODUCTTAGS;

DROP TABLE IF EXISTS RATINGS;

DROP TABLE IF EXISTS SOCIALMEDIAACCOUNTS;

DROP TABLE IF EXISTS SOCIALMEDIAS;

DROP TABLE IF EXISTS TAGCATEGORIES;

DROP TABLE IF EXISTS TAGS;

DROP TABLE IF EXISTS TICKETS;

DROP TABLE IF EXISTS TICKETTYPES;

DROP TABLE IF EXISTS USERS;

/*==============================================================*/
/* Table : ADMINS                                               */
/*==============================================================*/
CREATE TABLE ADMINS
(
   USER_ID              INT NOT NULL,
   PRIMARY KEY (USER_ID)
);

/*==============================================================*/
/* Table : CARTS                                                */
/*==============================================================*/
CREATE TABLE CARTS
(
   PRODUCT_ID           INT NOT NULL,
   USER_ID              INT NOT NULL,
   QUANTITY             INT NOT NULL,
   PRIMARY KEY (PRODUCT_ID, USER_ID)
);

/*==============================================================*/
/* Table : CATEGORIES                                           */
/*==============================================================*/
CREATE TABLE CATEGORIES
(
   CATEGORY_ID          INT NOT NULL AUTO_INCREMENT,
   CATEGORY_NAME        VARCHAR(254) NOT NULL,
   CATEGORY_DESCRIPTION VARCHAR(254) NOT NULL,
   PRIMARY KEY (CATEGORY_ID)
);

/*==============================================================*/
/* Table : CATEGORYTAGCATEGORIES                                */
/*==============================================================*/
CREATE TABLE CATEGORYTAGCATEGORIES
(
   CATEGORY_ID          INT NOT NULL,
   TAG_CATEGORY_ID      INT NOT NULL,
   PRIMARY KEY (CATEGORY_ID, TAG_CATEGORY_ID)
);

/*==============================================================*/
/* Table : COMMENTS                                             */
/*==============================================================*/
CREATE TABLE COMMENTS
(
   COMMENT_ID           INT NOT NULL AUTO_INCREMENT,
   RATING_ID            INT NOT NULL,
   USER_ID              INT NOT NULL,
   TITLE                VARCHAR(254) NOT NULL,
   BODY                 VARCHAR(254) NOT NULL,
   DATE                 DATE NOT NULL,
   PRIMARY KEY (COMMENT_ID)
);

/*==============================================================*/
/* Table : CREATORS                                             */
/*==============================================================*/
CREATE TABLE CREATORS
(
   USER_ID              INT NOT NULL,
   CREATOR_DESCRIPTION  VARCHAR(254) NOT NULL,
   CREATOR_BANNER_URL   VARCHAR(254),
   PRIMARY KEY (USER_ID)
);

/*==============================================================*/
/* Table : FAVORITES                                            */
/*==============================================================*/
CREATE TABLE FAVORITES
(
   USER_ID              INT NOT NULL,
   CREATORS_USER_ID     INT NOT NULL,
   PRIMARY KEY (USER_ID, CREATORS_USER_ID)
);

/*==============================================================*/
/* Table : PRODUCTS                                             */
/*==============================================================*/
CREATE TABLE PRODUCTS
(
   PRODUCT_ID           INT NOT NULL AUTO_INCREMENT,
   CATEGORY_ID          INT NOT NULL,
   USER_ID              INT NOT NULL,
   PRODUCT_NAME         VARCHAR(254) NOT NULL,
   PRODUCT_DESCRIPTION  VARCHAR(254) NOT NULL,
   PRODUCT_IMAGE_URL    VARCHAR(254),
   PRICE                DECIMAL(8,2) NOT NULL,
   DISCOUNT_PERCENTAGE  DECIMAL(5,2),
   STOCK                INT NOT NULL,
   VISIBLE              BOOL NOT NULL,
   PRIMARY KEY (PRODUCT_ID)
);

/*==============================================================*/
/* Table : PRODUCTTAGS                                          */
/*==============================================================*/
CREATE TABLE PRODUCTTAGS
(
   PRODUCT_ID           INT NOT NULL,
   TAG_ID               INT NOT NULL,
   PRIMARY KEY (PRODUCT_ID, TAG_ID)
);

/*==============================================================*/
/* Table : RATINGS                                              */
/*==============================================================*/
CREATE TABLE RATINGS
(
   RATING_ID            INT NOT NULL AUTO_INCREMENT,
   PRODUCT_ID           INT NOT NULL,
   COMMENT_ID           INT,
   USER_ID              INT NOT NULL,
   GRADE                INT NOT NULL,
   PRIMARY KEY (RATING_ID)
);

/*==============================================================*/
/* Table : SOCIALMEDIAACCOUNTS                                  */
/*==============================================================*/
CREATE TABLE SOCIALMEDIAACCOUNTS
(
   USER_ID              INT NOT NULL,
   SOCIAL_MEDIA_ID      INT NOT NULL,
   ACCOUNT              VARCHAR(254) NOT NULL,
   PRIMARY KEY (USER_ID, SOCIAL_MEDIA_ID)
);

/*==============================================================*/
/* Table : SOCIALMEDIAS                                         */
/*==============================================================*/
CREATE TABLE SOCIALMEDIAS
(
   SOCIAL_MEDIA_ID      INT NOT NULL AUTO_INCREMENT,
   SOCIAL_MEDIA_NAME    VARCHAR(254) NOT NULL,
   PRIMARY KEY (SOCIAL_MEDIA_ID)
);

/*==============================================================*/
/* Table : TAGCATEGORIES                                        */
/*==============================================================*/
CREATE TABLE TAGCATEGORIES
(
   TAG_CATEGORY_ID      INT NOT NULL AUTO_INCREMENT,
   TAG_CATEGORY_NAME    VARCHAR(254) NOT NULL,
   PRIMARY KEY (TAG_CATEGORY_ID)
);

/*==============================================================*/
/* Table : TAGS                                                 */
/*==============================================================*/
CREATE TABLE TAGS
(
   TAG_ID               INT NOT NULL AUTO_INCREMENT,
   TAG_CATEGORY_ID      INT NOT NULL,
   TAG_NAME             VARCHAR(254) NOT NULL,
   PRIMARY KEY (TAG_ID)
);

/*==============================================================*/
/* Table : TICKETS                                              */
/*==============================================================*/
CREATE TABLE TICKETS
(
   TICKET_ID            INT NOT NULL AUTO_INCREMENT,
   USER_ID              INT NOT NULL,
   TICKET_TYPE_ID       INT NOT NULL,
   ADMINS_USER_ID       INT NOT NULL,
   TICKET_NAME          VARCHAR(254) NOT NULL,
   TICKET_DESCRIPTION   VARCHAR(254) NOT NULL,
   RESOLVED             BOOL NOT NULL,
   PRIMARY KEY (TICKET_ID)
);

/*==============================================================*/
/* Table : TICKETTYPES                                          */
/*==============================================================*/
CREATE TABLE TICKETTYPES
(
   TICKET_TYPE_ID       INT NOT NULL AUTO_INCREMENT,
   TICKET_TYPE_NAME     VARCHAR(254) NOT NULL,
   PRIMARY KEY (TICKET_TYPE_ID)
);

/*==============================================================*/
/* Table : USERS                                                */
/*==============================================================*/
CREATE TABLE USERS
(
   USER_ID              INT NOT NULL AUTO_INCREMENT,
   FIRST_NAME           VARCHAR(254) NOT NULL,
   LAST_NAME            VARCHAR(254) NOT NULL,
   PASSWORD_HASH        VARCHAR(254) NOT NULL,
   EMAIL                VARCHAR(254) NOT NULL,
   PICTURE_URL          VARCHAR(254),
   PRIMARY KEY (USER_ID),
   UNIQUE KEY AK_FULL_NAME (FIRST_NAME, LAST_NAME)
);

ALTER TABLE ADMINS ADD CONSTRAINT FK_HERITAGE_USER FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CARTS ADD CONSTRAINT FK_CONTAINS FOREIGN KEY (PRODUCT_ID)
      REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CARTS ADD CONSTRAINT FK_CONTAINS2 FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CATEGORYTAGCATEGORIES ADD CONSTRAINT FK_PRECISES FOREIGN KEY (CATEGORY_ID)
      REFERENCES CATEGORIES (CATEGORY_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CATEGORYTAGCATEGORIES ADD CONSTRAINT FK_PRECISES2 FOREIGN KEY (TAG_CATEGORY_ID)
      REFERENCES TAGCATEGORIES (TAG_CATEGORY_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COMMENTS ADD CONSTRAINT FK_INFORMS FOREIGN KEY (RATING_ID)
      REFERENCES RATINGS (RATING_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COMMENTS ADD CONSTRAINT FK_POSTS FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CREATORS ADD CONSTRAINT FK_HERITAGE_USER2 FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FAVORITES ADD CONSTRAINT FK_FAVORITES FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FAVORITES ADD CONSTRAINT FK_FAVORITES2 FOREIGN KEY (CREATORS_USER_ID)
      REFERENCES CREATORS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTS ADD CONSTRAINT FK_BELONGS_TO FOREIGN KEY (CATEGORY_ID)
      REFERENCES CATEGORIES (CATEGORY_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTS ADD CONSTRAINT FK_SELLS FOREIGN KEY (USER_ID)
      REFERENCES CREATORS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTTAGS ADD CONSTRAINT FK_DEFINES FOREIGN KEY (PRODUCT_ID)
      REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTTAGS ADD CONSTRAINT FK_DEFINES2 FOREIGN KEY (TAG_ID)
      REFERENCES TAGS (TAG_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RATINGS ADD CONSTRAINT FK_GIVES FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RATINGS ADD CONSTRAINT FK_GRADES FOREIGN KEY (PRODUCT_ID)
      REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RATINGS ADD CONSTRAINT FK_INFORMS2 FOREIGN KEY (COMMENT_ID)
      REFERENCES COMMENTS (COMMENT_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SOCIALMEDIAACCOUNTS ADD CONSTRAINT FK_IS_ON FOREIGN KEY (USER_ID)
      REFERENCES CREATORS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SOCIALMEDIAACCOUNTS ADD CONSTRAINT FK_IS_ON2 FOREIGN KEY (SOCIAL_MEDIA_ID)
      REFERENCES SOCIALMEDIAS (SOCIAL_MEDIA_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TAGS ADD CONSTRAINT FK_IS_PART_OF FOREIGN KEY (TAG_CATEGORY_ID)
      REFERENCES TAGCATEGORIES (TAG_CATEGORY_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKETS ADD CONSTRAINT FK_HANDLES FOREIGN KEY (ADMINS_USER_ID)
      REFERENCES ADMINS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKETS ADD CONSTRAINT FK_OF_TYPE FOREIGN KEY (TICKET_TYPE_ID)
      REFERENCES TICKETTYPES (TICKET_TYPE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKETS ADD CONSTRAINT FK_OPENS FOREIGN KEY (USER_ID)
      REFERENCES USERS (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

