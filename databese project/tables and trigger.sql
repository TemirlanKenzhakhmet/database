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

create table option(
    id serial primary key,
    transmission_id integer references transmission_type(id),
    engine_id integer references engine_type(id),
    color_id integer references color_type(id)
);

create table vehicle(
    VIN serial primary key,
    type_id integer references body_style(id),
    option_type integer references option(id)
);

create table vehicle_part(
    id serial primary key,
    part text not null
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

alter table final_assemble add column model_id integer references body_style(id);

create table customer(
    id serial primary key,
    name varchar(20) not null,
    state varchar(20) not null,
    city varchar(20) not null,
    street varchar(20) not null,
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
    sale_id serial primary key,
    warehouse_id integer references warehouse(id),
    model_id integer references body_style(id) unique,
    delivery_time timestamp not null,
    pick_up_time timestamp
);

create table preserve(
    preserve_id serial primary key,
    warehouse_id integer references warehouse(id),
    model_id integer references body_style(id)
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


drop database kbtu_project;
create database kbtu_project;




create or replace procedure total_price() as
    $$
    begin
        update order_1
        set total_price = price * quantity
        from order_item
        where order_1.id = order_item.order_id;
    end;
    $$
language plpgsql;

create or replace function price() returns trigger as
    $$
    begin
        call total_price();
        return new;
    end;
    $$
language plpgsql;

create trigger trig1
    after insert on order_item
    for each statement
    execute procedure price();


# import random
# for j in range(1, 70):
#     for i in range(1, 8):
#         print(f"insert into for_sale(model_id, warehouse_id, delivery_time, pick_up_time) values({random.randint(1, 71)}, {random.randint(1, 9)}, '20{random.randint(10, 20)}-01-05 00:00:00.000000', '20{random.randint(20, 21)}-{random.randint(1, 12)}-05 00:00:00.000000');")

# import random
# for i in range(1, 91):
#     print(f"insert into order_item(vehicle_id, quantity, price, order_id) values({random.randint(1, 65)}, {random.randint(1, 10)}, {random.randrange(5000, 150000, 1000)}, {random.randint(1, 60)});")