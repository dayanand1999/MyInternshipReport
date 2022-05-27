CREATE SCHEMA sparkintern;

USE sparkintern;

CREATE TABLE sparkbank (
  cid varchar(20) NOT NULL,
  name varchar(15) DEFAULT NULL,
  email varchar(30) DEFAULT NULL,
  balance bigint DEFAULT NULL,
  PRIMARY KEY (cid)
);

alter table sparkbank
modify name varchar(255);
insert into sparkbank values(101,"Ajinkya Bothe","ab@gmail.com",50000.00);
insert into sparkbank values(102,"Ajinkya Rahane","ar@gmail.com",60000.00);
insert into sparkbank values(103,"Sheldon Cooper","sc@gmail.com",70000.00);
insert into sparkbank values(104,"Leonard Hofstadter","lh@gmail.com",45000.00);
insert into sparkbank values(105,"Howard Wolowitz","hw@gmail.com",55000.00);
insert into sparkbank values(106,"Rajesh Koothrapalli","rk@gmail.com",75000.00);
insert into sparkbank values(107,"Mahendra Singh Dhoni","msd@gmail.com",65000.00);
insert into sparkbank values(108,"Virat Kohli","vk@gmail.com",70000.00);
insert into sparkbank values(109,"Steve Rogers","sr@gmail.com",45000.00);
insert into sparkbank values(110,"Rahul Bodkhe","rb@gmail.com",35000.00);

select * from sparkbank;

CREATE TABLE transfers (
  tid int NOT NULL auto_increment,
  scid varchar(20) NOT NULL,
  rcid varchar(20) NOT NULL,
  amount bigint DEFAULT NULL,
  primary key (tid)
);

select * from transfers;

create table history (
	entry varchar(255) NOT NULL
);
    
select * from history;