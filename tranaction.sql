#select * from customer_acc;


SELECT cus_fname,customer_acc.cus_acc_amount, acc.acc_number FROM customer 
JOIN customer_acc ON customer.cus_id = customer_acc.cus_acc_cust 
WHERE customer_acc.cus_acc = 2;