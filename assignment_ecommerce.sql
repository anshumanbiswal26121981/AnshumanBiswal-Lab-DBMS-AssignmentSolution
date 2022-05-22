/* Question 1 */
Create database glassignment;
CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT NOT NULL,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR,
    PRIMARY KEY (CUS_ID)
);CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT NOT NULL,
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT NOT NULL,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT NOT NULL,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT NOT NULL,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES PRODUCT (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES SUPPLIER (SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
    ORD_ID INT NOT NULL,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID)
        REFERENCES CUSTOMER (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES SUPPLIER_PRICING (PRICING_ID)
);


CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT NOT NULL,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    PRIMARY KEY (RAT_ID),
    FOREIGN KEY (ORD_ID)
        REFERENCES `order` (ORD_ID)
);

/* Question 2 */
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890'); 
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470'); 
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315'); 
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285'); 
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532'); 
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M'); 
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M'); 
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F'); 
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
 INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M'); 
 INSERT INTO CATEGORY VALUES( 1,"BOOKS"); 
 INSERT INTO CATEGORY VALUES(2,"GAMES"); 
 INSERT INTO CATEGORY VALUES(3,"GROCERIES"); 
 INSERT INTO CATEGORY VALUES (4,"ELECTRONICS"); 
 INSERT INTO CATEGORY VALUES(5,"CLOTHES"); 
 INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2); 
 INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
 INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4); 
 INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3); 
 INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1); 
 INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3); 
 INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4); 
 INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
 INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2); 
 INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
 INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
 INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
 INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500); 
 INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000); 
 INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000); 
 INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);

INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000); 
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780); 
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789); 
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000); 
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450); 
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999); 
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549); 
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529); 
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105); 
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99); 
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
 INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999); 
 INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
 INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
 INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
 INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
 INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
 INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9); 
 INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
 INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6); 
 INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3); 
 INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
 INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5); 
 INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7); 
 INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
 INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5); 
 INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3); 
 INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14); 
 INSERT INTO RATING VALUES(1,101,4);

INSERT INTO RATING VALUES(2,102,3); 
INSERT INTO RATING VALUES(3,103,1); 
INSERT INTO RATING VALUES(4,104,2); 
INSERT INTO RATING VALUES(5,105,4); 
INSERT INTO RATING VALUES(6,106,3); 
INSERT INTO RATING VALUES(7,107,4); 
INSERT INTO RATING VALUES(8,108,4); 
INSERT INTO RATING VALUES(9,109,3); 
INSERT INTO RATING VALUES(10,110,5);
 INSERT INTO RATING VALUES(11,111,3);
 INSERT INTO RATING VALUES(12,112,4);
 INSERT INTO RATING VALUES(13,113,2); 
 INSERT INTO RATING VALUES(14,114,1); 
 INSERT INTO RATING VALUES(15,115,1); 
 INSERT INTO RATING VALUES(16,116,0);
 
 /* Question 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */
SELECT 
    COUNT(t1.cus_gender) AS count, t1.cus_gender
FROM
    (SELECT 
        `order`.*, customer.cus_gender, customer.cus_name
    FROM
        `order`
    INNER JOIN customer
    WHERE
        `order`.CUS_ID = customer.CUS_ID
    HAVING `order`.ORD_AMOUNT >= 3000) AS t1
GROUP BY t1.cus_gender;

 /* Question 4) Display all the orders along with product name ordered by a customer having Customer_Id=2*/
SELECT 
    product.pro_name, `order`.*
FROM
    `order`,
    supplier_pricing,
    product
WHERE
    `order`.CUS_ID = 2
        AND `order`.PRICING_ID = supplier_pricing.PRICING_ID
        AND supplier_pricing.PRO_ID = product.PRO_ID;
    
 /* Question 5) Display the Supplier details who can supply more than one product. */
SELECT 
    supplier.*
FROM
    supplier
WHERE
    supplier.SUPP_ID IN (SELECT 
            supp_id
        FROM
            supplier_pricing
        GROUP BY supp_id
        HAVING COUNT(supp_id) > 3);

 /*  Question 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
SELECT 
    category.cat_id,
    category.cat_name,
    MIN(t2.min_price) AS Min_Price
FROM
    category
        INNER JOIN
    (SELECT 
        product.cat_id, product.pro_name, t1.*
    FROM
        product
    INNER JOIN (SELECT 
        pro_id, MIN(supp_price) AS Min_Price
    FROM
        supplier_pricing
    GROUP BY pro_id) AS t1
    WHERE
        t1.PRO_id = product.pro_id) AS t2
WHERE
    t2.cat_id = category.cat_id
GROUP BY category.cat_id;

/* Question 7) Display the Id and Name of the Product ordered after “2021-10-05” */

SELECT 
    product.pro_id, product.pro_name
FROM
    `order`
        INNER JOIN
    supplier_pricing ON supplier_pricing.PRICING_ID = `order`.PRICING_ID
        INNER JOIN
    product ON product.pro_id = supplier_pricing.pro_id
WHERE
    `order`.ORD_DATE > '2021-10-05';
 
    /* Question 8) Display customer name and gender whose names start or end with character 'A'. */
    
SELECT 
    CUS_NAME, CUS_GENDER
FROM
    customer
WHERE
    UPPER(CUS_NAME) LIKE 'A%'
        OR UPPER(CUS_NAME) LIKE '%A';
        
/* 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service.
 For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
 If rating >2 print “Average Service” else print “Poor Service”. */

-- SELECT 
--     t3.SUPP_ID,
--     t3.SUPP_NAME,
--     t3.rat_ratstars,
--     CASE
--         WHEN t3.rat_ratstars = 5 THEN 'Excellent Service'
--         WHEN t3.rat_ratstars > 4 THEN 'Good Service'
--         WHEN t3.rat_ratstars > 2 THEN 'Average Service'
--         ELSE 'Poor Service'
--     END AS type_of_service
-- FROM
--     (SELECT 
--         s.SUPP_ID, s.SUPP_NAME, t2.rat_ratstars
--     FROM
--         supplier s
--     INNER JOIN (SELECT 
--         suppl.SUPP_ID, t1.rat_ratstars
--     FROM
--         supplier_pricing suppl
--     INNER JOIN (SELECT 
--         o.ORD_ID, o.PRICING_ID, r.rat_ratstars
--     FROM
--         `order` o, rating r
--     WHERE
--         o.ORD_ID = r.ORD_ID) AS t1 ON t1.PRICING_ID = suppl.pricing_id) AS t2 ON t2.SUPP_ID = s.supp_id) AS t3;
        

call getSupplierRatingDetails ();
