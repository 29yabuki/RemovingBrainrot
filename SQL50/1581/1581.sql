SELECT customer_id, COUNT(*) as count_no_trans
FROM Visits v
    LEFT JOIN Transactions t using (visit_id)
WHERE t.transaction_id IS NULL
GROUP BY customer_id