-- 1.  What are the top 5 brands by reciepts scanned for most recent month?

SELECT TOP 5
   b.NAMES
   ,COUNT(r.receipt_id) AS Receipt_Count
FROM Brands b
JOIN ReceiptItems ri 
ON b.brandCode = ri.brandCode 
JOIN Receipts r 
ON r.receipt_id = re.receipt_id
WHERE datetrunc(month,purchaseDate) = datetrunc(month, getdate())
GROUP BY  b.names
ORDER BY Receipt_Count ;


-- 3. When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT 
    rewardsReceiptStatus,
    AVG(totalSpent)
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected');

-- 4. When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT 
    rewardsReceiptStatus,
    SUM(purchasedItemCount)
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected');

-- 5. Which brand has the most spend among users who were created within the past 6 months?

SELECT  TOP 1 
    b.name as Brand_name
    ,SUM(r.totalSpent) as Tot_Spend
FROM Receipts r 
JOIN Users u
ON u.user_id = r.user_id
JOIN ReceiptItems ri 
ON r.receipt_id = ri.eceipt_id
JOIN Brands b 
ON b.brandCode = ri.brandCode 
WHERE createdDate >= DATEDADD(month, -6, GETDATE())
GROUP BY b.name
ORDER BY Tot_Spend DESC;

-- 6. Which brand has the most transactions among users who were created within the past 6 months

SELECT  TOP 1 
    b.name as Brand_name
    ,COUNT(r.totalSpent) as Tot_Transaction
FROM Receipts r 
JOIN Users u
ON u.user_id = r.user_id
JOIN ReceiptItems ri 
ON r.receipt_id = ri.eceipt_id
JOIN Brands b 
ON b.brandCode = ri.brandCode 
WHERE createdDate > DATEDADD(month, -6, GETDATE())
GROUP BY b.name
ORDER BY Tot_Transaction DESC;
