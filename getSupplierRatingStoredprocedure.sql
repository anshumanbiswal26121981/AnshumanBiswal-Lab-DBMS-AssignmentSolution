CREATE PROCEDURE `getSupplierRatingDetails` ()
BEGIN
SELECT 
    t3.SUPP_ID,
    t3.SUPP_NAME,
    t3.rat_ratstars,
    CASE
        WHEN t3.rat_ratstars = 5 THEN 'Excellent Service'
        WHEN t3.rat_ratstars > 4 THEN 'Good Service'
        WHEN t3.rat_ratstars > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS type_of_service
FROM
    (SELECT 
        s.SUPP_ID, s.SUPP_NAME, t2.rat_ratstars
    FROM
        supplier s
    INNER JOIN (SELECT 
        suppl.SUPP_ID, t1.rat_ratstars
    FROM
        supplier_pricing suppl
    INNER JOIN (SELECT 
        o.ORD_ID, o.PRICING_ID, r.rat_ratstars
    FROM
        `order` o, rating r
    WHERE
        o.ORD_ID = r.ORD_ID) AS t1 ON t1.PRICING_ID = suppl.pricing_id) AS t2 ON t2.SUPP_ID = s.supp_id) AS t3;
END