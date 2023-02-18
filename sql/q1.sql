-- Which brand saw the most dollars spent in the month of June
select name from brands b 
where barcode = (
select barcode from receipt_items ri 
where ri.total_final_price  = (
select max(total_final_price) from receipt_items ri
where barcode in (
select barcode from brands)
)and 
ri.receipt_id  in (
select id  from receipts r 
WHERE EXTRACT(month FROM r.create_date) = 6)
);





-- -----------------Practice Query-----------------------


select * from receipt_items ri 
where ri.receipt_id in (
select id  from receipts r 
WHERE EXTRACT(month FROM r.create_date) = 6
);


select id  from receipts r 
WHERE EXTRACT(month FROM r.create_date) = 6;





-- barcode = 4664
-- 511111107521
select barcode from receipt_items ri 
where ri.total_final_price  = (
select max(total_final_price) from receipt_items ri
where barcode in (
select barcode from brands)
);

select barcode, total_final_price  from receipt_items ri
where barcode in (
select barcode from brands);



-- 4664
-- 511111107521
select barcode from receipt_items ri 
where ri.total_final_price  = 400;

-- 31,003.84
-- 400
select max(total_final_price) from receipt_items ri
where barcode in (
select barcode from brands);


select barcode from brands;

-- -----------------Practice Query-----------------------