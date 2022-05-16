create table drzava(
drzava_id int auto_increment,
code int not null,
naziv varchar(50) not null,
primary key(drzava_id));

create table film(
id int auto_increment not null,
naziv varchar(50) not null,
godina int not null,
zanr varchar(50),
drzava_id int not null,
primary key(id),
foreign key(drzava_id) references drzava(drzava_id));

create table glumac(
id int auto_increment not null,
ime varchar(50) not null,
prezime varchar(50) not null,
god_rodjenja int not null,
pol varchar(10) not null,
drzavljanin_id int not null,
primary key(id),
foreign key(drzavljanin_id) references drzava(drzava_id));

create table film_glumac(
glumac_id int not null,
film_id int not null,
fg_id int auto_increment,
foreign key (glumac_id) references glumac(id),
foreign key (film_id) references film(id),
primary key (fg_id));

insert into drzava(naziv, code)
values ("SAD", 111);

insert into film(naziv, godina, zanr, drzava_id)
values ("Crna svadba", 2020, "Horor", 1);

insert into glumac(ime, prezime, god_rodjenja, pol, drzavljanin_id)
values ("KATARINA", "RADIVOJEVIC", 1980, "zenski", 1);

insert into film_glumac(film_id, glumac_id)
values (6, 3);

#zad1
select * from film where zanr = "Komedija";

#zad2
select * from glumac where god_rodjenja <= 1992;

#zad3
select glumac.ime, glumac.prezime, glumac.pol, drzava.naziv from glumac
join drzava on drzava.drzava_id = glumac.drzavljanin_id
where drzava.naziv = "SAD" and glumac.pol = "zenski";

#zad4
select film.naziv, film.godina, drzava.naziv from film
join drzava on drzava.drzava_id = film.drzava_id
where drzava.naziv = "Srbija" and film.godina >=2019;

#zad5
select count(id), drzava.naziv from film
join drzava on drzava.drzava_id = film.drzava_id
group by drzava.code;

#zad6
select film.naziv, film.drzava_id, glumac.ime, glumac.prezime, glumac.drzavljanin_id from film
join drzava on drzava.drzava_id = film.drzava_id
join film_glumac on film.id = film_glumac.fg_id
join glumac on glumac.drzavljanin_id = drzava.drzava_id
where drzava.drzava_id = film.drzava_id;
