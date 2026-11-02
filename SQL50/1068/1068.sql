SELECT 
    Product.product_name,
    Sales.year,
    Sales.price
FROM Sales
    JOIN Product using (product_id)