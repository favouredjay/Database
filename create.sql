

CREATE TABLE   actor(
act_id               integer                  not null,
act_fname            char(20)                  null,
act_lname            char(20)                  null,
act_gender           char(1)                   null,
CONSTRAINT           actor_PK                 PRIMARY KEY (act_id)
);

CREATE TABLE Movie(
mov_id                integer                not null,
mov_title             char(50)                null,
mov_year              integer                 null,
mov_time              integer                 null,
mov_lang              char(50)                null,
mov_dt_rel            date                   null,
mov_rel_country       char(5)                 null,
CONSTRAINT            Movie_PK              PRIMARY KEY (mov_id)
);

CREATE TABLE Director(
dir_id                integer                not null,
dir_fname             char(20)                null,
dir_lname             char(20)                null,
CONSTRAINT            Director_PK           PRIMARY KEY (dir_id)
);

CREATE TABLE movie_direction(
dir_id                integer                null,
mov_id                integer                null,
CONSTRAINT            Direction_FK         FOREIGN KEY (dir_id)
							REFERENCES  Director(dir_id),
CONSTRAINT            Movie_FK             FOREIGN KEY (mov_id)
							REFERENCES  Movie(mov_id)
                            );
                            
CREATE TABLE Reviewer(
rev_id                integer              not null,
rev_name               char(30)             null,
CONSTRAINT            Reviewer_PK          PRIMARY KEY(rev_id)
);

CREATE TABLE Movie_cast(
act_id               integer                null,
mov_id               integer                null,
role                  char(30)              null,
CONSTRAINT           Movie_cast1_FK         FOREIGN KEY (act_id)
								REFERENCES Actor(act_id),
CONSTRAINT           Movie_cast2_FK         FOREIGN KEY (mov_id)
								REFERENCES Movie(mov_id)
                                );
                                
CREATE TABLE Genres(
gen_id                integer              not null,
gen_title              char(20)             null,
CONSTRAINT            Genre_PK             PRIMARY KEY (gen_id)
);

CREATE TABLE Movie_genres(
mov_id                integer              null,
gen_id                integer               null,
CONSTRAINT            Movie_genres_Movies_FK     FOREIGN KEY(mov_id)
								REFERENCES  Movie(mov_id),
CONSTRAINT            Movie_genres_Genres_FK     FOREIGN KEY (gen_id)
								REFERENCES  Genres(gen_id)
                                );
                                
CREATE TABLE Rating(
mov_id               integer              not null,
rev_id               integer               not null,
rev_stars            integer               null,
num_o_rating        integer               null,

CONSTRAINT           Rating_Movie_FK     FOREIGN KEY(mov_id)
								REFERENCES  Movie(mov_id),
CONSTRAINT           Rating_Reviewer_FK     FOREIGN KEY(rev_id)
								REFERENCES  Reviewer(rev_id),
 CONSTRAINT          Movie_genres_PK     PRIMARY KEY(mov_id, rev_id)

);
                                
                            
