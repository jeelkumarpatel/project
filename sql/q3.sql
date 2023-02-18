-- Query for getting expensive item for all user
select r.id as receipt_id, r.user_id, ri.total_final_price, ri.quantity_purchased _id, ri.barcode  from receipts r 
left join receipt_items ri 
on r.id = ri.receipt_id
where ri.total_final_price  = (
select ri.total_final_price  from receipts r 
left join receipt_items ri 
on r.id = ri.receipt_id
where r.user_id in (
select id from users
)
and ri.total_final_price is not null
and ri.quantity_purchased <> 0.0
order by (total_final_price/ quantity_purchased )  desc
limit 1
);




-- -----------------Practice Query-----------------------
-- get all receipts item from a multiple user
select r.id as receipt_id, r.user_id, ri.total_final_price, ri.quantity_purchased _id from receipts r 
left join receipt_items ri 
on r.id = ri.receipt_id
where r.user_id in (
select id from users
);




-- Query for getting expensive item for one user

-- Finding most expensive item for a single user
select r.id as receipt_id, r.user_id, ri.total_final_price, ri.quantity_purchased _id from receipts r 
left join receipt_items ri 
on r.id = ri.receipt_id
where ri.total_final_price  = (
select ri.total_final_price  from receipts r 
left join receipt_items ri 
on r.id = ri.receipt_id
where r.user_id = '61bfce5d6655417f803b6538'
and ri.total_final_price is not null 
order by (total_final_price/ quantity_purchased )  desc
limit 1
);




-- Retrieved all the receipt_items for a user
select r.id as receipt_id, r.user_id, ri.total_final_price, ri.quantity_purchased _id from receipts r 
left join receipt_items ri 
on r.id = ri.receipt_id
where r.user_id = '61bfce5d6655417f803b6538';





-- All the receipts for the current user
select id from receipts r 
where r.user_id = '61bfce5d6655417f803b6538'




-- Query for getting expensive item for one receipt
-- receipt_id (foreign key of id receipts)
--  id <---> user_id
select * from receipt_items ri2
where ri2.total_final_price  = (
select total_final_price from receipt_items ri 
where receipt_id  = '602d470a0a720edb6d01b85b'
order by (total_final_price/ quantity_purchased )  desc
limit 1
)
and receipt_id = '602d470a0a720edb6d01b85b';





SELECT ri.*
FROM (
-- Retrieved receipt id
  SELECT id
  FROM receipts
  WHERE user_id = '61bfce5d6655417f803b6538'
) r
JOIN receipt_items ri ON r.id = ri.receipt_id
WHERE ri.total_final_price = (
  SELECT MAX(total_final_price)
  FROM receipt_items
  WHERE receipt_id = r.id
);
-- -----------------Practice Query-----------------------