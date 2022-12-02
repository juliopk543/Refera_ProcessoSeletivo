CREATE VIEW TOP16 AS
SELECT film.title, count(rental.vendas_id) as quantidade, rental.film_id
FROM ( SELECT rental.inventory_id as vendas_id, inventory.film_id FROM public.rental JOIN inventory ON inventory.inventory_id = rental.inventory_id)
rental JOIN public.film ON film.film_id = rental.film_id
group by film.title, rental.film_id
order by quantidade DESC
LIMIT 16;

SELECT CONCAT(film_actor.first_name, ' ',film_actor.last_name) as nome_completo, count(*) as quantidade
FROM ( SELECT actor.first_name, actor.last_name, film_actor.actor_id, film_actor.film_id FROM public.film_actor JOIN actor on actor.actor_id = film_actor.actor_id )
film_actor JOIN TOP16 ON TOP16.film_id = film_actor.film_id
group by nome_completo
order by quantidade DESC
LIMIT 1;