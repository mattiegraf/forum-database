
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// QUERY STRINGS

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

var dropTablesStr = 
`DROP TABLE reply;
DROP TABLE thread;
DROP TABLE message;
DROP TABLE subscribed_to;
DROP TABLE moderates;
DROP TABLE account;
DROP TABLE subforum;`;

var initTablesStr = 
`CREATE TABLE account(
    email VARCHAR(100) PRIMARY KEY,
    username VARCHAR(20),
    password VARCHAR(20),
    isadmin BIT(1));

CREATE TABLE subforum(
    name VARCHAR(50) PRIMARY KEY);

CREATE TABLE thread(
    name VARCHAR(50),
    id INTEGER,
    title VARCHAR(50),
    textbody VARCHAR(2000),
    email VARCHAR(100),

    PRIMARY KEY(id),
    FOREIGN KEY (name) REFERENCES subforum (name),
    FOREIGN KEY (email) REFERENCES account(email));

CREATE TABLE reply(
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


insert into account values('vybaby@gmail.com', 'vybaby', 'pblover97', 0);
insert into account values('mad@yahoo.ca', 'madiman', 'bmbot2k18', 0);
insert into account values('catdog@gmail.com', 'dog', 'cat', 0);
insert into account values('json@hotmail.com', 'json', 'java', 0);
insert into account values('nabstua@gmail.com', 'nabstua', 'school', 0);
insert into account values('superfoody@live.com', 'quinoa', 'couscous', 1);
insert into account values('greenearth@yahoo.ca', 'recycleboi', 'psycho', 1);
insert into account values('snowstorm@outlook.com', 'penguin', 'blizzard', 1);
insert into account values('itsdatboi@gmail.com', 'datboi', 'ohsnapwhaddup', 1);
insert into account values('deskrage@gmail.com', 'angrypaperclip', 'officesupplies', 1);

insert into subforum values('Food');
insert into subforum values('Movies/Television');
insert into subforum values('Music');
insert into subforum values('Sports');
insert into subforum values('Gaming');

insert into thread values('Food', 17, 'Crunchy or Smooth Peanut Butter?', 'What is your favourite? #nojudgezone', 'vybaby@gmail.com');
insert into thread values('Movies/Television', 1, 'Air Bud', 'Best movie of all time do not even @ me.', 'catdog@gmail.com');
insert into thread values('Music', 4, 'Selling Extra Killers Concert Ticket', 'My friend ditched me at the last minute. Anybody looking to go? DM me for ticket prices.', 'mad@yahoo.ca');
insert into thread values('Gaming', 5, 'Nintendo at E3', 'Let Us Go Pikachu had too much water. 7/10.', 'catdog@gmail.com');
insert into thread values('Sports', 2, 'World Cup Fever', 'Who else is counting down the days? My bodle cannot handle the hype.', 'json@hotmail.com');

insert into reply values(1, 17, 'Food', 'Does not matter what it is. As long as it is green and gluten-free my tummy is happy.', 'superfoody@live.com');
insert into reply values(2, 17, 'Food', 'Gotta be crunchy. Need something to take my anger out on. Those peanut bits help.', 'deskrage@gmail.com');
insert into reply values(3, 17, 'Food', 'Only nerds get crunchy. Smooth all the way.', 'mad@yahoo.ca');
insert into reply values(1, 4, 'Music', 'Me please! I can give you three fiddy and a handful of almonds.', 'json@hotmail.com');
insert into reply values(4, 17, 'Food', 'Honestly anyone who answered smooth is dead to me. #lowkeyjudging', 'vybaby@gmail.com');
insert into reply values(1, 5, 'Gaming', 'Honestly though? Not enough water. 3/10.', 'nabstua@gmail.com');
insert into reply values(1, 2, 'Sports', 'I heard Queens Park Rangers are gonna be there.', 'nabstua@gmail.com');
insert into reply values(2, 2, 'Sports', 'Italy for me!', 'itsdatboi@gmail.com');
insert into reply values(3, 2, 'Sports', 'Greenland OBVIOUSLY.', 'greenearth@yahoo.ca');
insert into reply values(4, 2, 'Sports', 'USA is in it this year right?', 'superfoody@live.com');
insert into reply values(1, 1, 'Movies/Television', 'Hiss.', 'snowstorm@outlook.com');
insert into reply values(2, 5, 'Gaming', 'UGH. They did not add Swampert. Hate it.', 'mad@yahoo.ca');
insert into reply values(2, 1, 'Movies/Television', 'Meow.', 'deskrage@gmail.com');
insert into reply values(2, 4, 'Music', 'I can give you three fiddy one and two handfuls of almonds.', 'catdog@gmail.com');

insert into subscribed_to values('superfoody@live.com', 'Food');
insert into subscribed_to values('deskrage@gmail.com', 'Sports');
insert into subscribed_to values('mad@yahoo.ca', 'Music');
insert into subscribed_to values('vybaby@gmail.com', 'Movies/Television');
insert into subscribed_to values('json@hotmail.com', 'Gaming');

insert into moderates values('deskrage@gmail.com', 'Sports');
insert into moderates values('snowstorm@outlook.com', 'Movies/Television');
insert into moderates values('json@hotmail.com', 'Gaming');
insert into moderates values('mad@yahoo.ca', 'Music');
insert into moderates values('itsdatboi@gmail.com', 'Food');

insert into message values(1, 'Nice made-up story about having friends.', 1527918209, 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(2, 'WooOoooooOooooow.', 1527919101, 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(3, 'I can offer you cashews instead if that changes anything.', 1527919530, 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(4, 'I will sell you tickets for just the almonds, as long as they are activated.', 1528919612, 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(5, 'I am actively repulsed by dogs and cats.', 1528917213, 'deskrage@gmail.com', 'catdog@gmail.com');`;





///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// EXPORT OBJECT

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////




module.exports = {
    initTables : initTablesStr,
    dropTables : dropTablesStr
};