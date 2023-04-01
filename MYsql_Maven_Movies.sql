use mavenmovies;
select 
* from rental;
-- Select Distnicht { how to get unique 6
select distinct
rating
from film;
-- Hmm Penasaran--
select distinct
country
from country;

-- Using Multiple Critera Using Where and And

select
customer_id,
rental_id,
amount
from payment
order by payment_date DESC;


-- Asignment 7 Where and End. Finding the payment over 5$ since customer January,1,2006
select
customer_id,
rental_id,
amount,
payment_date
from payment
where amount >= 5 and payment_date >= '2006-01-01' and customer_id < 101;

-- Where And Or 

select
customer_id,
rental_id,
amount,
payment_date
from payment
where amount > 5 
and customer_id in (42,53,60,75);


-- LIke Operator, 
-- Asignment 

select
title,
special_features
from film
where special_features  LIKE '%Behind The Scenes' and not '%Deleted Scenes%';


/* Group By By Clause Karena Menggunakan Data */
select
rental_duration,
rating,
replacement_cost,
max(film_id) > 500 as  films_with_rating
from film
group by rating,rental_duration;

-- Agregate Functions




/* Group Multiple Group by */
select 
first_name,
last_name,
company_name
from investor
group by first_name
order by last_name;

/* Example HavingClouse */
select
	customer_id,
    count(rental_id)
from rental
group by customer_id
having count(rental_id) > 30
order by;

/* The Order By Clouse */
select 
customer_id,
sum(amount)
from payment
group by customer_id
order by sum(amount) desc;

/* Closing : The Big 6 
 S, F , W, G,H , O


/* Part 2 */

-- The Case statement

select distinct
length,
title,
case
when length < 60 then 'under 1 hr'
when length between 60 and 90 then '1-1-5 hrs'
when length > 90 then 'over 1.5 hrs'
else ' check logic'
end as length_bucket,
case
when length < 60 then 'under 1 hr'
when length between 60 and 90 then '1-1-5 hrs'
when length > 90 then 'over 1.5 hrs'
else ' check logic'
end as reordered_reco
from film
group by length;


/* Case Statement Count and Case Statement
 */
SELECT
    film_id, 
    COUNT(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END) AS store_1_copies,
    COUNT(CASE WHEN store_id = 2 THEN inventory_id ELSE NULL END) AS store_2_copies,
    COUNT(inventory_id) AS total_copies
FROM inventory
GROUP BY film_id
ORDER BY film_id;


/* This is about Part 3-Analyzing Data joins */

select distinct
inventory.inventory_id,
inventory.store_id,
film.title,
film.description
from film
inner join inventory
on film.film_id = inventory.film_id;

/* Section 1_ Common Join Types */

select distinct
rental.rental_id
from inventory
inner join rental
on inventory.inventory_id = rental.inventory_id
limit 200;


/* Left JOin -- USefull */
select 
actor.first_name,
actor.last_name,
COUNT(film_actor.film_id) as  number_of_films
from actor
right join film_actor
on actor.actor_id = film_actor.actor_id
group by 
actor.first_name,
actor.last_name;

/* Left / Inner / RIght Join Example */
select 
actor.actor_id,
actor.first_name,
actor.last_name,
actor_award.first_name,
actor_award.last_name,
actor_award.awards
from actor
right  join actor_award
on actor.actor_id = actor_award_id
order by actor_id;




select
film.film_id,
film.title,
category.name
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on film_category.category_id = category.category_id;




select
actor.first_name,
actor.last_name,
film.title
from actor
inner join film_actor
on film_actor.actor_id = actor.actor_id
inner join film 
on film.film_id  = film_actor.film_id;



/* Multi Condition Join */
select
film.film_id,
film.title,
film.rating,
category.name
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on film_category.category_id = category.category_id
where category.name = 'horror'
order by film_id;


--
select distinct
film.title,
film.description
from film
inner join inventory
on inventory.film_id = film.film_id
and inventory.store_id = 2;


/* Union 