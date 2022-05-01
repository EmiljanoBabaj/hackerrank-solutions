
-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
--
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed
--  to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed,
--   and power of the wands that Ron's interested in, sorted in order of descending power. If more than
--    one wand has same power, sort the result in order of descending age.

-- This challenge is poorly worded. It's difficult to understand that you need to return only the cheapest wand for same power and age.
-- The subquery will get only the minimum coins needed for the wand with same age and power and then we can use that value to get
-- only the wands required

select id, age, coins_needed, power from wands w
inner join wands_property wp on w.code = wp.code
where wp.is_evil = 0
and coins_needed = (select MIN(w1.coins_needed) from wands w1 inner join wands_property wp1 ON wp1.code = w1.code where w1.power = w.power and wp1.age = wp.age )
order by power DESC, age DESC