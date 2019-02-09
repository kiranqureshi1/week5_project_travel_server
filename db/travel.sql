DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;


CREATE TABLE countries(
  id serial4 primary key,
  name VARCHAR(255)
);


CREATE TABLE cities(
  id serial4 primary key,
  name VARCHAR(255),
  visit_status BOOLEAN,
  number_of_visits INT4,
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE
);
