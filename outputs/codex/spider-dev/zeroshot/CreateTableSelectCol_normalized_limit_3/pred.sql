select count(*) from singer	concert_singer
select count(*) from singer	concert_singer
select name, country, age from singer order by age desc	concert_singer
select name, country, age from singer order by age desc	concert_singer
select avg(age), min(age), max(age) from singer where country = "France"	concert_singer
select avg(age), min(age), max(age) from singer where country = "France"	concert_singer
select song_name, song_release_year from singer where age = (select min(age) from singer)	concert_singer
select song_name, song_release_year from singer where age = (select min(age) from singer)	concert_singer
select distinct country from singer where age > 20	concert_singer
select distinct country from singer where age > 20	concert_singer
select country, count(*) from singer group by country	concert_singer
select country, count(*) from singer group by country	concert_singer
select song_name from singer where age > (select avg(age) from singer)	concert_singer
select song_name from singer where age > (select avg(age) from singer)	concert_singer
select location, name from stadium where capacity between 5000 and 10000	concert_singer
select location, name from stadium where capacity between 5000 and 10000	concert_singer
select max(capacity), avg(capacity) from stadium	concert_singer
select avg(capacity), max(capacity) from stadium	concert_singer
select name, capacity from stadium where average = (select max(average) from stadium)	concert_singer
select name, capacity from stadium where average = (select max(average) from stadium)	concert_singer
select count(*) from concert where year = 2014 or year = 2015	concert_singer
select count(*) from concert where year = 2014 or year = 2015	concert_singer
select name, count(concert_id) from stadium join concert on stadium.stadium_id = concert.stadium_id group by name	concert_singer
select stadium.name, count(concert.concert_id) from stadium join concert on stadium.stadium_id = concert.stadium_id group by stadium.name	concert_singer
select name, capacity from stadium where stadium_id in (select stadium_id from concert where year >= 2014)	concert_singer
select name, capacity from stadium where stadium_id in (select stadium_id from concert where year > 2013)	concert_singer
select year, count(*) as number_of_concerts from concert group by year order by number_of_concerts desc limit 1	concert_singer
select year, count(*) as count from concert group by year order by count desc limit 1	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert)	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert)	concert_singer
select distinct country from singer where age > 40 or age < 30	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert where year = 2014)	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert where year = 2014)	concert_singer
select concert_name, theme, count(singer_id) from concert, singer_in_concert where concert.concert_id = singer_in_concert.concert_id group by concert_name	concert_singer
select concert_name, theme, count(singer_id) from concert, singer_in_concert where concert.concert_id = singer_in_concert.concert_id group by concert_name, theme	concert_singer
select singer.name, count(singer_in_concert.concert_id) as number_of_concerts from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id group by singer.name	concert_singer
select singer.name, count(singer_in_concert.concert_id) as number_of_concerts from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id group by singer.name	concert_singer
select singer.name from singer, singer_in_concert, concert where singer.singer_id = singer_in_concert.singer_id and singer_in_concert.concert_id = concert.concert_id and concert.year = 2014	concert_singer
select name from singer where singer_id in (select singer_id from singer_in_concert where concert_id in (select concert_id from concert where year = 2014))	concert_singer
select name, country from singer where song_name like '%Hey%'	concert_singer
select name, country from singer where song_name like '%Hey%'	concert_singer
select name, location from stadium where stadium_id in (select stadium_id from concert where year in ('2014','2015'))	concert_singer
select name, location from stadium where stadium_id in (select stadium_id from concert where year in ('2014', '2015') group by stadium_id having count(*) = 2)	concert_singer
select count(*) from concert where stadium_id = (select stadium_id from stadium where capacity = (select max(capacity) from stadium))	concert_singer
select count(*) from concert where stadium_id = (select stadium_id from stadium where capacity = (select max(capacity) from stadium))	concert_singer
select count(*) from pets where weight > 10	pets_1
select count(*) from pets where weight > 10	pets_1
select weight from pets where pettype = "dog" and pet_age = (select min(pet_age) from pets where pettype = "dog")	pets_1
select weight from pets where pettype = "dog" and pet_age = (select min(pet_age) from pets where pettype = "dog")	pets_1
select pettype, max(weight) from pets group by pettype	pets_1
select pettype, max(weight) from pets group by pettype	pets_1
select count(*) from student, pets, has_pet where student.stuid = has_pet.stuid and pets.petid = has_pet.petid and student.age > 20	pets_1
select count(*) from pets, student, has_pet where student.age > 20 and student.stuid = has_pet.stuid and has_pet.petid = pets.petid	pets_1
select count(*) from pets, student, has_pet where pets.petid = has_pet.petid and student.stuid = has_pet.stuid and pets.pettype = "dog" and student.sex = "F"	pets_1
select count(*) from pets, student, has_pet where pets.petid = has_pet.petid and student.stuid = has_pet.stuid and pets.pettype = "dog" and student.sex = "F"	pets_1
select count(distinct pettype) from pets	pets_1
select count(distinct pettype) from pets	pets_1
select fname from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat" or pettype = "dog"))	pets_1
select fname from student, pets, has_pet where student.stuid = has_pet.stuid and pets.petid = has_pet.petid and (pettype = "cat" or pettype = "dog")	pets_1
select fname from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat") intersect select stuid from has_pet where petid in (select petid from pets where pettype = "dog"))	pets_1
select fname from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat") intersect select stuid from has_pet where petid in (select petid from pets where pettype = "dog"))	pets_1
select major, age from student where stuid not in (select stuid from has_pet where petid in (select petid from pets where pettype = 'cat'))	pets_1
select major, age from student where stuid not in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat"))	pets_1
select stuid from student where stuid not in (select stuid from has_pet where petid in (select petid from pets where pettype = 'cat'))	pets_1
select stuid from student where stuid not in (select stuid from has_pet where petid in (select petid from pets where pettype = 'cat'))	pets_1
select fname, age from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "dog") and stuid not in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat")))	pets_1
select fname from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "dog") and stuid not in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat")))	pets_1
select pettype, weight from pets where pet_age = (select min(pet_age) from pets)	pets_1
select pettype, weight from pets where pet_age = (select min(pet_age) from pets)	pets_1
select petid, weight from pets where pet_age > 1	pets_1
select petid, weight from pets where pet_age > 1	pets_1
select pettype, avg(pet_age), max(pet_age) from pets group by pettype	pets_1
select pettype, avg(pet_age), max(pet_age) from pets group by pettype	pets_1
select pettype, avg(weight) from pets group by pettype	pets_1
select pettype, avg(weight) from pets group by pettype	pets_1
select fname, age from student where stuid in (select stuid from has_pet)	pets_1
select fname, age from student where stuid in (select stuid from has_pet)	pets_1
select petid from has_pet where stuid in (select stuid from student where lname = 'Smith')	pets_1
select petid from has_pet where stuid in (select stuid from student where lname = 'Smith')	pets_1
select stuid, count(petid) from has_pet group by stuid	pets_1
select stuid, count(petid) from has_pet group by stuid	pets_1
select fname, sex from student where stuid in (select stuid from has_pet group by stuid having count(*) > 1)	pets_1
select fname, sex from student where stuid in (select stuid from has_pet group by stuid having count(*) > 1)	pets_1
select lname from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat" and pet_age = 3))	pets_1
select lname from student where stuid in (select stuid from has_pet where petid in (select petid from pets where pettype = "cat" and pet_age = 3))	pets_1
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1
select count(*) from continents	car_1
select count(*) from continents	car_1
select contid, continent, count(countryid) as num_countries from continents join countries on continents.contid = countries.continent group by contid	car_1
select continents.contid, continents.continent, count(countries.countryid) as country_count from continents join countries on continents.contid = countries.continent group by continents.contid	car_1
select count(*) from countries	car_1
select count(*) from countries	car_1
select fullname, id, count(model) as number_of_models from car_makers join model_list on car_makers.id = model_list.maker group by fullname, id	car_1
select car_makers.id, car_makers.fullname, count(model_list.model) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id	car_1
select model from model_list where modelid = (select id from car_names where horsepower = (select min(horsepower) from cars_data))	car_1
select model from model_list where modelid = (select model from car_names where makeid = (select id from cars_data where horsepower = (select min(horsepower) from cars_data)))	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from cars_data where weight < (select avg(weight) from cars_data)))	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from cars_data where weight < (select avg(weight) from cars_data)))	car_1
select maker from car_makers where id in (select maker from model_list where modelid in (select id from car_names where makeid in (select id from cars_data where year = 1970)))	car_1
select distinct car_makers.fullname from car_makers join car_names on car_names.model = car_makers.maker join cars_data on cars_data.id = car_names.makeid where cars_data.year = 1970	car_1
select make, year from cars_data join car_names on cars_data.id = car_names.makeid where year = (select min(year) from cars_data)	car_1
select make, year from cars_data join car_names on cars_data.id = car_names.makeid where year = (select min(year) from cars_data)	car_1
select distinct model from model_list join cars_data on model_list.model = cars_data.id where year > 1980	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from cars_data where year > 1980))	car_1
select continents.continent, count(car_makers.id) as count from continents join countries on continents.contid = countries.continent join car_makers on countries.countryid = car_makers.country group by continents.continent	car_1
select continents.continent, count(car_makers.id) as car_makers_count from continents left join countries on continents.contid = countries.continent left join car_makers on countries.countryid = car_makers.country group by continents.continent	car_1
select countryname from countries where countryid in (select country from car_makers group by country order by count(*) desc limit 1)	car_1
select countryname from countries where countryid = (select country from car_makers group by country order by count(*) desc limit 1)	car_1
select count(model_list.modelid), car_makers.fullname from model_list join car_makers on model_list.maker = car_makers.id group by car_makers.fullname	car_1
select car_makers.id, car_makers.fullname, count(model_list.model) as model_count from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id	car_1
select accelerate from cars_data where id = (select makeid from car_names where make = "amc hornet sportabout (sw)")	car_1
select accelerate from cars_data where id = (select makeid from car_names where make = "amc hornet sportabout (sw)")	car_1
select count(*) from car_makers where country = (select countryid from countries where countryname = "france")	car_1
select count(*) from car_makers where country = (select countryid from countries where countryname = "france")	car_1
select count(*) from car_makers where country = (select countryid from countries where countryname = "usa")	car_1
select count(model) from model_list where maker in (select id from car_makers where country in (select countryid from countries where countryname = "usa"))	car_1
select avg(mpg) from cars_data where cylinders = 4	car_1
select avg(mpg) from cars_data where cylinders = 4	car_1
select min(weight) from cars_data where cylinders = 8 and year = 1974	car_1
select min(weight) from cars_data where cylinders = 8 and year = 1974	car_1
select maker, model from car_makers join model_list on car_makers.id = model_list.maker	car_1
select maker, model from car_makers join model_list on car_makers.id = model_list.maker	car_1
select countryname, countryid from countries where countryid in (select country from car_makers)	car_1
select countryname, countryid from countries where countryid in (select country from car_makers)	car_1
select count(*) from cars_data where horsepower > 150	car_1
select count(*) from cars_data where horsepower > 150	car_1
select year, avg(weight) from cars_data group by year	car_1
select year, avg(weight), avg(year) from cars_data group by year	car_1
select countryname from countries where continent = 2 and countryid in (select country from car_makers group by country having count(*) >= 3)	car_1
select distinct countryname from countries where continent = 2 and countryid in (select country from car_makers group by country having count(*) >= 3)	car_1
select horsepower, make from cars_data, car_names where cars_data.id = car_names.makeid and cylinders = 3	car_1
select make from car_names where model in (select model from model_list where maker in (select id from car_makers where country in (select countryid from countries where continent in (select contid from continents where continent = "america")))) and makeid in (select id from cars_data where cylinders = 3 and horsepower = (select max(horsepower) from cars_data where cylinders = 3))	car_1
select model from model_list where modelid = (select model from car_names where makeid = (select id from cars_data where mpg = (select max(mpg) from cars_data)))	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from cars_data where mpg = (select max(mpg) from cars_data)))	car_1
select avg(horsepower) from cars_data where year < 1980	car_1
select avg(horsepower) from cars_data where year < 1980	car_1
select avg(edispl) from cars_data where id in (select makeid from car_names where model = "volvo")	car_1
select avg(edispl) from cars_data where id in (select makeid from car_names where model in (select model from model_list where maker in (select id from car_makers where maker = "volvo")))	car_1
select cylinders, max(accelerate) from cars_data group by cylinders	car_1
select max(accelerate) from cars_data where cylinders = 4	car_1
select model, count(make) as count from car_names group by model order by count desc limit 1	car_1
select model, count(*) as count from model_list group by model order by count desc limit 1	car_1
select count(*) from cars_data where cylinders > 4	car_1
select count(*) from cars_data where cylinders > 4	car_1
select count(*) from cars_data where year = 1980	car_1
select count(*) from cars_data where year = 1980	car_1
select count(model) from model_list where maker = (select id from car_makers where fullname = "American Motor Company")	car_1
select count(model) from model_list where maker = (select id from car_makers where maker = "amc")	car_1
select fullname, id from car_makers where id in (select maker from model_list group by maker having count(model) > 3)	car_1
select car_makers.maker, car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.maker having count(model_list.model) > 3	car_1
select model from model_list where maker in (select id from car_makers where fullname = "General Motors" or weight > 3500)	car_1
select model from model_list where maker in (select id from car_makers where maker in ("gm", "general motors")) and model in (select model from car_names where make in (select make from cars_data where weight > 3500))	car_1
select year from cars_data where weight between 3000 and 4000	car_1
select distinct year from cars_data where weight < 4000 and weight > 3000	car_1
select horsepower from cars_data where accelerate = (select max(accelerate) from cars_data)	car_1
select horsepower from cars_data where accelerate = (select max(accelerate) from cars_data)	car_1
select cylinders from cars_data where id in (select makeid from car_names where model = 'volvo' order by accelerate asc limit 1)	car_1
select cylinders from cars_data where id in (select id from car_names where model in (select model from model_list where maker in (select id from car_makers where maker = "volvo")) order by accelerate asc limit 1)	car_1
select count(*) from cars_data where accelerate > (select max(horsepower) from cars_data)	car_1
select count(*) from cars_data where accelerate > (select max(horsepower) from cars_data)	car_1
select count(*) from countries where countryid in (select country from car_makers group by country having count(*) > 2)	car_1
select count(*) from countries where countryid in (select country from car_makers group by country having count(*) > 2)	car_1
select count(*) from cars_data where cylinders > 6	car_1
select count(*) from cars_data where cylinders > 6	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from cars_data where cylinders = 4 and horsepower = (select max(horsepower) from cars_data where cylinders = 4)))	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from cars_data where cylinders = 4 order by horsepower desc limit 1))	car_1
select makeid, make from car_names where makeid in (select id from cars_data where horsepower > (select min(horsepower) from cars_data) and cylinders <= 3)	car_1
select makeid, make from car_names where makeid in (select id from cars_data where horsepower < (select min(horsepower) from cars_data) and cylinders < 4)	car_1
select max(mpg) from cars_data where cylinders = 8 or year < 1980	car_1
select max(mpg) from cars_data where cylinders = 8 or year < 1980	car_1
select model from model_list where modelid in (select model from car_names where makeid in (select id from car_makers where maker != 'ford' and id in (select id from cars_data where weight < 3500)))	car_1
select model from model_list where model not in (select model from car_names where make like '%ford%') and model in (select model from car_names where makeid in (select id from cars_data where weight < 3500))	car_1
select countryname from countries where countryid not in (select country from car_makers)	car_1
select countryname from countries where countryid not in (select country from car_makers)	car_1
select id, maker from car_makers where id in (select maker from model_list group by maker having count(*) >= 2) and id in (select id from car_makers group by id having count(*) > 3)	car_1
select car_makers.id, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker join car_names on model_list.model = car_names.model group by car_makers.id having count(model_list.model) >= 2 and count(car_names.make) > 3	car_1
select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.country join model_list on car_makers.id = model_list.maker where car_makers.id > 3 or model_list.model = 'fiat'	car_1
select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.country join model_list on car_makers.id = model_list.maker where model_list.model = 'fiat' or car_makers.id > 3	car_1
select country from airlines where airline = "JetBlue Airways"	flight_2
select country from airlines where airline = "Jetblue Airways"	flight_2
select abbreviation from airlines where airline = "JetBlue Airways"	flight_2
select abbreviation from airlines where airline = "Jetblue Airways"	flight_2
select airline, abbreviation from airlines where country = "USA"	flight_2
select airline, abbreviation from airlines where country = "USA"	flight_2
select airportcode, airportname from airports where city = "Anthony"	flight_2
select airportcode, airportname from airports where city = "Anthony"	flight_2
select count(*) from airlines	flight_2
select count(*) from airlines	flight_2
select count(*) from airports	flight_2
select count(*) from airports	flight_2
select count(*) from flights	flight_2
select count(*) from flights	flight_2
select airline from airlines where abbreviation = 'UAL'	flight_2
select airline from airlines where abbreviation = 'UAL'	flight_2
select count(*) from airlines where country = "USA"	flight_2
select count(*) from airlines where country = "USA"	flight_2
select city, country from airports where airportcode = 'ALN'	flight_2
select city, country from airports where airportcode = 'ALN'	flight_2
select airportname from airports where airportcode = 'AKO'	flight_2
select airportname from airports where airportcode = 'AKO'	flight_2
select airportname from airports where city = 'Aberdeen'	flight_2
select airportname from airports where city = "Aberdeen"	flight_2
select count(*) from flights where sourceairport = 'APG'	flight_2
select count(*) from flights where sourceairport = 'APG'	flight_2
select count(*) from flights where destairport = 'ATO'	flight_2
select count(*) from flights where destairport = 'ATO'	flight_2
select count(*) from flights where sourceairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select count(*) from flights where sourceairport = 'ABR'	flight_2
select count(*) from flights where destairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select count(*) from flights where destairport = 'ABZ'	flight_2
select count(*) from flights where sourceairport = (select airportcode from airports where city = 'Aberdeen') and destairport = (select airportcode from airports where city = 'Ashley')	flight_2
select count(*) from flights where sourceairport = "ABR" and destairport = "ASY"	flight_2
select count(*) from flights where airline = (select uid from airlines where airline = 'JetBlue Airways')	flight_2
select count(*) from flights where airline = 3	flight_2
select count(*) from flights where airline = 1 and destairport = 'ASY'	flight_2
select count(*) from flights where airline = 1 and destairport = 'ASY'	flight_2
select count(*) from flights, airlines where flights.airline = airlines.uid and airline = 'United Airlines' and sourceairport = 'AHD'	flight_2
select count(*) from flights where airline = 1 and sourceairport = 'AHD'	flight_2
select count(*) from flights, airlines, airports where flights.airline = airlines.uid and flights.destairport = airports.airportcode and airlines.airline = 'United Airlines' and airports.city = 'Aberdeen'	flight_2
select count(*) from flights, airlines, airports where flights.airline = airlines.uid and flights.destairport = airports.airportcode and airlines.airline = "United Airlines" and airports.city = "Aberdeen"	flight_2
select city, count(*) as count from airports join flights on airports.airportcode = flights.destairport group by city order by count desc limit 1	flight_2
select city, count(*) as count from airports join flights on airports.airportcode = flights.destairport group by city order by count desc limit 1	flight_2
select city, count(*) as count from airports join flights on airports.airportcode = flights.sourceairport group by city order by count desc limit 1	flight_2
select city from airports where airportcode in (select sourceairport from flights group by sourceairport order by count(*) desc limit 1)	flight_2
select destairport from flights group by destairport order by count(*) desc limit 1	flight_2
select airportcode from airports where airportcode in (select sourceairport from flights group by sourceairport order by count(*) desc limit 1)	flight_2
select airportcode from airports where airportcode not in (select sourceairport from flights) and airportcode not in (select destairport from flights)	flight_2
select airportcode from airports where airportcode not in (select destairport from flights) and airportcode not in (select sourceairport from flights)	flight_2
select airline, count(*) as num_flights from flights group by airline order by num_flights desc limit 1	flight_2
select airline, count(*) as num_flights from flights group by airline order by num_flights desc limit 1	flight_2
select abbreviation, country from airlines where uid = (select airline from flights group by airline order by count(*) limit 1)	flight_2
select abbreviation, country from airlines where uid = (select airline from flights group by airline order by count(*) limit 1)	flight_2
select airline from flights where sourceairport = 'AHD'	flight_2
select airline from flights where sourceairport = 'AHD'	flight_2
select airline from flights where destairport = 'AHD'	flight_2
select airline from flights where destairport = 'AHD'	flight_2
select distinct airline from flights where sourceairport = 'APG' and destairport = 'CVO'	flight_2
select distinct airline from flights where sourceairport = 'APG' and destairport = 'CVO'	flight_2
select distinct airline from flights where sourceairport = 'CVO' and sourceairport != 'APG'	flight_2
select distinct airline from flights where sourceairport = 'CVO' and destairport != 'APG'	flight_2
select airline from flights group by airline having count(*) >= 10	flight_2
select airline from flights group by airline having count(*) >= 10	flight_2
select airline from flights group by airline having count(*) < 200	flight_2
select airline from flights group by airline having count(*) < 200	flight_2
select flightno from flights where airline = (select uid from airlines where airline = "United Airlines")	flight_2
select flightno from flights where airline = 1	flight_2
select flightno from flights where sourceairport = "APG"	flight_2
select flightno from flights where sourceairport = "APG"	flight_2
select flightno from flights where destairport = "APG"	flight_2
select flightno from flights where destairport = 'APG'	flight_2
select flightno from flights where sourceairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select flightno from flights where sourceairport = 'ABZ'	flight_2
select flightno from flights where destairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select flightno from flights where destairport = (select airportcode from airports where city = "Aberdeen")	flight_2
select count(*) from flights where destairport in (select airportcode        from airports        where city in ('Aberdeen', 'Abilene'))	flight_2
select count(*) from flights where destairport in (select airportcode from airports where city in ("Aberdeen", "Abilene"))	flight_2
select airportname from airports where airportcode not in (select sourceairport from flights) and airportcode not in (select destairport from flights)	flight_2
select airportcode from airports where airportcode not in (select sourceairport from flights) and airportcode not in (select destairport from flights)	flight_2
select count(*) from employee	employee_hire_evaluation
select count(*) from employee	employee_hire_evaluation
select name from employee order by age asc	employee_hire_evaluation
select name, age from employee order by age asc	employee_hire_evaluation
select city, count(*) from employee group by city	employee_hire_evaluation
select city, count(*) from employee group by city	employee_hire_evaluation
select city from employee where age < 30 group by city having count(*) > 1	employee_hire_evaluation
select city from employee where age < 30 group by city having count(*) > 1	employee_hire_evaluation
select location, count(*) from shop group by location	employee_hire_evaluation
select location, count(*) from shop group by location	employee_hire_evaluation
select manager_name, district from shop where number_products = (select max(number_products) from shop)	employee_hire_evaluation
select manager_name, district from shop where number_products = (select max(number_products) from shop)	employee_hire_evaluation
select min(number_products), max(number_products) from shop	employee_hire_evaluation
select min(number_products), max(number_products) from shop	employee_hire_evaluation
select name, location, district from shop order by number_products desc	employee_hire_evaluation
select name, location, district from shop order by number_products desc	employee_hire_evaluation
select name from shop where number_products > (select avg(number_products) from shop)	employee_hire_evaluation
select name from shop where number_products > (select avg(number_products) from shop)	employee_hire_evaluation
select name from employee where employee_id in (select employee_id from evaluation group by employee_id order by count(*) desc limit 1)	employee_hire_evaluation
select name from employee where employee_id in (select employee_id from evaluation group by employee_id order by count(*) desc limit 1)	employee_hire_evaluation
select name from employee where employee_id = (select employee_id from evaluation where bonus = (select max(bonus) from evaluation))	employee_hire_evaluation
select name from employee where employee_id = (select employee_id from evaluation where bonus = (select max(bonus) from evaluation))	employee_hire_evaluation
select name from employee where employee_id not in (select employee_id from evaluation)	employee_hire_evaluation
select name from employee where employee_id not in (select employee_id from evaluation)	employee_hire_evaluation
select name from shop where shop_id = (select shop_id from hiring group by shop_id order by count(*) desc limit 1)	employee_hire_evaluation
select name from shop where shop_id = (select shop_id from hiring group by shop_id order by count(*) desc limit 1)	employee_hire_evaluation
select name from shop where shop_id not in (select shop_id from hiring)	employee_hire_evaluation
select name from shop where shop_id not in (select shop_id from hiring)	employee_hire_evaluation
select shop.name, count(*) as number_of_employees from shop, hiring where shop.shop_id = hiring.shop_id group by shop.name	employee_hire_evaluation
select shop.name, count(hiring.employee_id) as number_of_employees from shop join hiring on shop.shop_id = hiring.shop_id group by shop.name	employee_hire_evaluation
select sum(bonus) from evaluation	employee_hire_evaluation
select sum(bonus) from evaluation	employee_hire_evaluation
select * from hiring	employee_hire_evaluation
select * from hiring	employee_hire_evaluation
select distinct district from shop where number_products < 3000 or number_products > 10000	employee_hire_evaluation
select distinct district from shop where number_products < 3000 or number_products > 10000	employee_hire_evaluation
select count(distinct location) from shop	employee_hire_evaluation
select count(distinct location) from shop	employee_hire_evaluation
select count(*) from documents	cre_Doc_Template_Mgt
select count(*) from documents	cre_Doc_Template_Mgt
select document_id, document_name, document_description from documents	cre_Doc_Template_Mgt
select document_id, document_name, document_description from documents	cre_Doc_Template_Mgt
select document_name, template_id from documents where document_description like '%w%'	cre_Doc_Template_Mgt
select document_name, template_id from documents where document_description like '%w%'	cre_Doc_Template_Mgt
select document_id, template_id, document_description from documents where document_name = "Robbin CV"	cre_Doc_Template_Mgt
select document_id, template_id, document_description from documents where document_name = 'Robbin CV'	cre_Doc_Template_Mgt
select count(distinct template_id) from documents	cre_Doc_Template_Mgt
select count(distinct template_id) from templates	cre_Doc_Template_Mgt
select count(*) from documents d join templates t on d.template_id = t.template_id where t.template_type_code = 'PPT'	cre_Doc_Template_Mgt
select count(*) from documents d join templates t on d.template_id = t.template_id where t.template_type_code = 'PPT'	cre_Doc_Template_Mgt
select template_id, count(document_id) as num_documents from templates join documents on templates.template_id = documents.template_id group by template_id	cre_Doc_Template_Mgt
select template_id, count(*) from documents group by template_id	cre_Doc_Template_Mgt
select template_id, template_type_code from templates where template_id in (select template_id from documents group by template_id order by count(*) desc limit 1)	cre_Doc_Template_Mgt
select template_id, template_type_code from templates where template_id in (select template_id from documents group by template_id order by count(*) desc limit 1)	cre_Doc_Template_Mgt
select template_id from templates where template_id in (select template_id from documents group by template_id having count(*) > 1)	cre_Doc_Template_Mgt
select template_id from templates where template_id in (select template_id from documents group by template_id having count(*) > 1)	cre_Doc_Template_Mgt
select template_id from templates where template_id not in (select template_id from documents)	cre_Doc_Template_Mgt
select template_id from templates where template_id not in (select template_id from documents)	cre_Doc_Template_Mgt
select count(*) from templates	cre_Doc_Template_Mgt
select count(*) from templates	cre_Doc_Template_Mgt
select template_id, version_number, template_type_code from templates	cre_Doc_Template_Mgt
select template_id, version_number, template_type_code from templates	cre_Doc_Template_Mgt
select distinct template_type_code from templates	cre_Doc_Template_Mgt
select distinct template_type_code from ref_template_types	cre_Doc_Template_Mgt
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'	cre_Doc_Template_Mgt
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'	cre_Doc_Template_Mgt
select count(*) from templates where template_type_code = 'CV'	cre_Doc_Template_Mgt
select count(*) from templates where template_type_code = 'CV'	cre_Doc_Template_Mgt
select version_number, template_type_code from templates where version_number > 5	cre_Doc_Template_Mgt
select version_number, template_type_code from templates where version_number > 5	cre_Doc_Template_Mgt
select template_type_code, count(*) from templates group by template_type_code	cre_Doc_Template_Mgt
select template_type_code, count(*) from templates group by template_type_code	cre_Doc_Template_Mgt
select template_type_code, count(*) as cnt from templates group by template_type_code order by cnt desc limit 1	cre_Doc_Template_Mgt
select template_type_code from templates group by template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt
select template_type_code from templates group by template_type_code having count(*) < 3	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_code in (select template_type_code from templates group by template_type_code having count(*) < 3)	cre_Doc_Template_Mgt
select min(version_number), template_type_code from templates	cre_Doc_Template_Mgt
select min(version_number), template_type_code from templates	cre_Doc_Template_Mgt
select template_type_code from templates where template_id = (select template_id from documents where document_name = "Data base")	cre_Doc_Template_Mgt
select template_type_code from templates where template_id in (select template_id from documents where document_name = 'Data base')	cre_Doc_Template_Mgt
select document_name from documents where template_id in (select template_id from templates where template_type_code = 'BK')	cre_Doc_Template_Mgt
select document_name from documents where template_id in (select template_id from templates where template_type_code = 'BK')	cre_Doc_Template_Mgt
select template_type_code, count(document_id) as num_documents from templates join documents on templates.template_id = documents.template_id group by template_type_code	cre_Doc_Template_Mgt
select template_type_code, count(*) from templates group by template_type_code	cre_Doc_Template_Mgt
select template_type_code, count(*) as cnt from templates t join documents d on t.template_id = d.template_id group by template_type_code order by cnt desc limit 1	cre_Doc_Template_Mgt
select template_type_code from templates group by template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_code not in (select template_type_code from templates)	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_code not in (select template_type_code from templates)	cre_Doc_Template_Mgt
select template_type_code, template_type_description from ref_template_types	cre_Doc_Template_Mgt
select template_type_code, template_type_description from ref_template_types	cre_Doc_Template_Mgt
select template_type_description from ref_template_types where template_type_code = "AD"	cre_Doc_Template_Mgt
select template_type_description from ref_template_types where template_type_code = 'AD'	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_description = "Book"	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_description = "Book"	cre_Doc_Template_Mgt
select distinct template_type_description from ref_template_types where template_type_code in (select template_type_code from templates where template_id in (select template_id from documents))	cre_Doc_Template_Mgt
select distinct template_details from templates where template_id in (select template_id from documents)	cre_Doc_Template_Mgt
select template_id from templates where template_type_code in (select template_type_code from ref_template_types where template_type_description = "Presentation")	cre_Doc_Template_Mgt
select template_id from templates where template_details = 'Presentation'	cre_Doc_Template_Mgt
select count(*) from paragraphs	cre_Doc_Template_Mgt
select count(*) from paragraphs	cre_Doc_Template_Mgt
select count(*) from paragraphs where document_id in (select document_id from documents where document_name = 'Summer Show')	cre_Doc_Template_Mgt
select count(*) from paragraphs where document_id in (select document_id from documents where document_name = 'Summer Show')	cre_Doc_Template_Mgt
select * from paragraphs where paragraph_text = 'Korea '	cre_Doc_Template_Mgt
select * from paragraphs where paragraph_text like '%Korea%'	cre_Doc_Template_Mgt
select paragraph_id, paragraph_text from paragraphs where document_id in (select document_id from documents where document_name = 'Welcome to NY')	cre_Doc_Template_Mgt
select paragraph_id, paragraph_text from paragraphs where document_id in (select document_id from documents where document_name = 'Welcome to NY')	cre_Doc_Template_Mgt
select paragraph_text from paragraphs where document_id in (select document_id from documents where document_name = "Customer reviews")	cre_Doc_Template_Mgt
select paragraph_text from paragraphs where document_id in (select document_id from documents where document_name = 'Customer reviews')	cre_Doc_Template_Mgt
select document_id, count(paragraph_id) as paragraph_count from paragraphs group by document_id order by document_id	cre_Doc_Template_Mgt
select document_id, count(paragraph_id) as paragraph_count from paragraphs group by document_id order by document_id	cre_Doc_Template_Mgt
select document_id, document_name, count(paragraph_id) as paragraph_count from documents join paragraphs on documents.document_id = paragraphs.document_id group by document_id	cre_Doc_Template_Mgt
select documents.document_id, documents.document_name, count(paragraphs.paragraph_id) as paragraph_count from documents left join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id	cre_Doc_Template_Mgt
select document_id from paragraphs group by document_id having count(paragraph_id) >= 2	cre_Doc_Template_Mgt
select document_id from paragraphs group by document_id having count(paragraph_id) >= 2	cre_Doc_Template_Mgt
select document_id, document_name from documents where document_id = (select document_id from paragraphs group by document_id order by count(*) desc limit 1)	cre_Doc_Template_Mgt
select document_id, document_name from documents where document_id = (select document_id from paragraphs group by document_id order by count(*) desc limit 1)	cre_Doc_Template_Mgt
select document_id from paragraphs group by document_id order by count(*) asc limit 1	cre_Doc_Template_Mgt
select document_id from documents where document_id = (select document_id from paragraphs group by document_id order by count(*) asc limit 1)	cre_Doc_Template_Mgt
select document_id from documents where document_id in (select document_id from paragraphs group by document_id having count(paragraph_id) between 1 and 2)	cre_Doc_Template_Mgt
select document_id from documents where document_id in (select document_id from paragraphs group by document_id having count(paragraph_id) between 1 and 2)	cre_Doc_Template_Mgt
select document_id from paragraphs where paragraph_text in ('Brazil', 'Ireland')	cre_Doc_Template_Mgt
select document_id from paragraphs where paragraph_text in ('Brazil', 'Ireland')	cre_Doc_Template_Mgt
select count(*) from teacher	course_teach
select count(*) from teacher	course_teach
select name from teacher order by age asc	course_teach
select name from teacher order by age asc	course_teach
select age, hometown from teacher	course_teach
select age, hometown from teacher	course_teach
select name from teacher where hometown != "Little Lever Urban District"	course_teach
select name from teacher where hometown != "Little Lever Urban District"	course_teach
select name from teacher where age = 32 or age = 33	course_teach
select name from teacher where age = 32 or age = 33	course_teach
select hometown from teacher where age = (select min(age) from teacher)	course_teach
select hometown from teacher where age = (select min(age) from teacher)	course_teach
select hometown, count(*) from teacher group by hometown	course_teach
select hometown, count(*) from teacher group by hometown	course_teach
select hometown, count(*) as count from teacher group by hometown order by count desc limit 1	course_teach
select hometown, count(*) as count from teacher group by hometown order by count desc limit 1	course_teach
select hometown from teacher group by hometown having count(*)>1	course_teach
select hometown from teacher group by hometown having count(*)>=2	course_teach
select name, course from teacher, course_arrange, course where teacher.teacher_id = course_arrange.teacher_id and course_arrange.course_id = course.course_id	course_teach
select name, course from teacher, course_arrange, course where teacher.teacher_id = course_arrange.teacher_id and course_arrange.course_id = course.course_id	course_teach
select name, course from teacher, course_arrange, course where teacher.teacher_id = course_arrange.teacher_id and course_arrange.course_id = course.course_id order by name asc	course_teach
select name, course from teacher, course_arrange, course where teacher.teacher_id = course_arrange.teacher_id and course_arrange.course_id = course.course_id order by name asc	course_teach
select name from teacher where teacher_id in (select teacher_id from course_arrange where course_id in (select course_id from course where course = "Math"))	course_teach
select name from teacher where teacher_id in (select teacher_id from course_arrange where course_id in (select course_id from course where course = "Math"))	course_teach
select name, count(course_id) from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by name	course_teach
select teacher.name, count(course_arrange.course_id) as course_count from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by teacher.name	course_teach
select name from teacher where teacher_id in (select teacher_id from course_arrange group by teacher_id having count(*)>=2)	course_teach
select name from teacher where teacher_id in (select teacher_id from course_arrange group by teacher_id having count(*)>=2)	course_teach
select name from teacher where teacher_id not in (select teacher_id from course_arrange)	course_teach
select name from teacher where teacher_id not in (select teacher_id from course_arrange)	course_teach
select count(*) from visitor where age < 30	museum_visit
select name from visitor where level_of_membership > 4 order by level_of_membership desc	museum_visit
select avg(age) from visitor where level_of_membership <= 4	museum_visit
select name, level_of_membership from visitor where level_of_membership > 4 order by age desc	museum_visit
select museum_id, name from museum where num_of_staff = (select max(num_of_staff) from museum)	museum_visit
select avg(num_of_staff) from museum where open_year < 2009	museum_visit
select open_year, num_of_staff from museum where name = "Plaza Museum"	museum_visit
select name from museum where num_of_staff > (select min(num_of_staff) from museum where open_year > 2010)	museum_visit
select visitor.id, visitor.name, visitor.age from visitor, visit where visitor.id = visit.visitor_id group by visitor.id having count(visit.visitor_id) > 1	museum_visit
select visitor.id, visitor.name, visitor.level_of_membership from visitor, visit where visitor.id = visit.visitor_id group by visitor.id order by sum(visit.total_spent) desc limit 1	museum_visit
select museum.museum_id, museum.name from museum join visit on museum.museum_id = visit.museum_id group by museum.museum_id order by count(*) desc limit 1	museum_visit
select name from museum where museum_id not in (select museum_id from visit)	museum_visit
select visitor.name, visitor.age from visitor, visit where visitor.id = visit.visitor_id and visit.num_of_ticket = (select max(num_of_ticket) from visit)	museum_visit
select avg(num_of_ticket), max(num_of_ticket) from visit	museum_visit
select sum(total_spent) from visit where visitor_id in (select id from visitor where level_of_membership = 1)	museum_visit
select visitor.name from visitor, visit, museum where visitor.id = visit.visitor_id and visit.museum_id = museum.museum_id and museum.open_year < '2009' and museum.open_year > '2011'	museum_visit
select count(*) from visitor where id not in (select visitor_id from visit where museum_id in (select museum_id from museum where open_year > 2010))	museum_visit
select count(*) from museum where open_year > 2013 or open_year < 2008	museum_visit
select count(*) from players	wta_1
select count(*) from players	wta_1
select count(*) from matches	wta_1
select count(*) from matches	wta_1
select first_name, birth_date from players where country_code = "USA"	wta_1
select first_name, birth_date from players where country_code = "USA"	wta_1
select avg(winner_age) as avg_winner_age, avg(loser_age) as avg_loser_age from matches	wta_1
select avg(winner_age) as avg_winner_age, avg(loser_age) as avg_loser_age from matches	wta_1
select avg(winner_rank) from matches	wta_1
select avg(winner_rank) from matches	wta_1
select max(loser_rank) from matches	wta_1
select min(loser_rank) from matches	wta_1
select count(distinct country_code) from players	wta_1
select count(distinct country_code) from players	wta_1
select count(distinct loser_name) from matches	wta_1
select count(distinct loser_name) from matches	wta_1
select tourney_name from matches group by tourney_name having count(*) > 10	wta_1
select tourney_name from matches group by tourney_name having count(*) > 10	wta_1
select winner_name from matches where year = 2013 intersect select winner_name from matches where year = 2016	wta_1
select winner_name from matches where year = 2013 and winner_id in (select winner_id from matches where year = 2016)	wta_1
select count(*) from matches where year = 2013 or year = 2016	wta_1
select count(*) from matches where year = 2013 or year = 2016	wta_1
select distinct winner_ioc, winner_name from matches where tourney_name = "WTA Championships" and winner_id in (select winner_id from matches where tourney_name = "Australian Open")	wta_1
select distinct winner_name, winner_ioc from matches where tourney_name = "WTA Championships" and winner_id in ( select winner_id from matches where tourney_name = "Australian Open" )	wta_1
select first_name, country_code from players where birth_date = (select min(birth_date) from players)	wta_1
select first_name, country_code from players where birth_date = (select min(birth_date) from players)	wta_1
select first_name, last_name from players order by birth_date	wta_1
select first_name || ' ' || last_name as full_name, birth_date from players order by birth_date	wta_1
select first_name, last_name from players where hand = 'L' order by birth_date	wta_1
select first_name || " " || last_name as full_name, birth_date from players where hand = "L" order by birth_date	wta_1
select first_name, country_code from players where player_id in (select player_id from rankings where tours = (select max(tours) from rankings))	wta_1
select first_name, country_code from players where player_id in (select player_id from rankings where tours = (select max(tours) from rankings))	wta_1
select year, count(*) as num_matches from matches group by year order by num_matches desc limit 1	wta_1
select year, count(*) as matches from matches group by year order by matches desc limit 1	wta_1
select winner_name, winner_rank_points from matches group by winner_name order by winner_rank_points desc limit 1	wta_1
select winner_name, winner_rank_points from matches order by winner_rank_points desc limit 1	wta_1
select winner_name from matches where tourney_name = "Australian Open" and winner_rank_points = (select max(winner_rank_points) from matches where tourney_name = "Australian Open")	wta_1
select winner_name from matches where tourney_name = "Australian Open" and winner_rank_points = (select max(winner_rank_points) from matches where tourney_name = "Australian Open")	wta_1
select loser_name, winner_name from matches where minutes = (select max(minutes) from matches)	wta_1
select winner_name, loser_name from matches where minutes = (select max(minutes) from matches)	wta_1
select first_name, avg(ranking) from players join rankings on players.player_id = rankings.player_id group by players.player_id	wta_1
select first_name, avg(ranking) from players join rankings on players.player_id = rankings.player_id group by first_name	wta_1
select first_name, sum(ranking_points) as total_ranking_points from players join rankings on players.player_id = rankings.player_id group by players.player_id	wta_1
select first_name, sum(ranking_points) from players join rankings on players.player_id = rankings.player_id group by first_name	wta_1
select country_code, count(*) as num_players from players group by country_code	wta_1
select country_code, count(*) from players group by country_code	wta_1
select country_code, count(*) as num_players from players group by country_code order by num_players desc limit 1	wta_1
select country_code, count(*) as num_players from players group by country_code order by num_players desc limit 1	wta_1
select country_code from players group by country_code having count(*) > 50	wta_1
select country_code from players group by country_code having count(*) > 50	wta_1
select ranking_date, sum(tours) as total_tours from rankings group by ranking_date	wta_1
select ranking_date, sum(tours) as total_tours from rankings group by ranking_date	wta_1
select year, count(*) from matches group by year	wta_1
select year, count(*) from matches group by year	wta_1
select winner_name, winner_rank from matches order by winner_age limit 3	wta_1
select winner_name, winner_rank from matches where winner_age = (select min(winner_age) from matches)	wta_1
select count(distinct winner_id) from matches where winner_id in (select player_id from players where hand = 'L') and tourney_name = 'WTA Championships'	wta_1
select count(*) from matches where winner_hand = 'L' and tourney_level = 'W'	wta_1
select winner_name, winner_ioc, winner_age from matches where winner_rank_points = (select max(winner_rank_points) from matches)	wta_1
select first_name, country_code, birth_date from players where player_id = (select winner_id from matches where winner_rank_points = (select max(winner_rank_points) from matches))	wta_1
select hand, count(*) from players group by hand	wta_1
select hand, count(*) from players group by hand	wta_1
select count(*) from ship where disposition_of_ship = 'Captured'	battle_death
select name, tonnage from ship order by name desc	battle_death
select name, date, result from battle	battle_death
select max(killed), min(killed) from death	battle_death
select avg(injured) from death	battle_death
select * from death where caused_by_ship_id = (select id from ship where tonnage = 't')	battle_death
select name, result from battle where bulgarian_commander != 'Boril'	battle_death
select battle.id, battle.name from battle, ship where battle.id = ship.lost_in_battle and ship.ship_type = 'Brig'	battle_death
select battle.id, battle.name from battle, death where battle.id = death.caused_by_ship_id and death.killed > 10	battle_death
select ship.id, ship.name, sum(death.injured) as total_injuries from ship join death on ship.id = death.caused_by_ship_id group by ship.id order by total_injuries desc limit 1	battle_death
select distinct name from battle where bulgarian_commander = 'Kaloyan' and latin_commander = 'Baldwin I'	battle_death
select count(distinct result) from battle	battle_death
select count(*) from battle where id not in (select lost_in_battle from ship where tonnage = 225)	battle_death
select name, date from battle where id in (select lost_in_battle from ship where name in ('Lettice', 'HMS Atalanta'))	battle_death
select name, result, bulgarian_commander from battle where id not in (select lost_in_battle from ship where location = 'English Channel')	battle_death
select note from death where note like '%East%'	battle_death
select line_1, line_2 from addresses	student_transcripts_tracking
select line_1, line_2 from addresses	student_transcripts_tracking
select count(*) from courses	student_transcripts_tracking
select count(*) from courses	student_transcripts_tracking
select course_description from courses where course_name = 'math'	student_transcripts_tracking
select course_description from courses where course_name like '%math%'	student_transcripts_tracking
select zip_postcode from addresses where city = 'Port Chelsea'	student_transcripts_tracking
select zip_postcode from addresses where city = 'Port Chelsea'	student_transcripts_tracking
select department_name, department_id from departments where department_id in (select department_id from degree_programs group by department_id order by count(*) desc limit 1)	student_transcripts_tracking
select department_name, department_id from departments where department_id in (select department_id from degree_programs group by department_id order by count(*) desc limit 1)	student_transcripts_tracking
select count(distinct department_id) from degree_programs	student_transcripts_tracking
select count(distinct department_id) from degree_programs	student_transcripts_tracking
select count(distinct degree_summary_name) from degree_programs	student_transcripts_tracking
select count(*) from degree_programs	student_transcripts_tracking
select count(*) from degree_programs where department_id = (select department_id from departments where department_name = 'engineering')	student_transcripts_tracking
select count(*) from degree_programs where department_id = (select department_id from departments where department_name = 'engineering')	student_transcripts_tracking
select section_name, section_description from sections	student_transcripts_tracking
select section_name, section_description from sections	student_transcripts_tracking
select course_id, course_name from courses where course_id in (select course_id from sections group by course_id having count(*) <= 2)	student_transcripts_tracking
select course_id, course_name from courses where course_id in (select course_id from sections group by course_id having count(*) < 2)	student_transcripts_tracking
select section_name from sections order by section_name desc	student_transcripts_tracking
select section_name from sections order by section_name desc	student_transcripts_tracking
select semester_name, semester_id from semesters where semester_id in (select semester_id from student_enrolment group by semester_id order by count(*) desc limit 1)	student_transcripts_tracking
select semester_id, semester_name from semesters where semester_id in (select semester_id from student_enrolment group by semester_id order by count(*) desc limit 1)	student_transcripts_tracking
select department_description from departments where department_name like '%computer%'	student_transcripts_tracking
select department_description from departments where department_name like '%computer%'	student_transcripts_tracking
select first_name, middle_name, last_name, student_id from students where student_id in (select student_id from student_enrolment group by student_id having count(*) = 2)	student_transcripts_tracking
select students.first_name, students.middle_name, students.last_name, students.student_id from students, student_enrolment, degree_programs where students.student_id = student_enrolment.student_id and student_enrolment.degree_program_id = degree_programs.degree_program_id group by students.student_id having count(degree_programs.degree_program_id) = 2	student_transcripts_tracking
select first_name, middle_name, last_name from students, student_enrolment, degree_programs where students.student_id = student_enrolment.student_id and student_enrolment.degree_program_id = degree_programs.degree_program_id and degree_programs.degree_summary_name = "Bachelor"	student_transcripts_tracking
select first_name, middle_name, last_name from students, student_enrolment, degree_programs where students.student_id = student_enrolment.student_id and student_enrolment.degree_program_id = degree_programs.degree_program_id and degree_programs.degree_summary_name = "Bachelor"	student_transcripts_tracking
select degree_summary_name, count(*) as count from degree_programs dp join student_enrolment se on dp.degree_program_id = se.degree_program_id group by degree_summary_name order by count desc limit 1	student_transcripts_tracking
select degree_summary_name, count(*) as count from degree_programs dp join student_enrolment se on dp.degree_program_id = se.degree_program_id group by degree_summary_name order by count desc limit 1	student_transcripts_tracking
select degree_program_id, degree_summary_name from degree_programs where degree_program_id in ( select degree_program_id from student_enrolment group by degree_program_id order by count(*) desc limit 1 )	student_transcripts_tracking
select degree_program_id, degree_summary_name from degree_programs where degree_program_id in (select degree_program_id from student_enrolment group by degree_program_id order by count(*) desc limit 1)	student_transcripts_tracking
select student_id, first_name, middle_name, last_name, count(student_id) as enrollments, student_id from students join student_enrolment on students.student_id = student_enrolment.student_id group by student_id order by enrollments desc limit 1	student_transcripts_tracking
select first_name, middle_name, last_name, student_id, count(*) as enrollments from students join student_enrolment on students.student_id = student_enrolment.student_id group by student_id order by enrollments desc limit 1	student_transcripts_tracking
select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)	student_transcripts_tracking
select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)	student_transcripts_tracking
select course_name from courses where course_id in (select course_id from student_enrolment_courses)	student_transcripts_tracking
select course_name from courses where course_id in (select course_id from student_enrolment_courses)	student_transcripts_tracking
select course_name from courses where course_id = (select course_id from student_enrolment_courses group by course_id order by count(*) desc limit 1)	student_transcripts_tracking
select course_name from courses where course_id = (select course_id from student_enrolment_courses group by course_id order by count(*) desc limit 1)	student_transcripts_tracking
select last_name from students where current_address_id in (select address_id from addresses where state_province_county = 'North Carolina') and student_id not in (select student_id from student_enrolment)	student_transcripts_tracking
select last_name from students, addresses where students.current_address_id = addresses.address_id and state_province_county = "North Carolina" and student_id not in (select student_id from student_enrolment)	student_transcripts_tracking
select transcript_id, transcript_date from transcripts where transcript_id in (select transcript_id from transcript_contents group by transcript_id having count(*) >= 2)	student_transcripts_tracking
select transcript_id, transcript_date from transcripts where transcript_id in (select transcript_id from transcript_contents group by transcript_id having count(*) >= 2)	student_transcripts_tracking
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'	student_transcripts_tracking
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'	student_transcripts_tracking
select first_name, middle_name, last_name from students where date_first_registered = (select min(date_first_registered) from students)	student_transcripts_tracking
select first_name, middle_name, last_name from students where date_first_registered = (select min(date_first_registered) from students)	student_transcripts_tracking
select first_name, middle_name, last_name from students where date_left = (select min(date_left) from students)	student_transcripts_tracking
select first_name, middle_name, last_name from students where date_left = (select min(date_left) from students)	student_transcripts_tracking
select first_name from students where current_address_id != permanent_address_id	student_transcripts_tracking
select first_name from students where current_address_id != permanent_address_id	student_transcripts_tracking
select current_address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details from students, addresses where current_address_id = address_id group by current_address_id order by count(*) desc limit 1	student_transcripts_tracking
select address_id, line_1, line_2 from addresses where address_id in (select current_address_id from students group by current_address_id order by count(*) desc limit 1)	student_transcripts_tracking
select avg(transcript_date) from transcripts	student_transcripts_tracking
select avg(transcript_date) from transcripts	student_transcripts_tracking
select transcript_date, other_details from transcripts where transcript_id = (select min(transcript_id) from transcripts)	student_transcripts_tracking
select transcript_date, other_details from transcripts where transcript_date = (select min(transcript_date) from transcripts)	student_transcripts_tracking
select count(*) from transcripts	student_transcripts_tracking
select count(*) from transcripts	student_transcripts_tracking
select max(transcript_date) from transcripts	student_transcripts_tracking
select max(transcript_date) from transcripts	student_transcripts_tracking
select student_course_id, count(*) as count from transcript_contents group by student_course_id order by count desc limit 1	student_transcripts_tracking
select student_course_id, count(*) as count from transcript_contents group by student_course_id order by count desc limit 1	student_transcripts_tracking
select transcript_id, transcript_date from transcripts where transcript_id = (select min(transcript_id) from transcripts)	student_transcripts_tracking
select transcript_id, transcript_date from transcripts order by transcript_id limit 1	student_transcripts_tracking
select semester_name from semesters where semester_id in (select semester_id from student_enrolment where degree_program_id in (select degree_program_id from degree_programs where degree_summary_name in ('Master', 'Bachelor')))	student_transcripts_tracking
select semester_id from student_enrolment where degree_program_id in (select degree_program_id from degree_programs where degree_summary_name in ('Master', 'Bachelor'))	student_transcripts_tracking
select count(distinct current_address_id) from students	student_transcripts_tracking
select distinct line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details from addresses where address_id in (select current_address_id from students)	student_transcripts_tracking
select * from students order by last_name desc, first_name desc, middle_name desc	student_transcripts_tracking
select other_student_details from students order by other_student_details desc	student_transcripts_tracking
select * from sections where section_name = 'h'	student_transcripts_tracking
select section_description from sections where section_name = 'h'	student_transcripts_tracking
select first_name from students where permanent_address_id in (select address_id from addresses where country = 'Haiti') or cell_mobile_number = '09700166582'	student_transcripts_tracking
select first_name from students where permanent_address_id in (select address_id from addresses where country = 'Haiti') or cell_mobile_number = '09700166582'	student_transcripts_tracking
select title from cartoon order by title	tvshow
select title from cartoon order by title	tvshow
select * from cartoon where directed_by = "Ben Jones"	tvshow
select title from cartoon where directed_by = "Ben Jones"	tvshow
select count(*) from cartoon where written_by = "Joseph Kuhr"	tvshow
select count(*) from cartoon where written_by = "Joseph Kuhr"	tvshow
select title, directed_by from cartoon order by original_air_date	tvshow
select title, directed_by from cartoon order by original_air_date	tvshow
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Brandon Vietti"	tvshow
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Brandon Vietti"	tvshow
select country, count(*) as number_of_tv_channels from tv_channel group by country order by number_of_tv_channels desc limit 1	tvshow
select country, count(*) as num_channels from tv_channel group by country order by num_channels desc limit 1	tvshow
select count(distinct series_name), count(distinct content) from tv_channel	tvshow
select count(distinct series_name), count(distinct content) from tv_channel	tvshow
select content from tv_channel where series_name = "Sky Radio"	tvshow
select content from tv_channel where series_name = "Sky Radio"	tvshow
select package_option from tv_channel where series_name = "Sky Radio"	tvshow
select package_option from tv_channel where series_name = "Sky Radio"	tvshow
select count(*) from tv_channel where language = 'English'	tvshow
select count(*) from tv_channel where language = 'English'	tvshow
select language, count(language) as number_of_tv_channel from tv_channel group by language order by number_of_tv_channel asc limit 1	tvshow
select language, count(language) as count from tv_channel group by language order by count asc limit 1	tvshow
select language, count(*) from tv_channel group by language	tvshow
select language, count(*) from tv_channel group by language	tvshow
select series_name from tv_channel where id in (select channel from cartoon where title = "The Rise of the Blue Beetle!")	tvshow
select series_name from tv_channel where id in (select channel from cartoon where title = "The Rise of the Blue Beetle!")	tvshow
select title from cartoon where channel in (select id from tv_channel where series_name = "Sky Radio")	tvshow
select title from cartoon where channel in (select id from tv_channel where series_name = "Sky Radio")	tvshow
select episode from tv_series order by rating	tvshow
select episode from tv_series order by rating	tvshow
select episode, rating from tv_series order by rating desc limit 3	tvshow
select episode, rating from tv_series order by rating desc limit 3	tvshow
select min(share), max(share) from tv_series	tvshow
select max(share), min(share) from tv_series	tvshow
select air_date from tv_series where episode = "A Love of a Lifetime"	tvshow
select air_date from tv_series where episode = "A Love of a Lifetime"	tvshow
select weekly_rank from tv_series where episode = "A Love of a Lifetime"	tvshow
select weekly_rank from tv_series where episode = "A Love of a Lifetime"	tvshow
select series_name from tv_channel where id in (select channel from tv_series where episode = "A Love of a Lifetime")	tvshow
select series_name from tv_channel where id = (select channel from tv_series where episode = "A Love of a Lifetime")	tvshow
select episode from tv_series where channel in (select id from tv_channel where series_name = "Sky Radio")	tvshow
select episode from tv_series where channel = (select id from tv_channel where series_name = "Sky Radio")	tvshow
select directed_by, count(*) as number_of_cartoons from cartoon group by directed_by	tvshow
select directed_by, count(*) as count from cartoon group by directed_by	tvshow
select production_code, channel from cartoon order by original_air_date desc limit 1	tvshow
select production_code, channel from cartoon where original_air_date = (select max(original_air_date) from cartoon)	tvshow
select package_option, series_name from tv_channel where hight_definition_tv = "yes"	tvshow
select package_option, series_name from tv_channel where hight_definition_tv = "yes"	tvshow
select distinct country from tv_channel where id in ( select channel from cartoon where written_by = "Todd Casey" )	tvshow
select distinct country from tv_channel where id in ( select channel from cartoon where written_by = "Todd Casey" )	tvshow
select distinct country from tv_channel where id not in ( select channel from cartoon where written_by = 'Todd Casey' )	tvshow
select distinct country from tv_channel where id not in ( select channel from cartoon where written_by = "Todd Casey" )	tvshow
select tv_channel.series_name, tv_channel.country from tv_channel, cartoon where tv_channel.id = cartoon.channel and cartoon.directed_by = "Ben Jones" and cartoon.directed_by = "Michael Chang"	tvshow
select tv_channel.series_name, tv_channel.country from tv_channel, cartoon where tv_channel.id = cartoon.channel and (cartoon.directed_by = "Ben Jones" or cartoon.directed_by = "Michael Chang")	tvshow
select pixel_aspect_ratio_par, country from tv_channel where language != "English"	tvshow
select pixel_aspect_ratio_par, country from tv_channel where language != "English"	tvshow
select id from tv_channel where country in (select country from tv_channel group by country having count(*) > 2)	tvshow
select id from tv_channel group by id having count(*) > 2	tvshow
select id from tv_channel where id not in (select channel from cartoon where directed_by = "Ben Jones")	tvshow
select id from tv_channel where id not in (select channel from cartoon where directed_by = "Ben Jones")	tvshow
select package_option from tv_channel where id not in (select channel      from cartoon      where directed_by = 'Ben Jones')	tvshow
select package_option from tv_channel where id not in (select channel from cartoon where directed_by = "Ben Jones")	tvshow
select count(*) from poker_player	poker_player
select count(*) from poker_player	poker_player
select earnings from poker_player order by earnings desc	poker_player
select earnings from poker_player order by earnings desc	poker_player
select final_table_made, best_finish from poker_player	poker_player
select final_table_made, best_finish from poker_player	poker_player
select avg(earnings) from poker_player	poker_player
select avg(earnings) from poker_player	poker_player
select money_rank from poker_player where earnings = (select max(earnings) from poker_player)	poker_player
select money_rank from poker_player where earnings = (select max(earnings) from poker_player)	poker_player
select max(final_table_made) from poker_player where earnings < 200000	poker_player
select max(final_table_made) from poker_player where earnings < 200000	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id where earnings > 300000	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id where earnings > 300000	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id order by final_table_made asc	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id order by final_table_made asc	poker_player
select birth_date from people where people_id = (select people_id from poker_player where earnings = (select min(earnings) from poker_player))	poker_player
select birth_date from people where people_id = (select people_id from poker_player where earnings = (select min(earnings) from poker_player))	poker_player
select money_rank from poker_player where people_id in (select people_id from people where height = (select max(height) from people))	poker_player
select money_rank from poker_player where height = (select max(height) from people)	poker_player
select avg(earnings) from poker_player, people where poker_player.people_id = people.people_id and height > 200	poker_player
select avg(earnings) from poker_player, people where poker_player.people_id = people.people_id and height > 200	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id order by earnings desc	poker_player
select name from people join poker_player on people.people_id = poker_player.people_id order by earnings desc	poker_player
select nationality, count(*) from people group by nationality	poker_player
select nationality, count(*) from people group by nationality	poker_player
select nationality, count(*) as count from people group by nationality order by count desc limit 1	poker_player
select nationality, count(*) as count from people group by nationality order by count desc limit 1	poker_player
select nationality from people group by nationality having count(*) > 1	poker_player
select nationality from people group by nationality having count(*) >= 2	poker_player
select name, birth_date from people order by name asc	poker_player
select name, birth_date from people order by name	poker_player
select name from people where nationality != "Russia"	poker_player
select name from people where nationality != "Russia"	poker_player
select name from people where people_id not in (select people_id from poker_player)	poker_player
select name from people where people_id not in (select people_id from poker_player)	poker_player
select count(distinct nationality) from people	poker_player
select count(distinct nationality) from people	poker_player
select count(distinct state) from area_code_state	voter_1
select contestant_number, contestant_name from contestants order by contestant_name desc	voter_1
select vote_id, phone_number, state from votes	voter_1
select max(area_code), min(area_code) from area_code_state	voter_1
select created from votes where state = 'CA' order by created desc limit 1	voter_1
select contestant_name from contestants where contestant_name != 'Jessie Alloway'	voter_1
select distinct state, created from votes	voter_1
select contestant_number, contestant_name from contestants where contestant_number in (select contestant_number from votes group by contestant_number having count(*) >= 2)	voter_1
select contestant_number, contestant_name from contestants where contestant_number not in (select contestant_number from votes)	voter_1
select count(*) from votes where state = 'NY' or state = 'CA'	voter_1
select count(*) from contestants where contestant_number not in (select contestant_number from votes)	voter_1
select state, count(*) as count from votes join area_code_state on votes.state = area_code_state.state group by state order by count desc limit 1	voter_1
select created, state, phone_number from votes where contestant_number = (select contestant_number from contestants where contestant_name = 'Tabatha Gehling')	voter_1
select area_code from area_code_state where state in ( select state from votes where contestant_number in ( select contestant_number from contestants where contestant_name in ('Tabatha Gehling', 'Kelly Clauss') ) )	voter_1
select contestant_name from contestants where contestant_name like '%Al%'	voter_1
select name from country where indepyear > 1950	world_1
select name from country where indepyear > 1950	world_1
select count(*) from country where governmentform = 'Republic'	world_1
select count(*) from country where governmentform = 'Republic'	world_1
select sum(surfacearea) from country where region = "Caribbean"	world_1
select sum(surfacearea) from country where region = "Caribbean"	world_1
select continent from country where name = "Anguilla"	world_1
select continent from country where name = "Anguilla"	world_1
select district from city where name = "Kabul"	world_1
select district from city where name = "Kabul"	world_1
select language from countrylanguage where countrycode = 'ABW' order by percentage desc limit 1	world_1
select language from countrylanguage where countrycode = "ABW"	world_1
select population, lifeexpectancy from country where name = "Brazil"	world_1
select population, lifeexpectancy from country where name = "Brazil"	world_1
select region, population from country where name = "Angola"	world_1
select region, population from country where name = "Angola"	world_1
select avg(lifeexpectancy) from country where region = "Central Africa"	world_1
select avg(lifeexpectancy) from country where region = "Central Africa"	world_1
select name from country where continent = "Asia" and lifeexpectancy = (select min(lifeexpectancy) from country where continent = "Asia")	world_1
select name from country where continent = "Asia" and lifeexpectancy = (select min(lifeexpectancy) from country where continent = "Asia")	world_1
select sum(population), max(gnp) from country where continent = "Asia"	world_1
select sum(population) as population, max(gnp) as gnp from country where continent = "Asia"	world_1
select avg(lifeexpectancy) from country where continent = "Africa" and governmentform = "Republic"	world_1
select avg(lifeexpectancy) from country where continent = "Africa" and governmentform = "Republic"	world_1
select sum(surfacearea) from country where continent = 'Asia' or continent = 'Europe'	world_1
select sum(surfacearea) from country where continent = 'Asia' or continent = 'Europe'	world_1
select sum(population) from city where district = "Gelderland"	world_1
select sum(population) from city where district = "Gelderland"	world_1
select avg(gnp), sum(population) from country where governmentform like '%territory%'	world_1
select avg(gnp), sum(population) from country where continent = "North America" and region = "Caribbean"	world_1
select count(distinct language) from countrylanguage	world_1
select count(distinct language) from countrylanguage	world_1
select count(distinct governmentform) from country where continent = "Africa"	world_1
select count(distinct governmentform) from country where continent = "Africa"	world_1
select count(language) from countrylanguage where countrycode = 'ABW'	world_1
select count(*) from countrylanguage where countrycode = 'ABW'	world_1
select count(*) from countrylanguage where countrycode = 'AFG' and isofficial = 'T'	world_1
select count(*) from countrylanguage where countrycode = 'AFG' and isofficial = 'T'	world_1
select name from country where code in (select countrycode from countrylanguage group by countrycode order by count(*) desc limit 1)	world_1
select name from country where code in (select countrycode from countrylanguage group by countrycode having count(*) = (select max(count) from (select count(*) as count from countrylanguage group by countrycode)))	world_1
select continent, count(distinct language) as num_languages from country c join countrylanguage cl on c.code = cl.countrycode group by continent order by num_languages desc limit 1	world_1
select continent, count(language) as num_languages from countrylanguage join country on country.code = countrylanguage.countrycode group by continent order by num_languages desc limit 1	world_1
select count(*) from countrylanguage where language = "English" and countrycode in (select countrycode from countrylanguage where language = "Dutch")	world_1
select count(*) from countrylanguage where language = 'English' or language = 'Dutch'	world_1
select name from country where code in (select countrycode from countrylanguage where language in ('English', 'French') group by countrycode having count(*) = 2)	world_1
select name from country where code in (select countrycode from countrylanguage where language in ('English', 'French') group by countrycode having count(*) = 2)	world_1
select name from country where code in (select countrycode from countrylanguage where language in ('English', 'French') group by countrycode having count(*) = 2)	world_1
select name from country where code in (select countrycode from countrylanguage where language in ('English', 'French') and isofficial = 'T')	world_1
select count(distinct continent) from countrylanguage where language = 'Chinese'	world_1
select count(distinct continent) from countrylanguage where language = 'Chinese'	world_1
select distinct region from country where code in (select countrycode from countrylanguage where language in ('English', 'Dutch'))	world_1
select distinct region from country where code in (select countrycode from countrylanguage where language in ('Dutch', 'English'))	world_1
select name from country where code in (select countrycode from countrylanguage where language in ('English', 'Dutch') and isofficial = 'T')	world_1
select name from country where code in (select countrycode from countrylanguage where language in ('English', 'Dutch') and isofficial = 'T')	world_1
select language from countrylanguage where countrycode in (select code from country where continent = 'Asia') order by percentage desc limit 1	world_1
select language from countrylanguage where countrycode in (select code from country where continent = "Asia") group by language order by count(*) desc limit 1	world_1
select language from countrylanguage where countrycode in (select code from country where governmentform = 'Republic') group by language having count(*) = 1	world_1
select language from countrylanguage where countrycode in (select code from country where governmentform = 'Republic') group by language having count(*) = 1	world_1
select name from city where id in (select capital from country where code in (select countrycode from countrylanguage where language = 'English'))  	world_1
select name from city where population = (select max(population) from city where id in (select capital from country where code in (select countrycode from countrylanguage where language = "English")))  	world_1
select name, population, lifeexpectancy from country where continent = "Asia" order by surfacearea desc limit 1	world_1
select name, population, lifeexpectancy from country where continent = "Asia" and surfacearea = (select max(surfacearea) from country where continent = "Asia")	world_1
select avg(lifeexpectancy) from country where code not in (select countrycode from countrylanguage where isofficial = 'T' and language = 'English')	world_1
select avg(lifeexpectancy) from country where code not in (select countrycode from countrylanguage where isofficial = 'T' and language = 'English')	world_1
select sum(population) from country where code not in (select countrycode from countrylanguage where language = 'English')	world_1
select sum(population) from country where code not in (select countrycode from countrylanguage where language = 'English')	world_1
select language from countrylanguage where countrycode in (select code from country where headofstate = "Beatrix")	world_1
select language from countrylanguage where countrycode in (select code from country where headofstate = "Beatrix")	world_1
select count(distinct language) from countrylanguage where countrycode in (select code from country where indepyear < 1930) and isofficial = 'T'	world_1
select count(distinct language) from countrylanguage where countrycode in (select code from country where indepyear < 1930)	world_1
select name from country where surfacearea > (select max(surfacearea) from country where continent = 'Europe')	world_1
select name from country where continent != 'Europe' and surfacearea > (select max(surfacearea) from country where continent = 'Europe')	world_1
select name from country where continent = 'Africa' and population < (select min(population) from country where continent = 'Asia')	world_1
select name from country where continent = 'Africa' and population < (select min(population) from country where continent = 'Asia')	world_1
select name from country where continent = 'Asia' and population > (select max(population) from country where continent = 'Africa')	world_1
select name from country where continent = "Asia" and population > (select max(population) from country where continent = "Africa")	world_1
select countrycode from countrylanguage where language != "English"	world_1
select countrycode from countrylanguage where language != "English"	world_1
select countrycode from countrylanguage where language != "English"	world_1
select countrycode from countrylanguage where language != "English"	world_1
select code from country where governmentform != "Republic" and code not in (select countrycode from countrylanguage where language = "English")	world_1
select code from country where governmentform != "Republic" and code not in (select countrycode from countrylanguage where language = "English")	world_1
select name from city where countrycode in (select countrycode from country where continent = 'Europe' and code not in (select countrycode from countrylanguage where language = 'English' and isofficial = 'T'))	world_1
select name from city where id in (select capital from country where continent = "Europe" and code not in (select countrycode from countrylanguage where language = "English" and isofficial = "T"))	world_1
select distinct city.name from city, country, countrylanguage where city.countrycode = country.code and country.code = countrylanguage.countrycode and country.continent = "Asia" and countrylanguage.language = "Chinese" and countrylanguage.isofficial = "T"	world_1
select name from city where district in (select region from country where continent = 'Asia') and id in (select capital from country where code in (select countrycode from countrylanguage where language = 'Chinese' and isofficial = 'T'))	world_1
select name, indepyear, surfacearea from country where population = (select min(population) from country)	world_1
select name, indepyear, surfacearea from country where population = (select min(population) from country)	world_1
select name, headofstate, population from country where surfacearea = (select max(surfacearea) from country)	world_1
select name, population, headofstate from country where surfacearea = (select max(surfacearea) from country)	world_1
select name, count(*) as num_languages from country join countrylanguage on country.code = countrylanguage.countrycode group by country.code having count(*) >= 3	world_1
select name, count(*) as num_languages from country join countrylanguage on country.code = countrylanguage.countrycode group by country.code having num_languages > 2	world_1
select district, count(*) from city where population > (select avg(population) from city) group by district	world_1
select district, count(*) from city where population > (select avg(population) from city) group by district	world_1
select governmentform, sum(population) from country where lifeexpectancy > 72 group by governmentform	world_1
select governmentform, sum(population) from country where lifeexpectancy > 72 group by governmentform	world_1
select continent, avg(lifeexpectancy), sum(population) from country where lifeexpectancy < 72 group by continent	world_1
select continent, sum(population), avg(lifeexpectancy) from country where lifeexpectancy < 72 group by continent	world_1
select name, surfacearea from country order by surfacearea desc limit 5	world_1
select name, surfacearea from country order by surfacearea desc limit 5	world_1
select name from country order by population desc limit 3	world_1
select name from country order by population desc limit 3	world_1
select name from country where population in (select population from country order by population limit 3)	world_1
select name from country order by population asc limit 3	world_1
select count(*) from country where continent = 'Asia'	world_1
select count(*) from country where continent = 'Asia'	world_1
select name from country where continent = 'Europe' and population = 80000	world_1
select name from country where continent = "Europe" and population = 80000	world_1
select sum(population), avg(surfacearea) from country where continent = "North America" and surfacearea > 3000	world_1
select sum(population), avg(surfacearea) from country where continent = "North America" and surfacearea > 3000	world_1
select name from city where population between 160000 and 900000	world_1
select name from city where population between 160000 and 900000	world_1
select language from countrylanguage group by language order by count(*) desc limit 1	world_1
select language from countrylanguage group by language order by count(*) desc limit 1	world_1
select countrycode, language, percentage from countrylanguage where percentage = (select max(percentage) from countrylanguage group by countrycode)	world_1
select countrycode, language from countrylanguage where percentage = (select max(percentage) from countrylanguage)	world_1
select count(*) from countrylanguage where language = 'Spanish' and percentage = (select max(percentage) from countrylanguage where language = 'Spanish')	world_1
select count(*) from countrylanguage where language = 'Spanish'	world_1
select countrycode from countrylanguage where language = 'Spanish' order by percentage desc limit 1	world_1
select countrycode from countrylanguage where language = 'Spanish' and percentage > 50	world_1
select count(*) from conductor	orchestra
select count(*) from conductor	orchestra
select name, age from conductor order by age asc	orchestra
select name from conductor order by age	orchestra
select name from conductor where nationality != "USA"	orchestra
select name from conductor where nationality != "USA"	orchestra
select record_company, year_of_founded from orchestra order by year_of_founded desc	orchestra
select record_company, year_of_founded from orchestra order by year_of_founded desc	orchestra
select avg(attendance) from show	orchestra
select avg(attendance) from show	orchestra
select max(share), min(share) from performance where type != "Live final"	orchestra
select max(share), min(share) from performance where type != "Live final"	orchestra
select count(distinct nationality) from conductor	orchestra
select count(distinct nationality) from conductor	orchestra
select name, year_of_work from conductor order by year_of_work desc	orchestra
select name, year_of_work from conductor order by year_of_work desc	orchestra
select name from conductor where year_of_work = (select max(year_of_work) from conductor)	orchestra
select name from conductor where year_of_work = (select max(year_of_work) from conductor)	orchestra
select conductor.name, orchestra.orchestra from conductor, orchestra where conductor.conductor_id = orchestra.conductor_id	orchestra
select conductor.name, orchestra.orchestra from conductor, orchestra where conductor.conductor_id = orchestra.conductor_id	orchestra
select name from conductor where conductor_id in (select conductor_id from orchestra group by conductor_id having count(*) > 1)	orchestra
select name from conductor where conductor_id in (select conductor_id from orchestra group by conductor_id having count(*) > 1)	orchestra
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.name order by count(orchestra.orchestra_id) desc limit 1	orchestra
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.name order by count(orchestra.orchestra_id) desc limit 1	orchestra
select name from conductor where conductor_id in (select conductor_id from orchestra where year_of_founded > 2008)	orchestra
select name from conductor, orchestra where conductor.conductor_id = orchestra.conductor_id and orchestra.year_of_founded > 2008	orchestra
select record_company, count(*) from orchestra group by record_company	orchestra
select record_company, count(*) from orchestra group by record_company	orchestra
select major_record_format, count(major_record_format) as count from orchestra group by major_record_format order by count asc	orchestra
select major_record_format, count(major_record_format) as frequency from orchestra group by major_record_format order by frequency desc	orchestra
select record_company, count(*) as count from orchestra group by record_company order by count desc limit 1	orchestra
select record_company, count(*) as count from orchestra group by record_company order by count desc limit 1	orchestra
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)	orchestra
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)	orchestra
select record_company from orchestra where year_of_founded < 2003 or year_of_founded > 2003	orchestra
select record_company from orchestra where year_of_founded < 2003 or year_of_founded > 2003	orchestra
select count(*) from orchestra where major_record_format = "CD" or major_record_format = "DVD"	orchestra
select count(*) from orchestra where major_record_format = "CD" or major_record_format = "DVD"	orchestra
select year_of_founded from orchestra where orchestra_id in ( select orchestra_id from performance group by orchestra_id having count(*) > 1 )	orchestra
select year_of_founded from orchestra where orchestra_id in (select orchestra_id from performance group by orchestra_id having count(*) > 1)	orchestra
select count(*) from highschooler	network_1
select count(*) from highschooler	network_1
select name, grade from highschooler	network_1
select name, grade from highschooler	network_1
select grade from highschooler	network_1
select name, grade from highschooler	network_1
select grade from highschooler where name = "Kyle"	network_1
select grade from highschooler where name = "Kyle"	network_1
select name from highschooler where grade = 10	network_1
select name from highschooler where grade = 10	network_1
select id from highschooler where name = "Kyle"	network_1
select id from highschooler where name = "Kyle"	network_1
select count(*) from highschooler where grade in (9,10)	network_1
select count(*) from highschooler where grade in (9,10)	network_1
select grade, count(*) from highschooler group by grade	network_1
select grade, count(*) from highschooler group by grade	network_1
select grade, count(*) as num from highschooler group by grade order by num desc limit 1	network_1
select grade from highschooler group by grade order by count(*) desc limit 1	network_1
select grade from highschooler group by grade having count(*) >= 4	network_1
select grade from highschooler group by grade having count(*) >= 4	network_1
select student_id, count(friend_id) as num_friends from friend group by student_id	network_1
select h.name, count(f.friend_id) as friends from highschooler h left join friend f on h.id = f.student_id group by h.name	network_1
select name, count(friend_id) as num_friends from highschooler join friend on highschooler.id = friend.student_id group by name	network_1
select h.name, count(f.friend_id) as num_friends from highschooler h left join friend f on h.id = f.student_id group by h.id	network_1
select name from highschooler where id in ( select student_id from friend group by student_id order by count(*) desc limit 1 )	network_1
select name from highschooler where id in ( select student_id from friend group by student_id order by count(*) desc limit 1 )	network_1
select name from highschooler where id in ( select student_id from friend group by student_id having count(*) >= 3 )	network_1
select name from highschooler where id in ( select student_id from friend group by student_id having count(*) >= 3 )	network_1
select h.name from highschooler h, friend f where h.id = f.friend_id and f.student_id = (select id from highschooler where name = "Kyle")	network_1
select h.name from highschooler h, friend f where h.id = f.friend_id and f.student_id = (select id from highschooler where name = "Kyle")	network_1
select count(*) from friend where student_id = (select id from highschooler where name = "Kyle")	network_1
select count(*) from friend where student_id = (select id from highschooler where name = "Kyle")	network_1
select id from highschooler where id not in (select student_id from friend)	network_1
select id from highschooler where id not in (select student_id from friend)	network_1
select name from highschooler where id not in (select student_id from friend)	network_1
select name from highschooler where id not in (select friend_id from friend)	network_1
select h.id from highschooler h where exists (select * from friend f where f.student_id = h.id) and exists (select * from likes l where l.student_id = h.id)	network_1
select h.id from highschooler h where exists (select * from friend f where f.student_id = h.id) and exists (select * from likes l where l.student_id = h.id)	network_1
select name from highschooler where id in (select student_id from friend) and id in (select student_id from likes)	network_1
select h.name from highschooler h, friend f, likes l where h.id = f.student_id and h.id = l.student_id	network_1
select student_id, count(liked_id) as likes from likes group by student_id	network_1
select student_id, count(liked_id) as likes from likes group by student_id	network_1
select h.name, count(l.liked_id) as likes from highschooler h, likes l where h.id = l.student_id group by h.name	network_1
select h.name, count(l.liked_id) as likes from highschooler h join likes l on h.id = l.student_id group by h.name	network_1
select name from highschooler where id in (select liked_id from likes group by liked_id order by count(*) desc limit 1)	network_1
select name from highschooler where id in ( select liked_id from likes group by liked_id order by count(*) desc limit 1 )	network_1
select name from highschooler where id in (select student_id from likes group by student_id having count(*) >= 2)	network_1
select name from highschooler where id in ( select student_id from likes group by student_id having count(*) >= 2 )	network_1
select name from highschooler where grade > 5 and id in (select student_id from friend group by student_id having count(*) >= 2)	network_1
select name from highschooler where grade > 5 and id in (select student_id from friend group by student_id having count(*) >= 2)	network_1
select count(*) from likes where student_id = (select id from highschooler where name = "Kyle")	network_1
select count(*) from likes where student_id in (select id from highschooler where name = "Kyle")	network_1
select avg(grade) from highschooler where id in (select student_id from friend)	network_1
select avg(grade) from highschooler where id in (select student_id from friend)	network_1
select min(grade) from highschooler where id not in (select student_id from friend)	network_1
select min(grade) from highschooler where id not in (select student_id from friend)	network_1
select distinct state from owners intersect select distinct state from professionals	dog_kennels
select distinct state from owners intersect select distinct state from professionals	dog_kennels
select avg(age) from dogs where dog_id in (select dog_id from treatments)	dog_kennels
select avg(age) from dogs	dog_kennels
select professional_id, last_name, cell_number from professionals where state = 'Indiana' or treatment_id > 2	dog_kennels
select professional_id, last_name, cell_number from professionals where state = 'Indiana' or professional_id in (select professional_id from treatments group by professional_id having count(*) > 2)	dog_kennels
select name from dogs where dog_id not in (select dog_id from treatments where cost_of_treatment > 1000)	dog_kennels
select name from dogs where dog_id not in (select dog_id from treatments where cost_of_treatment > 1000)	dog_kennels
select first_name from owners union select first_name from professionals except select name from dogs	dog_kennels
select first_name from owners where first_name not in (select name from dogs) union select first_name from professionals where first_name not in (select name from dogs)	dog_kennels
select professional_id, role_code, email_address from professionals where professional_id not in (select professional_id from treatments)	dog_kennels
select professional_id, role_code, email_address from professionals where professional_id not in (select professional_id from treatments)	dog_kennels
select owner_id, first_name, last_name from owners where owner_id in (select owner_id from dogs group by owner_id order by count(*) desc limit 1)	dog_kennels
select owner_id, first_name, last_name from owners where owner_id in (select owner_id from dogs group by owner_id order by count(*) desc limit 1)	dog_kennels
select professional_id, role_code, first_name from professionals where professional_id in (select professional_id from treatments group by professional_id having count(*) >= 2)	dog_kennels
select professional_id, role_code, first_name from professionals where professional_id in (select professional_id from treatments group by professional_id having count(*) >= 2)	dog_kennels
select breed_name from breeds where breed_code = (select breed_code from dogs group by breed_code order by count(*) desc limit 1)	dog_kennels
select breed_name from breeds where breed_code = (select breed_code from dogs group by breed_code order by count(*) desc limit 1)	dog_kennels
select owner_id, last_name from owners where owner_id in (select owner_id from dogs where dog_id in (select dog_id from treatments))	dog_kennels
select owner_id, last_name from owners where owner_id in (select owner_id from dogs where dog_id in (select dog_id from treatments group by dog_id order by sum(cost_of_treatment) desc limit 1))	dog_kennels
select treatment_type_description from treatment_types where treatment_type_code = (select treatment_type_code from treatments where cost_of_treatment = (select min(cost_of_treatment) from treatments))	dog_kennels
select treatment_type_description from treatment_types where treatment_type_code = (select treatment_type_code from treatments where cost_of_treatment = (select min(cost_of_treatment) from treatments))	dog_kennels
select owner_id, zip_code from owners where owner_id in (select owner_id from dogs where dog_id in (select dog_id from treatments where treatment_id in (select treatment_id from treatments group by treatment_id order by sum(cost_of_treatment) desc limit 1)))	dog_kennels
select owner_id, zip_code from owners where owner_id in (select owner_id from dogs where dog_id in (select dog_id from treatments where treatment_id in (select treatment_id from treatments group by treatment_id order by sum(cost_of_treatment) desc limit 1)))	dog_kennels
select professional_id, cell_number from professionals where professional_id in (select professional_id from treatments group by professional_id having count(distinct treatment_type_code) >= 2)	dog_kennels
select professional_id, cell_number from professionals where professional_id in (select professional_id from treatments group by professional_id having count(distinct treatment_type_code) >= 2)	dog_kennels
select first_name, last_name from professionals where professional_id in (select professional_id from treatments where cost_of_treatment < (select avg(cost_of_treatment) from treatments))	dog_kennels
select first_name, last_name from professionals where professional_id in (select professional_id from treatments where cost_of_treatment < (select avg(cost_of_treatment) from treatments))	dog_kennels
select date_of_treatment, first_name from treatments, professionals where treatments.professional_id = professionals.professional_id	dog_kennels
select date_of_treatment, first_name from treatments, professionals where treatments.professional_id = professionals.professional_id	dog_kennels
select cost_of_treatment, treatment_type_description from treatments, treatment_types where treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select cost_of_treatment, treatment_type_description from treatments, treatment_types where treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select first_name, last_name, size_description from owners, dogs, sizes where owners.owner_id = dogs.owner_id and dogs.size_code = sizes.size_code	dog_kennels
select first_name, last_name, size_description from owners, dogs, sizes where owners.owner_id = dogs.owner_id and dogs.size_code = sizes.size_code	dog_kennels
select first_name, name from owners, dogs where owners.owner_id = dogs.owner_id	dog_kennels
select first_name, name from owners, dogs where owners.owner_id = dogs.owner_id	dog_kennels
select name, date_of_treatment from dogs, treatments where dogs.dog_id = treatments.dog_id and breed_code = (select breed_code from breeds group by breed_code having count(breed_code) = (select min(cnt) from (select count(breed_code) as cnt from breeds group by breed_code)))	dog_kennels
select name, date_of_treatment from dogs, treatments where dogs.dog_id = treatments.dog_id	dog_kennels
select first_name, name from owners, dogs where owners.owner_id = dogs.owner_id and state = 'Virginia'	dog_kennels
select first_name, name from owners, dogs where owners.owner_id = dogs.owner_id and state = 'Virginia'	dog_kennels
select dogs.date_arrived, dogs.date_departed from dogs inner join treatments on dogs.dog_id = treatments.dog_id	dog_kennels
select dogs.date_arrived, dogs.date_departed from dogs inner join treatments on dogs.dog_id = treatments.dog_id	dog_kennels
select last_name from owners where owner_id = (select owner_id from dogs where date_of_birth = (select min(date_of_birth) from dogs))	dog_kennels
select last_name from owners where owner_id = (select owner_id from dogs where date_of_birth = (select min(date_of_birth) from dogs))	dog_kennels
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'	dog_kennels
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'	dog_kennels
select date_arrived, date_departed from dogs	dog_kennels
select date_arrived, date_departed from dogs	dog_kennels
select count(*) from treatments	dog_kennels
select count(*) from treatments	dog_kennels
select count(distinct professional_id) from treatments	dog_kennels
select count(distinct professional_id) from treatments	dog_kennels
select role_code, street, city, state from professionals where city like '%West%'	dog_kennels
select role_code, street, city, state from professionals where city like '%West%'	dog_kennels
select first_name, last_name, email_address from owners where state like '%North%'	dog_kennels
select first_name, last_name, email_address from owners where state like '%North%'	dog_kennels
select count(*) from dogs where age < (select avg(age) from dogs)	dog_kennels
select count(*) from dogs where age < (select avg(age) from dogs)	dog_kennels
select cost_of_treatment from treatments order by date_of_treatment desc limit 1	dog_kennels
select cost_of_treatment from treatments order by date_of_treatment desc limit 1	dog_kennels
select count(*) from dogs where dog_id not in (select dog_id from treatments)	dog_kennels
select count(*) from dogs where dog_id not in (select dog_id from treatments)	dog_kennels
select count(*) from owners where owner_id not in (select owner_id from dogs)	dog_kennels
select count(*) from owners where owner_id not in (select owner_id from dogs)	dog_kennels
select count(*) from professionals where professional_id not in (select professional_id from treatments)	dog_kennels
select count(*) from professionals where professional_id not in (select professional_id from treatments)	dog_kennels
select name, age, weight from dogs where abandoned_yn = 1	dog_kennels
select name, age, weight from dogs where abandoned_yn = 1	dog_kennels
select avg(age) from dogs	dog_kennels
select avg(age) from dogs	dog_kennels
select max(age) from dogs	dog_kennels
select max(age) from dogs	dog_kennels
select charge_type, charge_amount from charges	dog_kennels
select charge_type, charge_amount from charges	dog_kennels
select charge_amount from charges order by charge_amount desc limit 1	dog_kennels
select charge_amount from charges order by charge_amount desc limit 1	dog_kennels
select email_address, cell_number, home_phone from professionals	dog_kennels
select email_address, home_phone, cell_number from professionals	dog_kennels
select b.breed_name, s.size_description from breeds b, sizes s where b.breed_code = s.size_code	dog_kennels
select distinct breed_code, size_code from dogs	dog_kennels
select first_name, treatment_type_description from professionals, treatments, treatment_types where professionals.professional_id = treatments.professional_id and treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select first_name, treatment_type_description from professionals join treatments on professionals.professional_id = treatments.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select count(*) from singer	singer
select count(*) from singer	singer
select name from singer order by net_worth_millions asc	singer
select name from singer order by net_worth_millions asc	singer
select birth_year, citizenship from singer	singer
select birth_year, citizenship from singer	singer
select name from singer where citizenship != "France"	singer
select name from singer where citizenship != 'France'	singer
select name from singer where birth_year = 1948 or birth_year = 1949	singer
select name from singer where birth_year = 1948 or birth_year = 1949	singer
select name from singer where net_worth_millions = (select max(net_worth_millions) from singer)	singer
select name from singer where net_worth_millions = (select max(net_worth_millions) from singer)	singer
select citizenship, count(*) from singer group by citizenship	singer
select citizenship, count(*) from singer group by citizenship	singer
select citizenship, count(*) as count from singer group by citizenship order by count desc limit 1	singer
select citizenship, count(*) as count from singer group by citizenship order by count desc limit 1	singer
select citizenship, max(net_worth_millions) from singer group by citizenship	singer
select citizenship, max(net_worth_millions) from singer group by citizenship	singer
select title, name from song, singer where song.singer_id = singer.singer_id	singer
select title, name from song join singer on song.singer_id = singer.singer_id	singer
select distinct name from singer where singer_id in (select singer_id from song where sales > 300000)	singer
select name from singer where singer_id in (select singer_id from song where sales > 300000)	singer
select name from singer where singer_id in (select singer_id from song group by singer_id having count(*) > 1)	singer
select name from singer where singer_id in (select singer_id from song group by singer_id having count(*) > 1)	singer
select name, sum(sales) from singer join song on singer.singer_id = song.singer_id group by name	singer
select name, sum(sales) from singer join song on singer.singer_id = song.singer_id group by name	singer
select name from singer where singer_id not in (select singer_id from song)	singer
select name from singer where singer_id not in (select singer_id from song)	singer
select citizenship from singer where birth_year < 1945 or birth_year > 1955	singer
select citizenship from singer where birth_year < 1945 or birth_year > 1955	singer
select count(*) from other_available_features	real_estate_properties
select feature_type_name from ref_feature_types where feature_type_code = (select feature_type_code from other_available_features where feature_name = 'AirCon')	real_estate_properties
select property_type_description from ref_property_types	real_estate_properties
select property_name from properties where property_type_code in ('House', 'Apartment') and room_count > 1	real_estate_properties
