SELECT mes_entrada_cliente, count(*) AS quantidade_de_clientes FROM
(SELECT DISTINCT ON (customer_id) customer_id, TO_CHAR(rental_date, 'Month') AS  mes_entrada_cliente
FROM public.rental) AS rental
group by mes_entrada_cliente