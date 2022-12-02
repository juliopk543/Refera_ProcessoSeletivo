SELECT film.title, count(rental.vendas_id) as quantidade
FROM ( SELECT rental.inventory_id as vendas_id, inventory.film_id FROM public.rental JOIN inventory ON inventory.inventory_id = rental.inventory_id)
rental JOIN public.film ON film.film_id = rental.film_id
group by film.title
order by quantidade DESC
LIMIT 2;