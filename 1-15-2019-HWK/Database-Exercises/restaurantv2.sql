CREATE TABLE restaurant (
  id SERIAL PRIMARY KEY,
  name varchar,
  address varchar,
  category varchar
);

CREATE TABLE reviewer (
  id SERIAL PRIMARY KEY,
  name varchar,
  email varchar,
  karma integer CHECK (karma >= 0 and karma <= 7)
);

CREATE TABLE review (
  id SERIAL PRIMARY KEY,
  title varchar,
  review varchar,
  stars integer CHECK (stars >= 0 and stars <= 5),
  reviewer_id integer REFERENCES reviewer (id),
  restaurant_id integer REFERENCES restaurant (id)
);