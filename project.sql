create table brand(
    id serial primary key,
    name varchar(20) not null
);

create table model(
    id serial primary key,
    brand_id integer references brand(id),
    name varchar(20) not null
);

create table body_style(
    id serial primary key,
    model_id integer references model(id),
    name varchar(20) not null
);


create table color_type(
    id serial primary key,
    type varchar(20) not null
);

create table engine_type(
    id serial primary key,
    tact varchar(20) not null,
    work_volume_cubic_cm integer not null,
    number_of_valves integer not null,
    cooling_system varchar(20) not null
);

create table transmission_type(
    id serial primary key,
    type varchar(25) not null
);

create table vehicle(
    VIN serial primary key,
    type_id integer references body_style(id),
    color_option integer references color_type(id),
    engine_option integer references engine_type(id),
    transmisson_option integer references transmission_type(id)
);

create table vehicle_part(
    id serial primary key,
    part varchar(20) not null
);

create table vendor(
    id serial primary key,
    part_id integer references vehicle_part(id),
    certain_model integer references body_style(id)
);

create table part_factory(
    id serial primary key,
    part_id integer references vehicle_part(id),
    certain_model integer references body_style(id)
);

create table final_assemble_factory(
    id serial primary key,
    state varchar(20) not null,
    city varchar(10) not null,
    street varchar(10) not null,
    street_number integer not null
);

create table final_assemble(
    id serial primary key,
    factory_id integer references final_assemble_factory(id),
    part_1 integer references vendor(id),
    part_2 integer references part_factory(id),
    assemble_date timestamp not null
);

create table customer(
    id serial primary key,
    name varchar(20) not null,
    state varchar(20) not null,
    city varchar(10) not null,
    street varchar(10) not null,
    street_number integer not null,
    phone_number varchar(14),
    gender varchar(6) not null,
    income text
);

create table dealer(
    id serial primary key,
    name varchar(20) not null,
    phone_number varchar(14),
    email varchar(30)
);

create table warehouse(
    id serial primary key,
    dealer_id integer references dealer(id),
    state varchar(20) not null,
    city varchar(10) not null,
    street varchar(10) not null,
    street_number integer not null
);

create table buy(
    id serial primary key,
    model_id integer references body_style(id),
    warehouse_id integer references warehouse(id),
    time_of_purchase timestamp not null
);

create table for_sale(
    warehouse_id integer references warehouse(id),
    model_id integer primary key references body_style(id),
    delivery_time timestamp not null,
    pick_up_time timestamp
);

create table preserve(
    warehouse_id integer references warehouse(id),
    model_id integer primary key references body_style(id)
);

create table order_1(
    id serial primary key,
    customer_id integer references customer(id),
    order_time timestamp not null,
    total_price numeric default 0
);

create table order_item(
    id serial primary key,
    vehicle_id integer references for_sale(model_id) not null,
    quantity integer default 0,
    price numeric,
    order_id integer references order_1(id) not null
);



-- drop database kbtu_project;
-- create database kbtu_project;



insert into dealer(name, phone_number, email) values('Timokha', '+1-423-5634500', 'timokha@gmail.com');
insert into dealer(name, phone_number, email) values('Johny', '+1-978-5678900', 'johny@gmail.com');
insert into dealer(name, phone_number, email) values('Andrew', '+1-543-5678900', 'andrew@gmail.com');
insert into dealer(name, phone_number, email) values('Bob', '+1-756-5678900', 'bob@gmail.com');
insert into dealer(name, phone_number, email) values('Martin', '+1-234-5634500', 'martin@gmail.com');
insert into dealer(name, phone_number, email) values('Queen', '+1-234-5678234', 'queen@gmail.com');
insert into dealer(name, phone_number, email) values('Elizabeth', '+1-234-1328900', 'elza@gmail.com');
insert into dealer(name, phone_number, email) values('Jenipher', '+1-234-5634900', 'jenipher@gmail.com');
insert into dealer(name, phone_number, email) values('Catrin', '+1-234-3478900', 'cat@gmail.com');


insert into brand(name) values('Volkswagen');
insert into brand(name) values('Audi');
insert into brand(name) values('Lamborghini');
insert into brand(name) values('Bentley');
insert into brand(name) values('Bugatti');
insert into brand(name) values('Skoda');
insert into brand(name) values('SEAT');


insert into model(brand_id, name) values(1, 'Taos');
insert into model(brand_id, name) values(1, 'Polo');
insert into model(brand_id, name) values(1, 'Passat');
insert into model(brand_id, name) values(1, 'Tiguan');
insert into model(brand_id, name) values(1, 'Amarok');
insert into model(brand_id, name) values(1, 'Iltis');
insert into model(brand_id, name) values(1, 'Jetta');
insert into model(brand_id, name) values(1, 'Scirocco');
insert into model(brand_id, name) values(1, 'Gol');
insert into model(brand_id, name) values(1, 'Golf');
insert into model(brand_id, name) values(1, 'Sharan');

insert into model(brand_id, name) values(2, 'S1');
insert into model(brand_id, name) values(2, 'TTS');
insert into model(brand_id, name) values(2, 'RS4');
insert into model(brand_id, name) values(2, 'SQ5');
insert into model(brand_id, name) values(2, 'S8');
insert into model(brand_id, name) values(2, 'A1');
insert into model(brand_id, name) values(2, 'S6');
insert into model(brand_id, name) values(2, 'A8');
insert into model(brand_id, name) values(2, 'Q7');
insert into model(brand_id, name) values(2, 'A6');

insert into model(brand_id, name) values(3, 'Reventón');
insert into model(brand_id, name) values(3, 'Aventador');
insert into model(brand_id, name) values(3, 'Veneno');
insert into model(brand_id, name) values(3, 'Huracán');
insert into model(brand_id, name) values(3, 'Centenario');
insert into model(brand_id, name) values(3, 'Urus');
insert into model(brand_id, name) values(3, 'Gallardo');
insert into model(brand_id, name) values(3, 'Asterion');
insert into model(brand_id, name) values(3, 'Marzal');
insert into model(brand_id, name) values(3, 'Estoque');

insert into model(brand_id, name) values(4, 'Azure');
insert into model(brand_id, name) values(4, 'Mulsanne');
insert into model(brand_id, name) values(4, 'Bentayga');
insert into model(brand_id, name) values(4, 'Zagato');
insert into model(brand_id, name) values(4, 'Dominator');
insert into model(brand_id, name) values(4, 'CONTINENTAL');
insert into model(brand_id, name) values(4, 'ArnageT');
insert into model(brand_id, name) values(4, 'SPUR');
insert into model(brand_id, name) values(4, 'SUPERSPORTS');

insert into model(brand_id, name) values(5, 'Veyron');
insert into model(brand_id, name) values(5, 'Chiron');
insert into model(brand_id, name) values(5, 'Divo');
insert into model(brand_id, name) values(5, 'Centodieci');
insert into model(brand_id, name) values(5, 'VisionGranTurismo');
insert into model(brand_id, name) values(5, 'EB110');
insert into model(brand_id, name) values(5, 'Galibier');
insert into model(brand_id, name) values(5, 'EB118');
insert into model(brand_id, name) values(5, 'EB112');
insert into model(brand_id, name) values(5, 'LaVoitureNoire');

insert into model(brand_id, name) values(6, 'Citigo');
insert into model(brand_id, name) values(6, 'Fabia');
insert into model(brand_id, name) values(6, 'Rapid');
insert into model(brand_id, name) values(6, 'Scala');
insert into model(brand_id, name) values(6, 'Octavia');
insert into model(brand_id, name) values(6, 'Superb');
insert into model(brand_id, name) values(6, 'Kamiq');
insert into model(brand_id, name) values(6, 'Karoq');
insert into model(brand_id, name) values(6, 'Kodiaq');

insert into model(brand_id, name) values(7, 'Ateca');
insert into model(brand_id, name) values(7, 'Arona');
insert into model(brand_id, name) values(7, 'Alhambra');
insert into model(brand_id, name) values(7, 'Ibiza');
insert into model(brand_id, name) values(7, 'León');
insert into model(brand_id, name) values(7, 'Mii');
insert into model(brand_id, name) values(7, 'Toledo');
insert into model(brand_id, name) values(7, 'Arosa');
insert into model(brand_id, name) values(7, 'Fura');
insert into model(brand_id, name) values(7, 'Cordoba');
insert into model(brand_id, name) values(7, 'Inca');
insert into model(brand_id, name) values(7, 'Panda');


insert into body_style(model_id, name) values(10, 'Sedan');
insert into body_style(model_id, name) values(14, 'Hatchback');
insert into body_style(model_id, name) values(13, 'Liftback');
insert into body_style(model_id, name) values(12, 'Sedan');
insert into body_style(model_id, name) values(15, 'Crossover');
insert into body_style(model_id, name) values(11, 'Wagon');
insert into body_style(model_id, name) values(12, 'Сonvertible');
insert into body_style(model_id, name) values(19, 'Limousine');
insert into body_style(model_id, name) values(9, 'Hatchback');
insert into body_style(model_id, name) values(8, 'Liftback');
insert into body_style(model_id, name) values(1, 'Wagon');
insert into body_style(model_id, name) values(5, 'Sedan');
insert into body_style(model_id, name) values(2, 'Crossover');
insert into body_style(model_id, name) values(3, 'Limousine');
insert into body_style(model_id, name) values(4, 'Hatchback');
insert into body_style(model_id, name) values(7, 'Limousine');
insert into body_style(model_id, name) values(16, 'Сonvertible');
insert into body_style(model_id, name) values(18, 'Wagon');
insert into body_style(model_id, name) values(20, 'Sedan');
insert into body_style(model_id, name) values(17, 'Liftback');
insert into body_style(model_id, name) values(30, 'Limousine');
insert into body_style(model_id, name) values(21, 'Hatchback');
insert into body_style(model_id, name) values(25, 'Crossover');
insert into body_style(model_id, name) values(37, 'Wagon');
insert into body_style(model_id, name) values(22, 'Coupe');
insert into body_style(model_id, name) values(28, 'Hatchback');
insert into body_style(model_id, name) values(27, 'Limousine');
insert into body_style(model_id, name) values(24, 'Liftback');
insert into body_style(model_id, name) values(26, 'Pickup');
insert into body_style(model_id, name) values(23, 'Wagon');
insert into body_style(model_id, name) values(29, 'Sedan');
insert into body_style(model_id, name) values(40, 'Coupe');
insert into body_style(model_id, name) values(47, 'Limousine');
insert into body_style(model_id, name) values(45, 'Hatchback');
insert into body_style(model_id, name) values(41, 'Сonvertible');
insert into body_style(model_id, name) values(49, 'Limousine');
insert into body_style(model_id, name) values(42, 'Sedan');
insert into body_style(model_id, name) values(48, 'Wagon');
insert into body_style(model_id, name) values(44, 'Crossover');
insert into body_style(model_id, name) values(43, 'Hatchback');
insert into body_style(model_id, name) values(46, 'Coupe');
insert into body_style(model_id, name) values(50, 'Wagon');
insert into body_style(model_id, name) values(60, 'Sedan');
insert into body_style(model_id, name) values(55, 'Сonvertible');
insert into body_style(model_id, name) values(51, 'Limousine');
insert into body_style(model_id, name) values(59, 'Hatchback');
insert into body_style(model_id, name) values(57, 'Pickup');
insert into body_style(model_id, name) values(54, 'Crossover');
insert into body_style(model_id, name) values(52, 'Wagon');
insert into body_style(model_id, name) values(53, 'Hatchback');
insert into body_style(model_id, name) values(56, 'Сonvertible');
insert into body_style(model_id, name) values(58, 'Sedan');
insert into body_style(model_id, name) values(61, 'Coupe');
insert into body_style(model_id, name) values(69, 'Wagon');
insert into body_style(model_id, name) values(66, 'Сonvertible');
insert into body_style(model_id, name) values(68, 'Sedan');
insert into body_style(model_id, name) values(62, 'Сonvertible');
insert into body_style(model_id, name) values(64, 'Wagon');
insert into body_style(model_id, name) values(65, 'Coupe');
insert into body_style(model_id, name) values(67, 'Sedan');
insert into body_style(model_id, name) values(71, 'Pickup');
insert into body_style(model_id, name) values(70, 'Сonvertible');
insert into body_style(model_id, name) values(12, 'Wagon');
insert into body_style(model_id, name) values(41, 'Coupe');
insert into body_style(model_id, name) values(65, 'Wagon');
insert into body_style(model_id, name) values(1, 'Sedan');


insert into color_type(type) values('Scarlet');
insert into color_type(type) values('Beige');
insert into color_type(type) values('White');
insert into color_type(type) values('Brown');
insert into color_type(type) values('Yellow');
insert into color_type(type) values('Blue');
insert into color_type(type) values('Red');
insert into color_type(type) values('Orange');
insert into color_type(type) values('Pink');
insert into color_type(type) values('Gray');
insert into color_type(type) values('Blue');
insert into color_type(type) values('Black');


insert into transmission_type(type) values('mechanical');
insert into transmission_type(type) values('hydromechanical');
insert into transmission_type(type) values('hydrostatic');
insert into transmission_type(type) values('hydraulic');
insert into transmission_type(type) values('electromechanical');


insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('2T', 3600, 8, 'air');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('2T', 2400, 4, 'air - oil');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('4T', 2100, 8, 'liquid');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('2T', 2000, 6, 'air');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('4T', 1700, 10, 'air - oil');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('2T', 1500, 4, 'air');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('4T', 2500, 8, 'liquid');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('2T', 1600, 6, 'air - oil');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('4T', 3600, 6, 'air');
insert into engine_type(tact, work_volume_cubic_cm, number_of_valves, cooling_system) values('4T', 5600, 8, 'liquid');


insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(12, 3, 10, 1);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(41, 6, 4, 2);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(23, 7, 1, 4);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(61, 9, 2, 1);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(12, 12, 6, 2);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(64, 13, 4, 3);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(4, 11, 9, 2);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(14, 10, 7, 1);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(61, 1, 8, 3);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(41, 3, 5, 2);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(15,3, 4, 4);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(1, 5, 2, 4);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(2, 4, 3, 1);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(9, 8, 9, 2);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(8, 7, 8, 2);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(10, 6, 3, 3);
insert into vehicle(type_id, color_option, engine_option, transmisson_option) values(12, 6, 1, 2);


insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person1','state1', 'city1', 'street1', 1, '+4848444656', 'female', 'I am human');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person2', 'state2', 'city2', 'street2', 2, '+4843458446', 'male', 'Hello world');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person3', 'state3', 'city3', 'street3', 3, '+4893446564', 'female', 'I am Daenerys Stormborn, of House Targaryen, of the blood of Old Valyria – I am the mother of dragon.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person4', 'state4', 'city4', 'street4', 2, '+4821458446', 'female', 'When you play the game of thrones, you win or you die.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person5', 'state5', 'city5', 'street5', 2, '+48412458446', 'male', 'Winter is coming.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person6', 'state6', 'city6', 'street6', 2, '+4846558446', 'male', 'A lion doesn’t concern itself with the opinion of sheep.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person7', 'state7', 'city7', 'street7', 2, '+4846458446', 'female', 'The gods have no mercy, that’s why they’re gods.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person8', 'state8', 'city8', 'street8', 2, '+4848758446', 'female', 'Turn us away, and we will burn you first.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person9', 'state9', 'city9', 'street9', 2, '+4849858446', 'female', 'I will do what queens do, I will rule.');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person10', 'state10', 'city10', 'street10', 2, '+4812458446', 'male', 'A girl gives a man his own name?');
insert into customer(name, state, city, street, street_number, phone_number, gender, income) values('person11', 'state11', 'city11', 'street11', 2, '+4851458446', 'male', 'A very small man can cast a very large shadow.');


insert into order_1(customer_id, order_time, total_price) VALUES(5, '2015-1-05 00:00:00.000000', 808);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2019-8-05 00:00:00.000000', 482);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2021-4-05 00:00:00.000000', 564);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2016-3-05 00:00:00.000000', 1888);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2015-6-05 00:00:00.000000', 2710);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2020-10-05 00:00:00.000000', 1398);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-3-05 00:00:00.000000', 796);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2020-6-05 00:00:00.000000', 4494);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2018-1-05 00:00:00.000000', 2640);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2020-3-05 00:00:00.000000', 7940);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2015-5-05 00:00:00.000000', 1872);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2020-2-05 00:00:00.000000', 4140);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2016-7-05 00:00:00.000000', 4032);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-3-05 00:00:00.000000', 4152);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2020-6-05 00:00:00.000000', 11535);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2018-3-05 00:00:00.000000', 2824);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2021-3-05 00:00:00.000000', 1456);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2020-9-05 00:00:00.000000', 3480);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2019-12-05 00:00:00.000000', 10032);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2015-11-05 00:00:00.000000', 4300);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2015-8-05 00:00:00.000000', 1350);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-8-05 00:00:00.000000', 3620);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2020-7-05 00:00:00.000000', 10215);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2020-9-05 00:00:00.000000', 3900);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2021-3-05 00:00:00.000000', 4175);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2015-8-05 00:00:00.000000', 2028);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2019-9-05 00:00:00.000000', 3336);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2021-11-05 00:00:00.000000', 8244);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2021-9-05 00:00:00.000000', 9288);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2017-1-05 00:00:00.000000', 11250);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2017-9-05 00:00:00.000000', 728);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2018-1-05 00:00:00.000000', 3906);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-6-05 00:00:00.000000', 5859);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2017-2-05 00:00:00.000000', 27076);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2021-1-05 00:00:00.000000', 25795);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2020-12-05 00:00:00.000000', 6616);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2016-10-05 00:00:00.000000', 10080);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2020-3-05 00:00:00.000000', 6648);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2017-4-05 00:00:00.000000', 5568);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-1-05 00:00:00.000000', 23640);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2016-5-05 00:00:00.000000', 5769);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2018-4-05 00:00:00.000000', 4194);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2020-6-05 00:00:00.000000', 11610);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2019-1-05 00:00:00.000000', 35208);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2018-1-05 00:00:00.000000', 16785);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2020-7-05 00:00:00.000000', 6520);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2015-8-05 00:00:00.000000', 19660);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2019-12-05 00:00:00.000000', 25290);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2018-11-05 00:00:00.000000', 18480);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2019-1-05 00:00:00.000000', 28000);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2019-6-05 00:00:00.000000', 9801);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2016-7-05 00:00:00.000000', 13794);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2020-12-05 00:00:00.000000', 17919);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2017-6-05 00:00:00.000000', 14784);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2017-6-05 00:00:00.000000', 8800);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2017-11-05 00:00:00.000000', 5496);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2020-5-05 00:00:00.000000', 3144);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2019-10-05 00:00:00.000000', 12492);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2021-2-05 00:00:00.000000', 31584);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2016-7-05 00:00:00.000000', 36600);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2015-5-05 00:00:00.000000', 2158);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2015-10-05 00:00:00.000000', 2860);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2016-2-05 00:00:00.000000', 36075);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2015-8-05 00:00:00.000000', 21528);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2017-7-05 00:00:00.000000', 55510);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2020-7-05 00:00:00.000000', 12558);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2020-12-05 00:00:00.000000', 18816);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2015-10-05 00:00:00.000000', 30786);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-7-05 00:00:00.000000', 31864);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2015-8-05 00:00:00.000000', 48650);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-10-05 00:00:00.000000', 6090);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2015-3-05 00:00:00.000000', 13830);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2018-12-05 00:00:00.000000', 5580);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-2-05 00:00:00.000000', 48480);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2020-10-05 00:00:00.000000', 12375);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2015-4-05 00:00:00.000000', 12144);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2021-1-05 00:00:00.000000', 14048);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2017-8-05 00:00:00.000000', 18624);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-9-05 00:00:00.000000', 24896);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2017-5-05 00:00:00.000000', 42880);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-12-05 00:00:00.000000', 9894);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2017-9-05 00:00:00.000000', 4862);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2018-8-05 00:00:00.000000', 18513);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2017-5-05 00:00:00.000000', 25976);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2021-4-05 00:00:00.000000', 65705);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2016-1-05 00:00:00.000000', 13860);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2021-5-05 00:00:00.000000', 28260);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2020-2-05 00:00:00.000000', 40878);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-3-05 00:00:00.000000', 20016);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2020-3-05 00:00:00.000000', 22410);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2015-7-05 00:00:00.000000', 17138);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2021-2-05 00:00:00.000000', 10450);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2017-7-05 00:00:00.000000', 35682);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2020-4-05 00:00:00.000000', 61864);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2021-1-05 00:00:00.000000', 22990);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2021-1-05 00:00:00.000000', 8340);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2016-4-05 00:00:00.000000', 8680);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-12-05 00:00:00.000000', 6480);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2016-3-05 00:00:00.000000', 66320);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2021-9-05 00:00:00.000000', 33200);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2017-5-05 00:00:00.000000', 19173);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2019-4-05 00:00:00.000000', 10290);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-4-05 00:00:00.000000', 26523);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2020-3-05 00:00:00.000000', 45192);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-4-05 00:00:00.000000', 44205);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2018-12-05 00:00:00.000000', 12078);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2021-4-05 00:00:00.000000', 15576);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2018-4-05 00:00:00.000000', 64746);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2016-10-05 00:00:00.000000', 57464);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2020-8-05 00:00:00.000000', 30030);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2015-3-05 00:00:00.000000', 12788);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2020-9-05 00:00:00.000000', 28428);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-8-05 00:00:00.000000', 66999);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2015-11-05 00:00:00.000000', 13340);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2016-3-05 00:00:00.000000', 26105);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2018-2-05 00:00:00.000000', 14448);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2018-5-05 00:00:00.000000', 37392);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2016-10-05 00:00:00.000000', 21024);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-3-05 00:00:00.000000', 30336);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2017-3-05 00:00:00.000000', 89040);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-6-05 00:00:00.000000', 12525);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-5-05 00:00:00.000000', 29650);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2018-4-05 00:00:00.000000', 34875);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2017-3-05 00:00:00.000000', 53700);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2019-1-05 00:00:00.000000', 104125);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2017-4-05 00:00:00.000000', 20332);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2015-10-05 00:00:00.000000', 39208);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2021-4-05 00:00:00.000000', 55458);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2017-5-05 00:00:00.000000', 99112);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2020-8-05 00:00:00.000000', 107900);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2015-8-05 00:00:00.000000', 14229);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2017-7-05 00:00:00.000000', 20466);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2016-5-05 00:00:00.000000', 56457);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2015-3-05 00:00:00.000000', 14688);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-9-05 00:00:00.000000', 66960);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2016-3-05 00:00:00.000000', 18368);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2021-12-05 00:00:00.000000', 28952);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2015-12-05 00:00:00.000000', 70056);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2018-2-05 00:00:00.000000', 67648);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2019-7-05 00:00:00.000000', 67620);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-1-05 00:00:00.000000', 24853);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2016-1-05 00:00:00.000000', 23200);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-4-05 00:00:00.000000', 76647);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2015-9-05 00:00:00.000000', 29580);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2016-1-05 00:00:00.000000', 88450);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-4-05 00:00:00.000000', 26220);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2016-8-05 00:00:00.000000', 25020);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2019-9-05 00:00:00.000000', 30510);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2018-7-05 00:00:00.000000', 22800);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2019-10-05 00:00:00.000000', 77100);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2021-6-05 00:00:00.000000', 26877);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2019-4-05 00:00:00.000000', 22134);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-2-05 00:00:00.000000', 85281);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2015-6-05 00:00:00.000000', 26040);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2019-2-05 00:00:00.000000', 148335);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2018-8-05 00:00:00.000000', 23520);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2016-12-05 00:00:00.000000', 14848);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2020-6-05 00:00:00.000000', 92448);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2017-11-05 00:00:00.000000', 52864);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2020-2-05 00:00:00.000000', 17440);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2016-5-05 00:00:00.000000', 8382);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2018-6-05 00:00:00.000000', 10230);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2015-10-05 00:00:00.000000', 18117);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-9-05 00:00:00.000000', 60060);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2016-9-05 00:00:00.000000', 154110);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2018-8-05 00:00:00.000000', 24242);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2020-10-05 00:00:00.000000', 63920);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2019-8-05 00:00:00.000000', 21114);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2017-8-05 00:00:00.000000', 65144);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2016-3-05 00:00:00.000000', 28390);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2020-4-05 00:00:00.000000', 29715);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2015-3-05 00:00:00.000000', 62300);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2015-3-05 00:00:00.000000', 16485);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2019-4-05 00:00:00.000000', 15680);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2016-6-05 00:00:00.000000', 95550);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2017-8-05 00:00:00.000000', 18612);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2018-9-05 00:00:00.000000', 9936);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2017-5-05 00:00:00.000000', 24084);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2019-9-05 00:00:00.000000', 32112);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2016-6-05 00:00:00.000000', 115200);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-8-05 00:00:00.000000', 22903);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2019-8-05 00:00:00.000000', 58312);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2016-12-05 00:00:00.000000', 110001);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-10-05 00:00:00.000000', 89096);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2015-3-05 00:00:00.000000', 41255);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2020-7-05 00:00:00.000000', 34352);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2017-5-05 00:00:00.000000', 64752);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2019-4-05 00:00:00.000000', 110580);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2016-9-05 00:00:00.000000', 96216);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2016-3-05 00:00:00.000000', 78850);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2016-8-05 00:00:00.000000', 7332);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2021-11-05 00:00:00.000000', 34710);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2017-12-05 00:00:00.000000', 73593);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2017-12-05 00:00:00.000000', 114036);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2019-6-05 00:00:00.000000', 110175);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-9-05 00:00:00.000000', 38720);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2015-6-05 00:00:00.000000', 76000);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2016-9-05 00:00:00.000000', 17400);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2015-2-05 00:00:00.000000', 91040);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2016-9-05 00:00:00.000000', 50200);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2017-2-05 00:00:00.000000', 10578);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2020-8-05 00:00:00.000000', 81508);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2019-8-05 00:00:00.000000', 14514);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2021-10-05 00:00:00.000000', 79212);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2015-10-05 00:00:00.000000', 145140);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2021-4-05 00:00:00.000000', 22890);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2020-8-05 00:00:00.000000', 43092);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2018-2-05 00:00:00.000000', 108990);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2020-12-05 00:00:00.000000', 71400);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2015-2-05 00:00:00.000000', 85260);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2021-11-05 00:00:00.000000', 38270);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2021-2-05 00:00:00.000000', 29240);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2019-6-05 00:00:00.000000', 34314);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2015-10-05 00:00:00.000000', 116444);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2015-4-05 00:00:00.000000', 200165);
insert into order_1(customer_id, order_time, total_price) VALUES(4, '2019-5-05 00:00:00.000000', 13200);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2019-5-05 00:00:00.000000', 13640);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2018-1-05 00:00:00.000000', 75108);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2019-12-05 00:00:00.000000', 121088);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2021-10-05 00:00:00.000000', 202180);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2020-8-05 00:00:00.000000', 40230);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2020-7-05 00:00:00.000000', 75870);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2016-2-05 00:00:00.000000', 85050);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2019-10-05 00:00:00.000000', 131760);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2016-2-05 00:00:00.000000', 68850);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2016-1-05 00:00:00.000000', 8602);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2015-10-05 00:00:00.000000', 42596);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2017-12-05 00:00:00.000000', 101706);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2016-8-05 00:00:00.000000', 171856);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2020-9-05 00:00:00.000000', 203550);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2016-12-05 00:00:00.000000', 36895);
insert into order_1(customer_id, order_time, total_price) VALUES(9, '2020-6-05 00:00:00.000000', 13348);
insert into order_1(customer_id, order_time, total_price) VALUES(3, '2019-5-05 00:00:00.000000', 66693);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2019-5-05 00:00:00.000000', 101708);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2016-6-05 00:00:00.000000', 201395);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2016-7-05 00:00:00.000000', 32544);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2018-9-05 00:00:00.000000', 21696);
insert into order_1(customer_id, order_time, total_price) VALUES(5, '2021-2-05 00:00:00.000000', 132336);
insert into order_1(customer_id, order_time, total_price) VALUES(7, '2019-8-05 00:00:00.000000', 157632);
insert into order_1(customer_id, order_time, total_price) VALUES(8, '2021-9-05 00:00:00.000000', 86640);
insert into order_1(customer_id, order_time, total_price) VALUES(10, '2016-12-05 00:00:00.000000', 11074);
insert into order_1(customer_id, order_time, total_price) VALUES(1, '2020-4-05 00:00:00.000000', 58604);
insert into order_1(customer_id, order_time, total_price) VALUES(11, '2017-4-05 00:00:00.000000', 76440);
insert into order_1(customer_id, order_time, total_price) VALUES(2, '2015-1-05 00:00:00.000000', 140336);
insert into order_1(customer_id, order_time, total_price) VALUES(6, '2016-9-05 00:00:00.000000', 207760);


insert into order_item(vehicle_id, quantity, price, order_id) values(8, 1, 10, 239);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 2, 20, 172);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 3, 30, 57);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 4, 40, 169);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 5, 50, 233);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 6, 60, 148);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 7, 70, 61);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 1, 20, 166);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 2, 40, 47);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 3, 60, 211);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 4, 80, 67);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 5, 100, 66);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 6, 120, 179);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 7, 140, 41);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 1, 30, 154);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 2, 60, 146);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 3, 90, 116);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 4, 120, 235);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 5, 150, 38);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 6, 180, 7);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 7, 210, 123);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 1, 40, 127);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 2, 80, 66);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 3, 120, 181);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 4, 160, 44);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 5, 200, 205);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 6, 240, 120);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 7, 280, 35);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 1, 50, 60);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 2, 100, 99);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 3, 150, 62);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 4, 200, 4);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 5, 250, 223);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 6, 300, 169);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 7, 350, 59);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 1, 60, 15);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 2, 120, 208);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 3, 180, 69);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 4, 240, 203);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 5, 300, 149);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 6, 360, 244);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 7, 420, 182);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 1, 70, 33);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 2, 140, 163);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 3, 210, 174);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 4, 280, 114);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 5, 350, 60);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 6, 420, 222);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 7, 490, 26);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 1, 80, 111);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 2, 160, 54);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 3, 240, 126);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 4, 320, 137);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 5, 400, 154);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 6, 480, 146);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 7, 560, 198);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 1, 90, 60);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 2, 180, 36);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 3, 270, 25);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 4, 360, 110);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 5, 450, 243);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 6, 540, 50);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 7, 630, 121);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 1, 100, 38);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 2, 200, 79);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 3, 300, 231);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 4, 400, 141);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 5, 500, 168);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 6, 600, 42);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 7, 700, 216);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 1, 110, 229);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 2, 220, 77);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 3, 330, 229);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 4, 440, 228);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 5, 550, 34);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 6, 660, 13);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 7, 770, 65);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 1, 120, 225);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 2, 240, 64);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 3, 360, 222);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 4, 480, 117);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 5, 600, 137);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 6, 720, 40);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 7, 840, 20);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 1, 130, 51);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 2, 260, 38);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 3, 390, 80);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 4, 520, 73);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 5, 650, 18);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 6, 780, 51);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 7, 910, 100);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 1, 140, 214);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 2, 280, 167);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 3, 420, 137);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 4, 560, 48);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 5, 700, 151);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 6, 840, 43);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 7, 980, 89);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 1, 150, 36);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 2, 300, 164);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 3, 450, 149);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 4, 600, 69);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 5, 750, 187);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 6, 900, 213);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 7, 1050, 182);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 1, 160, 53);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 2, 320, 53);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 3, 480, 107);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 4, 640, 102);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 5, 800, 184);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 6, 960, 127);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 7, 1120, 16);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 1, 170, 232);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 2, 340, 92);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 3, 510, 44);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 4, 680, 158);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 5, 850, 61);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 6, 1020, 160);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 7, 1190, 206);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 1, 180, 219);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 2, 360, 211);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 3, 540, 173);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 4, 720, 140);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 5, 900, 230);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 6, 1080, 245);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 7, 1260, 146);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 1, 190, 17);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 2, 380, 164);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 3, 570, 63);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 4, 760, 164);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 5, 950, 36);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 6, 1140, 84);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 7, 1330, 199);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 1, 200, 36);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 2, 400, 210);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 3, 600, 96);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 4, 800, 175);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 5, 1000, 42);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 6, 1200, 179);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 7, 1400, 198);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 1, 210, 212);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 2, 420, 196);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 3, 630, 77);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 4, 840, 219);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 5, 1050, 230);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 6, 1260, 110);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 7, 1470, 31);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 1, 220, 163);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 2, 440, 97);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 3, 660, 210);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 4, 880, 66);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 5, 1100, 94);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 6, 1320, 243);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 7, 1540, 114);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 1, 230, 45);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 2, 460, 32);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 3, 690, 42);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 4, 920, 191);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 5, 1150, 92);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 6, 1380, 226);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 7, 1610, 157);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 1, 240, 93);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 2, 480, 197);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 3, 720, 106);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 4, 960, 228);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 5, 1200, 41);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 6, 1440, 35);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 7, 1680, 77);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 1, 250, 67);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 2, 500, 34);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 3, 750, 14);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 4, 1000, 118);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 5, 1250, 211);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 6, 1500, 41);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 7, 1750, 50);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 1, 260, 57);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 2, 520, 31);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 3, 780, 163);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 4, 1040, 80);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 5, 1300, 29);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 6, 1560, 84);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 7, 1820, 5);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 1, 270, 29);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 2, 540, 124);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 3, 810, 67);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 4, 1080, 13);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 5, 1350, 175);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 6, 1620, 18);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 7, 1890, 17);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 1, 280, 26);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 2, 560, 180);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 3, 840, 37);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 4, 1120, 196);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 5, 1400, 42);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 6, 1680, 126);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 7, 1960, 45);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 1, 290, 167);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 2, 580, 211);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 3, 870, 183);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 4, 1160, 227);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 5, 1450, 98);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 6, 1740, 73);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 7, 2030, 94);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 1, 300, 236);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 2, 600, 94);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 3, 900, 39);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 4, 1200, 166);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 5, 1500, 67);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 6, 1800, 2);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 7, 2100, 217);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 1, 310, 84);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 2, 620, 102);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 3, 930, 72);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 4, 1240, 146);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 5, 1550, 45);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 6, 1860, 189);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 7, 2170, 24);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 1, 320, 106);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 2, 640, 240);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 3, 960, 60);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 4, 1280, 181);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 5, 1600, 195);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 6, 1920, 108);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 7, 2240, 119);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 1, 330, 141);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 2, 660, 60);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 3, 990, 198);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 4, 1320, 165);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 5, 1650, 114);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 6, 1980, 17);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 7, 2310, 158);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 1, 340, 19);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 2, 680, 78);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 3, 1020, 115);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 4, 1360, 90);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 5, 1700, 41);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 6, 2040, 56);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 7, 2380, 227);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 1, 350, 113);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 2, 700, 130);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 3, 1050, 23);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 4, 1400, 124);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 5, 1750, 181);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 6, 2100, 50);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 7, 2450, 62);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 1, 360, 217);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 2, 720, 216);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 3, 1080, 140);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 4, 1440, 186);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 5, 1800, 175);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 6, 2160, 164);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 7, 2520, 196);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 1, 370, 158);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 2, 740, 115);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 3, 1110, 156);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 4, 1480, 65);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 5, 1850, 30);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 6, 2220, 179);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 7, 2590, 105);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 1, 380, 211);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 2, 760, 92);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 3, 1140, 236);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 4, 1520, 132);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 5, 1900, 67);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 6, 2280, 140);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 7, 2660, 56);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 1, 390, 63);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 2, 780, 209);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 3, 1170, 180);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 4, 1560, 58);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 5, 1950, 210);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 6, 2340, 29);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 7, 2730, 8);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 1, 400, 233);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 2, 800, 213);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 3, 1200, 62);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 4, 1600, 95);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 5, 2000, 161);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 6, 2400, 39);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 7, 2800, 200);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 1, 410, 187);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 2, 820, 40);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 3, 1230, 195);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 4, 1640, 161);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 5, 2050, 25);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 6, 2460, 123);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 7, 2870, 25);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 1, 420, 185);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 2, 840, 66);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 3, 1260, 138);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 4, 1680, 52);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 5, 2100, 233);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 6, 2520, 174);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 7, 2940, 95);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 1, 430, 238);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 2, 860, 38);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 3, 1290, 188);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 4, 1720, 200);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 5, 2150, 18);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 6, 2580, 87);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 7, 3010, 103);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 1, 440, 136);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 2, 880, 84);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 3, 1320, 85);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 4, 1760, 51);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 5, 2200, 49);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 6, 2640, 188);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 7, 3080, 96);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 1, 450, 119);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 2, 900, 82);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 3, 1350, 112);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 4, 1800, 86);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 5, 2250, 93);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 6, 2700, 38);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 7, 3150, 129);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 1, 460, 33);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 2, 920, 213);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 3, 1380, 37);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 4, 1840, 108);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 5, 2300, 178);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 6, 2760, 230);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 7, 3220, 68);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 1, 470, 219);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 2, 940, 4);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 3, 1410, 102);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 4, 1880, 245);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 5, 2350, 189);
insert into order_item(vehicle_id, quantity, price, order_id) values(19, 6, 2820, 197);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 7, 3290, 115);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 1, 480, 9);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 2, 960, 203);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 3, 1440, 164);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 4, 1920, 176);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 5, 2400, 34);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 6, 2880, 9);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 7, 3360, 235);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 1, 490, 237);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 2, 980, 45);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 3, 1470, 110);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 4, 1960, 39);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 5, 2450, 155);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 6, 2940, 220);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 7, 3430, 90);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 1, 500, 180);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 2, 1000, 80);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 3, 1500, 62);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 4, 2000, 192);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 5, 2500, 91);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 6, 3000, 20);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 7, 3500, 147);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 1, 510, 21);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 2, 1020, 57);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 3, 1530, 98);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 4, 2040, 52);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 5, 2550, 101);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 6, 3060, 25);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 7, 3570, 204);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 1, 520, 233);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 2, 1040, 78);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 3, 1560, 151);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 4, 2080, 145);
insert into order_item(vehicle_id, quantity, price, order_id) values(20, 5, 2600, 109);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 6, 3120, 209);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 7, 3640, 202);
insert into order_item(vehicle_id, quantity, price, order_id) values(28, 1, 530, 226);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 2, 1060, 171);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 3, 1590, 11);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 4, 2120, 54);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 5, 2650, 95);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 6, 3180, 32);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 7, 3710, 31);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 1, 540, 146);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 2, 1080, 60);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 3, 1620, 116);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 4, 2160, 50);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 5, 2700, 51);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 6, 3240, 204);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 7, 3780, 101);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 1, 550, 240);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 2, 1100, 9);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 3, 1650, 35);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 4, 2200, 119);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 5, 2750, 9);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 6, 3300, 160);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 7, 3850, 1);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 1, 560, 95);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 2, 1120, 59);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 3, 1680, 166);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 4, 2240, 88);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 5, 2800, 226);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 6, 3360, 160);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 7, 3920, 39);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 1, 570, 88);
insert into order_item(vehicle_id, quantity, price, order_id) values(12, 2, 1140, 131);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 3, 1710, 31);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 4, 2280, 88);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 5, 2850, 214);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 6, 3420, 224);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 7, 3990, 169);
insert into order_item(vehicle_id, quantity, price, order_id) values(23, 1, 580, 133);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 2, 1160, 28);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 3, 1740, 198);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 4, 2320, 55);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 5, 2900, 116);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 6, 3480, 208);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 7, 4060, 80);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 1, 590, 66);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 2, 1180, 37);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 3, 1770, 177);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 4, 2360, 125);
insert into order_item(vehicle_id, quantity, price, order_id) values(3, 5, 2950, 196);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 6, 3540, 213);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 7, 4130, 17);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 1, 600, 237);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 2, 1200, 72);
insert into order_item(vehicle_id, quantity, price, order_id) values(16, 3, 1800, 166);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 4, 2400, 30);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 5, 3000, 90);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 6, 3600, 200);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 7, 4200, 31);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 1, 610, 69);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 2, 1220, 31);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 3, 1830, 56);
insert into order_item(vehicle_id, quantity, price, order_id) values(6, 4, 2440, 217);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 5, 3050, 166);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 6, 3660, 65);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 7, 4270, 106);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 1, 620, 215);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 2, 1240, 25);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 3, 1860, 112);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 4, 2480, 112);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 5, 3100, 193);
insert into order_item(vehicle_id, quantity, price, order_id) values(1, 6, 3720, 195);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 7, 4340, 190);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 1, 630, 57);
insert into order_item(vehicle_id, quantity, price, order_id) values(30, 2, 1260, 78);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 3, 1890, 208);
insert into order_item(vehicle_id, quantity, price, order_id) values(29, 4, 2520, 1);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 5, 3150, 21);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 6, 3780, 38);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 7, 4410, 130);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 1, 640, 172);
insert into order_item(vehicle_id, quantity, price, order_id) values(18, 2, 1280, 7);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 3, 1920, 224);
insert into order_item(vehicle_id, quantity, price, order_id) values(15, 4, 2560, 214);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 5, 3200, 141);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 6, 3840, 62);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 7, 4480, 200);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 1, 650, 2);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 2, 1300, 122);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 3, 1950, 220);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 4, 2600, 180);
insert into order_item(vehicle_id, quantity, price, order_id) values(9, 5, 3250, 241);
insert into order_item(vehicle_id, quantity, price, order_id) values(31, 6, 3900, 170);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 7, 4550, 221);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 1, 660, 22);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 2, 1320, 127);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 3, 1980, 182);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 4, 2640, 137);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 5, 3300, 90);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 6, 3960, 158);
insert into order_item(vehicle_id, quantity, price, order_id) values(7, 7, 4620, 87);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 1, 670, 50);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 2, 1340, 68);
insert into order_item(vehicle_id, quantity, price, order_id) values(17, 3, 2010, 233);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 4, 2680, 67);
insert into order_item(vehicle_id, quantity, price, order_id) values(21, 5, 3350, 56);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 6, 4020, 93);
insert into order_item(vehicle_id, quantity, price, order_id) values(13, 7, 4690, 59);
insert into order_item(vehicle_id, quantity, price, order_id) values(11, 1, 680, 239);
insert into order_item(vehicle_id, quantity, price, order_id) values(8, 2, 1360, 123);
insert into order_item(vehicle_id, quantity, price, order_id) values(4, 3, 2040, 160);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 4, 2720, 226);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 5, 3400, 6);
insert into order_item(vehicle_id, quantity, price, order_id) values(14, 6, 4080, 234);
insert into order_item(vehicle_id, quantity, price, order_id) values(27, 7, 4760, 100);
insert into order_item(vehicle_id, quantity, price, order_id) values(5, 1, 690, 100);
insert into order_item(vehicle_id, quantity, price, order_id) values(24, 2, 1380, 180);
insert into order_item(vehicle_id, quantity, price, order_id) values(2, 3, 2070, 87);
insert into order_item(vehicle_id, quantity, price, order_id) values(26, 4, 2760, 141);
insert into order_item(vehicle_id, quantity, price, order_id) values(25, 5, 3450, 61);
insert into order_item(vehicle_id, quantity, price, order_id) values(10, 6, 4140, 156);
insert into order_item(vehicle_id, quantity, price, order_id) values(22, 7, 4830, 204);


insert into warehouse(dealer_id, state, city, street, street_number) values(1,'state1', 'city1', 'street1', 1);
insert into warehouse(dealer_id, state, city, street, street_number) values(2, 'state2', 'city2', 'street2', 2);
insert into warehouse(dealer_id, state, city, street, street_number) values(3, 'state3', 'city3', 'street3', 3);
insert into warehouse(dealer_id, state, city, street, street_number) values(4, 'state4', 'city4', 'street4', 4);
insert into warehouse(dealer_id, state, city, street, street_number) values(5, 'state5', 'city5', 'street5', 5);
insert into warehouse(dealer_id, state, city, street, street_number) values(6, 'state6', 'city6', 'street6', 6);
insert into warehouse(dealer_id, state, city, street, street_number) values(7, 'state7', 'city7', 'street7', 7);
insert into warehouse(dealer_id, state, city, street, street_number) values(8, 'state8', 'city8', 'street8', 8);
insert into warehouse(dealer_id, state, city, street, street_number) values(9, 'state9', 'city9', 'street9', 9);


