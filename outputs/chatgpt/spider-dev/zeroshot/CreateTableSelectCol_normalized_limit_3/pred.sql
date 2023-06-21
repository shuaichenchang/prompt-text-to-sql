select count(*) from singer	concert_singer
select count(*) from singer	concert_singer
select name, country, age from singer order by age desc	concert_singer
select name, country, age from singer order by age desc	concert_singer
select avg(age), min(age), max(age) from singer where country = "France"	concert_singer
select avg(age), min(age), max(age) from singer where country = 'France'	concert_singer
select s.name, s.song_release_year from singer s where s.age = (select min(age) from singer)	concert_singer
select s.song_name, s.song_release_year from singer s where s.age = (select min(age) from singer) 	concert_singer
select distinct country from singer where age > 20	concert_singer
select distinct country from singer where age > 20	concert_singer
select country, count(*) as num_singers from singer group by country	concert_singer
select country, count(*) as num_singers from singer group by country	concert_singer
select song_name from singer where age > (select avg(age) from singer)	concert_singer
select s.song_name from singer s where s.age > (select avg(age) from singer) 	concert_singer
select location, name from stadium where capacity between 5000 and 10000	concert_singer
select location, name from stadium where capacity between 5000 and 10000	concert_singer
select max(capacity), avg(capacity) from stadium	concert_singer
select avg(capacity), max(capacity) from stadium	concert_singer
select name, capacity from stadium where average = (select max(average) from stadium)	concert_singer
select name, capacity from stadium where average = (select max(average) from stadium)	concert_singer
select count(*) from concert where year in ('2014', '2015')	concert_singer
select count(*) from concert where year in ('2014', '2015')	concert_singer
select stadium.name, count(concert.concert_id) as num_concerts from stadium left join concert on stadium.stadium_id = concert.stadium_id group by stadium.name	concert_singer
select stadium.name, count(concert.concert_id) from stadium left join concert on stadium.stadium_id = concert.stadium_id group by stadium.name	concert_singer
select s.name, s.capacity from stadium s inner join concert c on s.stadium_id = c.stadium_id where c.year >= 2014 group by s.stadium_id order by count(c.concert_id) desc limit 1	concert_singer
select name, capacity  from stadium  where stadium_id = (  select stadium_id   from concert   where year > 2013   group by stadium_id   order by count(*) desc   limit 1 )	concert_singer
select year, count(*) as num_concerts from concert group by year order by num_concerts desc limit 1	concert_singer
select year, count(*) as num_concerts from concert group by year order by num_concerts desc limit 1	concert_singer
select stadium.name from stadium left join concert on stadium.stadium_id = concert.stadium_id where concert.concert_id is null	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert)	concert_singer
select distinct s1.country, s2.country from singer s1, singer s2 where s1.age > 40 and s2.age < 30	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert where year = '2014')	concert_singer
select name from stadium where stadium_id not in (select stadium_id from concert where year = '2014')	concert_singer
select concert.concert_name, concert.theme, count(singer_in_concert.singer_id) as num_singers from concert left join singer_in_concert on concert.concert_id = singer_in_concert.concert_id group by concert.concert_id	concert_singer
select concert.concert_name, concert.theme, count(singer_in_concert.singer_id) as number_of_singers from concert inner join singer_in_concert on concert.concert_id = singer_in_concert.concert_id group by concert.concert_name	concert_singer
select singer.name, count(concert.concert_id) from singer inner join singer_in_concert on singer.singer_id = singer_in_concert.singer_id inner join concert on concert.concert_id = singer_in_concert.concert_id group by singer.name	concert_singer
select singer.name, count(concert.concert_id) from singer left join singer_in_concert on singer.singer_id = singer_in_concert.singer_id left join concert on singer_in_concert.concert_id = concert.concert_id group by singer.name	concert_singer
select singer.name from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id join concert on concert.concert_id = singer_in_concert.concert_id where concert.year = '2014'	concert_singer
select singer.name from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id join concert on concert.concert_id = singer_in_concert.concert_id where concert.year = '2014'	concert_singer
select singer.name, singer.country from singer where song_name like '%Hey%'	concert_singer
select singer.name, singer.country from singer where song_name like '%Hey%'	concert_singer
select stadium.name, stadium.location from stadium inner join concert on stadium.stadium_id = concert.stadium_id where concert.year = '2014' and stadium.stadium_id in (  select stadium_id  from concert  where year = '2015' )	concert_singer
select stadium.name, stadium.location from stadium inner join concert on stadium.stadium_id = concert.stadium_id where concert.year = '2014' and stadium.stadium_id in (  select stadium_id from concert where year = '2015' )	concert_singer
select count(*) from concert where stadium_id = (select stadium_id from stadium order by capacity desc limit 1)	concert_singer
select count(*) from concert where stadium_id = (select stadium_id from stadium order by capacity desc limit 1)	concert_singer
select count(*) from pets where weight > 10	pets_1
select count(*) from pets where weight > 10	pets_1
select min(pet_age), weight from pets where pettype = "dog"	pets_1
select min(weight) from pets where pettype = "dog" and pet_age = (select min(pet_age) from pets where pettype = "dog")	pets_1
select pettype, max(weight) as max_weight from pets group by pettype	pets_1
select pettype, max(weight) from pets group by pettype	pets_1
select count(*)  from has_pet  inner join student on has_pet.stuid = student.stuid  inner join pets on has_pet.petid = pets.petid  where student.age > 20	pets_1
select count(distinct has_pet.petid) from has_pet  inner join student on has_pet.stuid = student.stuid  where student.age > 20	pets_1
select count(*) from has_pet hp join pets p on hp.petid = p.petid join student s on hp.stuid = s.stuid where p.pettype = 'dog' and s.sex = 'F'	pets_1
select count(*) from has_pet hp join pets p on hp.petid = p.petid join student s on hp.stuid = s.stuid where p.pettype = 'dog' and s.sex = 'F'	pets_1
select count(distinct pettype) from pets	pets_1
select count(distinct pettype) from pets	pets_1
select student.fname from student inner join has_pet on student.stuid = has_pet.stuid inner join pets on has_pet.petid = pets.petid where pets.pettype in ('cat', 'dog')	pets_1
select student.fname from student inner join has_pet on student.stuid = has_pet.stuid inner join pets on has_pet.petid = pets.petid where pets.pettype in ('cat', 'dog')	pets_1
select fname from student where stuid in ( select stuid from has_pet where petid in ( select petid from pets where pettype = 'cat' ) intersect select stuid from has_pet where petid in ( select petid from pets where pettype = 'dog' ) )	pets_1
select fname from student where stuid in (  select stuid from has_pet  where petid in (   select petid from pets   where pettype = 'cat'  )  intersect  select stuid from has_pet  where petid in (   select petid from pets   where pettype = 'dog'  ) )	pets_1
select student.major, student.age from student where student.stuid not in (   select stuid   from has_pet   join pets on has_pet.petid = pets.petid   where pets.pettype = 'cat' )	pets_1
select student.major, student.age from student where student.stuid not in (   select has_pet.stuid   from has_pet   join pets on has_pet.petid = pets.petid   where pets.pettype = 'cat' )	pets_1
select student.stuid from student left join has_pet on student.stuid = has_pet.stuid left join pets on has_pet.petid = pets.petid where pets.pettype != 'cat' or pets.pettype is null	pets_1
select student.stuid from student where student.stuid not in (   select has_pet.stuid   from has_pet   join pets on has_pet.petid = pets.petid   where pets.pettype = 'cat' )	pets_1
select student.fname, student.age from student inner join has_pet on student.stuid = has_pet.stuid inner join pets on has_pet.petid = pets.petid where pets.pettype = 'dog' and student.stuid not in (  select student.stuid  from student  inner join has_pet on student.stuid = has_pet.stuid  inner join pets on has_pet.petid = pets.petid  where pets.pettype = 'cat' )	pets_1
select fname from student where stuid in (   select stuid from has_pet   join pets on has_pet.petid = pets.petid   where pettype = 'dog'   and stuid not in (  select stuid from has_pet  join pets on has_pet.petid = pets.petid  where pettype = 'cat'   ) )	pets_1
select pettype, weight from pets where pet_age = (select min(pet_age) from pets)	pets_1
select pettype, weight from pets where pet_age = (select min(pet_age) from pets)	pets_1
select petid, weight from pets where pet_age > 1	pets_1
select petid, weight from pets where pet_age > 1	pets_1
select pets.pettype, avg(pets.pet_age), max(pets.pet_age) from pets join has_pet on pets.petid = has_pet.petid group by pets.pettype	pets_1
select pettype, avg(pet_age), max(pet_age) from pets group by pettype	pets_1
select pettype, avg(weight) from pets group by pettype	pets_1
select pettype, avg(weight) from pets group by pettype	pets_1
select student.fname, student.age from student inner join has_pet on student.stuid = has_pet.stuid	pets_1
select student.fname, student.age from student inner join has_pet on student.stuid = has_pet.stuid	pets_1
select pet.petid from student join has_pet on student.stuid = has_pet.stuid join pets pet on has_pet.petid = pet.petid where student.lname = 'Smith'	pets_1
select pet.petid from student join has_pet on student.stuid = has_pet.stuid join pets pet on has_pet.petid = pet.petid where student.lname = 'Smith'	pets_1
select student.stuid, count(has_pet.petid) as num_pets from student inner join has_pet on student.stuid = has_pet.stuid group by student.stuid	pets_1
select student.stuid, count(has_pet.petid) as num_pets from student inner join has_pet on student.stuid = has_pet.stuid group by student.stuid	pets_1
select student.fname, student.sex from student inner join has_pet on student.stuid = has_pet.stuid group by student.stuid having count(has_pet.petid) > 1	pets_1
select student.fname, student.sex from student inner join has_pet on student.stuid = has_pet.stuid group by student.stuid having count(has_pet.petid) > 1	pets_1
select s.lname from student s join has_pet hp on s.stuid = hp.stuid join pets p on hp.petid = p.petid where p.pettype = 'cat' and p.pet_age = 3	pets_1
select s.lname from student s join has_pet hp on s.stuid = hp.stuid join pets p on hp.petid = p.petid where p.pettype = 'cat' and p.pet_age = 3	pets_1
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1
select count(*) from continents	car_1
select count(*) from continents	car_1
select continents.contid, continents.continent, count(countries.countryid) as num_countries from continents left join countries on continents.contid = countries.continent group by continents.contid	car_1
select continents.contid, continents.continent, count(countries.countryid) from continents left join countries on continents.contid = countries.continent group by continents.contid	car_1
select count(*) from countries	car_1
select count(*) from countries	car_1
select car_makers.fullname, car_makers.id, count(model_list.model) as num_models from car_makers inner join model_list on car_makers.id = model_list.maker group by car_makers.id	car_1
select car_makers.id, car_makers.fullname, count(model_list.model) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id	car_1
select model from car_names inner join cars_data on car_names.makeid = cars_data.id where horsepower = (select min(horsepower) from cars_data)	car_1
select model from car_names where makeid = (   select id from cars_data   where horsepower = (  select min(horsepower) from cars_data   ) )	car_1
select model from model_list where id in ( select maker from car_names where makeid in ( select id from cars_data where weight < ( select avg(weight) from cars_data) ) )	car_1
select model_list.model from cars_data inner join car_names on cars_data.id = car_names.makeid inner join model_list on car_names.model = model_list.model where cars_data.weight < (select avg(weight) from cars_data)	car_1
select car_makers.fullname from car_makers inner join car_names on car_makers.id = car_names.makeid inner join cars_data on car_names.makeid = cars_data.id where cars_data.year = 1970	car_1
select car_makers.fullname from car_makers join countries on car_makers.country = countries.countryid join model_list on car_makers.id = model_list.maker join car_names on model_list.modelid = car_names.model join cars_data on car_names.makeid = cars_data.id where cars_data.year = 1970	car_1
select car_names.make, cars_data.year from car_names inner join cars_data on car_names.makeid = cars_data.id where cars_data.year = (select min(year) from cars_data)	car_1
select car_makers.maker, cars_data.year from car_makers join model_list on car_makers.id = model_list.maker join car_names on model_list.modelid = car_names.makeid join cars_data on car_names.makeid = cars_data.id order by cars_data.year limit 1	car_1
select model_list.model from model_list inner join car_makers on model_list.maker = car_makers.id where car_makers.country in (  select countryid from countries where continent in (   select contid from continents where continent = 'america'  ) ) and model_list.model like '%198%' -- This query will return all car models that have "198" in their name and are produced in countries located in America.  	car_1
select model_list.model from model_list join car_makers on model_list.maker = car_makers.id join car_names on model_list.model = car_names.model join cars_data on car_names.makeid = cars_data.id where cars_data.year > 1980	car_1
select continents.continent, count(car_makers.id) as maker_count from continents inner join countries on continents.contid = countries.continent inner join car_makers on countries.countryid = car_makers.country group by continents.continent	car_1
select continents.continent, count(car_makers.id) from continents join countries on continents.contid = countries.continent join car_makers on countries.countryid = car_makers.country group by continents.continent	car_1
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryname order by count(car_makers.id) desc limit 1	car_1
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryname order by count(distinct car_makers.id) desc limit 1	car_1
select car_makers.fullname, count(model_list.model) as model_count from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.fullname	car_1
select car_makers.id, car_makers.fullname, count(model_list.model) as num_models from car_makers inner join model_list on car_makers.id = model_list.maker group by car_makers.id	car_1
select accelerate from cars_data  inner join car_names on cars_data.id = car_names.makeid  inner join model_list on car_names.model = model_list.model  inner join car_makers on model_list.maker = car_makers.id  where car_makers.maker = 'amc' and model_list.model = 'hornet sportabout (sw)'	car_1
select accelerate from cars_data  inner join car_names on cars_data.id = car_names.makeid  inner join model_list on car_names.model = model_list.model  inner join car_makers on model_list.maker = car_makers.id  where car_makers.maker = 'amc' and model_list.model = 'hornet sportabout (sw)'	car_1
select count(*) from car_makers where country = (select countryid from countries where countryname = 'france')	car_1
select count(distinct maker) from car_makers where country = (select countryid from countries where countryname = "france")	car_1
select count(distinct model_list.model) from model_list  inner join car_makers on model_list.maker = car_makers.id  inner join countries on car_makers.country = countries.countryid  where countries.countryname = 'usa'	car_1
select count(distinct model) from model_list where maker in (select id from car_makers where country = (select countryid from countries where countryname = 'usa'))	car_1
select avg(mpg) from cars_data  where cylinders = 4	car_1
select avg(cars_data.mpg) from cars_data  inner join car_names on cars_data.id = car_names.makeid  inner join model_list on car_names.model = model_list.model  where cars_data.cylinders = 4	car_1
select min(weight) from cars_data  join car_names on cars_data.id = car_names.makeid  join model_list on car_names.model = model_list.model  join car_makers on model_list.maker = car_makers.id  join countries on car_makers.country = countries.countryid  where cylinders = 8 and year = 1974	car_1
select min(weight) from cars_data  inner join car_names on cars_data.id = car_names.makeid  inner join model_list on car_names.model = model_list.model  inner join car_makers on model_list.maker = car_makers.id  inner join countries on car_makers.country = countries.countryid  where cylinders = 8 and year = 1974	car_1
select car_makers.maker, model_list.model from car_makers join model_list on car_makers.id = model_list.maker	car_1
select car_makers.maker, model_list.model from car_makers join model_list on car_makers.id = model_list.maker	car_1
select countries.countryid, countries.countryname from countries inner join car_makers on countries.countryid = car_makers.country group by countries.countryid order by countries.countryid	car_1
select countries.countryid, countries.countryname from countries inner join car_makers on countries.countryid = car_makers.country group by countries.countryid	car_1
select count(*) from cars_data where cast(horsepower as integer) > 150	car_1
select count(*) from cars_data where cast(horsepower as integer) > 150	car_1
select year, avg(weight) from cars_data group by year	car_1
select year, avg(weight), avg(year) from cars_data group by year	car_1
select countries.countryname from countries inner join car_makers on countries.countryid = car_makers.country inner join continents on countries.continent = continents.contid where continents.continent = "europe" group by countries.countryname having count(distinct car_makers.maker) >= 3	car_1
select countries.countryname from countries inner join car_makers on countries.countryid = car_makers.country where countries.continent = 2 group by countries.countryname having count(distinct car_makers.maker) >= 3	car_1
select max(cars_data.horsepower), car_names.make from cars_data join car_names on cars_data.id = car_names.makeid join model_list on car_names.model = model_list.model join car_makers on model_list.maker = car_makers.id where cars_data.cylinders = 3 group by car_names.make	car_1
select max(cars_data.horsepower), car_makers.fullname from cars_data join car_names on cars_data.id = car_names.makeid join model_list on car_names.model = model_list.model join car_makers on model_list.maker = car_makers.id where cars_data.cylinders = 3	car_1
select model_list.model, cars_data.mpg from model_list inner join car_names on model_list.id = car_names.model inner join cars_data on car_names.makeid = cars_data.id where cars_data.mpg = (select max(mpg) from cars_data)	car_1
select model_list.model, cars_data.mpg from model_list join car_names on model_list.modelid = car_names.model join cars_data on car_names.makeid = cars_data.id order by cars_data.mpg desc limit 1	car_1
select avg(cast(horsepower as integer)) from cars_data inner join car_names on cars_data.id = car_names.makeid inner join model_list on car_names.model = model_list.model inner join car_makers on model_list.maker = car_makers.id inner join countries on car_makers.country = countries.countryid where year < 1980	car_1
select avg(cars_data.horsepower) from cars_data inner join car_names on cars_data.id = car_names.makeid inner join model_list on car_names.model = model_list.model inner join car_makers on model_list.maker = car_makers.id inner join countries on car_makers.country = countries.countryid where cars_data.year < 1980	car_1
select avg(c.edispl) from cars_data c join car_names cn on c.id = cn.makeid join model_list ml on cn.model = ml.model join car_makers cm on ml.maker = cm.id where cm.maker = 'volvo'	car_1
select avg(c.edispl) from cars_data c join car_names cn on c.id = cn.makeid join model_list ml on cn.model = ml.model join car_makers cm on ml.maker = cm.id where cm.maker = 'volvo'	car_1
select cylinders, max(accelerate) from cars_data group by cylinders	car_1
select max(accelerate) from cars_data group by cylinders	car_1
select model_list.model, count(car_names.make) as num_cars from model_list inner join car_makers on model_list.maker = car_makers.id inner join car_names on model_list.model = car_names.model group by model_list.model order by num_cars desc limit 1	car_1
select model_list.model, count(distinct car_names.make) as num_versions from model_list inner join car_makers on model_list.maker = car_makers.id inner join car_names on model_list.model = car_names.model group by model_list.model order by num_versions desc limit 1	car_1
select count(*) from cars_data where cylinders > 4	car_1
select count(*) from cars_data where cylinders > 4	car_1
select count(*) from cars_data cd join car_names cn on cd.id = cn.makeid join model_list ml on cn.model = ml.model join car_makers cm on ml.maker = cm.id where cd.year = 1980	car_1
select count(*) from cars_data where year = 1980	car_1
select count(*) from model_list where maker = (select id from car_makers where fullname = "American Motor Company")	car_1
select count(*) from model_list where maker = (select id from car_makers where maker = 'amc')	car_1
select car_makers.fullname, car_makers.id from car_makers inner join model_list on car_makers.id = model_list.maker group by car_makers.id having count(model_list.model) > 3	car_1
select car_makers.id, car_makers.maker from car_makers inner join model_list on car_makers.id = model_list.maker group by car_makers.id having count(model_list.model) > 3	car_1
select model_list.model from model_list inner join car_makers on model_list.maker = car_makers.id inner join car_names on model_list.modelid = car_names.model inner join cars_data on car_names.makeid = cars_data.id where car_makers.fullname = "General Motors" or cars_data.weight > 3500	car_1
select model from model_list inner join car_makers on model_list.maker = car_makers.id inner join car_names on model_list.model = car_names.model inner join cars_data on car_names.makeid = cars_data.id where car_makers.fullname like '%General Motors%' or cars_data.weight > 3500	car_1
select year from cars_data where weight >= 3000 and weight <= 4000	car_1
select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000	car_1
select cars_data.horsepower from cars_data where accelerate = (select max(accelerate) from cars_data)	car_1
select cars_data.horsepower from cars_data where accelerate = (select max(accelerate) from cars_data)	car_1
select min(cylinders) from cars_data where id = (select makeid from car_names where model = 'volvo')	car_1
select min(cylinders) from cars_data  where id = (select makeid from car_names where model = 'volvo')  and accelerate = (select min(accelerate) from cars_data where id = (select makeid from car_names where model = 'volvo'))	car_1
select count(*) from cars_data where accelerate > (select max(accelerate) from cars_data where horsepower = (select max(horsepower) from cars_data))	car_1
select count(*) from cars_data where accelerate > (select max(accelerate) from cars_data where horsepower = (select max(horsepower) from cars_data))	car_1
select count(distinct country) from countries where countryid in (  select country  from car_makers  group by country  having count(distinct maker) > 2 )	car_1
select count(distinct country) from countries where countryid in (  select country  from car_makers  group by country  having count(distinct maker) > 2 )	car_1
select count(*) from cars_data where cylinders > 6	car_1
select count(*) from cars_data where cylinders > 6	car_1
select model_list.model, max(cars_data.horsepower)  from model_list  join car_makers on model_list.maker = car_makers.id  join car_names on model_list.modelid = car_names.makeid  join cars_data on car_names.makeid = cars_data.id  where cars_data.cylinders = 4  group by model_list.model  order by max(cars_data.horsepower) desc  limit 1	car_1
select model_list.model, max(cars_data.horsepower) from model_list join car_makers on model_list.maker = car_makers.id join car_names on model_list.modelid = car_names.makeid join cars_data on car_names.makeid = cars_data.id where cars_data.cylinders = 4 group by model_list.model order by max(cars_data.horsepower) desc limit 1	car_1
select car_names.makeid, car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.horsepower > (select min(horsepower) from cars_data) and cars_data.cylinders <= 3	car_1
select car_names.makeid, car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders < 4 and cars_data.horsepower > (select min(horsepower) from cars_data where cylinders >= 4)	car_1
select max(mpg) from cars_data  inner join car_names on cars_data.id = car_names.makeid  inner join model_list on car_names.model = model_list.model  inner join car_makers on model_list.maker = car_makers.id  inner join countries on car_makers.country = countries.countryid  where cylinders = 8 and year < 1980	car_1
select max(mpg) from cars_data  inner join car_names on cars_data.id = car_names.makeid  inner join model_list on car_names.model = model_list.modelid  inner join car_makers on model_list.maker = car_makers.id  inner join countries on car_makers.country = countries.countryid  where (cars_data.cylinders = 8 or cars_data.year < 1980)	car_1
select model_list.model from model_list inner join car_makers on model_list.maker = car_makers.id inner join car_names on model_list.modelid = car_names.model inner join cars_data on car_names.makeid = cars_data.id where cars_data.weight < 3500 and car_makers.fullname != 'Ford Motor Company'	car_1
select model_list.model from model_list inner join car_makers on model_list.maker = car_makers.id inner join car_names on model_list.modelid = car_names.model inner join cars_data on car_names.makeid = cars_data.id where cars_data.weight < 3500 and car_makers.fullname != "Ford Motor Company"	car_1
select countries.countryname from countries left join car_makers on countries.countryid = car_makers.country where car_makers.id is null	car_1
select countries.countryname from countries left join car_makers on countries.countryid = car_makers.country where car_makers.id is null	car_1
select car_makers.id, car_makers.maker from car_makers inner join model_list on car_makers.id = model_list.maker group by car_makers.id, car_makers.maker having count(distinct model_list.model) >= 2 and count(distinct car_makers.id) > 3	car_1
select car_makers.id, car_makers.maker from car_makers inner join model_list on car_makers.id = model_list.maker inner join car_names on model_list.modelid = car_names.model group by car_makers.id having count(distinct model_list.modelid) >= 2 and count(distinct car_names.makeid) > 3	car_1
select countries.countryid, countries.countryname from countries inner join car_makers on countries.countryid = car_makers.country inner join model_list on car_makers.id = model_list.maker where countries.countryid in (   select country   from car_makers   group by country   having count(distinct maker) > 3 ) or model_list.model = 'fiat'	car_1
select countries.countryid, countries.countryname from countries inner join car_makers on countries.countryid = car_makers.country inner join model_list on car_makers.id = model_list.maker where car_makers.maker = 'fiat' or  countries.countryid in (select country from car_makers group by country having count(distinct maker) > 3) order by countries.countryname	car_1
select country from airlines where airline = "JetBlue Airways"	flight_2
select airlines.country from airlines where airlines.airline = "Jetblue Airways"	flight_2
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
select city, country from airports where airportcode = "ALN"	flight_2
select city, country from airports where airportcode = "ALN"	flight_2
select airportname from airports where airportcode = 'AKO'	flight_2
select airportname from airports where airportcode = 'AKO'	flight_2
select airportname from airports where city = 'Aberdeen'	flight_2
select airportname from airports where city = "Aberdeen"	flight_2
select count(*) from flights where sourceairport = 'APG'	flight_2
select count(*) from flights where sourceairport = 'APG'	flight_2
select count(*) from flights where destairport = 'ATO'	flight_2
select count(*) from flights where destairport = 'ATO'	flight_2
select count(*) from flights where sourceairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select count(*) from flights where sourceairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select count(*) from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"	flight_2
select count(*) from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"	flight_2
select count(*) from flights where sourceairport = (select airportcode from airports where city = 'Aberdeen') and destairport = (select airportcode from airports where city = 'Ashley')	flight_2
select count(*) from flights where sourceairport = 'AAF' and destairport = 'ASY'	flight_2
select count(*) from flights where airline = (select uid from airlines where airline = 'JetBlue Airways')	flight_2
select count(*) from flights where airline = (select uid from airlines where airline = "Jetblue Airways")	flight_2
select count(*) from flights  join airlines on flights.airline = airlines.uid  join airports on flights.destairport = airports.airportcode  where airlines.airline = 'United Airlines' and airports.airportcode = 'ASY'	flight_2
select count(*)  from flights  where airline = 1 and destairport = 'ASY'	flight_2
select count(*) from flights  where airline = (select uid from airlines where airline = 'United Airlines')  and sourceairport = 'AHD'	flight_2
select count(*)  from flights  where airline = 1  and sourceairport = 'AHD'	flight_2
select count(*) from flights  join airlines on flights.airline = airlines.uid  join airports on flights.destairport = airports.airportcode  where airlines.airline = 'United Airlines' and airports.city = 'Aberdeen'	flight_2
select count(*) from flights where airline = 1 and destairport in (select airportcode from airports where city = "Aberdeen")	flight_2
select destairport, count(*) as num_arrivals from flights join airports on flights.destairport = airports.airportcode group by destairport order by num_arrivals desc limit 1	flight_2
select destairport, count(*) as freq_dest from flights join airports on flights.destairport = airports.airportcode group by destairport order by freq_dest desc limit 1	flight_2
select sourceairport, count(*) as num_flights from flights join airports on flights.sourceairport = airports.airportcode group by sourceairport order by num_flights desc limit 1	flight_2
select sourceairport, count(*) as frequency from flights join airports on flights.sourceairport = airports.airportcode group by sourceairport order by frequency desc limit 1	flight_2
select destairport, count(*) as num_flights from flights group by destairport order by num_flights desc limit 1	flight_2
select destairport, count(*) as num_flights from flights group by destairport order by num_flights desc limit 1	flight_2
select airportcode from airports where airportcode not in (   select sourceairport   from flights   union   select destairport   from flights ) order by airportcode limit 1	flight_2
select sourceairport, count(*) as num_flights from flights group by sourceairport order by num_flights limit 1	flight_2
select airline, count(*) as num_flights from flights group by airline order by num_flights desc limit 1	flight_2
select airline, count(*) as num_flights from flights group by airline order by num_flights desc limit 1	flight_2
select abbreviation, country from airlines where uid = (   select airline   from flights   group by airline   order by count(*) asc   limit 1 )	flight_2
select abbreviation, country from airlines where uid = (   select airline   from flights   group by airline   order by count(*) asc   limit 1 )	flight_2
select distinct a.airline from flights f join airports a on f.sourceairport = a.airportcode where a.airportcode = 'AHD'	flight_2
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = "AHD"	flight_2
select airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.destairport = 'AHD'	flight_2
select airline.airline from flights join airports on flights.destairport = airports.airportcode join airlines on flights.airline = airlines.uid where airports.airportcode = "AHD"	flight_2
select distinct a.airline from flights a inner join flights b on a.airline = b.airline where a.sourceairport = 'APG' and b.sourceairport = 'CVO'	flight_2
select distinct a.airline from flights f join airports a on f.sourceairport = a.airportcode where f.sourceairport in ('APG', 'CVO') and f.airline in (   select airline   from flights   join airports on flights.destairport = airports.airportcode   where airports.city in ('APG', 'CVO')   group by airline   having count(distinct airports.city) = 2 )	flight_2
select airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = 'CVO' and airlines.airline not in (  select airlines.airline  from airlines  join flights on airlines.uid = flights.airline  where flights.sourceairport = 'APG' )	flight_2
select distinct airline from flights where sourceairport = 'CVO' and airline not in (   select airline   from flights   where sourceairport = 'APG' )	flight_2
select airline, count(*) as num_flights from flights group by airline having num_flights >= 10	flight_2
select airline, count(*) as num_flights from flights group by airline having num_flights >= 10	flight_2
select airline, count(*) as num_flights from flights group by airline having num_flights < 200	flight_2
select airline, count(*) as num_flights from flights group by airline having num_flights < 200	flight_2
select flights.flightno  from flights  join airlines on flights.airline = airlines.uid  where airlines.airline = "United Airlines"	flight_2
select flightno from flights where airline = (select uid from airlines where airline = "United Airlines")	flight_2
select flights.flightno from flights where flights.sourceairport = "APG"	flight_2
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.airportcode = "APG"	flight_2
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.airportcode = "APG"	flight_2
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.airportcode = "APG"	flight_2
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"	flight_2
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"	flight_2
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"	flight_2
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"	flight_2
select count(*) from flights where destairport in (select airportcode from airports where city = 'Aberdeen' or city = 'Abilene')	flight_2
select count(*) from flights where destairport in ('AAF', 'ABI')	flight_2
select airportname from airports where airportcode not in (select sourceairport from flights) and airportcode not in (select destairport from flights)	flight_2
select airportname from airports where airportcode not in (select sourceairport from flights) and airportcode not in (select destairport from flights)	flight_2
select count(*) from employee	employee_hire_evaluation
select count(*) from employee	employee_hire_evaluation
select name from employee order by age asc	employee_hire_evaluation
select name from employee order by age asc	employee_hire_evaluation
select city, count(*) as num_employees from employee group by city	employee_hire_evaluation
select city, count(*) as num_employees from employee group by city	employee_hire_evaluation
select city from employee where age < 30 group by city having count(*) > 1	employee_hire_evaluation
select city from employee where age < 30 group by city having count(*) > 1	employee_hire_evaluation
select location, count(*) as num_shops from shop group by location	employee_hire_evaluation
select location, count(*) as num_shops from shop group by location	employee_hire_evaluation
select manager_name, district from shop where number_products = (select max(number_products) from shop)	employee_hire_evaluation
select manager_name, district from shop where number_products = (select max(number_products) from shop)	employee_hire_evaluation
select min(number_products), max(number_products) from shop	employee_hire_evaluation
select min(number_products), max(number_products) from shop	employee_hire_evaluation
select name, location, district from shop order by number_products desc	employee_hire_evaluation
select name, location, district from shop order by number_products desc	employee_hire_evaluation
select name from shop where number_products > (select avg(number_products) from shop)	employee_hire_evaluation
select name from shop where number_products > (select avg(number_products) from shop)	employee_hire_evaluation
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by employee.employee_id order by count(*) desc limit 1	employee_hire_evaluation
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by employee.employee_id order by count(*) desc limit 1	employee_hire_evaluation
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id where evaluation.bonus = (select max(bonus) from evaluation)	employee_hire_evaluation
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id where evaluation.bonus = (select max(bonus) from evaluation)	employee_hire_evaluation
select employee.name from employee left join evaluation on employee.employee_id = evaluation.employee_id where evaluation.employee_id is null	employee_hire_evaluation
select employee.name from employee left join evaluation on employee.employee_id = evaluation.employee_id where evaluation.employee_id is null	employee_hire_evaluation
select shop.name from shop join hiring on shop.shop_id = hiring.shop_id group by shop.name order by count(hiring.employee_id) desc limit 1	employee_hire_evaluation
select shop.name from shop join hiring on shop.shop_id = hiring.shop_id group by shop.shop_id order by count(hiring.employee_id) desc limit 1	employee_hire_evaluation
select shop.name from shop left join hiring on shop.shop_id = hiring.shop_id where hiring.employee_id is null	employee_hire_evaluation
select shop.name from shop left join hiring on shop.shop_id = hiring.shop_id where hiring.employee_id is null	employee_hire_evaluation
select shop.name, count(hiring.employee_id) as num_employees from shop inner join hiring on shop.shop_id = hiring.shop_id group by shop.name	employee_hire_evaluation
select shop.name, count(hiring.employee_id) as num_employees from shop left join hiring on shop.shop_id = hiring.shop_id group by shop.shop_id	employee_hire_evaluation
select sum(bonus) from evaluation	employee_hire_evaluation
select sum(bonus) from evaluation	employee_hire_evaluation
select * from hiring	employee_hire_evaluation
select * from hiring	employee_hire_evaluation
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000	employee_hire_evaluation
select district from shop where number_products < 3000 and district in (  select district from shop  where number_products > 10000 )	employee_hire_evaluation
select count(distinct location) from shop	employee_hire_evaluation
select count(distinct location) from shop	employee_hire_evaluation
select count(*) from documents	cre_Doc_Template_Mgt
select count(*) from documents	cre_Doc_Template_Mgt
select document_id, document_name, document_description from documents	cre_Doc_Template_Mgt
select document_id, document_name, document_description from documents	cre_Doc_Template_Mgt
select documents.document_name, templates.template_id from documents inner join templates on documents.template_id = templates.template_id where documents.document_description like '%w%'	cre_Doc_Template_Mgt
select documents.document_name, templates.template_id from documents inner join templates on documents.template_id = templates.template_id where documents.document_description like '%w%'	cre_Doc_Template_Mgt
select documents.document_id, templates.template_id, documents.document_description from documents inner join templates on documents.template_id = templates.template_id where documents.document_name = "Robbin CV"	cre_Doc_Template_Mgt
select documents.document_id, templates.template_id, documents.document_description from documents inner join templates on documents.template_id = templates.template_id where documents.document_name = "Robbin CV"	cre_Doc_Template_Mgt
select count(distinct template_id) from documents	cre_Doc_Template_Mgt
select count(distinct template_id) from documents	cre_Doc_Template_Mgt
select count(*) from documents d inner join templates t on d.template_id = t.template_id where t.template_type_code = 'PPT'	cre_Doc_Template_Mgt
select count(*) from documents d inner join templates t on d.template_id = t.template_id where t.template_type_code = 'PPT'	cre_Doc_Template_Mgt
select templates.template_id, count(documents.document_id) as num_documents from templates left join documents on templates.template_id = documents.template_id group by templates.template_id	cre_Doc_Template_Mgt
select templates.template_id, count(documents.document_id) as usage_count from templates left join documents on templates.template_id = documents.template_id group by templates.template_id	cre_Doc_Template_Mgt
select templates.template_id, templates.template_type_code from templates where templates.template_id = (  select documents.template_id  from documents  group by documents.template_id  order by count(*) desc  limit 1 )	cre_Doc_Template_Mgt
select templates.template_id, templates.template_type_code from templates inner join documents on templates.template_id = documents.template_id group by templates.template_id order by count(*) desc limit 1	cre_Doc_Template_Mgt
select templates.template_id from templates inner join documents on templates.template_id = documents.template_id group by templates.template_id having count(distinct documents.document_id) > 1	cre_Doc_Template_Mgt
select templates.template_id from templates inner join documents on templates.template_id = documents.template_id group by templates.template_id having count(distinct documents.document_id) > 1	cre_Doc_Template_Mgt
select templates.template_id from templates left join documents on templates.template_id = documents.template_id where documents.document_id is null	cre_Doc_Template_Mgt
select templates.template_id from templates left join documents on templates.template_id = documents.template_id where documents.document_id is null	cre_Doc_Template_Mgt
select count(*) from templates	cre_Doc_Template_Mgt
select count(*) from templates	cre_Doc_Template_Mgt
select template_id, version_number, template_type_code from templates	cre_Doc_Template_Mgt
select template_id, version_number, template_type_code from templates	cre_Doc_Template_Mgt
select distinct template_type_code from templates	cre_Doc_Template_Mgt
select template_type_code from ref_template_types	cre_Doc_Template_Mgt
select template_id from templates where template_type_code in ('PP', 'PPT')	cre_Doc_Template_Mgt
select template_id from templates where template_type_code in ('PP', 'PPT')	cre_Doc_Template_Mgt
select count(*) from templates where template_type_code = 'CV'	cre_Doc_Template_Mgt
select count(*) from templates where template_type_code = 'CV'	cre_Doc_Template_Mgt
select version_number, template_type_code from templates where version_number > 5	cre_Doc_Template_Mgt
select version_number, template_type_code from templates where version_number > 5	cre_Doc_Template_Mgt
select ref_template_types.template_type_code, count(templates.template_id) as num_templates from ref_template_types left join templates on ref_template_types.template_type_code = templates.template_type_code group by ref_template_types.template_type_code	cre_Doc_Template_Mgt
select ref_template_types.template_type_code, count(templates.template_id) from ref_template_types left join templates on ref_template_types.template_type_code = templates.template_type_code group by ref_template_types.template_type_code	cre_Doc_Template_Mgt
select template_type_code, count(*) as num_templates from templates group by template_type_code order by num_templates desc limit 1	cre_Doc_Template_Mgt
select template_type_code from templates group by template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt
select template_type_code from templates group by template_type_code having count(*) < 3	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_code not in (   select template_type_code   from templates   group by template_type_code   having count(*) >= 3 )	cre_Doc_Template_Mgt
select min(version_number), template_type_code from templates group by template_type_code order by min(version_number) limit 1	cre_Doc_Template_Mgt
select templates.version_number, templates.template_type_code from templates where templates.version_number = (select min(version_number) from templates)	cre_Doc_Template_Mgt
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = "Data base"	cre_Doc_Template_Mgt
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = "Data base"	cre_Doc_Template_Mgt
select documents.document_name from documents inner join templates on documents.template_id = templates.template_id where templates.template_type_code = 'BK'	cre_Doc_Template_Mgt
select documents.document_name from documents inner join templates on documents.template_id = templates.template_id where templates.template_type_code = 'BK'	cre_Doc_Template_Mgt
select ref_template_types.template_type_code, count(documents.document_id) from ref_template_types left join templates on ref_template_types.template_type_code = templates.template_type_code left join documents on templates.template_id = documents.template_id group by ref_template_types.template_type_code	cre_Doc_Template_Mgt
select ref_template_types.template_type_code, count(documents.document_id) from ref_template_types left join templates on ref_template_types.template_type_code = templates.template_type_code left join documents on templates.template_id = documents.template_id group by ref_template_types.template_type_code	cre_Doc_Template_Mgt
select templates.template_type_code, count(*) as num_docs from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by num_docs desc limit 1	cre_Doc_Template_Mgt
select templates.template_type_code from templates inner join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_code not in (  select template_type_code  from templates  inner join documents on templates.template_id = documents.template_id )	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_code not in (select template_type_code from templates)	cre_Doc_Template_Mgt
select template_type_code, template_type_description from ref_template_types	cre_Doc_Template_Mgt
select template_type_code, template_type_description from ref_template_types	cre_Doc_Template_Mgt
select template_type_description from ref_template_types where template_type_code = "AD"	cre_Doc_Template_Mgt
select template_type_description from ref_template_types where template_type_code = 'AD'	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_description = "Book"	cre_Doc_Template_Mgt
select template_type_code from ref_template_types where template_type_description = "Book"	cre_Doc_Template_Mgt
select distinct ref_template_types.template_type_description from ref_template_types inner join templates on ref_template_types.template_type_code = templates.template_type_code inner join documents on templates.template_id = documents.template_id	cre_Doc_Template_Mgt
select distinct ref_template_types.template_type_description from ref_template_types inner join templates on ref_template_types.template_type_code = templates.template_type_code inner join documents on templates.template_id = documents.template_id	cre_Doc_Template_Mgt
select templates.template_id from templates inner join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = "Presentation"	cre_Doc_Template_Mgt
select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Presentation'	cre_Doc_Template_Mgt
select count(*) from paragraphs	cre_Doc_Template_Mgt
select count(*) from paragraphs	cre_Doc_Template_Mgt
select count(*) from paragraphs p join documents d on p.document_id = d.document_id where d.document_name = 'Summer Show'	cre_Doc_Template_Mgt
select count(*) from paragraphs where document_id = (select document_id from documents where document_name = 'Summer Show')	cre_Doc_Template_Mgt
select * from paragraphs where paragraph_text = 'Korea'	cre_Doc_Template_Mgt
select paragraph_text, other_details from paragraphs where paragraph_text = 'Korea'	cre_Doc_Template_Mgt
select paragraph_id, paragraph_text from paragraphs where document_id = (   select document_id   from documents   where document_name = 'Welcome to NY' )	cre_Doc_Template_Mgt
select paragraph_id, paragraph_text from paragraphs where document_id = (   select document_id   from documents   where document_name = 'Welcome to NY' )	cre_Doc_Template_Mgt
select paragraph_text from paragraphs inner join documents on paragraphs.document_id = documents.document_id where documents.document_name = "Customer reviews"	cre_Doc_Template_Mgt
select paragraph_text from paragraphs inner join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Customer reviews'	cre_Doc_Template_Mgt
select documents.document_id, count(paragraphs.paragraph_id) as num_paragraphs from documents left join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by documents.document_id	cre_Doc_Template_Mgt
select documents.document_id, count(paragraphs.paragraph_id) as num_paragraphs from documents left join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by documents.document_id	cre_Doc_Template_Mgt
select documents.document_id, documents.document_name, count(paragraphs.paragraph_id) as num_paragraphs from documents left join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id	cre_Doc_Template_Mgt
select documents.document_id, documents.document_name, count(paragraphs.paragraph_id) as num_paragraphs from documents left join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id	cre_Doc_Template_Mgt
select document_id from paragraphs group by document_id having count(*) >= 2	cre_Doc_Template_Mgt
select documents.document_id from documents inner join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id having count(*) >= 2	cre_Doc_Template_Mgt
select documents.document_id, documents.document_name, count(paragraphs.paragraph_id) as num_paragraphs from documents inner join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by num_paragraphs desc limit 1	cre_Doc_Template_Mgt
select d.document_id, d.document_name from documents d inner join (   select document_id, count(*) as num_paragraphs   from paragraphs   group by document_id   order by num_paragraphs desc   limit 1 ) p on d.document_id = p.document_id	cre_Doc_Template_Mgt
select document_id, count(*) as num_paragraphs from paragraphs group by document_id order by num_paragraphs limit 1	cre_Doc_Template_Mgt
select document_id from paragraphs group by document_id order by count(*) asc limit 1	cre_Doc_Template_Mgt
select document_id from paragraphs group by document_id having count(*) between 1 and 2	cre_Doc_Template_Mgt
select documents.document_id from documents inner join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id having count(paragraphs.paragraph_id) between 1 and 2	cre_Doc_Template_Mgt
select documents.document_id from documents inner join paragraphs on documents.document_id = paragraphs.document_id where paragraphs.paragraph_text in ('Brazil', 'Ireland')	cre_Doc_Template_Mgt
select documents.document_id from documents inner join paragraphs on documents.document_id = paragraphs.document_id where paragraphs.paragraph_text in ('Brazil', 'Ireland')	cre_Doc_Template_Mgt
select count(*) from teacher	course_teach
select count(*) from teacher	course_teach
select name from teacher order by age asc	course_teach
select name from teacher order by age asc	course_teach
select age, hometown from teacher	course_teach
select age, hometown from teacher	course_teach
select name from teacher where hometown != "Little Lever Urban District"	course_teach
select name from teacher where hometown != "Little Lever Urban District"	course_teach
select name from teacher where age in ('32', '33')	course_teach
select name from teacher where age in ('32', '33')	course_teach
select hometown from teacher where age = (select min(age) from teacher)	course_teach
select hometown from teacher where age = (select min(age) from teacher)	course_teach
select hometown, count(*) as num_teachers from teacher group by hometown	course_teach
select hometown, count(*) as num_teachers from teacher group by hometown	course_teach
select hometown, count(*) as count from teacher group by hometown order by count desc limit 1	course_teach
select hometown, count(*) as count from teacher group by hometown order by count desc limit 1	course_teach
select distinct t1.hometown from teacher t1 inner join teacher t2 on t1.hometown = t2.hometown and t1.teacher_id <> t2.teacher_id	course_teach
select hometown from teacher group by hometown having count(*) >= 2	course_teach
select teacher.name, course.course from teacher inner join course_arrange on teacher.teacher_id = course_arrange.teacher_id inner join course on course_arrange.course_id = course.course_id	course_teach
select teacher.name, course.course from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id join course on course_arrange.course_id = course.course_id	course_teach
select teacher.name, course.course from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc	course_teach
select teacher.name, course.course from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc	course_teach
select teacher.name from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id join course on course_arrange.course_id = course.course_id where course.course = "Math"	course_teach
select teacher.name from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id join course on course_arrange.course_id = course.course_id where course.course = "Math"	course_teach
select teacher.name, count(course_arrange.course_id) as num_courses from teacher inner join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by teacher.name	course_teach
select teacher.name, count(course_arrange.course_id) as num_courses from teacher left join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by teacher.teacher_id	course_teach
select teacher.name from teacher inner join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by teacher.name having count(distinct course_arrange.course_id) >= 2	course_teach
select teacher.name from teacher inner join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by teacher.name having count(distinct course_arrange.course_id) >= 2	course_teach
select name from teacher where teacher_id not in (select teacher_id from course_arrange)	course_teach
select teacher.name from teacher left join course_arrange on teacher.teacher_id = course_arrange.teacher_id where course_arrange.course_id is null	course_teach
select count(*) from visitor where age < 30	museum_visit
select name from visitor where level_of_membership > 4 order by level_of_membership desc	museum_visit
select avg(age) from visitor where level_of_membership <= 4	museum_visit
select visitor.name, visitor.level_of_membership from visitor where visitor.level_of_membership > 4 order by visitor.age desc	museum_visit
select museum_id, name from museum where num_of_staff = (select max(num_of_staff) from museum)	museum_visit
select avg(num_of_staff) from museum where open_year < 2009	museum_visit
select open_year, num_of_staff from museum where name = "Plaza Museum"	museum_visit
select name from museum  where num_of_staff > (select min(num_of_staff) from museum where open_year > 2010)	museum_visit
select visitor.id, visitor.name, visitor.age from visitor inner join visit on visitor.id = visit.visitor_id group by visitor.id having count(distinct visit.museum_id) > 1	museum_visit
select visitor.id, visitor.name, visitor.level_of_membership from visitor inner join visit on visitor.id = visit.visitor_id group by visitor.id order by sum(total_spent) desc limit 1	museum_visit
select museum_id, name, count(*) as num_visits from visit join museum on visit.museum_id = museum.museum_id group by museum_id order by num_visits desc limit 1	museum_visit
select m.name from museum m left join visit v on m.museum_id = v.museum_id where v.visitor_id is null	museum_visit
select visitor.name, visitor.age from visitor join visit on visitor.id = visit.visitor_id where visit.num_of_ticket = (select max(num_of_ticket) from visit)	museum_visit
select avg(num_of_ticket), max(num_of_ticket) from visit	museum_visit
select sum(total_spent) from visit  inner join visitor on visit.visitor_id = visitor.id  where visitor.level_of_membership = 1	museum_visit
select visitor.name from visitor inner join visit on visitor.id = visit.visitor_id inner join museum on visit.museum_id = museum.museum_id where museum.open_year < 2009 and museum.open_year > 2011	museum_visit
select count(*) from visitor where id not in (   select visitor_id from visit   where museum_id in (  select museum_id from museum  where open_year > 2010   ) )	museum_visit
select count(*) from museum where open_year > 2013 or open_year < 2008	museum_visit
select count(*) from players	wta_1
select count(*) from players	wta_1
select count(*) from matches	wta_1
select count(*) from matches	wta_1
select first_name, birth_date from players where country_code = 'USA'	wta_1
select first_name, birth_date from players where country_code = "USA"	wta_1
select avg(loser_age) as avg_loser_age, avg(winner_age) as avg_winner_age from matches	wta_1
select avg(loser_age), avg(winner_age) from matches	wta_1
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
select distinct winner_name from matches where year = 2013 and winner_name in (   select winner_name   from matches   where year = 2016 )	wta_1
select p.first_name, p.last_name from players p inner join matches m1 on p.player_id = m1.winner_id inner join matches m2 on p.player_id = m2.winner_id where m1.year = 2013 and m2.year = 2016	wta_1
select count(*) from matches where year = 2013 or year = 2016	wta_1
select count(*) from matches where year = 2013 or year = 2016	wta_1
select players.country_code, players.first_name from players inner join matches as m1 on players.player_id = m1.winner_id inner join matches as m2 on players.player_id = m2.winner_id where m1.tourney_name = 'WTA Championships' and m2.tourney_name = 'Australian Open'	wta_1
select players.first_name, players.country_code from players inner join matches on players.player_id = matches.winner_id where matches.tourney_name = 'WTA Championships' and matches.tourney_id like '%-AUS-%' group by players.player_id having count(distinct matches.tourney_name) = 2	wta_1
select first_name, country_code from players where birth_date = (select min(birth_date) from players)	wta_1
select first_name, country_code from players where birth_date = (select min(birth_date) from players)	wta_1
select first_name, last_name from players order by birth_date	wta_1
select first_name || ' ' || last_name as full_name from players order by birth_date	wta_1
select first_name, last_name from players where hand = 'L' order by birth_date	wta_1
select first_name || ' ' || last_name as full_name from players where hand = 'L' order by birth_date	wta_1
select players.first_name, players.country_code from players inner join rankings on players.player_id = rankings.player_id where rankings.tours = (select max(tours) from rankings)	wta_1
select players.first_name, players.country_code from players inner join rankings on players.player_id = rankings.player_id where rankings.tours = (select max(tours) from rankings)	wta_1
select year, count(*) as num_matches from matches group by year order by num_matches desc limit 1	wta_1
select year, count(*) as num_matches from matches group by year order by num_matches desc limit 1	wta_1
select winner_name, winner_rank_points from matches join players on matches.winner_id = players.player_id group by winner_id order by count(*) desc limit 1	wta_1
select winner_name, winner_rank_points from matches join players on matches.winner_id = players.player_id group by winner_name order by count(*) desc limit 1	wta_1
select winner_name from matches where tourney_name = 'Australian Open' and winner_rank_points = (  select max(winner_rank_points)  from matches  where tourney_name = 'Australian Open' )	wta_1
select winner_name from matches where tourney_name = 'Australian Open' order by winner_rank_points desc limit 1	wta_1
select loser_name, winner_name from matches where minutes = (select max(minutes) from matches)	wta_1
select winner_name, loser_name from matches where minutes = (select max(minutes) from matches)	wta_1
select players.first_name, avg(rankings.ranking) as avg_ranking from players join rankings on players.player_id = rankings.player_id group by players.player_id	wta_1
select first_name, avg(rankings.ranking) as avg_ranking from players join rankings on players.player_id = rankings.player_id group by players.player_id	wta_1
select players.first_name, sum(rankings.ranking_points) as total_ranking_points from players join rankings on players.player_id = rankings.player_id group by players.player_id	wta_1
select players.first_name, sum(rankings.ranking_points) as total_ranking_points from players join rankings on players.player_id = rankings.player_id group by players.first_name	wta_1
select country_code, count(*) as num_players from players group by country_code	wta_1
select country_code, count(*) as num_players from players group by country_code	wta_1
select country_code, count(*) as num_players from players group by country_code order by num_players desc limit 1	wta_1
select country_code, count(*) as num_players from players group by country_code order by num_players desc limit 1	wta_1
select country_code from players group by country_code having count(player_id) > 50	wta_1
select country_code from players group by country_code having count(player_id) > 50	wta_1
select ranking_date, sum(tours) as total_tours from rankings group by ranking_date	wta_1
select ranking_date, sum(tours) as total_tours from rankings group by ranking_date	wta_1
select year, count(*) as num_matches from matches group by year	wta_1
select year, count(*) as num_matches from matches group by year	wta_1
select winner_name, winner_rank, winner_age from matches join players on matches.winner_id = players.player_id order by winner_age limit 3	wta_1
select winner_name, winner_rank, winner_age from matches join players on matches.winner_id = players.player_id order by winner_age limit 3	wta_1
select count(distinct winner_id) from matches where tourney_name = 'WTA Championships' and winner_hand = 'L'	wta_1
select count(distinct winner_id) from matches where winner_hand = 'L' and tourney_name = 'WTA Championships'	wta_1
select players.first_name, players.country_code, players.birth_date from players join matches on players.player_id = matches.winner_id where matches.winner_rank_points = (select max(winner_rank_points) from matches)	wta_1
select players.first_name, players.country_code, players.birth_date from players join matches on players.player_id = matches.winner_id where matches.winner_rank_points = (select max(winner_rank_points) from matches)	wta_1
select hand, count(*) as num_players from players group by hand	wta_1
select hand, count(*) as num_players from players group by hand	wta_1
select count(*) from ship where disposition_of_ship = 'Captured'	battle_death
select name, tonnage from ship order by name desc	battle_death
select name, date, result from battle	battle_death
select max(killed), min(killed) from death	battle_death
select avg(injured) from death	battle_death
select death.killed, death.injured from death inner join ship on death.caused_by_ship_id = ship.id where ship.tonnage = 't'	battle_death
select name, result from battle where bulgarian_commander != 'Boril'	battle_death
select battle.id, battle.name from battle join ship on battle.id = ship.lost_in_battle where ship.ship_type = 'Brig'	battle_death
select b.id, b.name from battle b join ship s on b.id = s.lost_in_battle join death d on s.id = d.caused_by_ship_id group by b.id, b.name having sum(d.killed) > 10	battle_death
select ship.id, ship.name, sum(death.injured) as total_injuries from ship join death on ship.id = death.caused_by_ship_id group by ship.id order by total_injuries desc limit 1	battle_death
select name from battle where bulgarian_commander = 'Kaloyan' and latin_commander = 'Baldwin I'	battle_death
select count(distinct result) from battle	battle_death
select count(distinct battle.id) from battle left join ship on battle.id = ship.lost_in_battle and ship.tonnage = '225' where ship.id is null	battle_death
select battle.name, battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name in ('Lettice', 'HMS Atalanta')	battle_death
select battle.name, battle.result, battle.bulgarian_commander from battle left join ship on battle.id = ship.lost_in_battle and ship.location = 'English Channel' where ship.id is null	battle_death
select note from death where note like '%East%'	battle_death
select line_1, line_2 from addresses	student_transcripts_tracking
select line_1, line_2 from addresses	student_transcripts_tracking
select count(*) from courses	student_transcripts_tracking
select count(*) from courses	student_transcripts_tracking
select course_description from courses where course_name = 'math'	student_transcripts_tracking
select course_description from courses where course_name = 'math'	student_transcripts_tracking
select zip_postcode from addresses where city = 'Port Chelsea'	student_transcripts_tracking
select zip_postcode from addresses where city = 'Port Chelsea'	student_transcripts_tracking
select departments.department_id, departments.department_name, count(degree_programs.degree_program_id) as num_degrees from departments inner join degree_programs on departments.department_id = degree_programs.department_id group by departments.department_id order by num_degrees desc limit 1	student_transcripts_tracking
select departments.department_name, departments.department_id from departments inner join degree_programs on departments.department_id = degree_programs.department_id group by departments.department_id order by count(degree_programs.degree_program_id) desc limit 1	student_transcripts_tracking
select count(distinct department_id) from degree_programs	student_transcripts_tracking
select count(distinct department_id) from degree_programs	student_transcripts_tracking
select count(distinct degree_summary_name) from degree_programs	student_transcripts_tracking
select count(distinct degree_summary_name) from degree_programs	student_transcripts_tracking
select count(*) from degree_programs where department_id = (select department_id from departments where department_name = 'engineering')	student_transcripts_tracking
select count(*) from degree_programs where department_id = (select department_id from departments where department_name = 'engineering')	student_transcripts_tracking
select section_name, section_description from sections	student_transcripts_tracking
select section_name, section_description from sections	student_transcripts_tracking
select courses.course_id, courses.course_name from courses where courses.course_id in (  select course_id  from sections  group by course_id  having count(*) <= 2 )	student_transcripts_tracking
select courses.course_id, courses.course_name from courses left join sections on courses.course_id = sections.course_id group by courses.course_id having count(sections.section_id) < 2	student_transcripts_tracking
select section_name from sections order by section_name desc	student_transcripts_tracking
select section_name from sections order by section_name desc	student_transcripts_tracking
select semesters.semester_id, semesters.semester_name, count(student_enrolment.student_id) as num_students from semesters inner join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by num_students desc limit 1	student_transcripts_tracking
select semesters.semester_id, semesters.semester_name, count(student_enrolment.student_id) as num_students from semesters inner join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by num_students desc limit 1	student_transcripts_tracking
select department_description from departments where department_name like '%computer%'	student_transcripts_tracking
select department_description from departments where department_name like '%computer%'	student_transcripts_tracking
select s.first_name, s.middle_name, s.last_name, s.student_id from students s inner join student_enrolment se on s.student_id = se.student_id where se.semester_id = 2 group by s.student_id having count(distinct se.degree_program_id) = 2	student_transcripts_tracking
select students.student_id, students.first_name, students.middle_name, students.last_name from students inner join student_enrolment on students.student_id = student_enrolment.student_id where student_enrolment.semester_id = 2 group by students.student_id having count(distinct student_enrolment.degree_program_id) = 2	student_transcripts_tracking
select students.first_name, students.middle_name, students.last_name from students inner join student_enrolment on students.student_id = student_enrolment.student_id inner join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id where degree_summary_name = 'Bachelor'	student_transcripts_tracking
select students.first_name, students.middle_name, students.last_name from students inner join student_enrolment on students.student_id = student_enrolment.student_id inner join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id where degree_summary_name = 'Bachelor'	student_transcripts_tracking
select degree_programs.degree_summary_name, count(*) as num_students from student_enrolment inner join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by degree_programs.degree_summary_name order by num_students desc limit 1	student_transcripts_tracking
select degree_summary_name, count(*) as num_students from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_summary_name order by num_students desc limit 1	student_transcripts_tracking
select degree_programs.degree_program_id, degree_summary_name from degree_programs inner join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_program_id order by count(student_enrolment.student_id) desc limit 1	student_transcripts_tracking
select degree_program_id, degree_summary_name, count(*) as num_students from student_enrolment group by degree_program_id, degree_summary_name order by num_students desc limit 1	student_transcripts_tracking
select students.student_id, students.first_name, students.middle_name, students.last_name, count(*) as num_enrollments from students inner join student_enrolment on students.student_id = student_enrolment.student_id group by students.student_id order by num_enrollments desc limit 1	student_transcripts_tracking
select students.student_id, students.first_name, students.middle_name, students.last_name, count(*) as num_enrollments from students join student_enrolment on students.student_id = student_enrolment.student_id group by students.student_id order by num_enrollments desc limit 1	student_transcripts_tracking
select semesters.semester_name from semesters left join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.semester_id is null	student_transcripts_tracking
select semesters.semester_name from semesters left join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.semester_id is null	student_transcripts_tracking
select distinct course_name from courses inner join sections on courses.course_id = sections.course_id inner join student_enrolment_courses on sections.section_id = student_enrolment_courses.student_course_id	student_transcripts_tracking
select courses.course_name from courses inner join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id	student_transcripts_tracking
select courses.course_name, count(student_enrolment_courses.student_course_id) as enrollments from courses inner join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_id order by enrollments desc limit 1	student_transcripts_tracking
select courses.course_name, count(*) as num_students from courses join sections on courses.course_id = sections.course_id join student_enrolment_courses on sections.section_id = student_enrolment_courses.student_enrolment_id group by courses.course_id order by num_students desc limit 1	student_transcripts_tracking
select students.last_name from students join addresses on students.current_address_id = addresses.address_id where addresses.state_province_county = 'North Carolina' and students.student_id not in (select student_id from student_enrolment)	student_transcripts_tracking
select students.last_name from students left join student_enrolment on students.student_id = student_enrolment.student_id where students.current_address_id in (  select address_id from addresses where state_province_county = 'North Carolina' ) and student_enrolment.student_enrolment_id is null	student_transcripts_tracking
select transcripts.transcript_date, transcripts.transcript_id from transcripts inner join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcripts.transcript_id having count(transcript_contents.student_course_id) >= 2	student_transcripts_tracking
select transcripts.transcript_date, transcripts.transcript_id from transcripts inner join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcripts.transcript_id having count(*) >= 2	student_transcripts_tracking
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'	student_transcripts_tracking
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'	student_transcripts_tracking
select first_name, middle_name, last_name from students order by date_first_registered limit 1	student_transcripts_tracking
select first_name, middle_name, last_name from students where student_id = 1	student_transcripts_tracking
select students.first_name, students.middle_name, students.last_name from students inner join student_enrolment on students.student_id = student_enrolment.student_id inner join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id where degree_summary_name = 'PHD' order by date_left limit 1	student_transcripts_tracking
select students.first_name, students.middle_name, students.last_name from students inner join student_enrolment on students.student_id = student_enrolment.student_id inner join transcripts on student_enrolment.student_enrolment_id = transcripts.transcript_id order by transcripts.transcript_date asc limit 1	student_transcripts_tracking
select students.first_name from students where current_address_id != permanent_address_id	student_transcripts_tracking
select students.first_name from students where current_address_id != permanent_address_id	student_transcripts_tracking
select current_address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details from students join addresses on students.current_address_id = addresses.address_id group by current_address_id order by count(*) desc limit 1	student_transcripts_tracking
select addresses.address_id, addresses.line_1, addresses.line_2 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count(students.student_id) desc limit 1	student_transcripts_tracking
select avg(strftime('%s', transcript_date)) from transcripts	student_transcripts_tracking
select avg(transcript_date) from transcripts	student_transcripts_tracking
select transcript_date, other_details from transcripts order by transcript_date limit 1	student_transcripts_tracking
select min(transcript_date), other_details from transcripts	student_transcripts_tracking
select count(*) from transcripts	student_transcripts_tracking
select count(*) from transcripts	student_transcripts_tracking
select max(transcript_date) from transcripts	student_transcripts_tracking
select max(transcript_date) from transcripts	student_transcripts_tracking
select count(student_course_id), student_course_id from transcript_contents group by student_course_id order by count(student_course_id) desc limit 1	student_transcripts_tracking
select student_course_id, count(*) as num_transcripts from transcript_contents group by student_course_id order by num_transcripts desc limit 1	student_transcripts_tracking
select transcript_id, transcript_date from transcripts where transcript_id in (   select transcript_id   from transcript_contents   group by transcript_id   order by count(*) asc   limit 1 )	student_transcripts_tracking
select transcript_id, transcript_date from transcripts where transcript_id in (   select transcript_id   from transcript_contents   group by transcript_id   order by count(*) asc   limit 1 )	student_transcripts_tracking
select semesters.semester_name from semesters inner join student_enrolment on semesters.semester_id = student_enrolment.semester_id inner join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id where degree_summary_name in ('Master', 'Bachelor') group by semesters.semester_name having count(distinct degree_summary_name) = 2	student_transcripts_tracking
select semesters.semester_id from semesters inner join student_enrolment on semesters.semester_id = student_enrolment.semester_id inner join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id where degree_summary_name in ('Master', 'Bachelor') group by semesters.semester_id having count(distinct degree_summary_name) = 2	student_transcripts_tracking
select count(distinct current_address_id) from students	student_transcripts_tracking
select distinct line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details from addresses where address_id in (  select current_address_id from students  union  select permanent_address_id from students )	student_transcripts_tracking
select * from students order by last_name desc, first_name desc, middle_name desc	student_transcripts_tracking
select * from students order by last_name desc	student_transcripts_tracking
select section_description from sections where section_name = 'h'	student_transcripts_tracking
select sections.section_description from sections where sections.section_name = 'h'	student_transcripts_tracking
select students.first_name from students inner join addresses on students.permanent_address_id = addresses.address_id where addresses.country = 'Haiti' or students.cell_mobile_number = '09700166582'	student_transcripts_tracking
select students.first_name from students inner join addresses on students.permanent_address_id = addresses.address_id where addresses.country = 'Haiti' or students.cell_mobile_number = '09700166582'	student_transcripts_tracking
select title from cartoon order by title asc	tvshow
select title from cartoon order by title asc	tvshow
select * from cartoon where directed_by = "Ben Jones"	tvshow
select title from cartoon where directed_by = "Ben Jones"	tvshow
select count(*) from cartoon where written_by = "Joseph Kuhr"	tvshow
select count(*) from cartoon where written_by = "Joseph Kuhr"	tvshow
select title, directed_by  from cartoon  order by original_air_date	tvshow
select cartoon.title, cartoon.directed_by from cartoon order by cartoon.original_air_date	tvshow
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Brandon Vietti"	tvshow
select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'	tvshow
select country, count(*) as num_channels from tv_channel group by country order by num_channels desc limit 1	tvshow
select country, count(*) as num_channels from tv_channel group by country order by num_channels desc limit 1	tvshow
select count(distinct series_name) as num_series_names, count(distinct content) as num_contents from tv_channel	tvshow
select count(distinct series_name), count(distinct content) from tv_channel	tvshow
select content from tv_channel where series_name = "Sky Radio"	tvshow
select content from tv_channel where series_name = "Sky Radio"	tvshow
select package_option from tv_channel where series_name = "Sky Radio"	tvshow
select package_option from tv_channel where series_name = "Sky Radio"	tvshow
select count(*) from tv_channel where language = "English"	tvshow
select count(*) from tv_channel where language = "English"	tvshow
select language, count(*) as num_channels from tv_channel group by language order by num_channels limit 1	tvshow
select language, count(*) as num_channels from tv_channel group by language order by num_channels limit 1	tvshow
select language, count(*) as num_channels from tv_channel group by language	tvshow
select language, count(distinct id) as num_channels from tv_channel group by language	tvshow
select tv_channel.series_name from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.title = "The Rise of the Blue Beetle!"	tvshow
select tv_channel.series_name from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.title = "The Rise of the Blue Beetle!"	tvshow
select cartoon.title  from cartoon  inner join tv_channel on cartoon.channel = tv_channel.id  where tv_channel.series_name = "Sky Radio"	tvshow
select cartoon.title  from cartoon  join tv_channel on cartoon.channel = tv_channel.id  where tv_channel.series_name = "Sky Radio"	tvshow
select episode from tv_series order by rating desc	tvshow
select episode from tv_series order by rating desc	tvshow
select episode, rating  from tv_series  order by rating desc  limit 3	tvshow
select episode, rating from tv_series order by rating desc limit 3	tvshow
select min(share), max(share) from tv_series	tvshow
select max(share), min(share) from tv_series	tvshow
select air_date from tv_series where episode = "A Love of a Lifetime"	tvshow
select air_date from tv_series where episode = "A Love of a Lifetime"	tvshow
select weekly_rank from tv_series where episode = "A Love of a Lifetime"	tvshow
select weekly_rank from tv_series where episode = "A Love of a Lifetime"	tvshow
select tv_channel.series_name from tv_channel join tv_series on tv_channel.id = tv_series.channel where tv_series.episode = "A Love of a Lifetime"	tvshow
select series_name from tv_channel join tv_series on tv_channel.id = tv_series.channel where episode = "A Love of a Lifetime"	tvshow
select tv_series.episode  from tv_series  inner join tv_channel on tv_series.channel = tv_channel.id  where tv_channel.series_name = "Sky Radio"	tvshow
select tv_series.episode from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_channel.series_name = "Sky Radio"	tvshow
select directed_by, count(*) as num_cartoons from cartoon group by directed_by	tvshow
select directed_by, count(*) as num_cartoons from cartoon group by directed_by	tvshow
select production_code, channel  from cartoon  where original_air_date = (select max(original_air_date) from cartoon)	tvshow
select production_code, channel from cartoon where original_air_date = (select max(original_air_date) from cartoon)	tvshow
select tv_channel.package_option, tv_channel.series_name from tv_channel where tv_channel.hight_definition_tv = 'yes'	tvshow
select package_option, series_name from tv_channel where hight_definition_tv = 'yes'	tvshow
select distinct c.channel from cartoon c join tv_channel ch on c.channel = ch.id where c.written_by = 'Todd Casey' and ch.country is not null	tvshow
select distinct tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'	tvshow
select distinct c.channel from cartoon c join tv_channel ch on c.channel = ch.id where c.written_by != 'Todd Casey' group by c.channel having count(distinct c.id) = 0	tvshow
select distinct country from tv_channel where id not in (   select channel   from cartoon   where written_by = 'Todd Casey' )	tvshow
select tv_channel.series_name, tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by in ('Ben Jones', 'Michael Chang')	tvshow
select tv_channel.series_name, tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by in ('Ben Jones', 'Michael Chang') group by tv_channel.series_name, tv_channel.country	tvshow
select pixel_aspect_ratio_par, country from tv_channel where language != 'English'	tvshow
select pixel_aspect_ratio_par, country from tv_channel where language != "English"	tvshow
select tv_channel.id from tv_channel where country in (  select country  from tv_channel  group by country  having count(*) > 2 )	tvshow
select id from tv_channel group by id having count(id) > 2	tvshow
select tv_channel.id from tv_channel where tv_channel.id not in (   select cartoon.channel   from cartoon   where cartoon.directed_by = 'Ben Jones' )	tvshow
select tv_channel.id from tv_channel where tv_channel.id not in (   select cartoon.channel   from cartoon   where cartoon.directed_by = 'Ben Jones' )	tvshow
select package_option  from tv_channel  where id not in (  select channel   from cartoon   where directed_by = 'Ben Jones' )	tvshow
select tv_channel.package_option from tv_channel where tv_channel.id not in (   select cartoon.channel   from cartoon   where cartoon.directed_by = 'Ben Jones' )	tvshow
select count(*) from poker_player	poker_player
select count(*) from poker_player	poker_player
select earnings from poker_player order by earnings desc	poker_player
select earnings from poker_player order by earnings desc	poker_player
select final_table_made, best_finish from poker_player	poker_player
select final_table_made, best_finish from poker_player	poker_player
select avg(earnings) from poker_player	poker_player
select avg(earnings) from poker_player	poker_player
select p.money_rank from poker_player p where p.earnings = (select max(earnings) from poker_player)	poker_player
select money_rank from poker_player where earnings = (select max(earnings) from poker_player)	poker_player
select max(final_table_made) from poker_player where earnings < 200000	poker_player
select max(final_table_made) from poker_player where earnings < 200000	poker_player
select people.name from people join poker_player on people.people_id = poker_player.people_id	poker_player
select people.name from poker_player join people on poker_player.people_id = people.people_id	poker_player
select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000	poker_player
select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000	poker_player
select p.name from poker_player pp join people p on pp.people_id = p.people_id order by pp.final_table_made asc	poker_player
select p.name from poker_player pp join people p on pp.people_id = p.people_id order by pp.final_table_made asc	poker_player
select birth_date from people where people_id = (select people_id from poker_player     where earnings = (select min(earnings) from poker_player))	poker_player
select people.birth_date from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings = (select min(earnings) from poker_player)	poker_player
select p.money_rank from poker_player p join people pe on p.people_id = pe.people_id where pe.height = (select max(height) from people)	poker_player
select p.money_rank from poker_player p join people pe on p.people_id = pe.people_id where pe.height = (select max(height) from people)	poker_player
select avg(earnings) from poker_player join people on poker_player.people_id = people.people_id where height > 200	poker_player
select avg(earnings) from poker_player  join people on poker_player.people_id = people.people_id  where height > 200	poker_player
select p.name from poker_player pp join people p on pp.people_id = p.people_id order by pp.earnings desc	poker_player
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc	poker_player
select nationality, count(*) as num_people from people group by nationality	poker_player
select nationality, count(*) as count from people group by nationality	poker_player
select nationality, count(*) as count from people group by nationality order by count desc limit 1	poker_player
select nationality from people group by nationality order by count(*) desc limit 1	poker_player
select distinct p1.nationality from people p1 inner join people p2 on p1.nationality = p2.nationality and p1.people_id <> p2.people_id	poker_player
select nationality from people group by nationality having count(*) >= 2	poker_player
select name, birth_date from people order by name asc	poker_player
select name, birth_date from people order by name asc	poker_player
select name from people where nationality != "Russia"	poker_player
select name from people where nationality != "Russia"	poker_player
select name from people where people_id not in (select people_id from poker_player)	poker_player
select people.name from people left join poker_player on people.people_id = poker_player.people_id where poker_player.people_id is null	poker_player
select count(distinct nationality) from people	poker_player
select count(distinct nationality) from people	poker_player
select count(distinct state) from area_code_state	voter_1
select contestant_number, contestant_name from contestants order by contestant_name desc	voter_1
select vote_id, phone_number, state from votes	voter_1
select max(area_code), min(area_code) from area_code_state	voter_1
select max(created) from votes where state = 'CA'	voter_1
select contestant_name from contestants where contestant_name != 'Jessie Alloway'	voter_1
select distinct state, created from votes	voter_1
select contestant_number, contestant_name from contestants where contestant_number in (   select contestant_number   from votes   group by contestant_number   having count(*) >= 2 )	voter_1
select contestant_number, contestant_name from contestants where contestant_number not in (   select contestant_number   from votes   group by contestant_number   order by count(*) desc   limit 1 )	voter_1
select count(*) from votes where state in ('NY', 'CA')	voter_1
select count(*) from contestants where contestant_number not in (select contestant_number from votes)	voter_1
select area_code_state.area_code, count(*) as num_votes from area_code_state join votes on area_code_state.state = votes.state group by area_code_state.area_code order by num_votes desc limit 1	voter_1
select votes.created, votes.state, votes.phone_number from votes inner join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Tabatha Gehling'	voter_1
select distinct a.area_code from area_code_state a inner join votes v on a.state = v.state inner join contestants c on v.contestant_number = c.contestant_number where c.contestant_name in ('Tabatha Gehling', 'Kelly Clauss') group by a.area_code having count(distinct v.contestant_number) = 2	voter_1
select contestant_name from contestants where contestant_name like '%Al%'	voter_1
select name from country where indepyear > 1950	world_1
select name from country where indepyear > 1950	world_1
select count(*) from country where governmentform like '%Republic%'	world_1
select count(*) from country where governmentform like '%Republic%'	world_1
select sum(surfacearea) from country where region = 'Caribbean'	world_1
select sum(surfacearea) from country where region = 'Caribbean'	world_1
select continent from country where name = "Anguilla"	world_1
select continent from country where name = "Anguilla"	world_1
select country.region from city join country on city.countrycode = country.code where city.name = "Kabul"	world_1
select region from country where code = (select countrycode from city where name = "Kabul")	world_1
select language from countrylanguage where countrycode = "ABW" order by percentage desc limit 1	world_1
select language from countrylanguage where countrycode = "ABW" and isofficial = "T"	world_1
select population, lifeexpectancy from country where name = "Brazil"	world_1
select population, lifeexpectancy from country where name = 'Brazil'	world_1
select region, population from country where name = 'Angola'	world_1
select region, population from country where name = 'Angola'	world_1
select avg(lifeexpectancy) from country where region = 'Central Africa'	world_1
select avg(lifeexpectancy) from country where region = 'Central Africa'	world_1
select country.name from country where continent = 'Asia' order by lifeexpectancy limit 1	world_1
select name from country where continent = 'Asia' and lifeexpectancy = (select min(lifeexpectancy) from country where continent = 'Asia')	world_1
select sum(population), max(gnp) from country where continent = 'Asia'	world_1
select sum(population), max(gnp) from country where continent = 'Asia'	world_1
select avg(lifeexpectancy) from country where continent = 'Africa' and governmentform = 'Republic'	world_1
select avg(lifeexpectancy) from country where continent = 'Africa' and governmentform = 'Republic'	world_1
select sum(surfacearea) from country where continent in ('Asia', 'Europe')	world_1
select sum(surfacearea) from country where continent in ('Asia', 'Europe')	world_1
select sum(population) from city where district = 'Gelderland'	world_1
select sum(population) from city where district = 'Gelderland'	world_1
select avg(gnp), sum(population) from country where governmentform like '%US territory%'	world_1
select avg(gnp) as mean_gnp, sum(population) as total_population from country where continent = 'North America' and governmentform like '%Territory%'	world_1
select count(distinct language) from countrylanguage	world_1
select count(distinct language) from countrylanguage	world_1
select count(distinct governmentform) from country where continent = 'Africa'	world_1
select count(distinct governmentform) from country where continent = 'Africa'	world_1
select count(*) from countrylanguage where countrycode = 'ABW'	world_1
select count(*) from countrylanguage where countrycode = 'ABW'	world_1
select count(*) from countrylanguage where countrycode = 'AFG' and isofficial = 'T'	world_1
select count(*) from countrylanguage where countrycode = 'AFG' and isofficial = 'T'	world_1
select country.name from country inner join (  select countrycode, count(*) as num_languages  from countrylanguage  group by countrycode  order by num_languages desc  limit 1 ) as lang_count on country.code = lang_count.countrycode	world_1
select country.name from country inner join (  select countrycode, count(*) as num_languages  from countrylanguage  group by countrycode  order by num_languages desc  limit 1 ) as max_languages on country.code = max_languages.countrycode	world_1
select continent, count(distinct language) as num_languages from countrylanguage join country on country.code = countrylanguage.countrycode group by continent order by num_languages desc limit 1	world_1
select continent, count(distinct language) as num_languages from countrylanguage join country on country.code = countrylanguage.countrycode group by continent order by num_languages desc limit 1	world_1
select count(*) from countrylanguage cl inner join country c on cl.countrycode = c.code where cl.language in ('English', 'Dutch') and cl.isofficial = 'T' group by cl.countrycode having count(distinct cl.language) = 2	world_1
select count(distinct countrycode) from countrylanguage where language in ('English', 'Dutch')	world_1
select c.name from country c inner join countrylanguage cl on c.code = cl.countrycode where cl.language in ('English', 'French') group by c.name having count(distinct cl.language) = 2	world_1
select c.name from country c inner join countrylanguage cl on c.code = cl.countrycode where cl.language = 'English' and cl.isofficial = 'T' and exists (select 1 from countrylanguage where countrycode = c.code and language = 'French' and isofficial = 'T')	world_1
select c.name from country c inner join countrylanguage cl1 on c.code = cl1.countrycode and cl1.language = 'English' and cl1.isofficial = 'T' inner join countrylanguage cl2 on c.code = cl2.countrycode and cl2.language = 'French' and cl2.isofficial = 'T'	world_1
select c.name from country c inner join countrylanguage cl on c.code = cl.countrycode where cl.language in ('English', 'French') and cl.isofficial = 'T' group by c.name having count(distinct cl.language) = 2	world_1
select count(distinct c.continent) as num_continents from countrylanguage cl inner join country c on cl.countrycode = c.code where cl.language = 'Chinese'	world_1
select count(distinct country.continent) from countrylanguage inner join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Chinese'	world_1
select distinct region from country inner join countrylanguage on country.code = countrylanguage.countrycode where language in ('English', 'Dutch')	world_1
select distinct region from country inner join countrylanguage on country.code = countrylanguage.countrycode where language in ('Dutch', 'English')	world_1
select country.name from country inner join countrylanguage on country.code = countrylanguage.countrycode where (countrylanguage.language = 'English' or countrylanguage.language = 'Dutch') and countrylanguage.isofficial = 'T'	world_1
select country.name from country inner join countrylanguage on country.code = countrylanguage.countrycode where (countrylanguage.language = 'English' or countrylanguage.language = 'Dutch') and countrylanguage.isofficial = 'T'	world_1
select language from countrylanguage cl join country c on cl.countrycode = c.code where c.continent = 'Asia' order by percentage desc limit 1	world_1
select language, count(*) as num_countries from countrylanguage cl join country c on cl.countrycode = c.code where c.continent = 'Asia' and cl.isofficial = 'T' group by language order by num_countries desc limit 1	world_1
select distinct language from countrylanguage cl inner join country c on cl.countrycode = c.code where c.governmentform = 'Republic' and not exists (  select 1  from countrylanguage cl2  where cl2.language = cl.language  and cl2.countrycode != cl.countrycode ) 	world_1
select language from countrylanguage cl inner join country c on cl.countrycode = c.code where c.governmentform = 'Republic' group by language having count(distinct cl.countrycode) = 1	world_1
select city.name, city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'English' and countrylanguage.isofficial = 'T' order by city.population desc limit 1	world_1
select city.name, city.population from city inner join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'English' and countrylanguage.isofficial = 'T' order by city.population desc limit 1	world_1
select country.name, country.population, country.lifeexpectancy from country where continent = 'Asia' order by surfacearea desc limit 1	world_1
select c.name, c.population, c.lifeexpectancy from country c where c.continent = 'Asia' order by c.surfacearea desc limit 1	world_1
select avg(lifeexpectancy) from country where code in (select countrycode from countrylanguage where language != 'English' and isofficial = 'F')	world_1
select avg(lifeexpectancy) from country where code in (select countrycode from countrylanguage where language != 'English' and isofficial = 'F')	world_1
select sum(population) from country where code not in (select countrycode from countrylanguage where language = 'English' and isofficial = 'T')	world_1
select sum(population) from country where code not in (select countrycode from countrylanguage where language = 'English' and isofficial = 'T')	world_1
select language from countrylanguage cl join country c on cl.countrycode = c.code where c.headofstate = 'Beatrix' and cl.isofficial = 'T'	world_1
select language from countrylanguage cl join country c on cl.countrycode = c.code where c.headofstate = 'Beatrix' and cl.isofficial = 'T'	world_1
select count(distinct language) from countrylanguage cl inner join country c on cl.countrycode = c.code where c.indepyear < 1930 and cl.isofficial = 'T'	world_1
select count(distinct language) from countrylanguage cl inner join country c on cl.countrycode = c.code where c.indepyear < 1930 and cl.isofficial = 'T'	world_1
select c.name from country c where c.surfacearea > (select max(surfacearea) from country where continent = 'Europe')	world_1
select country.name from country where surfacearea > (  select max(surfacearea)  from country  where continent = 'Europe' )	world_1
select c.name from country c where c.continent = 'Africa' and c.population < (select min(population) from country where continent = 'Asia')	world_1
select country.name from country where continent = 'Africa' and population < (select min(population) from country where continent = 'Asia')	world_1
select country.name from country where continent = 'Asia' and population > (select max(population) from country where continent = 'Africa')	world_1
select c.name from country c where c.continent = 'Asia' and c.population > (select max(population) from country where continent = 'Africa')	world_1
select distinct countrycode from countrylanguage where language != 'English'	world_1
select distinct countrycode from countrylanguage where language != 'English'	world_1
select distinct countrycode from countrylanguage where language != 'English'	world_1
select distinct countrycode from countrylanguage where language != 'English'	world_1
select country.code from country where country.code not in (   select countrylanguage.countrycode   from countrylanguage   where countrylanguage.language = 'English' ) and country.governmentform != 'Republic'	world_1
select code from country where code not in (   select countrycode from countrylanguage where language = 'English' ) and governmentform not like '%Republic%'	world_1
select city.name from city join country on city.countrycode = country.code join countrylanguage on country.code = countrylanguage.countrycode where country.continent = 'Europe' and countrylanguage.language = 'English' and countrylanguage.isofficial = 'F'	world_1
select city.name from city inner join countrylanguage on city.countrycode = countrylanguage.countrycode inner join country on city.countrycode = country.code where country.continent = 'Europe' and countrylanguage.language != 'English' and countrylanguage.isofficial = 'F'	world_1
select city.name from city inner join countrylanguage on city.countrycode = countrylanguage.countrycode inner join country on city.countrycode = country.code where country.continent = 'Asia' and countrylanguage.language = 'Chinese' and countrylanguage.isofficial = 'T'	world_1
select city.name from city join countrylanguage on city.countrycode = countrylanguage.countrycode join country on city.countrycode = country.code where country.continent = 'Asia' and countrylanguage.language = 'Chinese' and countrylanguage.isofficial = 'T'	world_1
select name, indepyear, surfacearea from country where population = (select min(population) from country)	world_1
select country.name, country.indepyear, country.surfacearea from country where population = (select min(population) from country) limit 1	world_1
select country.population, country.name, country.headofstate from country where surfacearea = (select max(surfacearea) from country)	world_1
select country.name, country.population, country.headofstate from country where surfacearea = (select max(surfacearea) from country)	world_1
select country.name, count(countrylanguage.language) as num_languages from country inner join countrylanguage on country.code = countrylanguage.countrycode group by country.code having num_languages >= 3	world_1
select country.name, count(countrylanguage.language) as num_languages from country inner join countrylanguage on country.code = countrylanguage.countrycode group by country.code having num_languages > 2	world_1
select district, count(*) as num_cities from city where population > (select avg(population) from city) group by district	world_1
select district, count(*) as num_cities from city where population > (select avg(population) from city) group by district	world_1
select governmentform, sum(population) as total_population from country where lifeexpectancy > 72 group by governmentform	world_1
select governmentform, sum(population) as total_population from country where lifeexpectancy > 72 group by governmentform	world_1
select continent, avg(lifeexpectancy), sum(population) from country where lifeexpectancy < 72 group by continent	world_1
select continent, sum(population) as total_population, avg(lifeexpectancy) as avg_life_expectancy from country where continent in (  select continent  from country  group by continent  having avg(lifeexpectancy) < 72 ) group by continent	world_1
select name, surfacearea from country order by surfacearea desc limit 5	world_1
select name, surfacearea from country order by surfacearea desc limit 5	world_1
select name from country order by population desc limit 3	world_1
select name from country order by population desc limit 3	world_1
select name from country order by population asc limit 3	world_1
select name from country order by population limit 3	world_1
select count(*) from country where continent = 'Asia'	world_1
select count(*) from country where continent = 'Asia'	world_1
select name from country where continent = 'Europe' and population = 80000	world_1
select name from country where continent = 'Europe' and population = 80000	world_1
select sum(population), avg(surfacearea)  from country  where continent = 'North America' and surfacearea > 3000	world_1
select sum(population), avg(surfacearea) from country where continent = 'North America' and surfacearea > 3000	world_1
select * from city where population between 160000 and 900000	world_1
select name from city where population between 160000 and 900000	world_1
select language, count(distinct countrycode) as num_countries from countrylanguage group by language order by num_countries desc limit 1	world_1
select language, count(distinct countrycode) as num_countries from countrylanguage group by language order by num_countries desc limit 1	world_1
select country.name, countrylanguage.language from country inner join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.percentage = (  select max(percentage)  from countrylanguage  where countrycode = country.code )	world_1
select country.code, countrylanguage.language from country inner join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.percentage = (  select max(percentage)  from countrylanguage  where countrylanguage.countrycode = country.code ) order by country.code	world_1
select count(*) from ( select countrycode, max(percentage) as max_percentage from countrylanguage where language = 'Spanish' group by countrycode having max_percentage = ( select max(percentage) from countrylanguage where language = 'Spanish' ) ) as temp	world_1
select count(*) from countrylanguage where language = 'Spanish' and isofficial = 'T'	world_1
select countrycode from countrylanguage where language = 'Spanish' order by percentage desc limit 1	world_1
select countrycode from countrylanguage where language = "Spanish" and percentage > 50	world_1
select count(*) from conductor	orchestra
select count(*) from conductor	orchestra
select name from conductor order by age asc	orchestra
select name from conductor order by age	orchestra
select name from conductor where nationality != "USA"	orchestra
select name from conductor where nationality != "USA"	orchestra
select orchestra.record_company from orchestra order by orchestra.year_of_founded desc	orchestra
select record_company, year_of_founded from orchestra order by year_of_founded desc	orchestra
select avg(attendance) from show	orchestra
select avg(attendance) from show	orchestra
select max(share), min(share) from performance where type != "Live final"	orchestra
select max(share), min(share) from performance where type != "Live final"	orchestra
select count(distinct nationality) from conductor	orchestra
select count(distinct nationality) from conductor	orchestra
select name from conductor order by year_of_work desc	orchestra
select name from conductor order by year_of_work desc	orchestra
select name from conductor where year_of_work = (select max(year_of_work) from conductor)	orchestra
select name from conductor where year_of_work = (select max(year_of_work) from conductor)	orchestra
select conductor.name, orchestra.orchestra from conductor inner join orchestra on conductor.conductor_id = orchestra.conductor_id	orchestra
select conductor.name, orchestra.orchestra from conductor inner join orchestra on conductor.conductor_id = orchestra.conductor_id	orchestra
select c.name from conductor c inner join orchestra o on c.conductor_id = o.conductor_id group by c.name having count(distinct o.orchestra_id) > 1	orchestra
select conductor.name from conductor inner join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.name having count(distinct orchestra.orchestra_id) > 1	orchestra
select c.name from conductor c join orchestra o on c.conductor_id = o.conductor_id group by c.name order by count(distinct o.orchestra_id) desc limit 1	orchestra
select conductor.name, count(orchestra.conductor_id) as num_orchestras from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by num_orchestras desc limit 1	orchestra
select c.name from conductor c join orchestra o on c.conductor_id = o.conductor_id where o.year_of_founded > 2008	orchestra
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008	orchestra
select record_company, count(distinct orchestra_id) as num_orchestras from orchestra group by record_company	orchestra
select record_company, count(distinct orchestra_id) as num_orchestras from orchestra group by record_company	orchestra
select major_record_format, count(*) as count from orchestra group by major_record_format order by count asc	orchestra
select major_record_format, count(*) as frequency from orchestra group by major_record_format order by frequency desc	orchestra
select record_company, count(distinct orchestra_id) as num_orchestras from orchestra group by record_company order by num_orchestras desc limit 1	orchestra
select record_company, count(distinct orchestra_id) as num_orchestras from orchestra group by record_company order by num_orchestras desc limit 1	orchestra
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)	orchestra
select orchestra.orchestra from orchestra left join performance on orchestra.orchestra_id = performance.orchestra_id where performance.performance_id is null	orchestra
select distinct record_company from orchestra where year_of_founded < 2003 or year_of_founded > 2003	orchestra
select distinct o1.record_company from orchestra o1 inner join orchestra o2 on o1.record_company = o2.record_company where o1.year_of_founded < 2003 and o2.year_of_founded > 2003	orchestra
select count(distinct orchestra_id) from orchestra where major_record_format in ('CD', 'DVD')	orchestra
select count(distinct orchestra_id) from orchestra where major_record_format in ('CD', 'DVD')	orchestra
select distinct year_of_founded from orchestra where orchestra_id in (  select orchestra_id  from performance  group by orchestra_id  having count(*) > 1 )	orchestra
select distinct orchestra.year_of_founded from orchestra inner join performance on orchestra.orchestra_id = performance.orchestra_id group by orchestra.orchestra_id having count(distinct performance.performance_id) > 1	orchestra
select count(*) from highschooler	network_1
select count(*) from highschooler	network_1
select name, grade from highschooler	network_1
select name, grade from highschooler	network_1
select grade from highschooler	network_1
select name, grade from highschooler	network_1
select grade from highschooler where name = "Kyle"	network_1
select grade from highschooler where name = 'Kyle'	network_1
select name from highschooler where grade = 10	network_1
select name from highschooler where grade = 10	network_1
select id from highschooler where name = "Kyle"	network_1
select There is no information provided in the tables about a person named Kyle, so it is not possible to determine their id.	network_1
select count(*) from highschooler where grade in (9,10)	network_1
select count(*) from highschooler where grade in (9,10)	network_1
select grade, count(*) as num_highschoolers from highschooler group by grade	network_1
select grade, count(*) from highschooler group by grade	network_1
select grade, count(*) as count from highschooler group by grade order by count desc limit 1	network_1
select grade, count(*) as num_highschoolers from highschooler group by grade order by num_highschoolers desc limit 1	network_1
select grade, count(*) as num_students from highschooler group by grade having num_students >= 4	network_1
select grade, count(*) as num_students from highschooler group by grade having num_students >= 4	network_1
select friend.student_id, count(friend.friend_id) as num_friends from friend group by friend.student_id	network_1
select highschooler.id, count(friend.friend_id) as num_friends from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id	network_1
select highschooler.name, count(friend.friend_id) as num_friends from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id	network_1
select highschooler.name, count(friend.friend_id) as num_friends from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id	network_1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id order by count(friend.friend_id) desc limit 1	network_1
select name from highschooler where id = (  select student_id from friend  group by student_id  order by count(friend_id) desc  limit 1 )	network_1
select h.name from highschooler h inner join friend f on h.id = f.student_id group by h.id having count(distinct f.friend_id) >= 3	network_1
select name from highschooler where id in ( select student_id from friend group by student_id having count(friend_id) >= 3 )	network_1
select h.name from highschooler h join friend f on h.id = f.friend_id join highschooler k on k.id = f.student_id where k.name = 'Kyle'	network_1
select name  from highschooler  where id in (  select friend_id   from friend   where student_id = (   select id    from highschooler    where name = 'Kyle'  ) )	network_1
select count(*) from friend where student_id = (select id from highschooler where name = "Kyle")	network_1
select count(*) from friend where student_id = (select id from highschooler where name = "Kyle")	network_1
select id from highschooler where id not in (select student_id from friend) and id not in (select friend_id from friend)	network_1
select id from highschooler where id not in (select student_id from friend union select friend_id from friend)	network_1
select name from highschooler where id not in (select student_id from friend) and id not in (select friend_id from friend)	network_1
select h.name from highschooler h where h.id not in (select f.student_id from friend f) and h.id not in (select f.friend_id from friend f)	network_1
select distinct h.id from highschooler h inner join friend f on h.id = f.student_id inner join likes l on h.id = l.liked_id	network_1
select distinct f.student_id from friend f inner join likes l on f.student_id = l.student_id and f.friend_id = l.liked_id	network_1
select distinct h.name from highschooler h inner join friend f on h.id = f.student_id inner join likes l on h.id = l.liked_id	network_1
select distinct h.name from highschooler h inner join friend f on h.id = f.student_id inner join likes l on h.id = l.student_id where h.id in (select friend_id from friend) and h.id in (select liked_id from likes)	network_1
select student_id, count(liked_id) as num_likes from likes group by student_id	network_1
select student_id, count(*) as num_likes from likes group by student_id	network_1
select highschooler.name, count(likes.liked_id) as num_likes from highschooler join likes on highschooler.id = likes.student_id group by highschooler.name	network_1
select highschooler.name, count(likes.liked_id) as num_likes from highschooler inner join likes on highschooler.id = likes.student_id group by highschooler.name	network_1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by highschooler.id order by count(likes.liked_id) desc limit 1	network_1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id order by count(likes.liked_id) desc limit 1	network_1
select h.name from highschooler h inner join likes l on h.id = l.student_id group by h.id having count(distinct l.liked_id) >= 2	network_1
select name from highschooler where id in ( select student_id from likes group by student_id having count(*) >= 2 )	network_1
select h.name from highschooler h inner join friend f on h.id = f.student_id where h.grade > 5 group by h.id having count(distinct f.friend_id) >= 2	network_1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.grade > 5 group by highschooler.id having count(distinct friend.friend_id) >= 2	network_1
select count(*) from likes where student_id = (select id from highschooler where name = "Kyle")	network_1
select count(*) from likes where student_id = (select id from highschooler where name = "Kyle")	network_1
select avg(h.grade)  from highschooler h  inner join friend f on h.id = f.student_id or h.id = f.friend_id	network_1
select avg(h.grade)  from highschooler h  join friend f on h.id = f.student_id or h.id = f.friend_id	network_1
select min(grade) from highschooler where id not in (select student_id from friend union select friend_id from friend)	network_1
select min(grade) from highschooler where id not in (select student_id from friend union select friend_id from friend)	network_1
select distinct o.state from owners o inner join professionals p on o.state = p.state	dog_kennels
select distinct owners.state from owners inner join professionals on owners.state = professionals.state	dog_kennels
select avg(cast(age as integer)) from dogs where dog_id in (select dog_id from treatments)	dog_kennels
select avg(cast(age as integer)) from dogs where dog_id in (select dog_id from treatments)	dog_kennels
select professionals.professional_id, professionals.last_name, professionals.cell_number from professionals inner join treatments on professionals.professional_id = treatments.professional_id where professionals.state = 'Indiana' or (select count(*) from treatments where treatments.professional_id = professionals.professional_id) > 2	dog_kennels
select professional_id, last_name, cell_number  from professionals  where state = 'Indiana' or professional_id in (  select professional_id   from treatments   group by professional_id   having count(*) > 2 )	dog_kennels
select dogs.name from dogs inner join treatments on dogs.dog_id = treatments.dog_id where treatments.cost_of_treatment <= 1000 group by dogs.name	dog_kennels
select dogs.name from dogs inner join treatments on dogs.dog_id = treatments.dog_id where treatments.cost_of_treatment <= 1000 group by dogs.name having sum(treatments.cost_of_treatment) <= 1000	dog_kennels
select distinct owners.first_name as name from owners left join dogs on owners.owner_id = dogs.owner_id left join professionals on owners.first_name = professionals.first_name where dogs.name is null and professionals.first_name is not null union select distinct professionals.first_name as name from professionals left join owners on professionals.first_name = owners.first_name left join dogs on owners.owner_id = dogs.owner_id where dogs.name is null and owners.first_name is not null	dog_kennels
select distinct owners.first_name from owners left join dogs on owners.owner_id = dogs.owner_id left join professionals on owners.first_name = professionals.first_name where dogs.name is null and professionals.first_name is not null union select distinct professionals.first_name from professionals left join owners on professionals.first_name = owners.first_name left join dogs on owners.owner_id = dogs.owner_id where dogs.name is null and owners.first_name is not null	dog_kennels
select professionals.professional_id, professionals.role_code, professionals.email_address from professionals left join treatments on professionals.professional_id = treatments.professional_id where treatments.treatment_id is null	dog_kennels
select professionals.professional_id, professionals.role_code, professionals.email_address from professionals left join treatments on professionals.professional_id = treatments.professional_id where treatments.treatment_id is null	dog_kennels
select owners.owner_id, owners.first_name, owners.last_name from owners inner join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count(dogs.dog_id) desc limit 1	dog_kennels
select owners.owner_id, owners.first_name, owners.last_name from owners inner join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count(dogs.dog_id) desc limit 1	dog_kennels
select professionals.professional_id, professionals.role_code, professionals.first_name from professionals inner join treatments on professionals.professional_id = treatments.professional_id group by treatments.professional_id having count(*) >= 2	dog_kennels
select professionals.professional_id, professionals.role_code, professionals.first_name from professionals inner join treatments on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count(*) >= 2	dog_kennels
select breeds.breed_name, count(dogs.breed_code) as num_dogs from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_name order by num_dogs desc limit 1	dog_kennels
select breed_name from breeds where breed_code = (  select breed_code  from dogs  group by breed_code  order by count(*) desc  limit 1 )	dog_kennels
select owners.owner_id, owners.last_name from owners inner join dogs on owners.owner_id = dogs.owner_id inner join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by sum(treatments.cost_of_treatment) desc limit 1	dog_kennels
select owners.owner_id, owners.last_name from owners inner join dogs on owners.owner_id = dogs.owner_id inner join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by sum(treatments.cost_of_treatment) desc limit 1	dog_kennels
select treatment_type_description, sum(cost_of_treatment) as total_cost from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by total_cost asc limit 1	dog_kennels
select treatment_type_description from treatment_types where treatment_type_code = (  select treatment_type_code  from treatments  group by treatment_type_code  order by sum(cost_of_treatment)  limit 1 )	dog_kennels
select owners.owner_id, owners.zip_code, sum(charges.charge_amount) as total_paid from owners inner join dogs on owners.owner_id = dogs.owner_id inner join treatments on dogs.dog_id = treatments.dog_id inner join charges on treatments.treatment_type_code = charges.charge_type group by owners.owner_id order by total_paid desc limit 1	dog_kennels
select owners.owner_id, owners.zip_code, sum(charges.charge_amount) as total_spent from owners inner join dogs on owners.owner_id = dogs.owner_id inner join treatments on dogs.dog_id = treatments.dog_id inner join charges on treatments.treatment_type_code = charges.charge_type group by owners.owner_id order by total_spent desc limit 1	dog_kennels
select professionals.professional_id, professionals.cell_number from treatments inner join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count(distinct treatments.treatment_type_code) >= 2	dog_kennels
select p.professional_id, p.cell_number from professionals p inner join treatments t on p.professional_id = t.professional_id group by p.professional_id having count(distinct t.treatment_type_code) >= 2	dog_kennels
select professionals.first_name, professionals.last_name from professionals inner join treatments on treatments.professional_id = professionals.professional_id where treatments.cost_of_treatment < (select avg(cost_of_treatment) from treatments)	dog_kennels
select distinct first_name, last_name from professionals where professional_id in (  select professional_id  from treatments  where cost_of_treatment < (   select avg(cost_of_treatment)   from treatments  ) )	dog_kennels
select treatments.date_of_treatment, professionals.first_name from treatments inner join professionals on treatments.professional_id = professionals.professional_id	dog_kennels
select treatments.date_of_treatment, professionals.first_name from treatments inner join professionals on treatments.professional_id = professionals.professional_id	dog_kennels
select treatments.cost_of_treatment, treatment_types.treatment_type_description from treatments inner join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select treatments.cost_of_treatment, treatment_types.treatment_type_description from treatments inner join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select owners.first_name, owners.last_name, sizes.size_description from owners inner join dogs on owners.owner_id = dogs.owner_id inner join sizes on dogs.size_code = sizes.size_code	dog_kennels
select owners.first_name, owners.last_name, sizes.size_description from owners join dogs on owners.owner_id = dogs.owner_id join sizes on dogs.size_code = sizes.size_code	dog_kennels
select owners.first_name, dogs.name from owners inner join dogs on owners.owner_id = dogs.owner_id	dog_kennels
select owners.first_name, dogs.name from owners inner join dogs on owners.owner_id = dogs.owner_id	dog_kennels
select dogs.name, treatments.date_of_treatment from dogs inner join breeds on dogs.breed_code = breeds.breed_code inner join treatments on dogs.dog_id = treatments.dog_id where breeds.breed_name = (select breed_name from breeds order by breed_code limit 1) order by treatments.date_of_treatment	dog_kennels
select dogs.name, treatments.date_of_treatment from dogs inner join treatments on dogs.dog_id = treatments.dog_id where dogs.breed_code = (select breed_code from breeds order by breed_code limit 1) order by treatments.date_of_treatment	dog_kennels
select owners.first_name, dogs.name from owners inner join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'	dog_kennels
select owners.first_name, dogs.name from owners inner join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'	dog_kennels
select dogs.date_arrived, dogs.date_departed from dogs inner join treatments on dogs.dog_id = treatments.dog_id	dog_kennels
select dogs.date_arrived, dogs.date_departed, treatments.date_of_treatment from dogs inner join treatments on dogs.dog_id = treatments.dog_id	dog_kennels
select o.last_name from owners o join dogs d on o.owner_id = d.owner_id where d.date_of_birth = (select min(date_of_birth) from dogs) limit 1	dog_kennels
select owners.last_name from dogs join owners on dogs.owner_id = owners.owner_id where date_of_birth = (select min(date_of_birth) from dogs) limit 1	dog_kennels
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'	dog_kennels
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'	dog_kennels
select date_arrived, date_departed from dogs	dog_kennels
select date_arrived, date_departed from dogs	dog_kennels
select count(distinct dog_id) from treatments	dog_kennels
select count(distinct dog_id) from treatments	dog_kennels
select count(distinct professional_id) from treatments	dog_kennels
select count(distinct professional_id) from treatments	dog_kennels
select role_code, street, city, state from professionals where city like '%West%'	dog_kennels
select role_code, street, city, state from professionals where city like '%West%'	dog_kennels
select first_name, last_name, email_address from owners where state like '%North%'	dog_kennels
select first_name, last_name, email_address from owners where state like '%North%'	dog_kennels
select count(*) from dogs where age < (select avg(age) from dogs)	dog_kennels
select count(*) from dogs where age < (select avg(cast(age as integer)) from dogs)	dog_kennels
select max(cost_of_treatment) from treatments	dog_kennels
select cost_of_treatment from treatments order by date_of_treatment desc limit 1	dog_kennels
select count(*) from dogs where dog_id not in (select dog_id from treatments)	dog_kennels
select count(*) from dogs where dog_id not in (select dog_id from treatments)	dog_kennels
select count(*) from owners o left join dogs d on o.owner_id = d.owner_id where d.dog_id is null	dog_kennels
select count(*) from owners where owner_id not in (select owner_id from dogs where date_adopted is null and date_departed is null)	dog_kennels
select count(*) from professionals where professional_id not in (select professional_id from treatments)	dog_kennels
select count(*) from professionals where professional_id not in (select professional_id from treatments)	dog_kennels
select name, age, weight from dogs where abandoned_yn = '1'	dog_kennels
select name, age, weight from dogs where abandoned_yn = 1	dog_kennels
select avg(age) from dogs	dog_kennels
select avg(age) from dogs	dog_kennels
select max(age) from dogs	dog_kennels
select max(age) from dogs	dog_kennels
select charge_type, charge_amount from charges	dog_kennels
select charge_type, charge_amount from charges	dog_kennels
select max(charge_amount) from charges	dog_kennels
select max(charge_amount) from charges	dog_kennels
select email_address, cell_number, home_phone from professionals	dog_kennels
select email_address, cell_number, home_phone from professionals	dog_kennels
select breeds.breed_name, sizes.size_description from breeds, sizes	dog_kennels
select distinct breed_code, size_code from dogs	dog_kennels
select professionals.first_name, treatment_types.treatment_type_description from professionals inner join treatments on professionals.professional_id = treatments.professional_id inner join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
select professionals.first_name, treatment_types.treatment_type_description from professionals join treatments on treatments.professional_id = professionals.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code	dog_kennels
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
select name from singer order by net_worth_millions desc limit 1	singer
select citizenship, count(*) as num_singers from singer group by citizenship	singer
select citizenship, count(*) as num_singers from singer group by citizenship	singer
select citizenship, count(*) as count from singer group by citizenship order by count desc limit 1	singer
select citizenship, count(*) as count from singer group by citizenship order by count desc limit 1	singer
select citizenship, max(net_worth_millions) as max_net_worth from singer group by citizenship	singer
select citizenship, max(net_worth_millions)  from singer  group by citizenship	singer
select song.title, singer.name from song join singer on song.singer_id = singer.singer_id	singer
select song.title, singer.name from song join singer on song.singer_id = singer.singer_id	singer
select distinct s.name from singer s inner join song so on s.singer_id = so.singer_id where so.sales > 300000	singer
select singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000	singer
select s.name from singer s inner join song so on s.singer_id = so.singer_id group by s.singer_id having count(so.song_id) > 1	singer
select s.name from singer s inner join song so on s.singer_id = so.singer_id group by s.singer_id having count(so.song_id) > 1	singer
select singer.name, sum(song.sales) as total_sales from singer join song on singer.singer_id = song.singer_id group by singer.name	singer
select singer.name, sum(song.sales) as total_sales from singer join song on singer.singer_id = song.singer_id group by singer.name	singer
select singer.name from singer left join song on singer.singer_id = song.singer_id where song.singer_id is null	singer
select name from singer where singer_id not in (select singer_id from song)	singer
select citizenship  from singer  where birth_year < 1945 or birth_year > 1955	singer
select distinct citizenship from singer where birth_year < 1945 or birth_year > 1955	singer
select count(*) from other_available_features	real_estate_properties
select feature_type_name from ref_feature_types inner join other_available_features on ref_feature_types.feature_type_code = other_available_features.feature_type_code where feature_name = 'AirCon'	real_estate_properties
select ref_property_types.property_type_description from properties inner join ref_property_types on properties.property_type_code = ref_property_types.property_type_code where properties.property_type_code = "House"	real_estate_properties
select property_name from properties where property_type_code in ('House', 'Apartment') and room_count > 1	real_estate_properties
