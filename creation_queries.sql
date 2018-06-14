
drop table reply;
drop table thread;
drop table message;
drop table subscribed_to;
drop table moderates;
drop table account;
drop table subforum;

CREATE TABLE account(
email CHAR(100) PRIMARY KEY,
username CHAR(20),
password VARCHAR(20));



CREATE TABLE subforum(
name VARCHAR(50) PRIMARY KEY);



CREATE TABLE thread(
name VARCHAR(50),
id INTEGER,
title VARCHAR(50),
textbody VARCHAR(5000),
email VARCHAR(100),

PRIMARY KEY(id),
FOREIGN KEY (name) REFERENCES subforum (name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE reply(
id_num INTEGER,
thread_id_num INTEGER,
name CHAR(50),
body CHAR(5000),
email CHAR(100),

PRIMARY KEY(id_num, thread_id_num, name),
FOREIGN KEY (thread_id_num) REFERENCES thread(id),
FOREIGN KEY (name) REFERENCES subforum(name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE message(
id_num INTEGER PRIMARY KEY,
body CHAR(5000),
date_sent INTEGER,
sent_email CHAR(100),
received_email CHAR(100),

FOREIGN KEY (sent_email) REFERENCES account(email),
FOREIGN KEY (received_email) REFERENCES account(email));



CREATE TABLE subscribed_to(
email CHAR(100),
name CHAR(50),

PRIMARY KEY(name,email),
FOREIGN KEY (name) REFERENCES subforum(name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE moderates(
email CHAR(100),
name CHAR(50),

PRIMARY KEY(name,email),
FOREIGN KEY (name) REFERENCES subforum(name),
FOREIGN KEY (email) REFERENCES account(email));