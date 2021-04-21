use movie;

select mov_title, mov_year
from movie;

select mov_title, mov_year
from movie
where mov_title = 'American Beauty';

select mov_year, mov_title
from movie
where mov_year = 1999;

select mov_year, mov_title
from movie
where mov_year < 1998;

select mov_year, mov_title
from movie
where mov_year = 1999;

select rev_name
from reviewer
where rev_id in
(select rev_id
from rating where rev_stars >=7);

select rev_name, num_o_rating
from reviewer, rating
where num_o_rating is null;

select dir_fname, dir_lname, mov_title
from director, movie
where mov_title = 'Eyes Wide Shut';