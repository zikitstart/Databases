skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Григорий   | Сергеев   | М      |  20
  6 | Анна       | Серова    | Ж      |  37
  7 | Сергей     | Петров    | М      |  58
  8 | Илья       | Степанов  | М      |  23
  9 | Татьяна    | Котова    | Ж      |  42
(5 строк)


skypro=# SELECT first_name AS Имя, last_name AS Фамилия
                skypro-# FROM employee;
Имя    | Фамилия
----------+----------
 Григорий | Сергеев
 Анна     | Серова
 Сергей   | Петров
 Илья     | Степанов
 Татьяна  | Котова
(5 строк)


skypro=# SELECT * FROM employee
skypro-# WHERE age<30 OR age>50;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Григорий   | Сергеев   | М      |  20
  7 | Сергей     | Петров    | М      |  58
  8 | Илья       | Степанов  | М      |  23
(3 строки)


skypro=# SELECT * FROM employee
skypro-# WHERE age>30 AND age<50;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  6 | Анна       | Серова    | Ж      |  37
  9 | Татьяна    | Котова    | Ж      |  42
(2 строки)


skypro=# SELECT * FROM employee
skypro-# ORDER BY last_name DESC;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  8 | Илья       | Степанов  | М      |  23
  6 | Анна       | Серова    | Ж      |  37
  5 | Григорий   | Сергеев   | М      |  20
  7 | Сергей     | Петров    | М      |  58
  9 | Татьяна    | Котова    | Ж      |  42
(5 строк)


skypro=# SELECT * FROM employee
skypro-# WHERE LENGTH(first_name)>4;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Григорий   | Сергеев   | М      |  20
  7 | Сергей     | Петров    | М      |  58
  9 | Татьяна    | Котова    | Ж      |  42
(3 строки)


skypro=# UPDATE employee SET first_name = 'Анна',last_name = 'Котова',gender = 'Ж',age = 42 WHERE id = 9;
UPDATE 1
skypro=# UPDATE employee SET first_name = 'Григорий',last_name = 'Петров',gender = 'М',age = 58 WHERE id = 7;
UPDATE 1
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Григорий   | Сергеев   | М      |  20
  6 | Анна       | Серова    | Ж      |  37
  8 | Илья       | Степанов  | М      |  23
  9 | Анна       | Котова    | Ж      |  42
  7 | Григорий   | Петров    | М      |  58
(5 строк)


skypro=# SELECT first_name AS Имя,
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
Имя    | Суммарный_возраст
----------+-------------------
 Анна     |                79
 Григорий |                78
 Илья     |                23
(3 строки)


skypro=# SELECT first_name AS Имя,
skypro-# MIN(age) AS Самый_юный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
Имя    | Самый_юный_возраст
----------+--------------------
 Анна     |                 37
 Григорий |                 20
 Илья     |                 23
(3 строки)


skypro=# SELECT first_name AS Имя,
skypro-# MAX(age) AS Максимальный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя
skypro-# HAVING count(first_name) > 1
skypro-# ORDER BY Максимальный_возраст;
Имя    | Максимальный_возраст
----------+----------------------
 Анна     |                   42
 Григорий |                   58
(2 строки)
