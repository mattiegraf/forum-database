
DROP TABLE reply;
DROP TABLE thread;
DROP TABLE message;
DROP TABLE subscribed_to;
DROP TABLE moderates;
DROP TABLE account;
DROP TABLE subforum;

/* Checking for age must be done at the application level. */
CREATE TABLE account(
email VARCHAR(100) PRIMARY KEY,
username VARCHAR(20),
password VARCHAR(20),
age INTEGER,
banana_score INTEGER,
isadmin BIT(1)
CHECK (age >= 13));

CREATE TABLE subforum(
name VARCHAR(50) PRIMARY KEY);

CREATE TABLE thread(
name VARCHAR(50),
id INTEGER,
title VARCHAR(50) NOT NULL,
textbody VARCHAR(2000),
date_posted DATE,
email VARCHAR(100),

PRIMARY KEY(id),
FOREIGN KEY (name) REFERENCES subforum (name) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (email) REFERENCES account(email) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE TABLE reply(
id_num INTEGER,
thread_id_num INTEGER,
name VARCHAR(50),
body VARCHAR(2000) NOT NULL,
date_posted DATE,
email VARCHAR(100),

PRIMARY KEY(id_num, thread_id_num, name),
FOREIGN KEY (thread_id_num) REFERENCES thread(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (name) REFERENCES subforum(name) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (email) REFERENCES account(email) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE TABLE message(
id_num INTEGER PRIMARY KEY,
body VARCHAR(2000),
date_sent DATE,
sent_email VARCHAR(100),
received_email VARCHAR(100),

FOREIGN KEY (sent_email) REFERENCES account(email) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (received_email) REFERENCES account(email) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE TABLE subscribed_to(
email VARCHAR(100),
name VARCHAR(50),

PRIMARY KEY(name,email),
FOREIGN KEY (name) REFERENCES subforum(name) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (email) REFERENCES account(email) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE moderates(
email VARCHAR(100),
name VARCHAR(50),

PRIMARY KEY(name,email),
FOREIGN KEY (name) REFERENCES subforum(name) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (email) REFERENCES account(email) ON DELETE CASCADE ON UPDATE CASCADE);


insert into account
values('vybaby@gmail.com', 'vybaby', 'pblover97', 21, 20, 0);

insert into account
values('mad@yahoo.ca', 'madiman', 'bmbot2k18', 23, 25, 0);

insert into account
values('catdog@gmail.com', 'dog', 'cat', 20, 75, 0);

insert into account
values('json@hotmail.com', 'json', 'java', 20, 30, 0);

insert into account
values('nabstua@gmail.com', 'nabstua', 'school', 23, 45, 0);

insert into account
values('superfoody@live.com', 'quinoa', 'couscous', 25, 50, 1);

insert into account
values('greenearth@yahoo.ca', 'recycleboi', 'psycho', 21, 60, 1);

insert into account
values('snowstorm@outlook.com', 'penguin', 'blizzard', 25, 75, 1);

insert into account
values('itsdatboi@gmail.com', 'datboi', 'ohsnapwhaddup', 15, 20, 1);

insert into account
values('deskrage@gmail.com', 'angrypaperclip', 'officesupplies', 21, 0, 1);


insert into subforum
values('Food');

insert into subforum
values('Movies/Television');

insert into subforum
values('Music');

insert into subforum
values('Sports');

insert into subforum
values('Gaming');


insert into thread
values('Food', 17, 'Crunchy or Smooth Peanut Butter?', 'What is your favourite? #nojudgezone', '2018-06-01', 'vybaby@gmail.com');

insert into thread
values('Movies/Television', 1, 'Air Bud', 'Best movie of all time do not even @ me.', '2018-06-02', 'catdog@gmail.com');

insert into thread
values('Music', 4, 'Selling Extra Killers Concert Ticket', 'My friend ditched me at the last minute. Anybody looking to go? DM me for ticket prices.', '2018-06-03', 'mad@yahoo.ca');

insert into thread
values('Gaming', 5, 'Nintendo at E3', 'Let Us Go Pikachu had too much water. 7/10.', '2018-06-04', 'catdog@gmail.com');

insert into thread
values('Sports', 2, 'World Cup Fever', 'Who else is counting down the days? My bodle cannot handle the hype.', '2018-06-05', 'json@hotmail.com');


insert into reply
values(1, 17, 'Food', 'Does not matter what it is. As long as it is green and gluten-free my tummy is happy.', '2018-06-01', 'superfoody@live.com');

insert into reply
values(2, 17, 'Food', 'Gotta be crunchy. Need something to take my anger out on. Those peanut bits help.', '2018-06-02', 'deskrage@gmail.com');

insert into reply
values(3, 17, 'Food', 'Only nerds get crunchy. Smooth all the way.', '2018-06-03', 'mad@yahoo.ca');

insert into reply
values(1, 4, 'Music', 'Me please! I can give you three fiddy and a handful of almonds.', '2018-06-04', 'json@hotmail.com');

insert into reply
values(4, 17, 'Food', 'Honestly anyone who answered smooth is dead to me. #lowkeyjudging', '2018-06-05', 'vybaby@gmail.com');

insert into reply
values(1, 5, 'Gaming', 'Honestly though? Not enough water. 3/10.', '2018-06-06', 'nabstua@gmail.com');

insert into reply
values(1, 2, 'Sports', 'I heard Queens Park Rangers are gonna be there.', '2018-06-07','nabstua@gmail.com');

insert into reply
values(2, 2, 'Sports', 'Italy for me!', '2018-06-08', 'itsdatboi@gmail.com');

insert into reply
values(3, 2, 'Sports', 'Greenland OBVIOUSLY.', '2018-06-09', 'greenearth@yahoo.ca');

insert into reply
values(4, 2, 'Sports', 'USA is in it this year right?', '2018-06-10', 'superfoody@live.com');

insert into reply
values(1, 1, 'Movies/Television', 'Hiss.', '2018-06-11', 'snowstorm@outlook.com');

insert into reply
values(2, 5, 'Gaming', 'UGH. They did not add Swampert. Hate it.', '2018-06-12', 'mad@yahoo.ca');

insert into reply
values(2, 1, 'Movies/Television', 'Meow.', '2018-06-13', 'deskrage@gmail.com');

insert into reply
values(2, 4, 'Music', 'I can give you three fiddy one and two handfuls of almonds.', '2018-06-14', 'catdog@gmail.com');



insert into subscribed_to
values('superfoody@live.com', 'Food');

insert into subscribed_to
values('deskrage@gmail.com', 'Sports');

insert into subscribed_to
values('mad@yahoo.ca', 'Music');

insert into subscribed_to
values('vybaby@gmail.com', 'Movies/Television');

insert into subscribed_to
values('json@hotmail.com', 'Gaming');

insert into subscribed_to
values('deskrage@gmail.com', 'Gaming');

insert into subscribed_to
values('deskrage@gmail.com', 'Movies/Television');

insert into subscribed_to
values('deskrage@gmail.com', 'Music');

insert into subscribed_to
values('deskrage@gmail.com', 'Food');

insert into subscribed_to
values('vybaby@gmail.com', 'Food');

insert into subscribed_to
values('vybaby@gmail.com', 'Gaming');

insert into subscribed_to
values('vybaby@gmail.com', 'Music');

insert into subscribed_to
values('vybaby@gmail.com', 'Sports');



insert into moderates
values('deskrage@gmail.com', 'Sports');

insert into moderates
values('snowstorm@outlook.com', 'Movies/Television');

insert into moderates
values('json@hotmail.com', 'Gaming');

insert into moderates
values('mad@yahoo.ca', 'Music');

insert into moderates
values('itsdatboi@gmail.com', 'Food');



insert into message
values(1, 'Nice made-up story about having friends.', '2018-06-01', 'nabstua@gmail.com', 'mad@yahoo.ca');

insert into message
values(2, 'WooOoooooOooooow.', '2018-06-02', 'mad@yahoo.ca', 'nabstua@gmail.com');

insert into message
values(3, 'I can offer you cashews instead if that changes anything.', '2018-06-03', 'json@hotmail.com', 'mad@yahoo.ca');

insert into message
values(4, 'I will sell you tickets for just the almonds, as long as they are activated.', '2018-06-04', 'superfoody@live.com', 'catdog@gmail.com');

insert into message
values(5, 'I am actively repulsed by dogs and cats.', '2018-06-05', 'deskrage@gmail.com', 'catdog@gmail.com');