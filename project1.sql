CREATE DATABASE restaurantsql;
\c restaurantsql;

CREATE TABLE parties (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	number_people integer,
	table_name VARCHAR(100),
	paid BOOLEAN,
	time_sat timestamp,
	time_paid timestamp
);

CREATE TABLE menu_items (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price money,
	description VARCHAR(1000),
	allergens VARCHAR(255),
	course VARCHAR(255),
	meal VARCHAR(255)
);

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	party_id integer,
	menu_item_id integer,
	notes VARCHAR(1000),
	queue BOOLEAN
);
\q














