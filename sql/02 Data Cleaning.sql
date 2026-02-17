
-- 1. ENABLE UPDATE MODE
SET SQL_SAFE_UPDATES = 0;

-- 2. INVOICE TYPE CLASSIFICATION

UPDATE e_comm_processed
SET invoice_flag =
CASE
WHEN invoice_id LIKE '5%' THEN 'SALE'
WHEN invoice_id LIKE 'C%' THEN 'CREDIT'
WHEN invoice_id LIKE 'A%' THEN 'ADJUSTMENT'
ELSE 'UNKNOWN'
END;

-- Convert CREDIT → RETURN for analytics consistency

UPDATE e_comm_processed
SET invoice_flag = 'RETURN'
WHERE invoice_flag = 'CREDIT';

-- 3. DUPLICATE REMOVAL

WITH ranked_rows AS (
SELECT
invoice_id,
stock_cd,
descr,
quant,
invoice_dt,
unit_pr,
customer_id,
country,
ROW_NUMBER() OVER (
PARTITION BY
invoice_id,
stock_cd,
descr,
quant,
invoice_dt,
unit_pr,
customer_id,
country
ORDER BY invoice_id
) AS row_num
FROM e_comm_processed
)

DELETE FROM e_comm_processed
WHERE (invoice_id, stock_cd, descr, quant,
invoice_dt, unit_pr, customer_id, country) IN (
SELECT
invoice_id, stock_cd, descr, quant,
invoice_dt, unit_pr, customer_id, country
FROM ranked_rows
WHERE row_num > 1
);

-- 4. REVENUE STANDARDIZATION
-- Ensure negative revenue is corrected

UPDATE e_comm_processed
SET revenue =
CASE
WHEN revenue < 0 THEN 0
ELSE revenue
END;

-- 5. PRODUCT DESCRIPTION CLEANING

-- Handle blank descriptions

UPDATE e_comm_processed
SET descr = 'UNKNOWN PRODUCT'
WHERE descr IS NULL
OR TRIM(descr) = '';

-- 6. PRODUCT VS NON-PRODUCT CLASSIFICATION

-- Example product classification

UPDATE e_comm_processed
SET product_flag = 'PRODUCT'
WHERE stock_cd = 'DCGSSGIRL';

-- Reclassify manual adjustments

UPDATE e_comm_processed
SET product_flag = 'NOT PRODUCT'
WHERE descr = 'Manual';

-- 7. CUSTOMER ID STANDARDIZATION

-- Convert blank IDs to NULL

UPDATE e_comm_processed
SET customer_id = NULL
WHERE customer_id = '';

-- END OF DATA CLEANING SCRIPT

