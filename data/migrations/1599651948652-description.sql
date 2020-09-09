A-

1-  create a `lab14` database: `CREATE DATABASE lab14;`.
2-(psql -f /data/schema.sql -d lab14)  new database from the terminal prompt: `psql -f /data/schema.sql -d lab14`.

Restart PSQL and switch to `lab14.
3- added the rows to lab14: `psql -f /data/seed.sql -d lab14`.

Restart PSQL and switch to `lab14' .

4- createdac opy of the database with the following command:

`CREATE DATABASE lab14_normal WITH TEMPLATE lab14;`


B- 

1-I will create a second table in the `lab14_normal` database named `authors`. Confirm the success of this command by typing `\d authors` in your SQL shell. You should see the authors table schema, as shown above.
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

2- i will use a simple subquery to retrieve unique author values from the books table and insert each one into the authors table in the `name` column. This is a great pattern for copying lots of data between tables.
 INSERT INTO authors(name) SELECT DISTINCT author FROM books;

 3-  will connect each book to a specific author in the other table.
 
 (UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;)
4- ill modify the books table by removing the column named `author`. Now that the books table contains a `author_id` column which will become a foreign key, your table does not need to contain a string representing each author.
`ALTER TABLE books DROP COLUMN author;

5- will modify the books table by removing the column named `author`. Now that the books table contains a `author_id` column which will become a foreign key, your table does not need to contain a string representing each author.
`ALTER TABLE books DROP COLUMN author;

6- `ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
 will modify the data type of the `author_id` in the books table, setting it as a foreign key which references the primary key in the authors table. Now PostgreSQL knows HOW these 2 tables are connected.
 
 