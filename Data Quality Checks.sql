
---------------SQL Queries for Data Quality Checks

--1. Missing Data in Critical Fields
-- Check for null values in Receipts
SELECT COUNT(*) AS missing_receipt_data
FROM Receipts
WHERE user_id IS NULL OR dateScanned IS NULL OR totalSpent IS NULL;

-- Check for null values in Users
SELECT COUNT(*) AS missing_user_data
FROM Users
WHERE user_id IS NULL OR createdDate IS NULL;

-- Check for null values in Brands
SELECT COUNT(*) AS missing_brand_data
FROM Brands
WHERE brand_id IS NULL OR brandCode IS NULL;

-------2.Inconsistent Data in rewardsReceiptStatus
-- Check for invalid status values
SELECT rewardsReceiptStatus, COUNT(*) AS status_count
FROM Receipts
GROUP BY rewardsReceiptStatus
HAVING rewardsReceiptStatus NOT IN ('Accepted', 'Rejected', 'Pending', 'Finished');

--------3. Duplicate Records
-- Find duplicate receipts
SELECT receipt_id, COUNT(*) AS duplicate_count
FROM Receipts
GROUP BY receipt_id
HAVING COUNT(*) > 1;

-- Find duplicate users
SELECT user_id, COUNT(*) AS duplicate_count
FROM Users
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Find duplicate brands
SELECT brand_id, COUNT(*) AS duplicate_count
FROM Brands
GROUP BY brand_id
HAVING COUNT(*) > 1;

--4. Referential Integrity Checks
SELECT COUNT(*) AS orphaned_receipts
FROM Receipts r
LEFT JOIN Users u ON r.userId = u._id
WHERE u.user_id IS NULL;

-- 5.Check for orphaned receipt items (brandCode not in Brands)
SELECT COUNT(*) AS orphaned_items
FROM ReceiptItems ri
LEFT JOIN Brands b ON ri.brandCode = b.brandCode
WHERE b.brandCode IS NULL;
