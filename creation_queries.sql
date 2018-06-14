CREATE TABLE account(
email VARCHAR(100) PRIMARY KEY,
username VARCHAR(20),
password VARCHAR(20));



CREATE TABLE subforum(
name VARCHAR(50) PRIMARY KEY);



CREATE TABLE thread(
name VARCHAR(50),
id INTEGER,
title VARCHAR(50),
textbody VARCHAR(2000),
email VARCHAR(100),

PRIMARY KEY(name,id),
FOREIGN KEY (name) REFERENCES subforum (name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE comment(
id_num INTEGER,
thread_id_num INTEGER,
name VARCHAR(50),
body VARCHAR(2000),
email VARCHAR(100),

PRIMARY KEY(id_num, thread_id_num, name),
FOREIGN KEY (thread_id_num) REFERENCES thread(id),
FOREIGN KEY (name) REFERENCES subforum(name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE message(
id_num INTEGER PRIMARY KEY,
body VARCHAR(2000),
date_sent INTEGER,
sent_email VARCHAR(100),
received_email VARCHAR(100),

FOREIGN KEY (sent_email) REFERENCES account(email),
FOREIGN KEY (received_email) REFERENCES account(email));



CREATE TABLE subscribed_to(
email VARCHAR(100),
name VARCHAR(50),

PRIMARY KEY(name,email),
FOREIGN KEY (name) REFERENCES subforum(name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE moderates(
email VARCHAR(100),
name VARCHAR(50),

PRIMARY KEY(name,email),
FOREIGN KEY (name) REFERENCES subforum(name),
FOREIGN KEY (email) REFERENCES account(email));