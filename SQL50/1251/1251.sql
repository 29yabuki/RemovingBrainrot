WITH UnitsRevenue AS (
    SELECT 
        p.product_id, 
        u.units, 
        p.price * u.units as revenue
    FROM Prices p
        LEFT JOIN UnitsSold u using (product_id)
    WHERE (u.purchase_date >= p.start_date AND u.purchase_date <= p.end_date) 
        OR (u.units is NULL)
)
SELECT
    product_id,
    COALESCE(ROUND(SUM(revenue)::NUMERIC/NULLIF(SUM(units), 0), 2), 0) as average_price
FROM UnitsRevenue
GROUP BY product_id;