--- Subqueries
select Store.StoreID, Store.StoreName, ProductID,Quantity, UnitPrice, Amount
from StoreSales
inner join Store
on StoreSales.StoreID = Store.StoreID
where Amount>(select avg(Amount) from StoreSales);

select Store.StoreID, Store.StoreName, ProductID,Quantity, UnitPrice, Amount
from StoreSales
inner join Store
on StoreSales.StoreID = Store.StoreID
where Amount in  (select Amount from StoreSales
where Amount > 4000);


select Store.StoreID, Store.StoreName, ProductID,Quantity, UnitPrice, Amount
from StoreSales
where exists  (select StoreID from StoreSales
inner join Store
on StoreSales.StoreID = Store.StoreID
where Store.StoreID = 1046);
