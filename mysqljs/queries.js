
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// INITIALIZATION QUERIES

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
values(5, 'I am actively repulsed by dogs and cats.', '2018-06-05', 'deskrage@gmail.com', 'catdog@gmail.com');`;





///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// GENERAL QUERIES
// - All functions in this section return strings containing the SQL query

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


/** Selects the username and password of a specific user. Can be used for logging in.
 * @param {string} username
 */
function getUserInfo(username) {
  return 'SELECT username, password FROM account WHERE account.username = "' + username + '";';
}


/** Allows user to add a reply to a thread.
 * @param {int} commentId - the ID of the comment (should be calculated front end? idk)
 * @param {int} threadId
 * @param {string} subforumName
 * @param {string} textBody
 * @param {string} date - format "YYYY-MM-DD"
 * @param {string} accountEmail
 */
function insertReply(commentId, threadId, subforumName, textBody, date, accountEmail) {
  return 'INSERT INTO reply values('+commentId+','+threadId+',"'+subforumName+'","'+textBody+'","'+date+'","'+accountEmail+'")';
}

/** Allow user to delete their own reply in a thread
 * @param {string} accountEmail
 * @param {int} commentId
 * @param {int} threadId
 */
function deleteReply(accountEmail, commentId, threadId) {
  return 'DELETE FROM reply WHERE email = "'+accountEmail+'" AND id_num = '+commentId+' AND thread_id_num = '+threadId+';';
}


/** Allow user to create a thread
 * @param {string} subforumName
 * @param {int} threadId
 * @param {string} title
 * @param {string} textBody
 * @param {string} date - format "YYYY-MM-DD"
 * @param {string} email
 */
function createThread(subforumName, threadId, title, textBody, date, email) {
  return 'INSERT INTO thread values("'+subforumName+'",'+threadId+',"'+title+'", "'+textBody+'", "'+date+'", "'+email+'");';
}


/** Allow user to delete a thread they made
 * @param {string} email
 * @param {int} threadId
 */
function deleteThread(email, threadId) {
  return 'DELETE FROM thread WHERE email = "'+email+'" AND id = '+threadId+';';
}


/** Allow user to send a message to another user
 * @param {int} messageId
 * @param {string} messageBody
 * @param {string} date - format "YYYY-MM-DD"
 * @param {string} fromEmail
 * @param {string} toEmail
 */
function sendMessage(messageId, messageBody, date, fromEmail, toEmail) {
  return 'INSERT INTO message values('+messageId+', "'+messageBody+'", "'+date+'", "'+fromEmail+'", "'+toEmail+'");';
}


/** Allow user to subscribe to a forum
 * @param {string} email
 * @param {string} subforumName
 */
function subscribeTo(email, subforumName) {
  return 'INSERT INTO subscribed_to values("'+email+'","'+subforumName+'");';
}


/** Allow user to unsubscibe from a subforum
 * @param {string} email
 * @param {string} subforumName
 */
function unsubscribeFrom(email, subforumName) {
  return 'DELETE FROM subscribed_to WHERE email = "'+email+'" AND name = "'+subforumName+'";';
}


/** Allows user to view the last 20 messages sent to their account.
 * @param {string} email - the email of the receiving user
 */
function getMessages(email) {
  return 'SELECT * FROM message WHERE received_email = "'+email+'" LIMIT 20;';
}


/** View threads on subforums by most commented on in the last week.
 * WARNING: DOES NOT INCLUDE THREADS WITH NO COMMENTS.
 * @param {string} subforumName
 */
function getMostCommentedThreads(subforumName) {
  return `SELECT COUNT(thread_id_num), thread_id_num
FROM reply
WHERE name = "`+subforumName+`" AND date_posted >= (CURDATE()-7)
GROUP BY thread_id_num
ORDER BY COUNT(thread_id_num) DESC;`;
}





///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// EXPORT OBJECT

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

module.exports = {
    // initTables and dropTables both return strings, the rest return functions
    initTables : initTablesStr,
    dropTables : dropTablesStr,
    getUserInfo : getUserInfo,
    insertReply : insertReply,
    deleteReply : deleteReply,
    createThread : createThread,
    deleteThread : deleteThread,
    sendMessage : sendMessage,
    subscribeTo : subscribeTo,
    unsubscribeFrom : unsubscribeFrom,
    getMessages : getMessages,
    getMostCommentedThreads : getMostCommentedThreads
};
