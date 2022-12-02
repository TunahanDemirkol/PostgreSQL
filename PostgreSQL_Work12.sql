1-)film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT COUNT(*) FROM film
WHERE LENGTH >
(
	SELECT AVG(LENGTH) FROM film
)

2-)film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT COUNT(rental_rate) FROM film
WHERE rental_rate =
(
	SELECT MAX(rental_rate) FROM film
)

3-)film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT title FROM film
WHERE rental_rate = (SELECT MIN (rental_rate) from film) AND replacement_cost = (SELECT MIN (replacement_cost) FROM film)

4-)payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.


SELECT customer.first_name,customer.last_name,payment.customer_id, COUNT(payment.customer_id) from payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name, customer.last_name,payment.customer_id
ORDER BY count desc



