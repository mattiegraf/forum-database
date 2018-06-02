CREATE TABLE account(
email CHAR(100) PRIMARY KEY,
username CHAR(20),
password CHAR(20));



CREATE TABLE subforum(
name CHAR(50) PRIMARY KEY);



CREATE TABLE thread(
name CHAR(50),
id INTEGER,
title CHAR(50),
textbody CHAR(5000),
email CHAR(100),

PRIMARY KEY(name,id),
FOREIGN KEY (name) REFERENCES subforum (name),
FOREIGN KEY (email) REFERENCES account(email));



CREATE TABLE comment(
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
received_email CHAR(100)

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