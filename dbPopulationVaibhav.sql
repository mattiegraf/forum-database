
DROP TABLE reply;
DROP TABLE thread;
DROP TABLE message;
DROP TABLE subscribed_to;
DROP TABLE moderates;
DROP TABLE account;
DROP TABLE subforum;


CREATE TABLE account(
email VARCHAR(100) PRIMARY KEY,
username VARCHAR(20),
password VARCHAR(20),
age INTEGER,
banana_score INTEGER,
isadmin BIT(1)
CHECK (banana_score >= 0));

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

insert into account
values('nonadmin@gmail.com', 'notanadmin', 'nonadmin', 20, 15, 0);

insert into account
values('admin@gmail.com', 'defsanadmin', 'admin', 20, 25, 1);


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


insert into message values(6, 'They do not!', '2018-3-8', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(7, 'They do to!', '2018-6-3', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(8, 'I hope so.', '2018-3-17', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(9, 'She okay?', '2018-4-2', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(10, 'Lets go.', '2018-6-2', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(11, 'Wow', '2018-2-9', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(12, 'Okay -- youre gonna need to learn how to lie.', '2018-6-15', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(13, 'No', '2018-5-25', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(14, 'Im kidding.  You know how sometimes you just become this persona?  And you dont know how to quit?', '2018-1-7', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(15, 'Like my fear of wearing pastels?', '2018-6-10', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(16, 'The real you.', '2018-3-8', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(17, 'What good stuff?', '2018-1-23', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(18, 'I figured youd get to the good stuff eventually.', '2018-6-7', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(19, 'Thank God!  If I had to hear one more story about your coiffure...', '2018-5-14', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(20, 'Me.  This endless ...blonde babble. Im like, boring myself.', '2018-1-25', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(21, 'What crap?', '2018-5-7', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(22, 'do you listen to this crap?', '2018-6-2', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(23, 'No...', '2018-1-13', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(24, 'Then Guillermo says, If you go any lighter, youre gonna look like an extra on 90210.', '2018-6-13', 'catdog@gmail.com', 'mad@yahoo.ca');
insert into message values(25, 'You always been this selfish?', '2018-2-3', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(26, 'But', '2018-2-8', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(27, 'Then thats all you had to say.', '2018-5-16', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(28, 'Well, no...', '2018-2-7', 'nabstua@gmail.com', 'nonadmin@gmail.com');
insert into message values(29, 'You never wanted to go out with me, did you?', '2018-2-17', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(30, 'I was?', '2018-5-23', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(31, 'I looked for you back at the party, but you always seemed to be occupied.', '2018-6-9', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(32, 'Tons', '2018-4-16', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(33, 'Have fun tonight?', '2018-1-14', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(34, 'I believe we share an art instructor', '2018-5-21', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(35, 'You know Chastity?', '2018-4-20', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(36, 'Looks like things worked out tonight, huh?', '2018-5-4', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(37, 'Hi.', '2018-6-7', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(38, 'Who knows?  All Ive ever heard her say is that shed dip before dating a guy that smokes.', '2018-4-1', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(39, 'So thats the kind of guy she likes? Pretty ones?', '2018-3-23', 'json@hotmail.com', 'snowstorm@outlook.com');
insert into message values(40, 'Lesbian?  No. I found a picture of Jared Leto in one of her drawers, so Im pretty sure shes not harboring same-sex tendencies.', '2018-1-5', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(41, 'Shes not a...', '2018-5-7', 'mad@yahoo.ca', 'json@hotmail.com');
insert into message values(42, 'Im workin on it. But she doesnt seem to be goin for him.', '2018-4-6', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(43, 'I really, really, really wanna go, but I cant.  Not unless my sister goes.', '2018-4-24', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(44, 'Sure have.', '2018-6-9', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(45, 'Ebers Deep Conditioner every two days. And I never, ever use a blowdryer without the diffuser attachment.', '2018-4-24', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(46, 'How do you get your hair to look like that?', '2018-4-20', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(47, 'Im on it', '2018-1-3', 'nabstua@gmail.com', 'json@hotmail.com');
insert into message values(48, 'When I shell out fifty, I expect results.', '2018-3-2', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(49, 'Fifty, and youve got your man.', '2018-3-18', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(50, 'Take it or leave it.  This isnt a negotiation.', '2018-4-15', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(51, 'Fine, thirty.', '2018-5-9', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(52, 'I cant take a girl like that out on twenty bucks.', '2018-6-11', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(53, 'How much?', '2018-2-17', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(54, 'I cant date her sister until that one gets a boyfriend.  And thats the catch. She doesnt want a boyfriend.', '2018-5-2', 'itsdatboi@gmail.com', 'admin@gmail.com');
insert into message values(55, 'Youre gonna pay me to take out some girl?', '2018-2-11', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(56, 'You got it, Verona.  I pick up the tab, you do the honors.', '2018-3-7', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(57, 'But youd go out with her if you had the cake?', '2018-3-12', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(58, 'You need money to take a girl out', '2018-4-3', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(59, 'You just said', '2018-4-16', 'itsdatboi@gmail.com', 'superfoody@live.com');
insert into message values(60, 'Sure, Sparky.  Ill get right on it.', '2018-3-6', 'snowstorm@outlook.com', 'mad@yahoo.ca');
insert into message values(61, 'Yeah, whatever.  I want you to go out with her.', '2018-1-8', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(62, 'Two legs, nice rack...', '2018-5-15', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(63, 'What do you think?', '2018-1-7', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(64, 'Yeah', '2018-4-12', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(65, 'Hey -- its all for the higher good right?', '2018-5-11', 'itsdatboi@gmail.com', 'deskrage@gmail.com');
insert into message values(66, 'You better not fuck this up.  Im heavily invested.', '2018-3-2', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(67, 'What?  We took bathes together when we were kids.', '2018-2-16', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(68, 'You and Verona?', '2018-5-27', 'superfoody@live.com', 'snowstorm@outlook.com');
insert into message values(69, 'Uh,  yeah.  Were old friend*', '2018-1-22', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(70, 'I hear youre helpin Verona.', '2018-6-14', 'vybaby@gmail.com', 'mad@yahoo.ca');
insert into message values(71, 'So what you need to do is recruit a guy wholl go out with her.  Someone whos up for the job.', '2018-4-26', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(72, 'Does this conversation have a purpose?', '2018-1-15', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(73, 'But she cant go out with you because her sister is this insane head case and no one will go out with her. right?', '2018-3-12', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(74, 'Were not.', '2018-1-1', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(75, 'Well, actually, I thought Id run an idea by you.  You know, just to see if youre interested.', '2018-6-13', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(76, 'We dont chat.', '2018-5-28', 'superfoody@live.com', 'json@hotmail.com');
insert into message values(77, 'Nope - just came by to chat', '2018-2-3', 'itsdatboi@gmail.com', 'json@hotmail.com');
insert into message values(78, 'Are you lost?', '2018-3-24', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(79, 'Hey.', '2018-4-23', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(80, 'Oh, honey -- tell me we havent progressed to full-on hallucinations.', '2018-5-24', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(81, 'William - he asked me to meet him here.', '2018-4-15', 'admin@gmail.com', 'superfoody@live.com');
insert into message values(82, 'Who?', '2018-6-5', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(83, 'Have you seen him?', '2018-2-10', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(84, 'Oh, good.  Something new and different for us.', '2018-1-1', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(85, 'You  re looking at this from the wrong perspective.  Were making a statement.', '2018-1-5', 'catdog@gmail.com', 'snowstorm@outlook.com');
insert into message values(86, 'Okay, okay, we wont go.  Its not like I have a dress anyway', '2018-2-12', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(87, 'Listen to you!  You sound like Betty, all pissed off because Archie is taking Veronica.', '2018-6-4', 'nonadmin@gmail.com', 'catdog@gmail.com');
insert into message values(88, 'Well, I guess were not, since we dont have dates .', '2018-3-21', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(89, 'Can you even imagine?  Who the hell would go to this a bastion of commercial excess?', '2018-6-4', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(90, 'I got drunk.  I puked.  I got rejected. It was big fun.', '2018-1-22', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(91, 'You didnt', '2018-3-18', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(92, 'I did Bianca a favor and it backfired.', '2018-4-10', 'itsdatboi@gmail.com', 'superfoody@live.com');
insert into message values(93, 'You didnt have a choice?  Wheres Kat and what have you done with her?', '2018-1-5', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(94, 'I didnt have a choice.', '2018-3-12', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(95, 'You went to the party?  I thought we were officially opposed to suburban social activity.', '2018-6-14', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(96, 'Who cares?', '2018-1-26', 'admin@gmail.com', 'superfoody@live.com');
insert into message values(97, 'Whatd he say?', '2018-2-17', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(98, 'No fear.', '2018-5-2', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(99, 'You think thisll work?', '2018-4-21', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(100, 'If I was Bianca, it would be, Any school you want, precious.  Dont forget your tiara.', '2018-1-16', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(101, 'Does it matter?', '2018-3-13', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(102, 'I appreciate your efforts toward a speedy death, but Im consuming.  Do you mind?', '2018-4-26', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(103, 'Neither has his heterosexuality.', '2018-2-23', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(104, 'Thats never been proven', '2018-3-28', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(105, 'William didnt even go to high school', '2018-3-13', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(106, 'William would never have gone to a state school.', '2018-2-12', 'greenearth@yahoo.ca', 'vybaby@gmail.com');
insert into message values(107, 'So he has this huge raging fit about Sarah Lawrence and insists that I go to his male-dominated, puking frat boy, number one golf team school. I have no ', '2018-5-26', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(108, 'You could always go with me.  Im sure William has some friends.', '2018-1-7', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(109, 'The people at this school are so incredibly foul.', '2018-6-12', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(110, 'But we do have a lack of notaries. You should contact my administration.', '2018-3-2', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(111, '... for a commoner?', '2018-4-3', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(112, 'You defend yourself admirably...', '2018-6-4', 'itsdatboi@gmail.com', 'admin@gmail.com');
insert into message values(113, 'Forgive me, Don Colon.  But what about gold?', '2018-5-15', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(114, 'They dont see sin in their nakedness.  They live according to nature, in a never ending summer. The islands are covered with trees, filled with b', '2018-2-27', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(115, 'If you wont accept our proposal, well simply find someone who will.', '2018-2-27', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(116, 'And were you never ambitious, Excellency?  Or is ambition only a virtue among the nobles, a fault for the rest of us?', '2018-6-14', 'superfoody@live.com', 'snowstorm@outlook.com');
insert into message values(117, 'Then you are too ambitious.', '2018-5-26', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(118, 'Im not bargaining!', '2018-4-22', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(119, 'I remind you, Senor Colon, that you are in no position to bargain with me.', '2018-4-26', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(120, 'NO...!  I have waited too long, fought too hard.  Now you expect me to take all the risks while you take the profit!  No... I will not be your ser', '2018-5-25', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(121, 'No?', '2018-2-27', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(122, 'No...', '2018-1-10', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(123, 'You never learned how to speak my language.', '2018-4-8', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(124, 'Utapan, wont you speak to me?  You used to know how to speak to me.', '2018-5-1', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(125, 'You did the same to your God!', '2018-6-8', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(126, 'You have to find them, Utapan.  Look what they did!', '2018-1-7', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(127, 'Ask him if he will help.', '2018-5-18', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(128, 'He understands.', '2018-5-24', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(129, 'We will work with his people.  We want peace.  Ask the Chief if he understands?', '2018-2-19', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(130, 'He has medicine.  Tell him we admire his people.', '2018-2-3', 'nonadmin@gmail.com', 'nabstua@gmail.com');
insert into message values(131, 'Chief says...', '2018-3-7', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(132, '... and also to bring medicine.', '2018-4-14', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(133, 'Chief says -- he has a God.', '2018-4-13', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(134, 'To bring the word of God.', '2018-2-22', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(135, 'Why?', '2018-6-3', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(136, 'Thousands.', '2018-1-27', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(137, 'Chief says -- how many?', '2018-6-14', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(138, 'Tell him his country is very beautiful.  Tell him we are leaving men here -- to build a fort.', '2018-4-11', 'vybaby@gmail.com', 'snowstorm@outlook.com');
insert into message values(139, 'Chief knows.', '2018-5-4', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(140, 'Tell the Chief we thank him.', '2018-3-3', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(141, 'You come!  You speak first!', '2018-6-9', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(142, 'Island.  Far.', '2018-5-11', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(143, 'What is it?  A tribe?  An island?', '2018-6-9', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(144, 'Say not here!  Cuba!', '2018-5-9', 'superfoody@live.com', 'json@hotmail.com');
insert into message values(145, 'I dont know... I have the impression that I didnt change that much.  I still cant accept the world as it is!', '2018-6-5', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(146, 'Oh?  So you are a new man?', '2018-6-8', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(147, 'New worlds create new people.', '2018-1-12', 'greenearth@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(148, 'I knew you would.', '2018-4-3', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(149, 'I have to disagree.', '2018-6-4', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(150, 'Youll always be older than me, Father.', '2018-2-18', 'snowstorm@outlook.com', 'nabstua@gmail.com');
insert into message values(151, 'I suppose were both old men now.', '2018-2-18', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(152, 'Give me absolution.', '2018-5-6', 'nonadmin@gmail.com', 'nabstua@gmail.com');
insert into message values(153, 'I believed in you...', '2018-3-27', 'json@hotmail.com', 'catdog@gmail.com');
insert into message values(154, 'You are bound by an oath, Father.', '2018-2-23', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(155, 'My son, my son...  Your certitudes are sometimes frightening...  Christopher, you must speak to them. And if you dont I will.', '2018-3-25', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(156, 'If I tell them, they wont follow me.  You know that I am right, Father.  You trust me...', '2018-1-19', 'vybaby@gmail.com', 'mad@yahoo.ca');
insert into message values(157, 'May God forgive you...!  You must tell them!  You must tell your men!', '2018-1-27', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(158, 'I am not sure... It could be twice the distance.', '2018-1-23', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(159, 'How long?', '2018-6-7', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(160, 'I lied.  The journey will be longer than I said.', '2018-5-22', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(161, 'What are you saying?', '2018-4-14', 'catdog@gmail.com', 'snowstorm@outlook.com');
insert into message values(162, 'Father, I have betrayed my family. I betrayed my men.  And I betrayed you.', '2018-3-21', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(163, 'I am listening, my son.', '2018-6-8', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(164, 'Forgive me, Father.  For I have sinned.', '2018-6-9', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(165, 'In Nomine Patris et Filius, et Spiritus Sancti.', '2018-3-13', 'nonadmin@gmail.com', 'snowstorm@outlook.com');
insert into message values(166, 'By my heel, I care not.', '2018-5-5', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(167, 'By my head here come the Capulets.', '2018-6-14', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(168, 'Thou art as hot a Jack in thy mood as any in Verona.', '2018-1-17', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(169, 'Am I like Such a fellow?', '2018-3-26', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(170, 'Keep away the cats! Thou art like one of these fellows that, when he enters the confines of a tavern claps me his sword upon the table and s', '2018-4-18', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(171, 'The what?', '2018-4-16', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(172, 'More than prince of cats. He is the courageous captain of compliments. He fights as you sing prick- song, keeps time, distance, and proporti', '2018-5-28', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(173, 'Why, what is Tybalt?', '2018-1-23', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(174, 'But alas poor Romeo! he is already dead; stabbed with a white wenchs black eye; shot through the ear with a love-song; the very pin of his ', '2018-1-25', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(175, 'Nay, he will answer the letters master, how he dares, being dared.', '2018-5-4', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(176, 'Any man that can write may answer a letter.', '2018-3-14', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(177, 'Romeo will answer it?', '2018-1-27', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(178, 'A challenge, on my life.', '2018-5-12', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(179, 'Tybalt, the kinsman of old Capulet, Hath sent a letter to his fathers house.', '2018-1-7', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(180, 'Why that pale hard-hearted wench, that Rosaline. Torments him so, that he will sure run mad.', '2018-3-19', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(181, 'Not to his fathers; I spoke with his man.', '2018-3-24', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(182, 'Where the devil should this Romeo be? Came he not home to-night?', '2018-3-10', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(183, 'Romeo! humours! madman! passion! lover! I conjure thee by Rosalines bright eyes, By her high forehead and her scarlet lip, By her fine foot', '2018-6-5', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(184, 'Romeo! Romeo!', '2018-6-12', 'vybaby@gmail.com', 'snowstorm@outlook.com');
insert into message values(185, 'Art thou hurt?', '2018-5-9', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(186, 'Forbear this outrage, good Mercutio.', '2018-3-7', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(187, 'I fear, too early: for my mind misgives Some consequence yet hanging in the stars Shall bitterly begin his fearful date With this nights revel', '2018-3-7', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(188, 'This wind, you talk of, blows us from ourselves; Supper is done, and we shall come too late.', '2018-4-27', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(189, 'But tis no wit to go.', '2018-6-1', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(190, 'Every man betake him to his legs.', '2018-2-15', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(191, 'Not mad, but bound more than a mad-man is; Shut up in prison, kept without my food, Whippd and tormented. Good day, good fellow.', '2018-5-9', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(192, 'By giving liberty unto thine eyes; Examine other beauties. Why, Romeo, art thou mad?', '2018-4-27', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(193, 'Teach me how I should forget to think.', '2018-4-6', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(194, 'Be ruled by me, forget to think of her.', '2018-5-15', 'nonadmin@gmail.com', 'mad@yahoo.ca');
insert into message values(195, 'She hath, and in that sparing makes huge waste.', '2018-4-23', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(196, 'Then she hath sworn that she will still live chaste?', '2018-2-11', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(197, 'Well, in that hit you miss: shell not be hit With Cupids arrow; Nor bide the encounter of assailing eyes, Nor open her lap to saint-seducing ', '2018-5-8', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(198, 'A right fair mark, fair cuz, is soonest hit.', '2018-5-28', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(199, 'A right good marks-man! And shes fair I love.', '2018-6-8', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(200, 'I aimd so near, when I supposed you loved.', '2018-1-15', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(201, 'In sadness, cousin, I do love a woman.', '2018-2-23', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(202, 'Tell me in sadness, who is that you love.', '2018-6-1', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(203, 'Soft! I will go along; An if you leave me so, you do me wrong.', '2018-3-5', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(204, 'Farewell, my cuz.', '2018-4-3', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(205, 'At thy good hearts oppression.', '2018-1-4', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(206, 'Good heart, at what?', '2018-5-7', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(207, 'No, cuz, I rather weep.', '2018-5-15', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(208, 'Alas, that love, whose view is muffled still, Should, without eyes, see pathways to his will! Where shall we dine? O me! What fray was here? Ye', '2018-3-3', 'nonadmin@gmail.com', 'mad@yahoo.ca');
insert into message values(209, 'Alas, that love, so gentle in his view, Should be so tyrannous and rough in proof!', '2018-1-10', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(210, 'Out of her favour, where I am in love.', '2018-1-12', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(211, 'Of love?', '2018-6-15', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(212, 'Out--', '2018-3-13', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(213, 'In love?', '2018-6-6', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(214, 'Not having that, which, having, makes them short.', '2018-3-20', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(215, 'It was. What sadness lengthens Romeos hours?', '2018-4-12', 'json@hotmail.com', 'superfoody@live.com');
insert into message values(216, 'Ay me! Sad hours seem long. Was that my father that went hence so fast?', '2018-3-14', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(217, 'But new struck cuz.', '2018-3-2', 'greenearth@yahoo.ca', 'vybaby@gmail.com');
insert into message values(218, 'Is the day so young?', '2018-6-6', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(219, 'Good-morrow, cousin.', '2018-5-26', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(220, 'Why then, O brawling love, O loving hate, O anything of nothing first create. heavy lightness. Serious vanity. Misshapen chaos of well seeming ', '2018-3-9', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(221, 'Go to! What, goodman boy! I say, he shall: go to; Make a mutiny among my guests?!', '2018-1-12', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(222, 'Uncle, tis a shame.', '2018-5-28', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(223, 'He shall be endured', '2018-1-7', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(224, 'Ill not endure him.', '2018-4-28', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(225, 'Content thee, gentle cuz, content thee. Let him alone; I would not for the wealth of all the town Here in my house do him disparagement: Ther', '2018-2-8', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(226, 'Tis he.', '2018-6-2', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(227, 'Young Romeo is it?', '2018-2-24', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(228, 'Uncle, this is that villain Romeo, a Montague, our foe.', '2018-5-23', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(229, 'Why, how now, kinsman! wherefore storm you so?', '2018-6-5', 'itsdatboi@gmail.com', 'deskrage@gmail.com');
insert into message values(230, 'What dares the slave Come hither, To fleer and scorn at our solemnity? Now, by the stock and honour of my kin, To strike him dead, I hold it n', '2018-1-28', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(231, 'Here is my gold. Worse poison to mens souls, than these poor compounds that thou mayest not sell.', '2018-6-10', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(232, 'Drink it off and, if you had the strength of twenty men it would dispatch you straight.', '2018-6-14', 'snowstorm@outlook.com', 'nonadmin@gmail.com');
insert into message values(233, 'I pay thy poverty, and not thy will.', '2018-4-21', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(234, 'My poverty, but not my will consents.', '2018-5-14', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(235, 'The world is not thy friend, nor the worlds law. Then be not poor, but break it, and take this.', '2018-5-7', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(236, 'Such mortal drugs I have, but Veronas law is death to any that utters them.', '2018-1-17', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(237, 'What if this mixture do not work at all? Shall I be married then tomorrow morning?', '2018-5-22', 'mad@yahoo.ca', 'json@hotmail.com');
insert into message values(238, 'I do spy a kind of hope, Which craves as desperate and execution as that is desperate which we would prevent. If, rather than to marr', '2018-3-13', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(239, 'Be not so long to speak I long to die.', '2018-5-14', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(240, 'Hold Daughter!', '2018-6-13', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(241, 'If in thy wisdom thou canst give no help Do thou but call my resolution wise, And with this Ill help it presently!', '2018-2-5', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(242, 'It strains me past the compass of my wits.', '2018-2-27', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(243, 'My leisure serves me, pensive daughter now. We must entreat the time alone.', '2018-2-6', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(244, 'Are you at leisure Holy Father, now? Or shall I come to you at evening mass?', '2018-3-1', 'greenearth@yahoo.ca', 'vybaby@gmail.com');
insert into message values(245, 'And all this day an unaccustomed spirit lifts me above the ground with cheerful thoughts. I dreampt my lady came and found me dead and breathed', '2018-2-24', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(246, 'As the custom is, in all her best array, bear her to church.', '2018-3-24', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(247, 'Farewell.', '2018-4-6', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(248, 'Hie you make haste! But look thou stay not till the watch be set, for then thou canst not pass to Mantua where thau shalt live till w', '2018-6-1', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(249, 'How well my comfort is revived by this.', '2018-4-1', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(250, 'O deadly sin, O rude unthankfulness! This is dear mercy and thou sees it not. Hence!', '2018-1-10', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(251, 'There is no world without Verona walls, hence banished is banished from the world and worlds exile is death. Then banished is death mis-termed.', '2018-2-25', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(252, 'Affliction is enamoured of thy parts, and thou art wedded to calamity. Hence from Verona art thou banished. Be patient, for the world is broad ', '2018-4-17', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(253, 'Banishment? Be merciful, say death; for exile hath more terror in his look much more than death. Do not say Banishment.', '2018-5-18', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(254, 'Wisely and slow; they stumble that run fast.', '2018-4-8', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(255, 'O, let us hence; I stand on sudden haste.', '2018-6-1', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(256, 'O, she new well. Thy love read by rote and could not spell. Come, young waverer, come, go with me, In one respect Ill thy assistant ', '2018-3-6', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(257, 'I pray thee, chde me not; whom I love now doth grace for grace and love for love allow; the other did not so.', '2018-6-10', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(258, 'For doting; not for loving, pupil mine.', '2018-3-8', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(259, 'Thou chidst me oft for loving Rosaline.', '2018-3-23', 'nonadmin@gmail.com', 'nabstua@gmail.com');
insert into message values(260, 'Holy Saint Francis, what a change is here! Is Rosaline that thou didst love so dear so soon forsaken? Young mens love then lies not ', '2018-6-3', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(261, 'Then plainly know my hearts dear love is set, on the fair daughter of rich Capulet. We met, we wooed, we made exchange of vow. Ill tell thee a', '2018-1-11', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(262, 'Be plain, good son, and homely in thy drift; riddling confession finds but riddling shrift.', '2018-6-6', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(263, 'I have been feasting with mine enemy, where on a sudden one hath wounded me, thats by me wounded; both our remeidies within thy help and holy ', '2018-2-8', 'nabstua@gmail.com', 'nonadmin@gmail.com');
insert into message values(264, 'Thats my good son: but where hast thou been', '2018-6-2', 'vybaby@gmail.com', 'snowstorm@outlook.com');
insert into message values(265, 'Rosaline? My ghostly father no; I have forgot that name, and that names woe.', '2018-4-6', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(266, 'God pardon sin, was thou with Rosaline!?', '2018-4-3', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(267, 'The last is true; the sweeter rest was mine.', '2018-6-4', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(268, 'Young son, it argues a distemperd head so soon to bid good marrow to thy bed: or if not so so, then here I hit it right, our Romeo h', '2018-1-12', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(269, 'Benedicite! What early tounge so sweet saludeth me?', '2018-2-12', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(270, 'Good marrow, father!', '2018-6-7', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(271, 'Sir, a ring my lady bid me give you.', '2018-4-18', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(272, 'I thought thy disposition better tempered! Thy Juliet is alive. There art thou happy. The law that threatened death becomes thy frien', '2018-2-12', 'json@hotmail.com', 'superfoody@live.com');
insert into message values(273, 'Romeo, come forth.', '2018-3-25', 'nabstua@gmail.com', 'itsdatboi@gmail.com');
insert into message values(274, 'Where is my Ladys lord?', '2018-6-13', 'nabstua@gmail.com', 'nonadmin@gmail.com');
insert into message values(275, 'Welcome.', '2018-6-1', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(276, 'I come for my lady Juliet.', '2018-6-1', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(277, 'O, mighty is the powerful grace that lies in plants, herbs, stones, and their true qualities: for nought so vile that the earth doth ', '2018-3-19', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(278, 'Juliet!', '2018-5-22', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(279, 'Romeo, I drink to thee.', '2018-3-11', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(280, 'Goodnight.', '2018-4-13', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(281, 'Farewell. God knows when we shall meet again.', '2018-1-24', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(282, 'Geth thee to be and rest, for thou has need.', '2018-1-1', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(283, 'No, madam. We have culled such necessaries as our behoveful for our state tomorrow. so please you, let me now be left alone, and let the nurse', '2018-6-4', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(284, 'What, daughter are you busy? Need you my help?', '2018-2-1', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(285, 'O God!--O Nurse, how shall this be prevented? What sayest thou? Hast thou not a word of joy? Some comfort nurse.', '2018-5-2', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(286, 'Talk not to me, for Ill not speak a word. Do as thou wilt for I have done with thee.', '2018-3-23', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(287, 'O sweet my mother cast me not away. Delay this marriage for a month, a week. Or if you do not make the bridal bed in that dim  monument where ', '2018-4-21', 'vybaby@gmail.com', 'superfoody@live.com');
insert into message values(288, 'Here comes your father, tell him so yourself.', '2018-4-22', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(289, 'What? Now. St. Peters Church, and Peter too, he shall not make me there a joyful bride!', '2018-4-7', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(290, 'Marry my child next Thursday Morn. The gallant, young and noble gentleman, Sir Paris, at Saint Peters Church, shall make thee there a joyful ', '2018-6-1', 'itsdatboi@gmail.com', 'deskrage@gmail.com');
insert into message values(291, 'Madam, in happy time what day is that?', '2018-1-14', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(292, 'Thou hast a careful father, child: One who, to put thee from thy heaviness, hath sorted out a sudden day of joy that thou expects nor I looked', '2018-6-9', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(293, 'Shell not come down tonight.', '2018-3-7', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(294, 'O God. Did Romeos hand shed Tybalts blood? O serpent heart hid with a flowering face. Was ever book containing such vile matters so fairly ', '2018-5-26', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(295, 'Well, thou hast comforted me marvelous much. Go in and tell my lady I am gone, having displeased my father to Father Lawrence to make confessi', '2018-4-4', 'snowstorm@outlook.com', 'json@hotmail.com');
insert into message values(296, 'What?', '2018-6-13', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(297, 'Amen', '2018-1-19', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(298, 'And from my soul too. Else beshrew them both.', '2018-2-17', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(299, 'Speakest thou from thy heart?', '2018-5-8', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(300, 'Faith, here it is. I think it best you marry with this Paris. O, hes a lovely gentleman. I think you are happy in this second match, for it ex', '2018-1-7', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(301, 'Then hie you hence to Father Laurence cell; There stays a husband to make you a wife', '2018-3-22', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(302, 'I have.', '2018-3-6', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(303, 'Have you got leave to go to confession to-day?', '2018-5-15', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(304, 'Heres such a coil! Come, what says Romeo?', '2018-2-4', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(305, 'O lady dear! Are you so hot? Henceforward do your messages yourself.', '2018-2-5', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(306, 'Where is my mother! How oddly thou repliest! Your love says, like an honest gentleman, Where is your mother?', '2018-3-13', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(307, 'Your love says, like an honest gentleman, and a courteous, and a kind, and a handsome, and, I warrant, a virtuous,--Where is your mother?', '2018-6-10', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(308, 'I faith, I am sorry that thou art not well. Sweet, sweet, sweet nurse, tell me, what says my love?', '2018-1-14', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(309, 'Lord, how my head aches! what a head have I! O, my back! Other other side,--O, my back.', '2018-4-17', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(310, 'But all this did I know before. What says he of our marriage? what of that?', '2018-2-23', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(311, 'Well, you have made a simple choice; you know not how to choose a man: Romeo! no, not he; though his face be better than any mans, yet his leg', '2018-4-17', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(312, 'How art thou out of breath, when thou hast breath To say to me that thou art out of breath? Is the news good, or bad? answer to that;', '2018-2-19', 'catdog@gmail.com', 'mad@yahoo.ca');
insert into message values(313, 'What haste? can you not stay awhile? Do you not see that I am out of breath?', '2018-6-9', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(314, 'I would thou hadst my bones, and I thy news: I pray thee, speak.', '2018-6-3', 'greenearth@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(315, 'I am a-weary, give me leave awhile: Fie, how my bones ache! what a jaunt have I!', '2018-1-14', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(316, 'O honey nurse, what news? Nurse?', '2018-6-5', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(317, 'By and by, I come: -- To cease thy strief, and leave me to my grief: To-morrow will I send.', '2018-4-2', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(318, '[Within] Juliet!', '2018-4-10', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(319, 'I uh, by and by I come--But if thou meanst not well, I do beseech thee--', '2018-5-22', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(320, '[Within] Juliet!', '2018-2-17', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(321, 'Three words, dear Romeo, and good night indeed. If that thy bent of love be honourable, Thy purpose marriage, send me word to-morrow, By one t', '2018-3-27', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(322, 'Juliet!', '2018-1-1', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(323, 'Madam, I am here. What is your will?', '2018-6-9', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(324, 'I bade her come. God forbid! Juliet! Juliet! Juliet!', '2018-6-14', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(325, 'Thus..... with a kiss...... I die.', '2018-6-1', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(326, 'Romeo. Whats here? Poison. Drunk all, and left no friendly drop to help me after. I will kiss thy lips. Happily some poison yet doth hang on ', '2018-4-19', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(327, 'O God, I have an ill-divining soul. Methinks I see thee, now thou art so low, as one dead in the bottom of a tomb. O fortune, fortune. Be fick', '2018-2-22', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(328, 'I doubt it not. Trust me, love, all these woes shall serve for sweet discourses in our times to come. Adieu.', '2018-1-9', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(329, 'Then window, let day in and let life out. O, thinkst thou we shall ever meet again?', '2018-1-18', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(330, 'More Light and light, more dark and dark our woes.', '2018-4-25', 'superfoody@live.com', 'itsdatboi@gmail.com');
insert into message values(331, 'It is, It is! Hie hence, be gone, away.  O, now be gone. More light and light it grows.', '2018-1-4', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(332, 'Let me be taken, let me be put to death. I have more care to stay then will to go. Come death, Welcome, Juliet wills it so. How ist my soul? L', '2018-2-18', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(333, 'That light is not daylight, I know it, I. It is some meteor that the sun exhales to light thee on thy way to Mantua. Therefore stay yet. Thou ', '2018-1-21', 'nonadmin@gmail.com', 'superfoody@live.com');
insert into message values(334, 'I must be gone and live, or stay and die.', '2018-6-13', 'json@hotmail.com', 'superfoody@live.com');
insert into message values(335, 'Wilt thou be gone? It is not yet near day.', '2018-4-19', 'catdog@gmail.com', 'snowstorm@outlook.com');
insert into message values(336, 'Mercutios soul is but a little way above our heads staying for thine to keep him company!', '2018-2-28', 'nabstua@gmail.com', 'json@hotmail.com');
insert into message values(337, 'Come gentle night. Come loving black-browned night give me my Romeo. And when I shall die, take him and cut him out into little stars, and he ', '2018-5-15', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(338, 'I will not fail: tis twenty year till then.', '2018-4-17', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(339, 'By the hour of nine.', '2018-4-28', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(340, 'Romeo! At what oclock to-morrow Shall I send to thee?', '2018-4-18', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(341, 'A thousand times the worse, to want thy light. Love goes toward love, as schoolboys from their books, But love from love, toward school with he', '2018-4-25', 'nonadmin@gmail.com', 'nabstua@gmail.com');
insert into message values(342, 'A thousand times good night! Exit, above', '2018-1-15', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(343, 'So thrive my soul--', '2018-6-1', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(344, 'I gave thee mine before thou didst request it!', '2018-3-14', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(345, 'The exchange of thy loves faithful vow for mine.', '2018-4-24', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(346, 'What satisfaction canst thou have to-night?', '2018-3-7', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(347, 'O, wilt thou leave me so unsatisfied?', '2018-2-26', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(348, 'Do not swear: although I joy in thee, I have no joy of this contract to-night: It is too rash, too unadvised, too sudden; Too like the lightni', '2018-5-22', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(349, 'If my hearts dear love--', '2018-5-20', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(350, 'Do not swear at all; Or, if thou wilt, swear by thy gracious self, Which is the god of my idolatry, And Ill believe thee.', '2018-4-10', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(351, 'Well what shall I swear by?', '2018-6-2', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(352, 'O, swear not by the moon, the inconstant moon, That monthly changes in her circled orb, Lest that thy love prove likewise variable.', '2018-4-15', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(353, 'Lady, by yonder blessed moon I swear That tips with silver all these fruit-tree tops--', '2018-6-6', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(354, 'Thou knowst the mask of night is on my face, Else would a maiden blush bepaint my cheek For that which thou hast heard me speak to-night Fain', '2018-5-10', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(355, 'I have nights cloak to hide me from their eyes, And but thou love me, let them find me here: My life were better ended by their hate, Than dea', '2018-1-23', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(356, 'If they do see thee, they will murder thee.', '2018-3-19', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(357, 'With loves light wings did I oer-perch these walls; For stony limits cannot hold love out, And what love can do that dares love attempt; Ther', '2018-3-22', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(358, 'How camest thou hither, tell me, and wherefore? The garden walls are high and hard to climb, And the place death, considering who thou art, If', '2018-3-17', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(359, 'Neither, fair maid, if either thee dislike.', '2018-6-9', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(360, 'Art thou not Romeo and a Montague?', '2018-1-8', 'snowstorm@outlook.com', 'nabstua@gmail.com');
insert into message values(361, 'Ahhh!', '2018-3-26', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(362, 'I take thee at thy word.', '2018-1-24', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(363, 'Tis but thy name that is my enemy; Thou art thyself, though not a Montague. Whats Montague? it is nor hand, nor foot, Nor arm, nor face, nor', '2018-4-13', 'greenearth@yahoo.ca', 'vybaby@gmail.com');
insert into message values(364, '[Aside] Shall I hear more, or shall I speak at this?', '2018-6-7', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(365, 'Romeo, O Romeo! wherefore art thou Romeo? Deny thy father and refuse thy name; Or, if thou wilt not, be but sworn my love, And Ill no longer ', '2018-3-18', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(366, 'She speaks: O, speak again, bright angel!', '2018-6-15', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(367, 'Ay me!', '2018-3-18', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(368, 'He jests at scars that never felt a wound. But, soft! what light through yonder window breaks? It is the east, and Juliet is the sun. Arise, fa', '2018-2-13', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(369, 'You kiss by the book.', '2018-6-13', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(370, 'Sin from my lips? O trespass sweetly urged! Give me my sin again.', '2018-2-3', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(371, 'Then have my lips the sin that they have took.', '2018-2-25', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(372, 'Then move not, while my prayers effect I take. Thus from my lips, by yours, my sin is purged.', '2018-4-23', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(373, 'Saints do not move, though grant for prayers sake.', '2018-2-14', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(374, 'Well, then, dear saint, let lips do what hands do; They pray, grant thou, lest faith turn to despair.', '2018-1-26', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(375, 'Ay, pilgrim, lips that they must use in prayer.', '2018-6-6', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(376, 'Have not saints lips, and holy palmers too?', '2018-6-2', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(377, 'Good pilgrim, you do wrong your hand too much, Which mannerly devotion shows in this; For saints have hands that pilgrims hands do touch, And', '2018-4-16', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(378, 'If I profane with my unworthiest hand This holy shrine, the gentle sin is this: My lips, two blushing pilgrims, ready stand To smooth that roug', '2018-2-8', 'superfoody@live.com', 'snowstorm@outlook.com');
insert into message values(379, 'Did my heart love till now? forswear it, sight! For I neer saw true beauty till this night.', '2018-1-21', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(380, 'Go, girl, seek happy nights to happy days.', '2018-2-11', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(381, 'Go! We follow thee. Juliet, Blah!', '2018-4-10', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(382, 'Speak briefly, can you like of Paris love?', '2018-1-24', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(383, 'Nay, bigger; women grow by men.', '2018-2-14', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(384, 'This night you shall behold him at our feast; Read oer the volume of young Paris face, And find delight writ there with beautys pen; ', '2018-4-14', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(385, 'Nay, hes a flower; in faith, a very flower.', '2018-1-14', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(386, 'Veronas summer hath not such a flower.', '2018-6-13', 'vybaby@gmail.com', 'mad@yahoo.ca');
insert into message values(387, 'A man, young lady! Lady, such a man As all the world- -why, hes a man of wax.', '2018-1-21', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(388, 'By my count, I was your mother much upon these years, You are now a maid. Thus then in brief: The valiant Paris seeks you for his love.', '2018-1-12', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(389, 'Thou wast the prettiest babe that eer I nursed.', '2018-5-17', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(390, 'Nurse, give leave awhile, We must talk in secret. Nurse, come back again; I have rememberd me, thous hear our counsel. Nurse, Thou kno', '2018-5-3', 'nonadmin@gmail.com', 'mad@yahoo.ca');
insert into message values(391, 'NO! Mercutio!', '2018-4-4', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(392, 'A Plague o both your houses.', '2018-4-2', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(393, 'I thought all for the best.', '2018-4-15', 'itsdatboi@gmail.com', 'json@hotmail.com');
insert into message values(394, 'Twill serve. Ask for me tomorrow and you shall find me a grave man. A plague o both your houses. They have made worms meat of me. A plague', '2018-2-14', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(395, 'Courage man, the hurt can not be much.', '2018-2-11', 'nabstua@gmail.com', 'itsdatboi@gmail.com');
insert into message values(396, 'Ay, ay, a scratch, a scratch. Ay, a scratch, a scratch. HA HA HA.', '2018-6-9', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(397, 'Farewell, ancient lady; farewell,', '2018-2-19', 'json@hotmail.com', 'snowstorm@outlook.com');
insert into message values(398, 'I will follow you.', '2018-3-23', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(399, 'Heres goodly gear!', '2018-1-26', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(400, 'Sure Witt! Now art thou sociable, now art thou Romeo; now art thou what thou art, by art as well as by nature.', '2018-6-4', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(401, 'Why, then is my pump well flowered.', '2018-1-2', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(402, 'Right.', '2018-6-14', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(403, 'Pink for flower.', '2018-3-2', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(404, 'Nay, I am the very pink of courtesy.', '2018-3-19', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(405, 'A most courteous exposition.', '2018-3-7', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(406, 'Thou hast most kindly hit it.', '2018-2-17', 'snowstorm@outlook.com', 'mad@yahoo.ca');
insert into message values(407, 'Meaning, to courtsy.', '2018-5-5', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(408, 'Thats as much as to say, such a case as yours constrains a man to bow in the hams.', '2018-6-9', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(409, 'Pardon, good Mercutio, my business was great; and in such a case as mine a man may strain courtesy.', '2018-6-6', 'mad@yahoo.ca', 'json@hotmail.com');
insert into message values(410, 'The slip, son, the slip; can you not conceive?', '2018-3-7', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(411, 'Good morrow to you both. What counterfeit did I give you?', '2018-2-16', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(412, 'Signior Romeo, bon jour! theres a French salutation to your French slop. You gave us the counterfeit fairly last night.', '2018-3-19', 'superfoody@live.com', 'snowstorm@outlook.com');
insert into message values(413, 'Ho Ho, Capital Punks!', '2018-4-9', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(414, 'Ay, so I fear; the more is my unrest.', '2018-3-8', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(415, 'Away, begone; the sport is at the best.', '2018-6-14', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(416, 'True, I talk of dreams, Which are the children of an idle brain, Begot of nothing but vain fantasy, Which is as thin of substance as the air', '2018-1-1', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(417, 'Peace, good Mercutio, peace! Thou talkst of nothing.', '2018-4-16', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(418, 'O, then, I see Queen Mab hath been with you. She is the fairies midwife, and she comes In shape no bigger than an agate-stone On the fore-f', '2018-6-3', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(419, 'In bed asleep, while they do dream things true.', '2018-6-9', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(420, 'That dreamers often lie.', '2018-2-23', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(421, 'Well, what was yours?', '2018-3-16', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(422, 'And so did I.', '2018-3-16', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(423, 'I dreamd a dream to-night.', '2018-6-1', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(424, 'Why, may one ask?', '2018-5-9', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(425, 'If love be rough with you, be rough with love; Prick love for pricking, and you beat love down.', '2018-6-5', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(426, 'Is love a tender thing? It is too rough, Too rude, too boisterous, and it pricks like thorn.', '2018-2-20', 'itsdatboi@gmail.com', 'mad@yahoo.ca');
insert into message values(427, 'Too great oppression for a tender thing.', '2018-3-24', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(428, 'Under loves heavy burden do I sink.', '2018-6-3', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(429, 'You are a lover; borrow Cupids wings, And soar with them above a common bound.', '2018-5-26', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(430, 'Not I, Not I believe me: you have dancing shoes With nimble soles: I have a soul of lead', '2018-6-15', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(431, 'Young hearts run free. Never be caught up, caught up like Rosaline and thee. Nay, gentle Romeo, we must have you dance.', '2018-6-2', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(432, 'I am for you.', '2018-5-17', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(433, 'Good king of cats, nothing but one of your nine lives.', '2018-3-5', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(434, 'What wouldst thou have with me?', '2018-5-28', 'snowstorm@outlook.com', 'nabstua@gmail.com');
insert into message values(435, 'Calm, Dishonorable, Vile Submission! Thou art my souls hate! Tybalt! You ratcatcher, will you walk?', '2018-1-7', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(436, 'Consort? What does thou make us minstrels? An thou make minstrels of us look to hear nothing of discords. Heres my fiddlestick. Heres that', '2018-1-19', 'itsdatboi@gmail.com', 'admin@gmail.com');
insert into message values(437, 'Mercutio! Thou art consortest with Romeo?', '2018-6-4', 'deskrage@gmail.com', 'catdog@gmail.com');
insert into message values(438, 'Could you not take some occasion without giving?', '2018-3-22', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(439, 'You shall find me apt enough to that, sir. And you will give me occasion.', '2018-1-12', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(440, 'OH, and but one word with one of us? Couple it with something. Make it a word and a...a blow.', '2018-6-2', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(441, 'Follow me close. Gentlemen, gooday. A word with one of you?', '2018-1-5', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(442, 'As if that name, Shot from the deadly level of a gun did murder her, as that names cursed hand did murder her kinsman.', '2018-3-27', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(443, 'O, she says nothing sir, but weeps and weeps, and then on Romeo cries and then falls down again.', '2018-3-19', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(444, 'Sir. Ah, sir. Death the end of all', '2018-5-6', 'vybaby@gmail.com', 'superfoody@live.com');
insert into message values(445, 'Nurse.', '2018-4-24', 'snowstorm@outlook.com', 'mad@yahoo.ca');
insert into message values(446, 'Bid her to come to confession this afternoon; And there she shall at Father Laurence cell Be shrived and married.', '2018-3-9', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(447, 'If ye should lead her into a fools paradise, as they say, it were a very gross kind of behavior, as they say: for the lady is young; and, ther', '2018-1-2', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(448, 'His name is Romeo, and hes a Montague; The only son of your great enemy.', '2018-5-17', 'admin@gmail.com', 'superfoody@live.com');
insert into message values(449, 'Is she a Capulet?', '2018-1-21', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(450, 'Madam, your mother craves a word with you. Come lets away.', '2018-1-18', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(451, 'As my American friend Larry would say: are you fucking deaf?  Its under your seat.', '2018-5-20', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(452, 'What?', '2018-2-10', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(453, 'Its under your seat.', '2018-5-24', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(454, 'To make a point.  I dont know her, and I was ready to splatter her brains all over the sidewalk.  I dont particularly like you, so imagine w', '2018-4-3', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(455, 'Why did you do that?', '2018-4-11', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(456, 'You know it is.', '2018-6-9', 'vybaby@gmail.com', 'snowstorm@outlook.com');
insert into message values(457, 'Do you really think so?', '2018-4-1', 'vybaby@gmail.com', 'snowstorm@outlook.com');
insert into message values(458, 'This is important.', '2018-3-6', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(459, 'Always in a rush, you are.  All these years Ive known you, you could never wait for anything.', '2018-4-25', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(460, 'Do you have it?', '2018-6-5', 'itsdatboi@gmail.com', 'superfoody@live.com');
insert into message values(461, 'Im up for that...', '2018-1-3', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(462, 'I dont know.  I was thinking...Maybe the three of us might partner up -- guns for hire, that sort of thing.', '2018-5-5', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(463, 'So where do you go from here?', '2018-5-19', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(464, 'Only the stupid ones.  Cigarettes kill more patriots than bullets.  Besides, Im not IRA no more.', '2018-6-4', 'json@hotmail.com', 'catdog@gmail.com');
insert into message values(465, 'I dont want you dead, woman, I want the the truth!', '2018-3-27', 'deskrage@gmail.com', 'mad@yahoo.ca');
insert into message values(466, 'You go shoot me if you want, Vincent, but youll be dead before I hit the ground.', '2018-5-15', 'snowstorm@outlook.com', 'admin@gmail.com');
insert into message values(467, 'And I dont believe you...', '2018-6-1', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(468, 'Well I dont!', '2018-2-15', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(469, 'When this whole thing started you made it clear: youre running the show.  And I dont believe youd be running this show if you didnt know ', '2018-3-6', 'admin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(470, 'I dont know.', '2018-6-12', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(471, 'Finding this package is a thing easier said than done.  We dont even know what it is.  What did we steal?', '2018-5-7', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(472, 'Of course.', '2018-1-18', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(473, 'Very good.  Now all we have to do is live long enough to get paid.', '2018-4-26', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(474, 'And then Sam, you and I clean up whatevers left to be cleaned.', '2018-6-1', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(475, 'Leaving...', '2018-4-25', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(476, 'While Sam and I take out the back two cars...', '2018-4-17', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(477, 'Is that right?', '2018-6-8', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(478, 'We kept it...', '2018-6-8', 'itsdatboi@gmail.com', 'deskrage@gmail.com');
insert into message values(479, 'Of course.', '2018-1-2', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(480, 'Coordinate all you want, but make sure whatever you do gets cleared through me.  Are we in sync on this, Vincent?', '2018-3-3', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(481, 'I drink what every civilized man, woman and child in the world drinks: Guinness.', '2018-2-14', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(482, 'Oh yeah?  Whatta you drink, then?', '2018-2-23', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(483, 'Budweiser?  You talk to me of beer and youve the unbridled gall to mention Budweiser in the same sentence?  Thats not beer!  Christ, its n', '2018-6-3', 'itsdatboi@gmail.com', 'catdog@gmail.com');
insert into message values(484, 'Best beer in the world?  Budweiser for me, thanks.', '2018-1-2', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(485, 'Best beer in the world known to man or God.', '2018-5-22', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(486, 'What is?', '2018-1-12', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(487, 'Some places, not all.  Italy, for instance, theyre serious about their food.  But try bloody Britain, anywhere in the U.K., you dont get mu', '2018-4-5', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(488, 'This...this is incredible. Is the rest of Europe like this?', '2018-2-21', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(489, 'Thats why you were riding with him.', '2018-3-19', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(490, 'I never did trust that blonde fuck...', '2018-3-1', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(491, 'How do we know that?', '2018-2-11', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(492, 'And you believed me?  But it wasnt my people who did it.', '2018-3-1', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(493, 'And then...', '2018-4-27', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(494, 'Then Swede and I split with the package and meet you back at the rendezvous.', '2018-3-26', 'deskrage@gmail.com', 'superfoody@live.com');
insert into message values(495, 'Which leads us to...', '2018-2-23', 'admin@gmail.com', 'superfoody@live.com');
insert into message values(496, 'You call me with the targets route, I follow along until weve reached the attack point and then I run his squag ass off the road.', '2018-1-12', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(497, 'The deal?  The deal is we leave for Nice at first light.', '2018-2-2', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(498, 'So whats the deal?', '2018-4-16', 'snowstorm@outlook.com', 'nonadmin@gmail.com');
insert into message values(499, 'And who are you?', '2018-1-10', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(500, 'I drive -- and my name is Larry.  Larry from the States.', '2018-6-5', 'catdog@gmail.com', 'snowstorm@outlook.com');
insert into message values(501, 'The name is Deirdre, and Im running this show.', '2018-6-13', 'itsdatboi@gmail.com', 'superfoody@live.com');
insert into message values(502, 'Who the fuck are you?', '2018-4-2', 'admin@gmail.com', 'superfoody@live.com');
insert into message values(503, 'Its good to see youve all got such faith in our little undertaking.', '2018-4-21', 'vybaby@gmail.com', 'superfoody@live.com');
insert into message values(504, 'No, Seamus.  I heard you the first time.', '2018-6-14', 'nonadmin@gmail.com', 'mad@yahoo.ca');
insert into message values(505, 'Do I need to repeat myself?', '2018-2-23', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(506, 'Shut up!!!  Shut up and drive!  Im your superior officer and you will do as I goddamn well say, is that understood?!?', '2018-2-16', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(507, 'Youre thinking with your gun, Seamus, and not your head...', '2018-1-17', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(508, 'Plastic fucking surgeon?  You think Im going to fix this, Deirdre lass?  Its the mark of the patriot, and Ill wear it like a badge.  As for', '2018-5-10', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(509, 'You better be careful, Seamus, before something happens a plastic surgeon cant fix.', '2018-5-18', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(510, 'Theyre good!', '2018-6-7', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(511, 'Good Christ!  Cant you lose these jokers?', '2018-5-25', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(512, 'Not yet...', '2018-2-21', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(513, 'About time!', '2018-5-20', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(514, 'You lose them!', '2018-6-5', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(515, 'Lose them!', '2018-3-4', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(516, 'Thats him.', '2018-4-2', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(517, 'From Interpol?', '2018-4-16', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(518, 'Theyre part of the team.  One of thems the guy I told you about.', '2018-3-17', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(519, 'What in bloody hell is going on?', '2018-5-4', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(520, 'Nothing.', '2018-1-10', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(521, 'Would somebody tell me what fucking well happened in there?', '2018-3-16', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(522, 'Problem my ass!  I think youre lying to me, and if you are youre a dead man!', '2018-6-12', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(523, 'I thought I did.', '2018-3-14', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(524, 'Not to me, you know that.', '2018-3-9', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(525, 'Its been known to happen.', '2018-1-25', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(526, 'So you thought that maybe Id grown too attached to this charade Ive been playing, is that it?', '2018-3-16', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(527, 'It means I was worried that all the time you spent away from the fold might have affected you.  Youve been living the life of the hired gun -', '2018-2-19', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(528, 'And whats that supposed to mean, Seamus Reilly?', '2018-4-6', 'deskrage@gmail.com', 'snowstorm@outlook.com');
insert into message values(529, 'Now theres the Deirdre I know.', '2018-4-22', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(530, 'When were done with this, I want to do for that one myself.', '2018-1-25', 'itsdatboi@gmail.com', 'json@hotmail.com');
insert into message values(531, 'Come off it, Sam -- if we werent friends already we wouldnt be here now, would we?', '2018-6-10', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(532, 'Not me.  You work too often with the same people and you become friends -- clouds your judgement.', '2018-2-16', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(533, 'Alright?  Its bloody fucking freezing in here!', '2018-1-24', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(534, 'Are you alright?', '2018-1-5', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(535, 'Bloody fucking hell...', '2018-1-25', 'deskrage@gmail.com', 'catdog@gmail.com');
insert into message values(536, 'I didnt say I was.', '2018-3-9', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(537, 'Where do you get off saying word one? All the time pretending to be one of us, its the same thing we were doing, Seamus and myself.  And her', '2018-2-13', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(538, 'Dont even think that Im buying that.', '2018-2-14', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(539, 'Im a patriate.', '2018-3-1', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(540, 'Oh please..youre on some sort of holy mission?', '2018-5-2', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(541, 'Well, if it isnt Mr. Interpol himself.  I cant believe I misjudged you like I did.', '2018-3-5', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(542, 'That were too stupid to trace his calls.', '2018-4-3', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(543, 'Check this out.  Gregors a spook, or he was one until recently.  When he was a spy he lived the life -- you know, a prince in some Eastern Bloc ', '2018-3-22', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(544, 'I bought it for him -- all the stuff he was using, it was in his contract.  Cost a nice penny, too, especially that goddamned phone: Gregor h', '2018-4-1', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(545, 'Exactly.  Gregor, he was the Russians man.  It was my people came up with the idea for this run, but the Russians who had the capital to fin', '2018-2-22', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(546, 'Because if they had shed be gone along with the package, instead of sitting here with us.', '2018-3-15', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(547, 'I dont know...  Well I dont!  Its a goddamned mystery to me just like it is to you.  But I do know who were working for.  My people, and ', '2018-1-9', 'nonadmin@gmail.com', 'snowstorm@outlook.com');
insert into message values(548, 'Now, what did we steal?', '2018-1-2', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(549, 'Just business.', '2018-3-28', 'itsdatboi@gmail.com', 'superfoody@live.com');
insert into message values(550, 'Duty calls?', '2018-1-26', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(551, 'I better be getting that.', '2018-4-22', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(552, 'Exactly.  And last night I wanted to be with someone who was just like me.', '2018-1-27', 'admin@gmail.com', 'snowstorm@outlook.com');
insert into message values(553, 'Youre a hired gun, Deirdre -- just like me.', '2018-1-16', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(554, 'I know I dont have to, Sam, its just that, for once, I want to.  when I was a -  Patriot, it was a given Id sleep with any man it was deem', '2018-6-7', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(555, 'You dont have to explain yourself to me, Deirdre.', '2018-1-25', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(556, 'Look, Sam, dont take it the wrong way when I tell you we wont be doing this again.', '2018-6-7', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(557, 'I probably do.  But for the time being, Im willing to forget about it...', '2018-4-3', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(558, 'And when I consider that, I have to wonder if you dont have some ulterior motive for being here, with me, right now.', '2018-4-16', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(559, 'Nobodys saying they dont.', '2018-5-24', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(560, 'Part of me says I should just look at this as a perk.  You know, a bonus.  But then I remember youre you -- Deirdre who used to belong to the IR', '2018-4-17', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(561, 'Thats right.', '2018-6-9', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(562, 'Is that right?', '2018-1-14', 'itsdatboi@gmail.com', 'json@hotmail.com');
insert into message values(563, 'I still am.', '2018-2-5', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(564, 'I didnt think to see you again tonight. You were pretty pissed.', '2018-5-2', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(565, 'I feel as if Ive wandered onto the set of Enter The Dragon.  Could you teach me to do that?', '2018-6-1', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(566, 'We werent real thrilled about it either...', '2018-4-23', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(567, 'The two of you were supposed to go to a simple meet and come back with a simple piece of information, and instead you went to fucking war...', '2018-1-21', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(568, 'Hazard pay...', '2018-4-12', 'vybaby@gmail.com', 'snowstorm@outlook.com');
insert into message values(569, 'Once.', '2018-6-10', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(570, 'You were a soldier, were you?', '2018-5-28', 'nabstua@gmail.com', 'nonadmin@gmail.com');
insert into message values(571, 'Sam.  Im a weapons guy.', '2018-5-2', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(572, 'Hell kill me anway, Sam, shoot though me and kill this fucker.', '2018-5-4', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(573, 'Shut up!', '2018-1-2', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(574, 'Dont do it, Sam!', '2018-2-11', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(575, 'Go ahead, shoot... Shoot and kill the bitch, I dont care.  And yet you dont shoot.  Interesting. Put down your weapon and walk away.', '2018-5-12', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(576, 'Should any of you decide to rush me, Ill kill myself and whoever happens to be near me at the time.', '2018-6-12', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(577, 'That fucking figures...', '2018-6-5', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(578, 'Theres a problem...', '2018-3-24', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(579, 'Wheres the case?', '2018-4-20', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(580, 'Ready when you are...', '2018-6-5', 'superfoody@live.com', 'json@hotmail.com');
insert into message values(581, 'Alright, Gregor, Im...', '2018-3-4', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(582, 'Next.', '2018-5-20', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(583, 'I use my cell phone to get computer access to the telecommunications satellite used by our target.  I trace his cell phone signature and use i', '2018-6-9', 'greenearth@yahoo.ca', 'nabstua@gmail.com');
insert into message values(584, 'Now then, lets run through it one more time, shall we?  Whats your job?', '2018-5-23', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(585, 'In this business, your life and your reputation are more often than not one and the same.', '2018-5-10', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(586, 'But would you stake your life, thats the question...', '2018-5-5', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(587, 'Id stake my reputation.', '2018-4-5', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(588, 'You sure about this?', '2018-6-2', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(589, 'I intend to.  This phone is wired like no other: its got an encryption chip and instant sat-a-link recognition, it can talk to any computer i', '2018-4-1', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(590, 'Good, because it cost enough.  Theres cheaper phones by far than that one, man: you better fucking use it.', '2018-5-16', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(591, 'Its quite satifactory.', '2018-2-27', 'snowstorm@outlook.com', 'json@hotmail.com');
insert into message values(592, 'These days they they call me Gregor -- and Im a tech.  I do electronic work, surveillance, computer runs.', '2018-3-7', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(593, 'From here on in you want something you pay cash for it: no credit cards, no bank accounts are in place: ten percent up front, the rest when t', '2018-1-1', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(594, 'Not likely.  Once, yeah, I was -- but there wasnt an inch of profit in it, and Im a cash oriented girl, if you take my meaning.  Im a hire', '2018-3-16', 'json@hotmail.com', 'snowstorm@outlook.com');
insert into message values(595, 'Who are you?  IRA?', '2018-3-15', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(596, 'I think not.  After you...', '2018-3-13', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(597, 'Perhaps we could both go at the same time...', '2018-6-6', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(598, 'You first, Edvard.', '2018-2-20', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(599, 'Do you have the material?', '2018-5-2', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(600, 'Really?  Do you have the money with you?', '2018-5-14', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(601, 'Well double your price.', '2018-5-13', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(602, 'Im sure.  But Im sorry to say that its too late for trust: we have a serious problem.', '2018-1-2', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(603, 'That was a mistake, trying to kill you. Mikhi did it without consulting me, Id have never allowed it.', '2018-2-21', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(604, 'Im touched, really, that theyd send someone of your caliber.  Its nice to know that they didnt make the mistake of underestimating me twic', '2018-3-4', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(605, 'Yes, Gregor, they sent me.', '2018-4-19', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(606, 'Then you better find it in your heart to tell me, Francois, because while your death is inevitable, it still isnt decided how painful its g', '2018-5-26', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(607, 'In here...', '2018-6-4', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(608, 'Wheres my information?', '2018-4-1', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(609, 'Of course.', '2018-1-6', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(610, 'I take it you still want the money...', '2018-4-6', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(611, 'If you say a word in English, Vincent, my friend with the high powered sporting rifle will shoot you in the throat. Sorry to screw you over ', '2018-4-14', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(612, 'Whats that?', '2018-4-16', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(613, 'Theres been a slight problem.', '2018-6-5', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(614, 'Heres yours.', '2018-6-15', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(615, 'Hes a cop, Vincent, hes French and hes a cop and you better shoot him in the fucking head right now!', '2018-2-8', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(616, 'What do you mean?', '2018-5-21', 'snowstorm@outlook.com', 'nabstua@gmail.com');
insert into message values(617, 'Bad company...', '2018-6-7', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(618, 'Hes company.', '2018-6-10', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(619, 'Not so fast.  Whos that?', '2018-3-9', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(620, 'Do you have it?', '2018-1-27', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(621, 'Youll die if you leave here.', '2018-3-13', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(622, 'Well die if we stay here!', '2018-6-10', 'nonadmin@gmail.com', 'catdog@gmail.com');
insert into message values(623, 'Ill destroy whatevers in the case.', '2018-4-10', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(624, 'And more importantly --', '2018-4-13', 'json@hotmail.com', 'snowstorm@outlook.com');
insert into message values(625, 'Enough!', '2018-2-10', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(626, 'Im shocked, shocked to think that youd believe him.', '2018-3-6', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(627, 'Edvard said the same thing about you before he died.', '2018-6-13', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(628, 'Whatever you wish...  This has all been a terrible mistake, Gregor.  I wanted to play straight with you, but Edvard insisted we try and kill yo', '2018-3-25', 'greenearth@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(629, 'No, Mikhi, I wouldnt.  Since I wont speak your language, and you cant speak mine, English will do nicely.', '2018-6-2', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(630, 'Sit, sit...  Would you like one?', '2018-5-13', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(631, 'I think not.  I have, of course, taken the precaution of wiring the briefcase to explode five seconds after it opens.  Unless, of course, I de', '2018-6-10', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(632, 'Figured enough to know theres an odd man out and Im looking at him.', '2018-4-10', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(633, 'So, youve got it all figured, do you?', '2018-6-8', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(634, 'Whats a little hate between business partners?', '2018-5-19', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(635, 'But you hate each other!', '2018-6-13', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(636, 'What am I doing here?  Why, Im here to see my partners, Gregor, the boys in the Russian Mafia.  See, your bosses had hoped to screw me by hir', '2018-2-27', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(637, 'Youve told me a lot of things, boyo...', '2018-4-16', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(638, 'It is, Im telling you it is!!', '2018-3-5', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(639, 'This better be the real thing or youre a dead man!', '2018-3-24', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(640, 'I swear, it has to come here!  It has to...', '2018-3-5', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(641, 'If youre lying to me you poor excuse for a human being, Im gonna blow your brains all over this car.', '2018-5-1', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(642, 'A post office box.', '2018-3-7', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(643, 'Sent it where?', '2018-3-5', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(644, 'I sent it to myself in Paris.', '2018-3-18', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(645, 'Then where is it?', '2018-2-5', 'snowstorm@outlook.com', 'admin@gmail.com');
insert into message values(646, 'I swear...', '2018-4-10', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(647, 'Bullshit!', '2018-4-13', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(648, 'I dont have it with me...', '2018-2-20', 'superfoody@live.com', 'json@hotmail.com');
insert into message values(649, 'Dont talk to me unless you tell me what I want to hear, understand?!?  You have no choice in this, dont think about winning, think about stayin', '2018-6-6', 'snowstorm@outlook.com', 'nonadmin@gmail.com');
insert into message values(650, 'Now that is an interesting proposition.', '2018-4-19', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(651, 'So none of us knows whos paying the freight, this is just some anonymous job. For all we know, were working for different people.', '2018-2-26', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(652, 'I got this gig through a contractor. And he most definitely didnt know who was doing the hiring, only that they were paying a lot of money...', '2018-3-11', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(653, 'Whoever hired us.', '2018-2-25', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(654, 'What I do is none of your concern.  What you should do is wait for my next phone call.  Im going to find a place where I can tilt the field i', '2018-6-13', 'nabstua@gmail.com', 'itsdatboi@gmail.com');
insert into message values(655, 'So what do we do?', '2018-3-18', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(656, 'Im in the middle of saving you people a great deal of money -- the least you could do is have the decency to pay me!', '2018-6-5', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(657, 'It was a mistake, it shouldnt have happened.', '2018-5-5', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(658, 'Much to your disappointment, no doubt.', '2018-5-26', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(659, 'Gregor, is that you?', '2018-3-27', 'admin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(660, 'Its done.', '2018-2-21', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(661, 'Is it done?', '2018-1-4', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(662, 'I do, I do...', '2018-5-17', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(663, 'I just wanted to make sure you knew who you were dealing with.', '2018-2-4', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(664, 'I need you, Swede, I cant do this without you!', '2018-3-5', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(665, 'Really?', '2018-5-22', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(666, 'Nobodys going to do that!', '2018-5-8', 'catdog@gmail.com', 'itsdatboi@gmail.com');
insert into message values(667, 'Dont cross me...', '2018-5-15', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(668, 'What are you doing?', '2018-3-10', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(669, 'Whats that?', '2018-3-28', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(670, 'There is one other thing...', '2018-3-7', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(671, 'Then I guess were set.', '2018-4-17', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(672, 'Thats it.', '2018-5-19', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(673, 'A means to an end, is that it?', '2018-2-16', 'nonadmin@gmail.com', 'superfoody@live.com');
insert into message values(674, 'I hadnt thought about it.  Understand me, Gregor -- I take no pleasure in killing.  It doesnt bother me one bit, but I dont get off on it.', '2018-4-18', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(675, 'I would imagine that the great satisfaction in all of this will be killing the American.', '2018-5-9', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(676, 'Because if theres more than one party involved, if we really are working for different people, then perhaps some of us are on different sides', '2018-1-12', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(677, 'How so?', '2018-3-2', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(678, 'If he hadnt youd have put a bullet in his head a long time ago.', '2018-2-14', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(679, 'How did you know?', '2018-4-11', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(680, 'Not exactly?  But close enough, eh?  So he saved your life, then?', '2018-3-20', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(681, 'Not exactly.', '2018-5-22', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(682, 'Ive never seen a man who could have taken what he just went through.  Hes a cop?', '2018-6-4', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(683, 'Of course.  Dont you?', '2018-3-21', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(684, 'And you respect him.', '2018-3-4', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(685, 'Yes, Sams tough alright.', '2018-4-6', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(686, 'Hes tough, your American friend.', '2018-2-8', 'nabstua@gmail.com', 'json@hotmail.com');
insert into message values(687, 'Hello, my friend.  He doesnt look French to me, Vincent.', '2018-5-26', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(688, 'Hello, Jean-Pierre.', '2018-1-13', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(689, 'A Samurai has honor, a Samurai live by the code of Bushido, the way of the warrior.  Im just a killer for hire.  The world isnt about honor, an', '2018-5-6', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(690, 'You seem one to me.', '2018-5-12', 'json@hotmail.com', 'catdog@gmail.com');
insert into message values(691, 'Vincents life is his own burden; hell have to carry it for himself.  And Im not any kind of Samurai.', '2018-5-2', 'mad@yahoo.ca', 'deskrage@gmail.com');
insert into message values(692, 'Perhaps forged is a better word.  Like steel.  Like a sword.  Youre a modern Samurai.  Ive spent my life around extraordinary men -- me', '2018-3-7', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(693, 'Created?', '2018-2-21', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(694, 'I suppose I want to know how a man like you is created.', '2018-3-18', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(695, 'So what is it you want to know?', '2018-1-4', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(696, 'Perhaps.  But you are not healthy, and if you try Ill kill you.', '2018-6-6', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(697, 'If I was healthy, I could take that away from you.', '2018-1-22', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(698, 'Call it a reckoning of character.', '2018-5-1', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(699, 'So this is what, a test?', '2018-6-15', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(700, 'Not a word.  But no ordinary criminal would have the extensive military and medical expertise you do.  And so I place the pieces of the p', '2018-2-24', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(701, 'Vincent told you that Im a cop?', '2018-3-25', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(702, 'You suffered through an agonizing pain last night, pain you could have avoided by declaring yourself an agent of the law.', '2018-5-8', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(703, 'I didnt expect that he would.', '2018-3-23', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(704, 'He sees this differently, as you well know.', '2018-1-2', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(705, 'Forgive my intrusion into your affairs, but I am the one who connected Vincent to this job, his agent, if you will.  He is one of my olde', '2018-5-3', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(706, 'It gets done now or not at all.  Another couple of days and the parties concerned are gone where I cant get them.', '2018-3-27', 'json@hotmail.com', 'superfoody@live.com');
insert into message values(707, 'Something important?  A thing that cannot wait?', '2018-1-2', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(708, 'Yeah.', '2018-2-16', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(709, 'But first you have something to take care of?', '2018-1-25', 'snowstorm@outlook.com', 'mad@yahoo.ca');
insert into message values(710, 'Soon.', '2018-5-11', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(711, 'You should really let a doctor look at that.', '2018-2-24', 'deskrage@gmail.com', 'catdog@gmail.com');
insert into message values(712, 'Some, thanks.  Enough to move on, for now.', '2018-4-12', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(713, 'Then if you dont mind...  Im gonna pass out.', '2018-3-18', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(714, 'Dont worry, well take care of it.', '2018-3-11', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(715, 'You think you can stitch me up on you own?', '2018-6-5', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(716, 'No booze...Pains in the mind, and the mind I can control.  Alright, lets do it.', '2018-1-16', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(717, 'Are you sure you wont have a drink?', '2018-3-21', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(718, 'Well, Vincents American friend, shall we see what we can do for you?', '2018-6-8', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(719, 'American.', '2018-6-4', 'catdog@gmail.com', 'mad@yahoo.ca');
insert into message values(720, 'Did he bring that with him?', '2018-6-12', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(721, 'What are you gonna do, call him up and ask him to give us back our shit?', '2018-3-23', 'json@hotmail.com', 'catdog@gmail.com');
insert into message values(722, 'Fine with fucking me, we got work to do. I dont care what it takes, we are getting our property back and putting it into the hands of the peop', '2018-6-1', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(723, 'Its a cocktail.  Mostly demerol, cut with a little crank because we might need you awake in the real near future.', '2018-6-8', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(724, 'My way is better.', '2018-1-20', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(725, 'Yeah, well...  My way works too.', '2018-1-14', 'superfoody@live.com', 'catdog@gmail.com');
insert into message values(726, 'Why dont you go do better, then...', '2018-2-15', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(727, 'Its been known to happen.', '2018-4-19', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(728, 'Is that right?', '2018-6-3', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(729, 'Long enough to shoot back.', '2018-2-7', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(730, 'Not for long.', '2018-5-28', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(731, 'All in the stomach, though.  Your man might live.', '2018-4-23', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(732, 'Gets the job done.', '2018-1-25', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(733, 'You shoot alright.', '2018-5-25', 'catdog@gmail.com', 'json@hotmail.com');
insert into message values(734, 'Anybody tries to unpleasant me Ill put two between his eyes -- one to do the job and the other to make sure it takes.', '2018-2-25', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(735, 'The point remains: we could be working for different people.  Theres a chance for one of us...  Maybe more than one of us -- has been paid to cr', '2018-2-28', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(736, 'I dont think so.', '2018-6-2', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(737, 'I dont particularly like killing, tubby, but I want you to know that this one Im going to enjoy.', '2018-2-19', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(738, 'Not in mine.', '2018-2-8', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(739, 'Its consider a virtue in some corners of the world.', '2018-2-26', 'nonadmin@gmail.com', 'vybaby@gmail.com');
insert into message values(740, 'Is that right?', '2018-6-2', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(741, 'You should learn a little patience.', '2018-3-12', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(742, 'Where is this broad?', '2018-1-26', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(743, 'I blast the lead car into oblivion...', '2018-3-5', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(744, 'After we stop the target car I get out and use the heavy artillery to kill the driver and his bodyguard.', '2018-2-14', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(745, 'Eat shit and die slowly...', '2018-5-19', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(746, 'I ride with fat-boy...', '2018-4-24', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(747, 'Who you calling dumb, dickless?', '2018-2-24', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(748, 'And you could stand to get a little smarter, aint that right you dumb blonde fuck?', '2018-3-18', 'snowstorm@outlook.com', 'json@hotmail.com');
insert into message values(749, 'Im just worried about your health, Larry.  You could stand to shed a few pounds.', '2018-2-11', 'snowstorm@outlook.com', 'json@hotmail.com');
insert into message values(750, 'Who the fuck died and appointed you food czar?', '2018-3-2', 'superfoody@live.com', 'deskrage@gmail.com');
insert into message values(751, 'You should watch what you eat.', '2018-1-9', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(752, 'Everybody.', '2018-4-21', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(753, 'Whos they?', '2018-1-27', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(754, 'They call me Swede.', '2018-5-14', 'snowstorm@outlook.com', 'nonadmin@gmail.com');
insert into message values(755, 'I got a surprise for you, blondie...', '2018-6-7', 'superfoody@live.com', 'itsdatboi@gmail.com');
insert into message values(756, 'What a surprise...', '2018-1-13', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(757, 'Whatre you talking about, man?  I dont understand.', '2018-6-8', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(758, 'Just to keep me company, Sam -- I hate smoking alone.  How about you?  I thought all you IRA types smoked.', '2018-4-3', 'nabstua@gmail.com', 'deskrage@gmail.com');
insert into message values(759, 'I told you, I quit.', '2018-5-14', 'nabstua@gmail.com', 'json@hotmail.com');
insert into message values(760, 'I guess thats for the best.', '2018-2-9', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(761, 'Gone.  Destroyed.', '2018-5-1', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(762, 'What happened to it?', '2018-1-27', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(763, 'I dont know.  Nobody knows, except a bunch of people who are too dead to tell us.  Theres probably a couple of guys back at the Company who kno', '2018-1-23', 'greenearth@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(764, 'Tell me something first.  The package: what was it?', '2018-1-3', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(765, 'You better get some sleep, alright?', '2018-4-21', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(766, 'I know.', '2018-2-15', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(767, 'You dont owe me a goddamned thing, Vincent, and you know it.  You stepped in front of a bullet for me.  I owe you a heavy debt.', '2018-4-27', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(768, 'Your field dressing saved his life. Thats three I owe you.', '2018-1-21', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(769, 'Nothing...', '2018-4-25', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(770, 'What of it?', '2018-4-10', 'greenearth@yahoo.ca', 'superfoody@live.com');
insert into message values(771, 'You speak French.', '2018-5-23', 'admin@gmail.com', 'catdog@gmail.com');
insert into message values(772, 'What?', '2018-5-13', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(773, 'You son-of-a-bitch...', '2018-3-9', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(774, 'Finish it!', '2018-3-22', 'itsdatboi@gmail.com', 'json@hotmail.com');
insert into message values(775, 'And now...', '2018-5-8', 'greenearth@yahoo.ca', 'vybaby@gmail.com');
insert into message values(776, 'Finish the job...', '2018-1-13', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(777, 'Lets get him out of here...', '2018-6-10', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(778, 'Ill work on it...', '2018-1-8', 'deskrage@gmail.com', 'superfoody@live.com');
insert into message values(779, 'You have to stop doing that!', '2018-4-12', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(780, 'No, I dont.', '2018-6-3', 'itsdatboi@gmail.com', 'admin@gmail.com');
insert into message values(781, 'Do you have a good answer?', '2018-2-28', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(782, 'Thats a good question.', '2018-3-26', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(783, 'And when you finish?  What then?  This package, whatever it is, do you give it to the CIA?  Do you really think they deserve it?', '2018-6-3', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(784, 'And yet you would have killed him to save my life.  You have a sense of honor, Vincent, that I cant even remember anymore.  I dont know that I ', '2018-3-13', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(785, 'Closest and oldest.', '2018-3-14', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(786, 'Its the one thing Ive got left to hold onto.  Jean-Pierre is one of your closest friends, is he not?', '2018-6-8', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(787, 'Why not?', '2018-5-8', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(788, 'Because I dont walk away.', '2018-1-14', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(789, 'Why then, Sam, dont you act like this is a job like any other?  Surely, if you are a hired gun, you realize that some times you just have to', '2018-2-19', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(790, 'The mark of a true Samurai.  What I do for the Company, Vincent, is no different than what you do.  Were both hired guns, and this is a job -- l', '2018-5-19', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(791, 'Why?  Youve got more force of will than anyone Ive ever seen.  You handle a gun like its a part of you, you perform surgery on yourself wi', '2018-6-5', 'superfoody@live.com', 'admin@gmail.com');
insert into message values(792, 'Would you stop with that...', '2018-1-12', 'deskrage@gmail.com', 'superfoody@live.com');
insert into message values(793, 'What of it?  Samurai pain in the ass.', '2018-1-12', 'greenearth@yahoo.ca', 'vybaby@gmail.com');
insert into message values(794, 'Not just like that... Just before I turn around and its six months from now and the first thing I do when I wake up in the morning is light a ci', '2018-5-8', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(795, 'Just like that?', '2018-6-9', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(796, 'Time to quit.', '2018-1-24', 'itsdatboi@gmail.com', 'json@hotmail.com');
insert into message values(797, 'If Im going to die for the CIA, Im going to go out smoking.  Besides, theres half a forest between us and them, they cant see a goddamned', '2018-6-13', 'vybaby@gmail.com', 'itsdatboi@gmail.com');
insert into message values(798, 'Not here.  They might see it.', '2018-2-18', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(799, 'Yeah.  We need out fucking heads examined.', '2018-5-1', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(800, 'Do we need anything else?', '2018-4-7', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(801, 'I think not.', '2018-3-17', 'nabstua@gmail.com', 'itsdatboi@gmail.com');
insert into message values(802, 'In a minute.', '2018-1-14', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(803, 'If our positions were reversed, would you leave me?', '2018-3-6', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(804, 'No you dont, and you know it.', '2018-2-7', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(805, 'So I do it.', '2018-2-22', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(806, 'I know I dont need to say this to you, but I need to say it to you.  This is my job, I have to do it.', '2018-4-3', 'nonadmin@gmail.com', 'snowstorm@outlook.com');
insert into message values(807, 'Something like that.', '2018-6-7', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(808, 'Business keeps you on the road?', '2018-4-25', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(809, 'Im not here very much.', '2018-2-19', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(810, 'Why are you driving?  Youre not French, you dont live here, you dont know these roads.  Why are you driving?', '2018-3-7', 'nonadmin@gmail.com', 'nabstua@gmail.com');
insert into message values(811, 'Gimme a goddamn cigarette!!!!', '2018-2-19', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(812, 'Right now?', '2018-1-15', 'vybaby@gmail.com', 'mad@yahoo.ca');
insert into message values(813, 'Give me a cigarette.', '2018-4-27', 'superfoody@live.com', 'greenearth@yahoo.ca');
insert into message values(814, 'You dont know?  Bullshit, you had her, there was no way out.', '2018-6-8', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(815, 'I dont know...', '2018-3-23', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(816, 'What the fuck happened?', '2018-5-5', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(817, 'You said it yourself: Gregors not dead. If they had the package, theyd have killed him.', '2018-2-26', 'superfoody@live.com', 'mad@yahoo.ca');
insert into message values(818, 'You think?', '2018-6-5', 'snowstorm@outlook.com', 'admin@gmail.com');
insert into message values(819, 'They dont have the package.', '2018-4-5', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(820, 'Because I owe you.  Look at that...', '2018-4-28', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(821, 'How could you have done that?', '2018-4-15', 'deskrage@gmail.com', 'nonadmin@gmail.com');
insert into message values(822, 'I would have tried not to.  But yes, if it would have kept him from shooting you, I would have.', '2018-6-11', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(823, 'You would have done that?', '2018-1-3', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(824, 'I was waiting to see what would happen. I didnt want to kill him if I didnt have to.', '2018-6-8', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(825, 'You were behind the door?', '2018-1-17', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(826, 'I know.  Jean-Pierre did.', '2018-5-23', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(827, 'I never made that claim.', '2018-1-6', 'nabstua@gmail.com', 'vybaby@gmail.com');
insert into message values(828, 'Not very zen of you, huh?  Not so much the modern Samurai after all.', '2018-1-1', 'vybaby@gmail.com', 'mad@yahoo.ca');
insert into message values(829, 'It is at that.', '2018-6-5', 'deskrage@gmail.com', 'catdog@gmail.com');
insert into message values(830, 'Very ugly.', '2018-4-11', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(831, 'Dark operations.  Wet work.  Kidnaping. Assassination.', '2018-3-8', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(832, 'Dark ops?', '2018-4-1', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(833, 'Im a field agent -- last of an already extinct breed.  I do dark ops.', '2018-3-15', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(834, 'Its a cover, then.  A cover within a cover, a feint within a feint.  You work for the CIA, its the only possible answer.', '2018-3-8', 'superfoody@live.com', 'json@hotmail.com');
insert into message values(835, 'Sure I do.  You heard him, you heard the guy -- thats what he said, what Edvard said.', '2018-5-22', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(836, 'Then quit.  You dont work for Interpol, Sam.', '2018-5-21', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(837, 'Its my job.', '2018-5-8', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(838, 'Continue when it would be so much easier to give it up.', '2018-6-12', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(839, 'Do what?', '2018-5-17', 'mad@yahoo.ca', 'greenearth@yahoo.ca');
insert into message values(840, 'Tell me, Sam: why do you do this?', '2018-1-22', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(841, 'If Tony says this is it, then its it.', '2018-2-25', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(842, 'You sure your friend got the right place?', '2018-5-6', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(843, 'Thorough man.', '2018-6-13', 'deskrage@gmail.com', 'greenearth@yahoo.ca');
insert into message values(844, 'The address of the Russian production company.  Just in case we need to find them.', '2018-5-25', 'nabstua@gmail.com', 'greenearth@yahoo.ca');
insert into message values(845, 'Whats this?', '2018-5-20', 'deskrage@gmail.com', 'mad@yahoo.ca');
insert into message values(846, 'Yes.', '2018-1-18', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(847, 'The Irish representative?', '2018-2-25', 'mad@yahoo.ca', 'nabstua@gmail.com');
insert into message values(848, 'I know of him.', '2018-3-15', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(849, 'You know him?', '2018-1-20', 'superfoody@live.com', 'itsdatboi@gmail.com');
insert into message values(850, 'Good.  Now take the forceps, and remember, Vincent, what were doing here is routine.  Ive done stuff like this at least twenty times in the fie', '2018-4-1', 'vybaby@gmail.com', 'deskrage@gmail.com');
insert into message values(851, 'Clearly.', '2018-2-24', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(852, 'You see the bullet?', '2018-6-8', 'mad@yahoo.ca', 'json@hotmail.com');
insert into message values(853, 'Alright, its done.', '2018-5-2', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(854, 'Yes I do.', '2018-2-18', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(855, 'You dont have to do this.', '2018-4-23', 'deskrage@gmail.com', 'mad@yahoo.ca');
insert into message values(856, 'It isnt about money for me, not anymore.', '2018-3-27', 'superfoody@live.com', 'json@hotmail.com');
insert into message values(857, 'This doesnt involve you, dont you understand?  I cant even guarantee you any money out of all this.', '2018-3-25', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(858, 'Im going with you.', '2018-3-3', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(859, 'We?  There is no we in my world now, Vincent, just me.', '2018-2-6', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(860, 'I think so.', '2018-1-28', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(861, 'Did you do it?', '2018-3-26', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(862, 'Oh!  Yes, Doctor.', '2018-2-25', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(863, 'Give him the sedative!', '2018-6-1', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(864, 'Are you serious??', '2018-6-2', 'deskrage@gmail.com', 'mad@yahoo.ca');
insert into message values(865, 'All right -- give it to him!', '2018-4-11', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(866, 'Stop -- singing!!!', '2018-3-21', 'admin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(867, 'It has a pas-sion, The Con-ti nen-tal...', '2018-3-2', 'json@hotmail.com', 'nabstua@gmail.com');
insert into message values(868, 'Its some-thing dar-ing, The Con-ti-nen-tal, A way of danc-ing thats real-ly ul-tra new; Its ver-y sub-tle, The Con-ti-nen-tal.', '2018-1-8', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(869, 'This is not the finals -- just sing!', '2018-1-25', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(870, 'Id be so nervous.', '2018-6-11', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(871, 'Yes -- quickly, dear!', '2018-2-14', 'admin@gmail.com', 'nonadmin@gmail.com');
insert into message values(872, 'Me?  Sing?', '2018-2-25', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(873, 'Do you think you can sing it?', '2018-2-4', 'deskrage@gmail.com', 'catdog@gmail.com');
insert into message values(874, 'I think Ill...carry him.', '2018-2-16', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(875, 'What are you going to do?', '2018-1-5', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(876, 'What do you think we should do?', '2018-6-1', 'mad@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(877, 'It looks that way.', '2018-4-6', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(878, 'Alive!  Look at it.  I have defeated death!', '2018-6-8', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(879, 'I think youve done it, master.', '2018-6-3', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(880, 'Oh, Doctor!', '2018-3-17', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(881, 'Look here -  if it wasnt you, and it wasnt you, and it wasnt me...', '2018-2-27', 'greenearth@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(882, 'It wasnt me.', '2018-2-28', 'mad@yahoo.ca', 'json@hotmail.com');
insert into message values(883, 'I dont understand -- I followed the notes to the letter.', '2018-5-16', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(884, 'I thought it was wonderful.', '2018-4-17', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(885, 'Reputation.  Reputation!', '2018-2-15', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(886, 'Oh!  Yes, Doctor.', '2018-4-22', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(887, 'Raise the platform, hurry!', '2018-3-6', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(888, 'Right here?', '2018-1-17', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(889, 'I know.', '2018-6-5', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(890, 'Yes!', '2018-3-22', 'json@hotmail.com', 'snowstorm@outlook.com');
insert into message values(891, 'A god?', '2018-6-14', 'json@hotmail.com', 'admin@gmail.com');
insert into message values(892, 'Oh, Frederick... youre not only a great doctor, youre a great... youre almost a...', '2018-5-10', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(893, 'Soon, all the electrical secrets of Heaven shall be mine.', '2018-1-14', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(894, 'Dilation of his sacral parasympathetic impulses would cause an increase in flow of blood and the erection to approximately nineteen inches of', '2018-6-10', 'snowstorm@outlook.com', 'catdog@gmail.com');
insert into message values(895, 'And look at this, Doctor!', '2018-2-25', 'nabstua@gmail.com', 'admin@gmail.com');
insert into message values(896, 'As the minuteness of the parts formed a great hindrance to my speed, I resolved to make the Creature of a gigantic stature. Of course!  That', '2018-3-8', 'nabstua@gmail.com', 'catdog@gmail.com');
insert into message values(897, 'Perhaps wed better leave.', '2018-6-12', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(898, 'Oh, doctor!', '2018-5-21', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(899, 'But who was playing it?', '2018-4-13', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(900, 'Well, this explains the music.', '2018-6-2', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(901, 'Look, Doctor!', '2018-5-12', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(902, 'What a filthy mess.', '2018-5-10', 'deskrage@gmail.com', 'vybaby@gmail.com');
insert into message values(903, 'Ooh!', '2018-5-1', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(904, 'All right then, quietly!  Close your robe and stay right behind me. Dont make a sound!', '2018-2-4', 'admin@gmail.com', 'superfoody@live.com');
insert into message values(905, 'Let me come with you, Doctor, please!  I dont want to stay up here alone.', '2018-1-16', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(906, 'Whatever it is, its coming from down there.  Im going down to see.', '2018-2-4', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(907, 'Dr. Fronkonsteen -- look!', '2018-6-14', 'snowstorm@outlook.com', 'deskrage@gmail.com');
insert into message values(908, 'I dont know.  It just woke me up.', '2018-2-24', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(909, 'Yes!  What could it be at this hour?', '2018-3-27', 'nonadmin@gmail.com', 'superfoody@live.com');
insert into message values(910, 'Listen!  Dont you hear that strange music?', '2018-4-3', 'admin@gmail.com', 'mad@yahoo.ca');
insert into message values(911, 'What is it?  Is something wrong, Doctor?', '2018-4-25', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(912, 'Inga, wake up!', '2018-3-2', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(913, 'Yes, you may... but dont make any noise.', '2018-2-27', 'nonadmin@gmail.com', 'mad@yahoo.ca');
insert into message values(914, 'Inga!', '2018-3-11', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(915, 'Well... Ill just finish unpacking.', '2018-3-5', 'greenearth@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(916, 'No, thanks!  I want to get right to sleep.', '2018-5-8', 'nonadmin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(917, 'Would you like a sandwich?', '2018-4-2', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(918, 'Well.. I suppose it would be all right, for just a little while.', '2018-6-6', 'snowstorm@outlook.com', 'admin@gmail.com');
insert into message values(919, 'Oh please -- just till I get sleepy. Then you can force me right back to my room.', '2018-6-10', 'json@hotmail.com', 'greenearth@yahoo.ca');
insert into message values(920, 'Well...', '2018-6-7', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(921, 'I know, but usually I can fall asleep right away.  It must be the strange room.', '2018-6-12', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(922, 'We only arrived a few minutes ago.', '2018-4-24', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(923, 'Could I lie down in your bed for a little while?  I just cant sleep.', '2018-6-13', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(924, 'Thats quite all right.  What is it, dear?', '2018-3-11', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(925, 'Are you busy?', '2018-5-13', 'deskrage@gmail.com', 'itsdatboi@gmail.com');
insert into message values(926, 'Just an atmospheric discharge. Nothing to be afraid of.', '2018-3-23', 'nabstua@gmail.com', 'nonadmin@gmail.com');
insert into message values(927, 'Sometimes Im afraid of the lightning.', '2018-6-7', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(928, 'Im not sure I...get your drift.', '2018-5-3', 'itsdatboi@gmail.com', 'greenearth@yahoo.ca');
insert into message values(929, 'Did you ever have a roll in the hay?', '2018-5-20', 'deskrage@gmail.com', 'mad@yahoo.ca');
insert into message values(930, 'Yes, thank you.  It wasnt bad.', '2018-2-2', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(931, 'Did you have a pleasant trip?', '2018-6-14', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(932, 'How nice.', '2018-4-27', 'mad@yahoo.ca', 'json@hotmail.com');
insert into message values(933, 'Extremely well.', '2018-2-2', 'vybaby@gmail.com', 'superfoody@live.com');
insert into message values(934, 'Do Something!  Stall them!', '2018-4-11', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(935, 'Another fifteen seconds to go.', '2018-4-20', 'json@hotmail.com', 'itsdatboi@gmail.com');
insert into message values(936, 'Igor -- the clock!  Hurry!', '2018-3-12', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(937, 'Oh, must be around ten... ten-thirty.', '2018-5-22', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(938, 'Sounds like visitors.  Its all right -- Frau Blucher will show them in.', '2018-2-14', 'deskrage@gmail.com', 'nabstua@gmail.com');
insert into message values(939, '', '2018-6-15', 'nonadmin@gmail.com', 'catdog@gmail.com');
insert into message values(940, 'Absolutely!  May my mother grow two heads if Im not telling the truth.', '2018-5-14', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(941, 'Igor -- are you sure the monster has a good brain?  Are you absolutely certain that you took the brain of Hans Delbruck that night?', '2018-2-24', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(942, 'Oh, Igor -- Im so afraid!  I just hope this all ends well.', '2018-4-26', 'nonadmin@gmail.com', 'deskrage@gmail.com');
insert into message values(943, 'What dya want to do to kill time?', '2018-5-7', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(944, 'Yes.', '2018-2-22', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(945, 'Three minutes to go!', '2018-5-22', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(946, 'Four', '2018-3-6', 'nonadmin@gmail.com', 'catdog@gmail.com');
insert into message values(947, 'How long is it so far?', '2018-4-28', 'itsdatboi@gmail.com', 'catdog@gmail.com');
insert into message values(948, 'The doctor said to allow seven minutes:  no more and no less -- or else they could both become hopelessly paralyzed.', '2018-4-14', 'vybaby@gmail.com', 'superfoody@live.com');
insert into message values(949, 'How do you know theyre done?', '2018-1-5', 'catdog@gmail.com', 'snowstorm@outlook.com');
insert into message values(950, 'Why certainly.  Dont you, Frau Blucher?', '2018-5-3', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(951, 'I think the doctor is a genius! Dont you, Igor?', '2018-2-25', 'admin@gmail.com', 'json@hotmail.com');
insert into message values(952, 'You cant expect to iron out all the kinks in one night.', '2018-2-28', 'nabstua@gmail.com', 'itsdatboi@gmail.com');
insert into message values(953, 'Look how far weve come.', '2018-2-1', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(954, 'Why dont we all turn in?  Its been a long day.', '2018-2-1', 'nonadmin@gmail.com', 'nabstua@gmail.com');
insert into message values(955, 'Im getting tired.', '2018-1-28', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(956, 'Do you know the theme from Doctor Zhivago?', '2018-1-17', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(957, 'Its working!  Oh, Doctor -- you play beautifully.', '2018-6-4', 'greenearth@yahoo.ca', 'mad@yahoo.ca');
insert into message values(958, 'Whew!  A nineteen-inch drill.', '2018-6-12', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(959, 'His schwanzstucker.', '2018-4-17', 'mad@yahoo.ca', 'greenearth@yahoo.ca');
insert into message values(960, 'His what??', '2018-6-3', 'greenearth@yahoo.ca', 'catdog@gmail.com');
insert into message values(961, 'There must have been someone else down here then.', '2018-5-27', 'mad@yahoo.ca', 'vybaby@gmail.com');
insert into message values(962, 'No, not sound.', '2018-1-13', 'vybaby@gmail.com', 'superfoody@live.com');
insert into message values(963, 'Franz!  Help!  Lunatic!', '2018-1-17', 'itsdatboi@gmail.com', 'mad@yahoo.ca');
insert into message values(964, 'GRRRHMMNNNJKJMMMNN!', '2018-4-6', 'nabstua@gmail.com', 'snowstorm@outlook.com');
insert into message values(965, 'Now just one moment.  Theres no need for roughhousing.  Have you ever tried a tip?', '2018-6-7', 'nabstua@gmail.com', 'itsdatboi@gmail.com');
insert into message values(966, 'Foooooood!', '2018-6-15', 'vybaby@gmail.com', 'catdog@gmail.com');
insert into message values(967, 'Oh, no sir-ee.  If yo dont have a reservation you can skip to ma-loo.', '2018-4-19', 'snowstorm@outlook.com', 'nonadmin@gmail.com');
insert into message values(968, 'Drink!', '2018-2-4', 'snowstorm@outlook.com', 'vybaby@gmail.com');
insert into message values(969, 'Im sorry, sir.  We only seat by reservation.', '2018-2-2', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(970, 'Food!!', '2018-2-1', 'snowstorm@outlook.com', 'itsdatboi@gmail.com');
insert into message values(971, 'Do you have a reservation?', '2018-2-7', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(972, 'Food!', '2018-4-12', 'admin@gmail.com', 'greenearth@yahoo.ca');
insert into message values(973, 'Yes, sir, name, please?', '2018-4-27', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(974, 'Zulu may not wear shoes or trousers and the like but it don t mean to say they got no brains. Theyll watch us  and wait  and find our we', '2018-4-2', 'mad@yahoo.ca', 'admin@gmail.com');
insert into message values(975, 'Why don t the Zulus attack?', '2018-3-13', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(976, 'One Zulu is only one man.. ..and Im afeared of no one man... but the Zulu, they come in the thousands.... like a black wave of death.... ', '2018-3-28', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(977, 'You afeared of the Zulus then, Quartermaster?', '2018-4-26', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(978, 'Could be.  Across the river into Zululand. . They might just be waiting there for us to show up... .them stabbing assegais pointing right ', '2018-3-6', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(979, 'Will we be fighting the Zulus soo~, Quartermaster? .', '2018-2-6', 'catdog@gmail.com', 'nonadmin@gmail.com');
insert into message values(980, 'So, you got it in the line of dooty.. ... point taken.', '2018-5-5', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(981, 'From the Cook, Sir They saw me dip your shaving tin in the tea-water this morning, made their tea taste of Lifebuoy toilet soap, they saij', '2018-1-9', 'greenearth@yahoo.ca', 'json@hotmail.com');
insert into message values(982, 'I listened extra careful to your Stand To this mornin, Boy. ft was peifecL I couldnt ve done it better meseif, not even when I was Bu', '2018-6-7', 'nonadmin@gmail.com', 'itsdatboi@gmail.com');
insert into message values(983, 'Will you hear Last Post, Sir?', '2018-3-15', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(984, 'Our friend Colonel Dumford will be  should be   at this minute approaching Pulleine. I think well eat here. I want to scout that mountain', '2018-2-15', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(985, 'Eleven oclock, My LorJ 42', '2018-2-20', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(986, 'What oclock is it, Mr Noggs?', '2018-4-26', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(987, 'My only fear is that the Zulu will avoid the engagement', '2018-1-9', 'deskrage@gmail.com', 'catdog@gmail.com');
insert into message values(988, 'So attack is your defence. Well lets hope Cetshwayo will offer his Impis full destruction.', '2018-5-11', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(989, 'Do not confuse yourse{fi Why? We must strike a heavy blow. This cannot be a war of manoeuvre.', '2018-1-9', 'snowstorm@outlook.com', 'nabstua@gmail.com');
insert into message values(990, 'If Ive got it right, My Lord, you lead an invasion into Zululand, for I see it all around me, but why? is the question my readers wi', '2018-6-13', 'catdog@gmail.com', 'mad@yahoo.ca');
insert into message values(991, 'Tell what you see. Write it well, Sir, and make sure you get it right', '2018-3-5', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(992, 'They spurred onto high ground, My Lord, full of spirit and looking for the Zulu. Full of sport they were, My Lord.', '2018-2-1', 'vybaby@gmail.com', 'nonadmin@gmail.com');
insert into message values(993, 'Were they in good heart as they entered enemy territory?', '2018-5-25', 'mad@yahoo.ca', 'snowstorm@outlook.com');
insert into message values(994, 'Indeedldid, MyLord. Itwas one ofthe first to cross.', '2018-3-8', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(995, '1 saw you lead our Cavalry sir', '2018-1-4', 'catdog@gmail.com', 'superfoody@live.com');
insert into message values(996, 'Excuse me, My Lord.  Norris-Newman, of The Standard, My Lord.', '2018-3-23', 'itsdatboi@gmail.com', 'snowstorm@outlook.com');
insert into message values(997, 'An historical moment, Gentlemen.', '2018-4-4', 'catdog@gmail.com', 'nabstua@gmail.com');
insert into message values(998, 'And the threat of counter invasion no longer exists? 40', '2018-1-12', 'deskrage@gmail.com', 'admin@gmail.com');
insert into message values(999, 'Tomorrow we will continue our advance on Ulundi. Dumford, kindly return to your unit Bring them here immediately to support Pulleine. Mr V', '2018-4-11', 'nabstua@gmail.com', 'superfoody@live.com');
insert into message values(1000, 'Im explaining my reasons.', '2018-3-19', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(1001, 'Are you dictating the strategy of this war, Sir?', '2018-1-14', 'json@hotmail.com', 'nonadmin@gmail.com');
insert into message values(1002, 'Intelligence? Sources of your own? Did it not occur to you they may be native rumours? Rumours to draw you off- to leave the whole ofNatal', '2018-5-13', 'itsdatboi@gmail.com', 'admin@gmail.com');
insert into message values(1003, 'I have received intelligence from, sources of my own that the Zulu Impis are moving North of here and threaten your left.', '2018-4-20', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(1004, 'You intended to bring your reserves across the river?', '2018-3-20', 'nabstua@gmail.com', 'mad@yahoo.ca');
insert into message values(1005, 'My Lord.  This list was prepared for you. I don t think another can understand its true value.', '2018-2-27', 'json@hotmail.com', 'mad@yahoo.ca');
insert into message values(1006, 'Excellent. Thank you.  Give them to Crealock, would you?', '2018-1-28', 'admin@gmail.com', 'deskrage@gmail.com');
insert into message values(1007, 'I thought it might be more effective to find someone who speaks Zulu.', '2018-2-21', 'nonadmin@gmail.com', 'snowstorm@outlook.com');
insert into message values(1008, 'Oh... indeed. Crealock, we should see that Colonel Dumford has an Officer for his hard riders. Perhaps a subaltern from the Twenty Fourth.', '2018-5-25', 'itsdatboi@gmail.com', 'vybaby@gmail.com');
insert into message values(1009, 'They come well recommended do they? DURNFORD', '2018-3-22', 'vybaby@gmail.com', 'admin@gmail.com');
insert into message values(1010, 'Sikali Horse, My Lord. Christians alL I know each one by name.', '2018-5-17', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(1011, 'Splendid horsemanship  Who are they?', '2018-6-7', 'json@hotmail.com', 'deskrage@gmail.com');
insert into message values(1012, 'Certainly, Sin', '2018-1-21', 'superfoody@live.com', 'vybaby@gmail.com');
insert into message values(1013, 'Splendid site, Crealock, splendil I want to establish Camp here immediately.', '2018-6-1', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(1014, 'A large party of Zulus have been sighted in the direction of the Kings KraaL Getting up, CHELMSFORD moves over to look at the map on his de', '2018-5-22', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(1015, 'Yes?', '2018-6-5', 'mad@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(1016, 'Thank you.', '2018-3-22', 'vybaby@gmail.com', 'greenearth@yahoo.ca');
insert into message values(1017, 'The only reports of enemy activity have come from the direction of the Royal Kraal, at Ulundi.', '2018-6-1', 'itsdatboi@gmail.com', 'mad@yahoo.ca');
insert into message values(1018, 'Our runners bare his dispatches, do they not?', '2018-6-10', 'greenearth@yahoo.ca', 'admin@gmail.com');
insert into message values(1019, 'Er, called Noggs, Sir Actual name is Norris-Newman. He presented credentials from The Standard.', '2018-6-14', 'greenearth@yahoo.ca', 'deskrage@gmail.com');
insert into message values(1020, 'Whats that strange name the newspaper chaps called?', '2018-4-8', 'mad@yahoo.ca', 'catdog@gmail.com');
insert into message values(1021, 'But will they make good use of them?', '2018-5-21', 'deskrage@gmail.com', 'json@hotmail.com');
insert into message values(1022, 'Yes. I see youve issued each of them with a Martini Henry Carbine. Our quota for Native contingencies: one rifle to ten men and only five r', '2018-1-1', 'nonadmin@gmail.com', 'admin@gmail.com');
insert into message values(1023, 'Right.  Bombardier, to me please.', '2018-1-11', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(1024, 'Well, fed or hungry, Pulleine wants them in position immediately. .', '2018-4-7', 'greenearth@yahoo.ca', 'itsdatboi@gmail.com');
insert into message values(1025, 'Well, my horses are feeding, as you may observe, Mr Coghill. Itll take a little while.', '2018-3-2', 'mad@yahoo.ca', 'greenearth@yahoo.ca');
insert into message values(1026, 'How quickly can you move your artillery forward?', '2018-2-13', 'catdog@gmail.com', 'vybaby@gmail.com');
insert into message values(1027, 'Yes.', '2018-3-21', 'snowstorm@outlook.com', 'superfoody@live.com');
insert into message values(1028, 'Stuart?', '2018-3-16', 'itsdatboi@gmail.com', 'nonadmin@gmail.com');
insert into message values(1029, 'Keep steady. Youre the best shots of the Twenty-Fourth. You bunch of heathens, do it', '2018-4-14', 'catdog@gmail.com', 'admin@gmail.com');
insert into message values(1030, 'Choose your targets men. Thats right Watch those markers. 55', '2018-3-9', 'vybaby@gmail.com', 'json@hotmail.com');
insert into message values(1031, 'ft could be you flatter yourself CoghilL Its that odd eye.', '2018-1-3', 'deskrage@gmail.com', 'mad@yahoo.ca');
insert into message values(1032, 'Well that one. The one who keeps looking at me.', '2018-3-21', 'mad@yahoo.ca', 'superfoody@live.com');
insert into message values(1033, 'Which one?', '2018-3-28', 'superfoody@live.com', 'nabstua@gmail.com');
insert into message values(1034, 'Do you think she might be interested in  someone?', '2018-6-3', 'vybaby@gmail.com', 'nabstua@gmail.com');
insert into message values(1035, 'Well thats typical of Her Majestys army. Appoint an engineer to do a soldiers work.', '2018-5-17', 'nonadmin@gmail.com', 'json@hotmail.com');
insert into message values(1036, 'Um. There are rumours that my Lord Chelmsford intends to make Durnford Second in Command.', '2018-2-5', 'snowstorm@outlook.com', 'greenearth@yahoo.ca');
insert into message values(1037, 'Lighting COGHILL 5 cigar: Our good Colonel Dumford scored quite a coup with the Sikali Horse.', '2018-1-4', 'json@hotmail.com', 'vybaby@gmail.com');
insert into message values(1038, 'So far only their scouts. But we have had reports of a small Impi farther north, over there. ', '2018-6-6', 'admin@gmail.com', 'nabstua@gmail.com');
insert into message values(1039, 'And I assure you, you do not In fact Id be obliged for your best advice. What have your scouts seen?', '2018-4-19', 'admin@gmail.com', 'vybaby@gmail.com');
insert into message values(1040, 'Well I assure you, Sir, I have no desire to create difficulties. 45', '2018-5-2', 'greenearth@yahoo.ca', 'nonadmin@gmail.com');
insert into message values(1041, 'I think Chelmsford wants a good man on the border Why he fears a flanking attack and requires a steady Commander in reserve.', '2018-5-6', 'catdog@gmail.com', 'greenearth@yahoo.ca');
insert into message values(1042, 'Lord Chelmsford seems to want me to stay back with my Basutos.', '2018-2-2', 'catdog@gmail.com', 'deskrage@gmail.com');
insert into message values(1043, 'Im to take the Sikali with the main column to the river', '2018-3-9', 'superfoody@live.com', 'nonadmin@gmail.com');
insert into message values(1044, 'Your orders, Mr Vereker?', '2018-1-4', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(1045, 'Good ones, yes, Mr Vereker. Gentlemen who can ride and shoot', '2018-6-10', 'itsdatboi@gmail.com', 'nabstua@gmail.com');
insert into message values(1046, 'Colonel Durnford... William Vereker. I hear you ve been seeking Officers?', '2018-6-10', 'snowstorm@outlook.com', 'nonadmin@gmail.com');


insert into thread values('Food',6,'RIP Anthony Bourdain','https://www.cnn.com/2018/06/08/us/anthony-bourdain-obit/index.htmlA mix of a storyteller and a che','2018-4-3', 'nabstua@gmail.com');
insert into thread values('Food',7,'So, after I made a post on r/eatcheapandhealt','EDIT: [WE HAVE RECIPES.](https://missmedlandtaylor.com/)[Yesterdays post](https://www.reddit.com/','2018-2-15', 'nabstua@gmail.com');
insert into thread values('Food',8,'Get your turkey out to thaw if its 200lbs or','','2018-4-8', 'catdog@gmail.com');
insert into thread values('Food',9,'Alton Brown announces the return of Good Eat','https://twitter.com/altonbrown/status/904449569127370753','2018-2-11', 'nonadmin@gmail.com');
insert into thread values('Food',10,'As if 2016 couldnt get any worse, I just saw','','2018-5-14', 'greenearth@yahoo.ca');
insert into thread values('Food',11,'Getting sick of the way online recipes are be','Does anyone have any idea why for the love of all things amazing that people who are writing online ','2018-4-16', 'deskrage@gmail.com');
insert into thread values('Food',12,'I never thought it would happen to me, but it','I spent three hours making a Korean bone broth soup. Once all of the bones were finally clean of all','2018-2-17', 'catdog@gmail.com');
insert into thread values('Food',13,'Is anyone else fully sick of recipe sites tha','It just pisses me off; Im not even sure if anyone bothers to read the mountain of text before the r','2018-4-5', 'greenearth@yahoo.ca');
insert into thread values('Food',14,'Is anyone else considered the chef or pers','I guess Im a decent cook, but Im always baffled when I make a dish and people ask me where I learn','2018-2-10', 'greenearth@yahoo.ca');
insert into thread values('Food',15,'A friend of mine told me Cooking alone for y','Sorry if this post isnt allowed - I couldnt tell from the Rules. Technically this post is permitte','2018-5-22', 'json@hotmail.com');

insert into thread values('Movies/Television',16,'YouTube channel Every Frame a Painting anno','Co-Creators Tony Zhou and Taylor Ramos officially announced there wont be any new EFAP videos comin','2018-2-4', 'itsdatboi@gmail.com');
insert into thread values('Movies/Television',18,'I am Tony Zhou, creator of the Every Frame a','First off, thanks to your mod bulcmlifeurt for putting this together.So I am Tony Zhou. Im a film','2018-6-1', 'nabstua@gmail.com');
insert into thread values('Movies/Television',19,'Wonder Woman really isnt that great','I recently watched Wonder Woman for the second time since seeing it in theatre and now that the dust','2018-1-17', 'nonadmin@gmail.com');
insert into thread values('Movies/Television',20,'The Last Jedi is Poor Storytelling: How Episo','**[Spoilers follow]**Although critics praise director Rian Johnson for taking Star Wars in a bold ','2018-1-10', 'mad@yahoo.ca');
insert into thread values('Movies/Television',21,'RESULTS: /r/TrueFilms favorite films of 2014','','2018-3-28', 'deskrage@gmail.com');
insert into thread values('Movies/Television',22,'500 Days of Summers color palette (theory). W','To preface, I have seen this movie maybe five or six times now and love everything about it. However','2018-4-22', 'itsdatboi@gmail.com');
insert into thread values('Movies/Television',23,'As a Mexican I am emotionally overwhelmed & s','I was already excited for this movie due to Pixars reputation & the fact that our Mexican heritage ','2018-4-19', 'snowstorm@outlook.com');
insert into thread values('Movies/Television',24,'Childish Gambino - This is America Analysis','If I posted in the wrong sub, I apologize, please do message me the right sub to post this in.I en','2018-3-8', 'vybaby@gmail.com');
insert into thread values('Movies/Television',25,'[RESULTS] R/TRUEFILMS FAVORITE FILMS OF 2017','','2018-6-13', 'superfoody@live.com');
insert into thread values('Movies/Television',26,'Alan Rickman, star of stage and screen has di','http://www.bbc.co.uk/news/entertainment-arts-35313604Most well known for playing Severus Snape in ','2018-6-4', 'greenearth@yahoo.ca');

insert into thread values('Sports',27,'CHIEFS -7 UPVOTE PARTY','WHAT A WAY TO COVER LMAO','2018-1-4', 'catdog@gmail.com');
insert into thread values('Sports',28,'U.S. Supreme Court rules federal ban on state','Time for all states to finally allow sports betting!','2018-2-21', 'nabstua@gmail.com');
insert into thread values('Sports',29,'Super Bowl Live Betting Strategy Thread','it is what it says. nba finals we had some awesome updates and discussion, me and /u/sab3r even caug','2018-6-4', 'itsdatboi@gmail.com');
insert into thread values('Sports',30,'Lets put on money on Net Neutrality. Go to th','https://www.battleforthenet.com/?utm_source=AN&utm_medium=email&utm_campaign=BFTNCallTool&utm_conten','2018-5-14', 'nabstua@gmail.com');
insert into thread values('Sports',31,'News years resolution was no more online spor','','2018-3-19', 'admin@gmail.com');
insert into thread values('Sports',32,'DO NOT USE BETONLINE - CAUGHT CHEATING AT BLA','I know this sub is about sports betting but BetOnline was caught red handed cheating in blackjack by','2018-6-2', 'deskrage@gmail.com');
insert into thread values('Sports',33,'RP-Excel Wk 5 Algorithmic Predictions | The M','Hey Guys! Romeo (aka RP-Excel) here again with my weekly RP1 algorithmic picks!  **Last weeks p','2018-6-13', 'itsdatboi@gmail.com');
insert into thread values('Sports',34,'HOW TO BET THE NHL PLAYOFFS (a study by Profe','Hello everyone!  With the 2017 NHL playoffs set to begin tomorrow night, I figured I would revisit','2018-5-19', 'snowstorm@outlook.com');
insert into thread values('Sports',35,'I followed eight professional tipsters of a p','Hey guys,The title probably says it allhttps://cognitivefootball.wordpress.com/2018/03/04/the-il','2018-1-8', 'catdog@gmail.com');
insert into thread values('Sports',36,'I hope he didnt max bet that 100% lock...','https://www.reddit.com/r/sportsbook/comments/78q2ng/is_this_the_first_legitimate_100_lock_youve/> ','2018-2-16', 'deskrage@gmail.com');

insert into thread values('Gaming',37,'John @Totalbiscuit Bain July 8, 1984 - May 24','','2018-1-19', 'deskrage@gmail.com');
insert into thread values('Gaming',38,'Belgium says loot boxes are gambling, wants t','','2018-4-14', 'nabstua@gmail.com');
insert into thread values('Gaming',39,'The ONLY way a large company such as EA will ','I feel like I should make this reality clear to everyone who is rightfully annoyed and upset by the ','2018-5-9', 'admin@gmail.com');
insert into thread values('Gaming',40,'Titanfall 2 will not have a season pass, all ','','2018-3-24', 'json@hotmail.com');
insert into thread values('Gaming',41,'Totalbiscuit hospitalized, his cancer is spre','','2018-6-9', 'vybaby@gmail.com');
insert into thread values('Gaming',42,'[E3 2018] Cyberpunk 2077','**Name: Cyberpunk 2077****Platforms: PC, Xbox, Playstation****Genre: RPG.****Release Date: TBA','2018-4-17', 'json@hotmail.com');
insert into thread values('Gaming',43,'EA fired Plants VS Zombies creator for object','','2018-5-16', 'itsdatboi@gmail.com');
insert into thread values('Gaming',44,'Sony faces growing Fortnite backlash at E3','','2018-2-1', 'deskrage@gmail.com');
insert into thread values('Gaming',45,'Later today, Red Dead 2 gets a new trailer. B','The hypetrain is about to start for Rockstar and Take2s next AAA title Red Dead Redemption 2. I hope','2018-1-14', 'snowstorm@outlook.com');
insert into thread values('Gaming',46,'First Look at Nintendo Switch','','2018-6-14', 'superfoody@live.com');

insert into thread values('Music',47,'Lets Talk: Songs that are good introductions','On a couple other subs theres been a couple discussions recently about songs that work as good intr','2018-5-12', 'itsdatboi@gmail.com');
insert into thread values('Music',48,'Hi, Im Max Landis and I wrote a 150 page ess','https://www.youtube.com/watch?v=jCFh0lJ-WAgThis is the gateway video, but the site itself, featuri','2018-1-26', 'deskrage@gmail.com');
insert into thread values('Music',49,'We need to get rid of the false idea that cla','Haydn was a self-taught peasant. Beethoven came from a down-and-out family and his dad was always in','2018-3-21', 'nabstua@gmail.com');
insert into thread values('Music',50,'Could Trump Presidency Spell Resurgence for P','The bread and butter of a lot of Punk music is political unrest from the left. Many are calling Trum','2018-6-14', 'vybaby@gmail.com');
insert into thread values('Music',51,'ALRIGHT GUYS. ITS TIME TO GO FULL MUSIC SNOB.','We always see those posts about poorly regarded albums that you like, where youre meant to explai','2018-5-17', 'admin@gmail.com');
insert into thread values('Music',52,'A Personal Farewell to Pitchfork','Im slightly ashamed that Im writing this but its for good reason. I say without any hesitation th','2018-1-22', 'greenearth@yahoo.ca');
insert into thread values('Music',53,'K-pop is exploitative as a industry, and blan','IMO, I am sickened by K-Pop both as a industry and as a genre of music.It is the ONLY genre of mus','2018-1-17', 'greenearth@yahoo.ca');
insert into thread values('Music',54,'So hip-hop got To Pimp a Butterfly. Can roc','Needless to say this is just speculating, but speculating is part of what makes music discussion fun','2018-1-20', 'itsdatboi@gmail.com');
insert into thread values('Music',55,'What albums have the craziest back-stories?','(Hopefully this is an acceptable post, if it isnt then please delete!) Im currently beginning wor','2018-4-13', 'itsdatboi@gmail.com');
insert into thread values('Music',56,'Lets talk Arcade Fire, Reflektor','The album just leaked and because of the excitement surrounding this release, I thought we could sta','2018-5-12', 'itsdatboi@gmail.com');

insert into reply values(5,6, 'Food','It is indeed, marvelous. An irony-free zone, where everything is beautiful and nothing hurts. Where','2018-4-17','nabstua@gmail.com');
insert into reply values(6,6, 'Food','Watching No Reservations was one of my favourite things to do with my grandpa before he passed away.','2018-4-5','greenearth@yahoo.ca');
insert into reply values(7,6, 'Food','Kitchen confidential inspired me to be a chef. We have lost one of the greats. ','2018-4-3','catdog@gmail.com');
insert into reply values(8,6, 'Food','Literally a man living the best life I could ever imagine. Were just being shown time and time agai','2018-4-13','mad@yahoo.ca');
insert into reply values(9,6, 'Food','Found by Eric Ripert too, wow this just ruined my day.','2018-4-28','greenearth@yahoo.ca');
insert into reply values(10,6, 'Food','I know this sounds superficial, but like, I follow him on Instagram and just a week ago or something','2018-4-12','superfoody@live.com');
insert into reply values(11,6, 'Food',' My favorite quote of his\- I understand theres a guy inside me who wants to lay in bed, smoke wee','2018-4-26','mad@yahoo.ca');
insert into reply values(12,6, 'Food','This one hurts. ','2018-4-23','nabstua@gmail.com');
insert into reply values(13,6, 'Food','This is just such a huge blow to me. I came in so giddy today and then bam, its like someone just s','2018-4-23','catdog@gmail.com');

insert into reply values(5,7, 'Food','I find crock pot cooking to be really helpful in case you want to explore that avenue. I can just du','2018-2-16','catdog@gmail.com');
insert into reply values(6,7, 'Food','This is a great idea. I think moving forward, you could even think of including some very simple rec','2018-2-19','deskrage@gmail.com');
insert into reply values(7,7, 'Food','Maybe Im missing something, but I dont see any actual recipes, just the shopping list post.','2018-2-23','json@hotmail.com');
insert into reply values(8,7, 'Food','Youre amazing. Its been 4 months since my first breakup, and literally my first trip to any grocer','2018-2-25','superfoody@live.com');
insert into reply values(9,7, 'Food','I really need this right now. Thanks','2018-2-24','admin@gmail.com');
insert into reply values(10,7, 'Food','As some one with a severe fatigue disorder who counts her spoons so carefully, this blog will be awe','2018-2-15','itsdatboi@gmail.com');
insert into reply values(11,7, 'Food','I guess Im lucky that cooking helps my depressed self feel happy and far less depressed/stressed th','2018-2-26','admin@gmail.com');
insert into reply values(12,7, 'Food','This is huge! I commend you for making a blog like this. You should look into making an app that all','2018-2-20','admin@gmail.com');
insert into reply values(13,7, 'Food','Omg. Omg. I just went on antidepressants last week. My dad died last Christmas after suffering from ','2018-2-26','vybaby@gmail.com');

insert into reply values(5,8, 'Food','if google is telling me the truth, the largest turkey was 86 pounds, and thawing a turkey requires 2','2018-4-25','catdog@gmail.com');
insert into reply values(6,8, 'Food','High quality Turkey Day Shitpost.','2018-4-14','catdog@gmail.com');
insert into reply values(7,8, 'Food','bruh i just slow smoke my 200lbs turkeys for 3 weeks straight, no need to thaw','2018-4-12','catdog@gmail.com');
insert into reply values(8,8, 'Food','How long before I take out the 150lb duck that Ill stuff inside the turkey?','2018-4-12','vybaby@gmail.com');
insert into reply values(9,8, 'Food','Pff, Ill be frying my turkey. I figure the oil is so hot it doesnt matter if my bird is still froz','2018-4-27','json@hotmail.com');
insert into reply values(10,8, 'Food','As a european I have no idea if this reasonable advice or not','2018-4-14','superfoody@live.com');
insert into reply values(11,8, 'Food','If you forget to thaw your turkey on the day of Thanksgiving, it *will* seem like a 200 pound bird.','2018-4-19','json@hotmail.com');
insert into reply values(12,8, 'Food','So glad were not cooking a Turkey this year, I hate busting out the dolly to move the turkey from my','2018-4-11','nonadmin@gmail.com');
insert into reply values(13,8, 'Food','If you have a 200lb turkey that needs 21 days to thaw, wouldnt the outside start going bad before t','2018-4-24','deskrage@gmail.com');

insert into reply values(5,9, 'Food','Im really excited because I love the show, but Im a little sad its under Food Network. Its great','2018-2-24','catdog@gmail.com');
insert into reply values(6,9, 'Food','Alton Brown is a conundrum to me. His delivery would normally be irritating to me but any show hoste','2018-2-21','admin@gmail.com');
insert into reply values(7,9, 'Food','Excited about the announcement but its still so far away. Oh well, Ive waited this long, I can wai','2018-2-25','superfoody@live.com');
insert into reply values(8,9, 'Food',' Return of the Eats (Once again!) Return of the Eats (Pump up the world!) Return of the Eats ','2018-2-13','json@hotmail.com');
insert into reply values(9,9, 'Food','One show I actually enjoy and look forward to watch on food network','2018-2-20','superfoody@live.com');
insert into reply values(10,9, 'Food','If they film in the Atlanta area again, and why wouldnt since AB is based there, hopefully Lucky Ya','2018-2-24','snowstorm@outlook.com');
insert into reply values(11,9, 'Food','Heres the announcement [recorded at Dragon Con](https://youtu.be/pS3e4Y9NOtc) ','2018-2-24','mad@yahoo.ca');
insert into reply values(12,9, 'Food','I love Good Eats, so I realllly hope this doesnt turn out to be another Bill Nye Saves the World.','2018-2-28','superfoody@live.com');
insert into reply values(13,9, 'Food','He wasnt kidding about DDD.  I went to visit my parents for a week in August and decided to watch s','2018-2-26','deskrage@gmail.com');

insert into reply values(5,10, 'Food','Wait til you hear that a lot of people mash up peas and put them in guac.','2018-5-20','nonadmin@gmail.com');
insert into reply values(6,10, 'Food','my sister did this.  she also thinks garlic salt is the same thing as garlic powder.','2018-5-14','mad@yahoo.ca');
insert into reply values(7,10, 'Food','That shit is delicious on a turkey sandwich but even a mayo dumpster like me would never eat that on','2018-5-15','greenearth@yahoo.ca');
insert into reply values(8,10, 'Food','Eww gross.  Sounds like shes used to the cheap guac thats actually just 2% avocado...','2018-5-26','mad@yahoo.ca');
insert into reply values(9,10, 'Food','Pretty sure this constitutes a hostile work environment.','2018-5-23','nabstua@gmail.com');
insert into reply values(10,10, 'Food','OH GOD NO','2018-5-22','nonadmin@gmail.com');
insert into reply values(11,10, 'Food','This is the worst thing I have read in 2016.','2018-5-14','deskrage@gmail.com');
insert into reply values(12,10, 'Food','My German roommate made guac once. It was half Creme fraiche and half avocado. ','2018-5-19','nabstua@gmail.com');
insert into reply values(13,10, 'Food','THATS IT! Everyone pack it up were just gonna end the universe now before it gets any worse.','2018-5-15','deskrage@gmail.com');
insert into reply values(14,10, 'Food','As someone who loves avocados and guacamole but hates mayo, god damn this.','2018-5-25','greenearth@yahoo.ca');

insert into reply values(5,11, 'Food','https://galpalactic.tumblr.com/post/134577149346/me-googles-how-to-mash-potatoes-some-food','2018-4-21','superfoody@live.com');
insert into reply values(6,11, 'Food','Its because by writing it that way Google considers it unique and original and rates it higher.','2018-4-25','snowstorm@outlook.com');
insert into reply values(7,11, 'Food','[Heres a starter pack I made a while back](https://i.redd.it/8l6cp7icadyy.png)','2018-4-20','mad@yahoo.ca');
insert into reply values(8,11, 'Food','Something that grates on me as well is how they advertise a recipe as having only 3 steps! or what','2018-4-20','admin@gmail.com');
insert into reply values(9,11, 'Food','While I dont hate this style of recipe blogging as much as others, I do get annoyed when the short ','2018-4-18','snowstorm@outlook.com');
insert into reply values(10,11, 'Food','Its because, well Ill tell you a story about how while I was at the dentists office the woman at ','2018-4-20','vybaby@gmail.com');
insert into reply values(11,11, 'Food','Because recipe blogs are supported by ad revenue.If you only publish recipes, then you only get re','2018-4-16','nabstua@gmail.com');
insert into reply values(12,11, 'Food','Totally agree. I would much rather enjoy reading history about the ingredients, a discussion about h','2018-4-25','superfoody@live.com');
insert into reply values(13,11, 'Food','At least the stories are skippable.  As someone with little cooking skill and patience, what really ','2018-4-25','snowstorm@outlook.com');
insert into reply values(14,11, 'Food','They need a button at the top that lets you skip to the recipe. Then those that want a mile long jou','2018-4-20','deskrage@gmail.com');

insert into reply values(5,12, 'Food','I once strained a can of pineapple juice into the sink thinking it was pineapple chunks.','2018-2-23','nonadmin@gmail.com');
insert into reply values(6,12, 'Food','I peeled 5 pounds of shrimp while talking to my wife one night, only to realize I tossed the shells ','2018-2-27','mad@yahoo.ca');
insert into reply values(7,12, 'Food','I put a pot of chicken stock in the sink with cold water running around it to cool down faster, the ','2018-2-24','nonadmin@gmail.com');
insert into reply values(8,12, 'Food','I once spent forever taking the meat off of a cooked chicken to store for various dishes. I was putt','2018-2-25','vybaby@gmail.com');
insert into reply values(9,12, 'Food','Sleep it off with a running fan.','2018-2-23','deskrage@gmail.com');
insert into reply values(10,12, 'Food','spent hours making chicken broth once. strained it into a pot in the sink, then left it to cool. 5 m','2018-2-20','vybaby@gmail.com');
insert into reply values(11,12, 'Food','Dont feel bad! Its embarrassing now, but the OMG Im dumb feeling is your brains way of helping','2018-2-19','deskrage@gmail.com');
insert into reply values(12,12, 'Food','This is about as bad as the first time I used my blender, which also happened to be on Thanksgiving.','2018-2-25','mad@yahoo.ca');
insert into reply values(13,12, 'Food','Cracked an egg into the compost, and put the shells in the frying pan. Our brains are such dicks som','2018-2-20','json@hotmail.com');
insert into reply values(14,12, 'Food','One time in college I went to a fast food place, ordered, paid for my food, then drove off without g','2018-2-25','nonadmin@gmail.com');

insert into reply values(5,13, 'Food','That, and the following comments raving about how great the recipe is, followed by the.mountain of c','2018-4-16','mad@yahoo.ca');
insert into reply values(6,13, 'Food','I started a small baking blog at one point, and I got an e-mail after a little while saying that I w','2018-4-8','nabstua@gmail.com');
insert into reply values(7,13, 'Food','I dont mind the story. I dont like in that example that all the photos of the process of making th','2018-4-21','json@hotmail.com');
insert into reply values(8,13, 'Food','It actually has nothing to do with validation, its an SEO (search engine optimization) tactic. The ','2018-4-12','nabstua@gmail.com');
insert into reply values(9,13, 'Food','I just wish that the recipe came first, then the photo recipe, and if they want to put their 5 page ','2018-4-27','superfoody@live.com');
insert into reply values(10,13, 'Food','It depends, honestly a lot of times it is less story and more discussion of a specific ingredient, o','2018-4-20','superfoody@live.com');
insert into reply values(11,13, 'Food','and my husband doesnt even like X but he ate all of these and I had to make them again later in th','2018-4-15','json@hotmail.com');
insert into reply values(12,13, 'Food','Serious eats/ rasamalaysia have it right, put the recipe and story on a different page, so you can b','2018-4-11','snowstorm@outlook.com');

insert into reply values(5,14, 'Food','I never knew how to cook, not even for myself... then I got a job at a fast food pizza place so I wa','2018-2-25','greenearth@yahoo.ca');
insert into reply values(6,14, 'Food','Im that person, but I dont follow the recipes to a T anymore. The recipes are more like loose guid','2018-2-20','admin@gmail.com');
insert into reply values(7,14, 'Food','I just look up whatever I want to make on Serious Eats. ','2018-2-15','nabstua@gmail.com');
insert into reply values(8,14, 'Food','When people ask where I learned to cook my go-to response is that I live alone and love good food. I','2018-2-19','admin@gmail.com');
insert into reply values(9,14, 'Food','People rave about my BBQ sauce.  Its just 3 parts sweet baby rays bbq sauce to one part sweet baby r','2018-2-12','superfoody@live.com');
insert into reply values(10,14, 'Food','Youd be surprised how many people are completely incapable of following instructions to a T. Cook ','2018-2-10','json@hotmail.com');
insert into reply values(11,14, 'Food','Yeah Im a great cook who mostly just looks up good shit, or remembers how to make something I onc','2018-2-15','itsdatboi@gmail.com');
insert into reply values(12,14, 'Food','Ill stick relatively close to the recipe the first time I make something. I know what tastes I like','2018-2-10','admin@gmail.com');
insert into reply values(13,14, 'Food','I can easily follow any recipe to perfection but to follow a recipe you need to know how to cook. No','2018-2-28','mad@yahoo.ca');
insert into reply values(14,14, 'Food','I think you are selling yourself short. I used to think that way. Like I felt some imposter syndrome','2018-2-13','superfoody@live.com');

insert into reply values(5,15, 'Food','Cooking alone for oneself is kind of a necessity for survival so I wouldnt call it sad. I like cook','2018-5-22','deskrage@gmail.com');
insert into reply values(6,15, 'Food','Thats a stupid sentiment. How do you eat then if you live alone?','2018-5-26','admin@gmail.com');
insert into reply values(7,15, 'Food','Cooking for yourself is NOT sad.Microwave dinners and having to order take out all the time becaus','2018-5-26','vybaby@gmail.com');
insert into reply values(8,15, 'Food','Ive been told eating my work lunch by myself is sad. TBH theres nothing better than a half hour no','2018-5-26','catdog@gmail.com');
insert into reply values(9,15, 'Food','I love cooking...period.  It doesnt matter if Im cooking for me, for me and my husband, or a group','2018-5-28','nabstua@gmail.com');
insert into reply values(10,15, 'Food','Cooking for myself is *playtime*!Its when I can try wild and often ill-advised flavor combination','2018-5-23','deskrage@gmail.com');
insert into reply values(11,15, 'Food','I like cooking by myself. I live alone for quite a time, I am used to it, and to eat alone. If I am','2018-5-22','greenearth@yahoo.ca');
insert into reply values(12,15, 'Food','Cooking for myself isnt sad. I like it because I can do whatever I want with my food while cooking ','2018-5-22','catdog@gmail.com');
insert into reply values(13,15, 'Food','Im scared to go out and eat alone because someone might think Im lonely and come sit with me and t','2018-5-28','catdog@gmail.com');
insert into reply values(14,15, 'Food','I like cooking alone because no one can see me flounder in the kitchen. ','2018-5-27','mad@yahoo.ca');

insert into reply values(5,16, 'Movies/Television','Heres the link [on Medium.](https://medium.com/@tonyszhou/postmortem-1b338537fabc) The article it','2018-2-9','snowstorm@outlook.com');
insert into reply values(6,16, 'Movies/Television','One of the few legitimately informative and interesting  movie-based YouTube channels. Its a shame.','2018-2-5','vybaby@gmail.com');
insert into reply values(7,16, 'Movies/Television','Oh no! That channel was so excellent. I hope its ending because they got an offer to make it a TV s','2018-2-18','itsdatboi@gmail.com');
insert into reply values(8,16, 'Movies/Television','Id recommend Lessons from the Screenplay for anyone looking for a channel along the same lines with','2018-2-23','snowstorm@outlook.com');
insert into reply values(9,16, 'Movies/Television','Some channels I follow that can maybe fill the void - [kaptainkristian](https://www.youtube.com/chan','2018-2-11','admin@gmail.com');
insert into reply values(10,16, 'Movies/Television','~~I thought it ended a long time ago, it has been an year since their last vido.~~ At least some clo','2018-2-13','deskrage@gmail.com');
insert into reply values(11,16, 'Movies/Television','One of the best YouTube channels in YouTubes short history. I seriously hope they continue doing si','2018-2-18','greenearth@yahoo.ca');
insert into reply values(12,16, 'Movies/Television','I cant believe its been more than a year since their last video. Nothing else on YouTube comes clo','2018-2-11','superfoody@live.com');
insert into reply values(13,16, 'Movies/Television','This channel has made me look at the screen with greater attention to detail and introduced me to Bu','2018-2-15','mad@yahoo.ca');
insert into reply values(14,16, 'Movies/Television','>For instance, wed always wanted to talk about Tarkovsky, but its impossible to talk about how he ','2018-2-12','mad@yahoo.ca');

insert into reply values(5,18, 'Movies/Television','Okay I stuck around till 7 p.m. Phew I am exhausted. Thank you all for participating in this. It was','2018-6-25','admin@gmail.com');
insert into reply values(6,18, 'Movies/Television','Hi Tony,Im trying to understand better the differences that editing makes in film versus the actu','2018-6-14','superfoody@live.com');
insert into reply values(7,18, 'Movies/Television','Hey Mr. Zhou, My question is how do pick the topics/ subject matter for your videos? is it somethin','2018-6-6','nonadmin@gmail.com');
insert into reply values(8,18, 'Movies/Television','Hi Tony, thanks once again from me, the mods of /r/truefilm and the community for doing this. I ha','2018-6-26','snowstorm@outlook.com');
insert into reply values(9,18, 'Movies/Television','Tony, I just wanted to say a few things.First as a young filmmaker, your videos have been like an ','2018-6-12','snowstorm@outlook.com');
insert into reply values(10,18, 'Movies/Television','Hey! Almost forgot this AMA was happening, glad I didnt!1. Is Every Frame a Painting your current','2018-6-18','nonadmin@gmail.com');
insert into reply values(11,18, 'Movies/Television','Tony, any movie podcast you could recommend? or any other channel or analysis series that doesnt ','2018-6-8','vybaby@gmail.com');
insert into reply values(12,18, 'Movies/Television','Are there any current Western directors who you think shoot and edit action properly, as outlined in','2018-6-8','greenearth@yahoo.ca');
insert into reply values(13,18, 'Movies/Television','Hi Tony! Heres something /u/Carpeaux wanted to ask you:Im awful at showing up in time for this s','2018-6-10','admin@gmail.com');
insert into reply values(14,18, 'Movies/Television','Tony, where did you learn to analyze film the way you did.  Is it just repeated observation or were ','2018-6-1','json@hotmail.com');

insert into reply values(5,19, 'Movies/Television','The movie depicts the Germans so much as the bad guys that I literally thought the story took place ','2018-1-22','nabstua@gmail.com');
insert into reply values(6,19, 'Movies/Television','All these are valid criticisms. The biggest issue with this movie for me is something you touch upon','2018-1-28','itsdatboi@gmail.com');
insert into reply values(7,19, 'Movies/Television','I just got around to seeing it a couple of nights ago, you know not being in any rush to see it beca','2018-1-18','snowstorm@outlook.com');
insert into reply values(8,19, 'Movies/Television','I couldnt agree with some of these more.  I didnt have issue with the opening scene, but after tha','2018-1-18','nabstua@gmail.com');
insert into reply values(9,19, 'Movies/Television','I always find it hilarious when people in /r/TrueFilm critique Hollywood blockbusters like WW (or an','2018-1-25','itsdatboi@gmail.com');
insert into reply values(10,19, 'Movies/Television','Not to mention the completely insensitive manner they deal with PTSD. Ewan Bremners character is cl','2018-1-22','mad@yahoo.ca');
insert into reply values(11,19, 'Movies/Television','Superhero movies in general arent that great. Theres not a one that isnt heavily dependent on the','2018-1-26','catdog@gmail.com');
insert into reply values(12,19, 'Movies/Television','The bell tower jump was rad.  That jump was novel superhero movie physics.You do a good service wi','2018-1-28','catdog@gmail.com');
insert into reply values(13,19, 'Movies/Television','Wonder Woman is a fantasy about having power to act on your compassion without fear.Its most power','2018-1-24','mad@yahoo.ca');

insert into reply values(5,20, 'Movies/Television','How do you feel about the fact that half of the movie was an inconsequential arc regarding the light','2018-1-15','itsdatboi@gmail.com');
insert into reply values(6,20, 'Movies/Television','I will watch your career with great interest.Thanks for the piece. I dont understand how there ca','2018-1-10','nonadmin@gmail.com');
insert into reply values(7,20, 'Movies/Television','I agree with the vast majority of what you have said, but just wanted to touch on this:>  progress','2018-1-18','admin@gmail.com');
insert into reply values(8,20, 'Movies/Television','I agree with a lot of this, especially these two points. >* a lot happens. But not a lot happens f','2018-1-11','catdog@gmail.com');
insert into reply values(9,20, 'Movies/Television','Good post! I agree with much of this, but I think certain elements are wrong in important ways.  And','2018-1-19','vybaby@gmail.com');
insert into reply values(10,20, 'Movies/Television','It annoys me to no end when people defend this film by acting like the only reason I dont like it i','2018-1-22','snowstorm@outlook.com');
insert into reply values(11,20, 'Movies/Television','I feel like you enjoyed TFA a lot more than I did.. Particularly the JJ Abrams mysteries such as R','2018-1-26','superfoody@live.com');
insert into reply values(12,20, 'Movies/Television','I have started nurturing a pet theory that Johnson is making a comment on interminable blockbuster s','2018-1-23','superfoody@live.com');
insert into reply values(13,20, 'Movies/Television','I agree with a good chunk of your commentary as well as the other points raised here, but also take ','2018-1-25','snowstorm@outlook.com');
insert into reply values(14,20, 'Movies/Television','I think critical reception was positive because this was a Star Wars film that really had something ','2018-1-12','admin@gmail.com');

insert into reply values(5,21, 'Movies/Television','Bonus! /u/pastypilgrim kindly ran your choices through an algorithm that produced a visual represent','2018-3-28','json@hotmail.com');
insert into reply values(6,21, 'Movies/Television','Wow, Nightcrawler did really poorly in the box office','2018-3-28','json@hotmail.com');
insert into reply values(7,21, 'Movies/Television','Goodness! Thank you for putting it together like this. Im already looking forward to several movies','2018-3-28','snowstorm@outlook.com');
insert into reply values(8,21, 'Movies/Television','Honestly, I am very disappointed seeing Mr. Turner way down on #47. I felt it was excellent on all l','2018-3-28','vybaby@gmail.com');
insert into reply values(9,21, 'Movies/Television','Quite disappointed in myself as to how few of these Ive seen. Time to start watching!','2018-3-28','superfoody@live.com');
insert into reply values(10,21, 'Movies/Television','Ive really wanted to try Goodbye to Language, but I know its in 3D and since its Godard, I feel l','2018-3-28','itsdatboi@gmail.com');
insert into reply values(11,21, 'Movies/Television','Im so happy to see The Rover included in the list. I was truly surprised and thrilled by that film.','2018-3-28','snowstorm@outlook.com');
insert into reply values(12,21, 'Movies/Television','Extremely surprised that John Wick did not make it on to this list. Next to Calvary and Ida, it was ','2018-3-28','superfoody@live.com');
insert into reply values(13,21, 'Movies/Television','This is great. So many movies that I missed. Is there a thread like this for 2013? ','2018-3-28','json@hotmail.com');

insert into reply values(5,22, 'Movies/Television','In case anyone is interested here is a [movie barcode] (http://41.media.tumblr.com/tumblr_lpnkkgv275','2018-4-28','snowstorm@outlook.com');
insert into reply values(6,22, 'Movies/Television','Really nicely structured piece, dude. Its the subtle (or in this case fairly unsubtle, but still su','2018-4-26','json@hotmail.com');
insert into reply values(7,22, 'Movies/Television','I also love this film, and have always admired its use of colour both for aesthetic reasons and for ','2018-4-23','catdog@gmail.com');
insert into reply values(8,22, 'Movies/Television','This is a really convincing theory that I hadnt really thought of before for this film. It is actua','2018-4-25','mad@yahoo.ca');
insert into reply values(9,22, 'Movies/Television','Production Designers really dont get enough credit. I mean, sure, on *Star Wars* or *Lord of the Ri','2018-4-25','snowstorm@outlook.com');
insert into reply values(10,22, 'Movies/Television','Really good observation. I think the theme of the movie is the balance between passion and pragmat','2018-4-28','greenearth@yahoo.ca');
insert into reply values(11,22, 'Movies/Television','This is not at all on topic, but until your analysis, I never noticed that the architectural firm To','2018-4-26','mad@yahoo.ca');
insert into reply values(12,22, 'Movies/Television','Message of the film: stick to your own color. Gotcha.But in all seriousness, I clicked on this thi','2018-4-26','json@hotmail.com');
insert into reply values(13,22, 'Movies/Television','That is amazing. Its this kind of stuff thats right in front of your damn face but so little of us','2018-4-22','itsdatboi@gmail.com');
insert into reply values(14,22, 'Movies/Television','i love this i was a little aware of the colors after like 6 times of watching this movie.is my favo','2018-4-26','itsdatboi@gmail.com');

insert into reply values(5,23, 'Movies/Television','As a Lithuanian living in the US, I was shocked to see how similar Mexican values are to ours. Not t','2018-4-23','admin@gmail.com');
insert into reply values(6,23, 'Movies/Television','Saw it last week and was overwhelmed by how unique it was, might even go so far as to call it odd on','2018-4-23','catdog@gmail.com');
insert into reply values(7,23, 'Movies/Television','Mexican here: it was alright. I do agree with you that its nice having some semblance of Mexican cu','2018-4-24','itsdatboi@gmail.com');
insert into reply values(8,23, 'Movies/Television','Theres been a lot of controversy surrounding this movie and The Book of Life. If youve seen The Bo','2018-4-26','itsdatboi@gmail.com');
insert into reply values(9,23, 'Movies/Television','Hey, this post makes me super happy for all the obvious reasons, but I just wanted to say thanks for','2018-4-24','mad@yahoo.ca');
insert into reply values(10,23, 'Movies/Television','I liked much of the inner values of this film, but it also raises a big single flag to me.  The conc','2018-4-25','greenearth@yahoo.ca');
insert into reply values(11,23, 'Movies/Television','I agree 110%. I was so afraid of this movie portraying Mexican heritage in a whitewashed, try-hard H','2018-4-28','mad@yahoo.ca');
insert into reply values(12,23, 'Movies/Television','~~Pixar~~ Disney puts together heritage councils and the creators take lots of field trips.https:/','2018-4-24','deskrage@gmail.com');
insert into reply values(13,23, 'Movies/Television','Going by reviews Ive been reading from Latino critics, I am so freaking happy at how I, frankly, ca','2018-4-24','itsdatboi@gmail.com');
insert into reply values(14,23, 'Movies/Television','So glad that there are other people feeling like this. Its been a week since Ive watched Coco and ','2018-4-21','catdog@gmail.com');

insert into reply values(5,24, 'Movies/Television','Dont forget the pale horse rider passing in the background, the literal symbol of death and the apo','2018-3-25','deskrage@gmail.com');
insert into reply values(6,24, 'Movies/Television','I immediately associated the man shot in the beginning with the blues. Older black man sitting down ','2018-3-20','snowstorm@outlook.com');
insert into reply values(7,24, 'Movies/Television','I think in some ways youre missing the forest for the trees with your analysis.  Theres a lot of b','2018-3-8','itsdatboi@gmail.com');
insert into reply values(8,24, 'Movies/Television','Solid analysis.To address your hunned bands question, its common slang for bands to mean $1000.','2018-3-26','snowstorm@outlook.com');
insert into reply values(9,24, 'Movies/Television','>He is run after by a mob of white people.This has a double meaning of white people consuming blac','2018-3-19','json@hotmail.com');
insert into reply values(10,24, 'Movies/Television','> This is reinforced by how the corners are rounded and cut off, quite telling that he wants an Anal','2018-3-23','snowstorm@outlook.com');
insert into reply values(11,24, 'Movies/Television','The fake gun throws me for a loop. While I would posit that it likely is a reference to police shoot','2018-3-23','nonadmin@gmail.com');
insert into reply values(12,24, 'Movies/Television','Good work, you definitely got a lot of good details in your post. Id say I agree with [Genius](http','2018-3-19','mad@yahoo.ca');
insert into reply values(13,24, 'Movies/Television','Feels more like a meta-commentary on the fetishizing of drugs and violence in hip-hop. We did someth','2018-3-24','catdog@gmail.com');
insert into reply values(14,24, 'Movies/Television','Well put. First time I see the teacher interpretation and I like it. As a white person I relate to t','2018-3-19','superfoody@live.com');

insert into reply values(5,25, 'Movies/Television','Number of Submissions: 80Number of Films Submitted: 87Number of Documentaries: 6 (7 if you count','2018-6-13','admin@gmail.com');
insert into reply values(6,25, 'Movies/Television','Interesting to see Ladybird over CMBYN. While I generally enjoyed Ladybird, the film seemed like a f','2018-6-14','snowstorm@outlook.com');
insert into reply values(7,25, 'Movies/Television','This is a good list (Im especially happy that Blade Runner 2049 and Phantom Thread, my two favorite','2018-6-20','nonadmin@gmail.com');
insert into reply values(8,25, 'Movies/Television','Ah, to bad I missed the cut off, I had a few more movies I wanted to catch before voting!Really ha','2018-6-23','json@hotmail.com');
insert into reply values(9,25, 'Movies/Television','Can someone explain to me why Wind River hasnt gotten more love? I genuinely think it is one of the','2018-6-18','superfoody@live.com');
insert into reply values(10,25, 'Movies/Television','Why no love for Logan Lucky?  I think its a very well made modern day heist film with a twist in ','2018-6-21','nabstua@gmail.com');
insert into reply values(11,25, 'Movies/Television','Biggest omission by far is *I Dont Feel at Home in This World Anymore*. Went from Grand Jury Prize ','2018-6-16','itsdatboi@gmail.com');
insert into reply values(12,25, 'Movies/Television','Solid list','2018-6-27','deskrage@gmail.com');
insert into reply values(13,25, 'Movies/Television','I do think that over time, people will start to appreciate 3 Billboards for what it is. A lot of peo','2018-6-28','snowstorm@outlook.com');
insert into reply values(14,25, 'Movies/Television','What immediately jumps out to me is how I wouldnt consider a dozen or so of the films on this list ','2018-6-20','nabstua@gmail.com');

insert into reply values(5,26, 'Movies/Television','*Snow Cake*, which Rickman stars in, is a film thats really close to my heart. I never really knew ','2018-6-21','vybaby@gmail.com');
insert into reply values(6,26, 'Movies/Television','This makes me incredibly sad. I absolutely loved him in Galaxy Quest, such a funny part he played in','2018-6-13','nonadmin@gmail.com');
insert into reply values(7,26, 'Movies/Television','By Grabthars Hammer, this is sad news.','2018-6-23','vybaby@gmail.com');
insert into reply values(8,26, 'Movies/Television','The first performance that I ever actually *loved* was Rickman as the Sheriff of Nottingham in Robin','2018-6-15','greenearth@yahoo.ca');
insert into reply values(9,26, 'Movies/Television','Ok, the day before Bowie died I watched Basquiat and yesterday I watched Sweeney Todd. WHAT IS HAP','2018-6-19','snowstorm@outlook.com');
insert into reply values(10,26, 'Movies/Television','this is just a terrible week.  I recently watched CBGB, he was great in that.  RIP Alan. ','2018-6-6','admin@gmail.com');
insert into reply values(11,26, 'Movies/Television','Devastating news.  I feel like someone cut my heart out with a spoon.','2018-6-11','itsdatboi@gmail.com');
insert into reply values(12,26, 'Movies/Television','[How I feel about this new](https://media2.giphy.com/media/qOVZOYP1d2zBu/giphy.gif)Edit: [Source](','2018-6-7','snowstorm@outlook.com');
insert into reply values(13,26, 'Movies/Television','To me he will always be the sad ghostly husband from Truly Madly Deeply.','2018-6-4','greenearth@yahoo.ca');
insert into reply values(14,26, 'Movies/Television','Look...at...me... he whispered. The green eyes found the black, but after a second, something in t','2018-6-6','superfoody@live.com');

insert into reply values(5,27, 'Sports','Parlayed the Chiefs and the over. Woke my wife and daughter up lol','2018-1-8','admin@gmail.com');
insert into reply values(6,27, 'Sports','WAS +7 and Under 48 SADNESS PARTY, FOLLOW ME!','2018-1-18','admin@gmail.com');
insert into reply values(7,27, 'Sports','The gods have smiled upon me tonight.  My picks were as follows.  I only lost one. 1)Parlay Over ','2018-1-16','vybaby@gmail.com');
insert into reply values(8,27, 'Sports','32 upvotes for Chiefs -7 but dont forget fellow parlay MVP over 48.5','2018-1-6','mad@yahoo.ca');
insert into reply values(9,27, 'Sports','Justin houston knew the spread, or just wanted that TD cash money','2018-1-9','itsdatboi@gmail.com');
insert into reply values(10,27, 'Sports','Holy Shit! I had Chiefs -7, Over 48 & small parlay of both. That was the luckiest play in my betting','2018-1-7','nonadmin@gmail.com');
insert into reply values(11,27, 'Sports','Im disgusted I bet Chiefs -7 and won. lol','2018-1-12','json@hotmail.com');
insert into reply values(12,27, 'Sports','Had the skins+7 and Pryor over 4 catches. Was hoping theyd toss the garbage pass to him so it count','2018-1-21','catdog@gmail.com');
insert into reply values(13,27, 'Sports','imma need a link to that logic song asap','2018-1-13','nabstua@gmail.com');
insert into reply values(14,27, 'Sports','https://nitrogensports.eu/betslip/bbc311cekRoRitJOG5KWFVwN3ViQXptS0JUZz0just saw this online. now ','2018-1-7','superfoody@live.com');

insert into reply values(5,28, 'Sports','Fading the public has never been more prosperous.','2018-2-27','itsdatboi@gmail.com');
insert into reply values(6,28, 'Sports','well, I dont feel cool anymore. Bye guys..','2018-2-23','vybaby@gmail.com');
insert into reply values(7,28, 'Sports','Wasnt going to bet today but it feels like a national holiday','2018-2-23','snowstorm@outlook.com');
insert into reply values(8,28, 'Sports','Everyone prepare for the flood of new highly sophisticated American bettors here.','2018-2-28','mad@yahoo.ca');
insert into reply values(9,28, 'Sports','Its a holiday for the degens!','2018-2-24','mad@yahoo.ca');
insert into reply values(10,28, 'Sports','Now, I can lose a shit ton to MGM and Westgate from Massachusetts, instead of having to fly out.','2018-2-24','json@hotmail.com');
insert into reply values(11,28, 'Sports','What does this mean for betting from home. Now can use American versions of betting sites instead of','2018-2-23','itsdatboi@gmail.com');
insert into reply values(12,28, 'Sports','Green Bay -3.5 -125Seattle +2.5 -125','2018-2-22','greenearth@yahoo.ca');
insert into reply values(13,28, 'Sports','what a glorious time to be alive. ','2018-2-27','greenearth@yahoo.ca');

insert into reply values(5,29, 'Sports','Im new to betting...Im using bovada and getting lost in it. Whats an insanely high risk/high rewa','2018-6-12','catdog@gmail.com');
insert into reply values(6,29, 'Sports','May I recommend that we include the game clock or something? Itll just make it easier to follow, im','2018-6-5','deskrage@gmail.com');
insert into reply values(7,29, 'Sports','Not a live bet but does anyone fancy a small wager on the ML at -102/-102  the small vig is just t','2018-6-6','vybaby@gmail.com');
insert into reply values(8,29, 'Sports','Jesus. The Broncos are getting destroyed. Will they even score a TD?','2018-6-8','nonadmin@gmail.com');
insert into reply values(9,29, 'Sports','Thank god the broncos went for it. Saved my under 23.5 and Seattle 1st half parlay ','2018-6-23','snowstorm@outlook.com');
insert into reply values(10,29, 'Sports','Anybody got a count on the Omahas? ','2018-6-24','json@hotmail.com');
insert into reply values(11,29, 'Sports','This is ridiculous. Is there a prop bet on the Broncos getting shut out?','2018-6-11','greenearth@yahoo.ca');
insert into reply values(12,29, 'Sports','Whats the best site for live betting?Id like to try to trade on individual plays (so, place a be','2018-6-15','nabstua@gmail.com');
insert into reply values(13,29, 'Sports','Denver +3.5?','2018-6-25','json@hotmail.com');
insert into reply values(14,29, 'Sports','anyone wanna bet if guys from south park are going to make an episode out of this great game? my bet','2018-6-21','superfoody@live.com');

insert into reply values(5,30, 'Sports','Side note, has anyone found a book where we can bet on if it will be repealed or not?','2018-5-21','nonadmin@gmail.com');
insert into reply values(6,30, 'Sports','Very true. Everyone should contact their state senator immediately. 12/14/17 is the day of the vote.','2018-5-17','json@hotmail.com');
insert into reply values(7,30, 'Sports','For the lazy who dont want to speak:International: https://www.savetheinternet.com/sti-homeUS: ','2018-5-15','nonadmin@gmail.com');
insert into reply values(8,30, 'Sports','go to the website, you put in your number and it calls for you. its worth the time, we have lost a l','2018-5-19','deskrage@gmail.com');
insert into reply values(9,30, 'Sports','Is this US only?','2018-5-27','snowstorm@outlook.com');
insert into reply values(10,30, 'Sports','Its true. Imagine the sportsbook package well have to pay for if sports betting becomes legal in','2018-5-22','mad@yahoo.ca');
insert into reply values(11,30, 'Sports','I could be wrong here, but Im a little concerned about ISPs outright blocking online gambling websi','2018-5-17','vybaby@gmail.com');
insert into reply values(12,30, 'Sports','Internet is already fucked. We dont need NN. ','2018-5-18','superfoody@live.com');
insert into reply values(13,30, 'Sports','Will this affect nitrogens sports book??','2018-5-19','snowstorm@outlook.com');
insert into reply values(14,30, 'Sports','The government is ridiculous, soon they will be charging us for oxygen. ','2018-5-17','superfoody@live.com');

insert into reply values(5,31, 'Sports','which way you leaning i wanna tail','2018-3-19','nonadmin@gmail.com');
insert into reply values(6,31, 'Sports','Lol this is great.','2018-3-19','deskrage@gmail.com');
insert into reply values(7,31, 'Sports','Trailing! BOL!!!','2018-3-27','deskrage@gmail.com');
insert into reply values(8,31, 'Sports','I know right...sometimes Norwegian volleyball be poppin off','2018-3-21','snowstorm@outlook.com');
insert into reply values(9,31, 'Sports','Fantastic, let me know and Ill tail with you. ','2018-3-19','deskrage@gmail.com');
insert into reply values(10,31, 'Sports','Do it bud','2018-3-25','mad@yahoo.ca');
insert into reply values(11,31, 'Sports','Chinese Womens Tennis is my late night weakness.','2018-3-23','superfoody@live.com');
insert into reply values(12,31, 'Sports','I swear to god that was mine too... I stopped for 5 days and then one night and 3 am loaded up and t','2018-3-28','json@hotmail.com');
insert into reply values(13,31, 'Sports','im a degen with ya and unsubscribing from this sub is probably the best thing to do if you are serio','2018-3-27','vybaby@gmail.com');
insert into reply values(14,31, 'Sports','what you thinking??','2018-3-26','deskrage@gmail.com');

insert into reply values(5,32, 'Sports','During the superbowl I deposited $400 with BetOnline and the god damn site showed Declined but of ','2018-6-19','greenearth@yahoo.ca');
insert into reply values(6,32, 'Sports','What the dicks?  Usually Im skeptical of claims of house cheating because theres literally nothing','2018-6-21','superfoody@live.com');
insert into reply values(7,32, 'Sports','Thats horrible, in a perfect world theyd lose all their business. And theyll probably be fine.','2018-6-11','nonadmin@gmail.com');
insert into reply values(8,32, 'Sports','Dont play online blackjack in the first place. This card counter should know that. Only half pene','2018-6-20','vybaby@gmail.com');
insert into reply values(9,32, 'Sports','Can somebody explain to me how the dealer could effectively know that the second card would be the o','2018-6-11','superfoody@live.com');
insert into reply values(10,32, 'Sports','5dimes uses this same online casino. These dealers are based in Costa Rica.','2018-6-11','snowstorm@outlook.com');
insert into reply values(11,32, 'Sports','I like real titties, not some fake shit. LMAO','2018-6-24','admin@gmail.com');
insert into reply values(12,32, 'Sports','SBR going to bump Betonline to #1 Sportsbook rankings.','2018-6-6','superfoody@live.com');
insert into reply values(13,32, 'Sports','amazingly obvious, somebody can legally file a claim against them','2018-6-3','greenearth@yahoo.ca');
insert into reply values(14,32, 'Sports','wow','2018-6-17','vybaby@gmail.com');

insert into reply values(5,33, 'Sports','Just wanted to say thank you for doing this and for sharing it for free. You rock, seriously.','2018-6-21','catdog@gmail.com');
insert into reply values(6,33, 'Sports','Yes','2018-6-18','itsdatboi@gmail.com');
insert into reply values(7,33, 'Sports','Is your Oakland by 19 prediction including the fact that Carr is kill? ','2018-6-28','admin@gmail.com');
insert into reply values(8,33, 'Sports','Awesome job! One thing that sticks out to me this week as compared to others, is that the Trends/Tre','2018-6-19','vybaby@gmail.com');
insert into reply values(9,33, 'Sports','Thanks for all the info. What do you recommend when there is conflict between the rp1 and the trend ','2018-6-14','nabstua@gmail.com');
insert into reply values(10,33, 'Sports','> It uses a combination of neural networks, genetic algorithms, and Monte Carlo simulations to predi','2018-6-28','deskrage@gmail.com');
insert into reply values(11,33, 'Sports','Parlaying them together minus Dallas, wish me luck. ','2018-6-26','greenearth@yahoo.ca');
insert into reply values(12,33, 'Sports','Damn close prediction on the Pats/Bucs. Impressive , thanks!','2018-6-28','json@hotmail.com');
insert into reply values(13,33, 'Sports','So it looks like NY Giants and Oakland are your best bets meaning those two are what you are the mos','2018-6-23','catdog@gmail.com');
insert into reply values(14,33, 'Sports','Hey man, i know this man be dumb and sorry if I go off topic but I really wanna try using your site ','2018-6-24','admin@gmail.com');

insert into reply values(5,34, 'Sports','the crowd chants MVP MVP MVPthanks alot really appreciate reading your posts.','2018-5-26','superfoody@live.com');
insert into reply values(6,34, 'Sports','While I am not a very successfull gambler and as such my opinion will not be taken very highly, I am','2018-5-25','vybaby@gmail.com');
insert into reply values(7,34, 'Sports','thanks teach!','2018-5-24','catdog@gmail.com');
insert into reply values(8,34, 'Sports','Beautiful... just beautiful *applause*','2018-5-22','superfoody@live.com');
insert into reply values(9,34, 'Sports','Great read, looks like I know what to bet on Friday!','2018-5-26','snowstorm@outlook.com');
insert into reply values(10,34, 'Sports','Yup, printed this out and put it on my desk. Will follow every game of the playoffs, cuz yolo.','2018-5-22','json@hotmail.com');
insert into reply values(11,34, 'Sports','You da man as always prof!Always enjoy reading these brilliant write ups. ','2018-5-28','deskrage@gmail.com');
insert into reply values(12,34, 'Sports','great post. you should get in on the Bracket challenge, wed love to have you.','2018-5-20','itsdatboi@gmail.com');
insert into reply values(13,34, 'Sports','Wow this is incredibly interesting! Keep up the amazing work my friend, we all appreciate it.','2018-5-20','snowstorm@outlook.com');
insert into reply values(14,34, 'Sports','Thank you for this, great post.  I have only one question.  Who do I bet in game 1?Cant wait for ','2018-5-20','mad@yahoo.ca');

insert into reply values(5,35, 'Sports','Fascinating article, gonna be clicking around your website for a while. Thanks for posting!','2018-1-27','superfoody@live.com');
insert into reply values(6,35, 'Sports','My problem with this article is how bookies change lines.  IIRC, they dont change lines just becaus','2018-1-12','nonadmin@gmail.com');
insert into reply values(7,35, 'Sports','Very nice job. Ive got a question about the methodology though:You say that the Tipsters used dif','2018-1-21','deskrage@gmail.com');
insert into reply values(8,35, 'Sports','Good piece, thanks. Not to hijack but Pregame is often linked here. This piece is a bit more in dept','2018-1-11','mad@yahoo.ca');
insert into reply values(9,35, 'Sports','This is great.  This is the type of information people like that dude who posted the AMA cuz he was ','2018-1-13','snowstorm@outlook.com');
insert into reply values(10,35, 'Sports','Great article! Reading through your other articles and love the bojack horseman reference ','2018-1-24','mad@yahoo.ca');
insert into reply values(11,35, 'Sports','Thats good work and an interesting read. I appreciate it.','2018-1-19','deskrage@gmail.com');
insert into reply values(12,35, 'Sports','This is some really interesting stuff, thank you!','2018-1-18','snowstorm@outlook.com');
insert into reply values(13,35, 'Sports','Really good read, very enjoyable and well written. Youre going places OP, keep doing what youre do','2018-1-11','nonadmin@gmail.com');
insert into reply values(14,35, 'Sports','The question really is, are these losing bettors who ran hot for a year, or winning bettors who won ','2018-1-16','nonadmin@gmail.com');

insert into reply values(5,36, 'Sports','Immediately thought about that post when i saw the rankings, insane','2018-2-18','json@hotmail.com');
insert into reply values(6,36, 'Sports','He didnt.','2018-2-17','catdog@gmail.com');
insert into reply values(7,36, 'Sports','Something similar happened with someone asking about the -400 lock on USA qualifying for the World C','2018-2-27','nabstua@gmail.com');
insert into reply values(8,36, 'Sports','Question: are there actually that many people on this sub that even bet on lines like -4000?','2018-2-23','deskrage@gmail.com');
insert into reply values(9,36, 'Sports','Curious, what was the line for no?','2018-2-28','snowstorm@outlook.com');
insert into reply values(10,36, 'Sports','/u/Jewbear3','2018-2-26','catdog@gmail.com');
insert into reply values(11,36, 'Sports','Immediately thought of this and tried to find it. Thanks for re-posting! Hope he didnt lose his hou','2018-2-18','admin@gmail.com');
insert into reply values(12,36, 'Sports','New lock of the Century: Saban is going to use this a disrespect to roll UGA in the SEC championship','2018-2-16','itsdatboi@gmail.com');
insert into reply values(13,36, 'Sports','I would never put money on that committee. They clearly have a strategy in how they rank the teams t','2018-2-21','catdog@gmail.com');
insert into reply values(14,36, 'Sports','The reddit curse is real. ','2018-2-18','mad@yahoo.ca');

insert into reply values(5,37, 'Gaming','This is tragic news, and we wish for the best for his family. There will be no tolerance for any i','2018-1-21','nabstua@gmail.com');
insert into reply values(6,37, 'Gaming','Damn, hed just been talking about how he was retiring from criticism but had plans to do some more ','2018-1-26','superfoody@live.com');
insert into reply values(7,37, 'Gaming','He did so much for so many small indie games and made me discover tons of amazing cool stuff, RIP','2018-1-20','nonadmin@gmail.com');
insert into reply values(8,37, 'Gaming','Damn. His last tweet said he was feeling better but needed more time to recover mentally. Guess it t','2018-1-20','itsdatboi@gmail.com');
insert into reply values(9,37, 'Gaming','I didnt expect this to happen so suddenlyI just want to say that his latest update is what got me','2018-1-25','admin@gmail.com');
insert into reply values(10,37, 'Gaming','Ugh this is too much, I used to always watch his WTF is series ','2018-1-19','mad@yahoo.ca');
insert into reply values(11,37, 'Gaming','This one hurts.','2018-1-27','vybaby@gmail.com');
insert into reply values(12,37, 'Gaming','I respected this man more than most people in the industry. He always fought for the consumer, alway','2018-1-21','vybaby@gmail.com');
insert into reply values(13,37, 'Gaming','Dosent feel real','2018-1-26','mad@yahoo.ca');
insert into reply values(14,37, 'Gaming','TotalBiscuit made huge strides in the PC gaming community and the Starcraft 2 eSports. Even with his','2018-1-23','greenearth@yahoo.ca');

insert into reply values(5,38, 'Gaming','Im Dutch and this is my translation of [the article they used](https://nieuws.vtm.be/vtm-nieuws/bin','2018-4-25','deskrage@gmail.com');
insert into reply values(6,38, 'Gaming','Its weird to see our government on the frontpage of reddit, lol. Never thought Id see our minister','2018-4-16','greenearth@yahoo.ca');
insert into reply values(7,38, 'Gaming','Im sure Activision-Blizzard, Valve, Riot and basically every other publisher are very thankful to E','2018-4-15','admin@gmail.com');
insert into reply values(8,38, 'Gaming','Oh man Disney are gonna lose their shit with EA after this. Their biggest property is being directly','2018-4-16','vybaby@gmail.com');
insert into reply values(9,38, 'Gaming','Most mobile games are gambling, they literally have themed versions of wheel of fortune, slots, roul','2018-4-16','admin@gmail.com');
insert into reply values(10,38, 'Gaming','From Gamasutras [article](https://www.gamasutra.com/view/news/310188/Belgian_officials_decide_yes_lo','2018-4-21','nabstua@gmail.com');
insert into reply values(11,38, 'Gaming','Assuming this even leads to an EU wide ban on lootboxes, I am going to make a prediction right now. ','2018-4-16','admin@gmail.com');
insert into reply values(12,38, 'Gaming','Classic EA. This is without a doubt the most expensive PR failure in the history of technology and g','2018-4-24','admin@gmail.com');
insert into reply values(13,38, 'Gaming','oooohhhhhh this is getting damned interesting. Now the big question will be are they going to stop t','2018-4-19','admin@gmail.com');
insert into reply values(14,38, 'Gaming','More importantly, how do we contact the Minister of Justice there and give him/her our support?','2018-4-26','catdog@gmail.com');

insert into reply values(5,39, 'Gaming','I wont buy it, seemed fun but Im not interested in such a heavy money or time investment. A lot of ','2018-5-20','nabstua@gmail.com');
insert into reply values(6,39, 'Gaming','Dont stop buying EAs games to make them change.    Stop buying EAs games *because* theyre neve','2018-5-21','nabstua@gmail.com');
insert into reply values(7,39, 'Gaming','Cancelled my preorder this morning. Im sad because Ive wanted a game like this my whole life, but ','2018-5-17','greenearth@yahoo.ca');
insert into reply values(8,39, 'Gaming','Fully on board. I want to kill this loot box problem dead. I actually loved the free2play model on g','2018-5-27','nonadmin@gmail.com');
insert into reply values(9,39, 'Gaming','While I agree, we have to be realistic about this.Reddit gamers are such a tiny, tiny fraction of ','2018-5-21','mad@yahoo.ca');
insert into reply values(10,39, 'Gaming','Nothing will change. We go through this every big game. Everyone goes up in arms, but the game sells','2018-5-16','nabstua@gmail.com');
insert into reply values(11,39, 'Gaming','Wheres this most downvoted comment in Reddit history?','2018-5-19','admin@gmail.com');
insert into reply values(12,39, 'Gaming','Real talk - anyone who has a passing interest in video games and is on r/Games ***already knows this','2018-5-9','itsdatboi@gmail.com');
insert into reply values(13,39, 'Gaming','Someone else did the math and figured out that about 50% of the money spent on microtransactions is ','2018-5-26','mad@yahoo.ca');
insert into reply values(14,39, 'Gaming','Star Wars is a *Disney* IP.*Disney* cares a *lot* about their public image.Pissed off Star Wars ','2018-5-20','mad@yahoo.ca');

insert into reply values(5,40, 'Gaming','This statement alone might get me to buy the game, if just to support the practice.Good on Respawn','2018-3-27','snowstorm@outlook.com');
insert into reply values(6,40, 'Gaming','As someone that usually thinks eh Ill wait for GOTY with all the DLC bundled and then in half the','2018-3-26','deskrage@gmail.com');
insert into reply values(7,40, 'Gaming','Looks like the gaming industry still has a little bit of soul left. I almost want to buy the game ju','2018-3-28','greenearth@yahoo.ca');
insert into reply values(8,40, 'Gaming','Looks to be an amazing game already, so this is just the icing on the cake.Plus, theres no bullsh','2018-3-27','itsdatboi@gmail.com');
insert into reply values(9,40, 'Gaming','Am I crazy or was this known a very long time ago? I recall Vince saying it shortly after developmen','2018-3-24','json@hotmail.com');
insert into reply values(10,40, 'Gaming','Damn, even the reviews have been excellent. I am really tempted to pick this up ,especially, since I','2018-3-24','nabstua@gmail.com');
insert into reply values(11,40, 'Gaming','I was still a little on the fence, but now I want this game. Would you recommend the PC or PS4 versi','2018-3-26','vybaby@gmail.com');
insert into reply values(12,40, 'Gaming','Whoa this is huge! One commonly cited reason for Titanfalls failure was the splitting of its player','2018-3-24','mad@yahoo.ca');
insert into reply values(13,40, 'Gaming','What a fucking massive win for the industry. Dunno abut the guys behind this title, but from this fa','2018-3-26','nonadmin@gmail.com');
insert into reply values(14,40, 'Gaming','Dang, Titanfall 2 really seems like its knocking things out of the park lately. Major focus on sing','2018-3-26','greenearth@yahoo.ca');

insert into reply values(5,41, 'Gaming','Judging by the almost two-dozen reports and significant number of rule-breaking comments, this is co','2018-6-16','snowstorm@outlook.com');
insert into reply values(6,41, 'Gaming','Hes only 33 and has been dealing with this cancer for 4 years now. He has a wife and son. Devastati','2018-6-10','greenearth@yahoo.ca');
insert into reply values(7,41, 'Gaming','I used to watch Totalbiscuit a ton when I was younger, really sad to hear this. From looking at his ','2018-6-15','snowstorm@outlook.com');
insert into reply values(8,41, 'Gaming','I have followed this man closely for years. Ive watched his Cataclsym wow videos religiously when I','2018-6-19','json@hotmail.com');
insert into reply values(9,41, 'Gaming','Man this sucks. The co-optional podcast for the longest time has been a highlight of the week for me','2018-6-9','nabstua@gmail.com');
insert into reply values(10,41, 'Gaming','Ive gone through school, college, uni and even started working all while listening and watching his','2018-6-10','json@hotmail.com');
insert into reply values(11,41, 'Gaming','Damn things are looking grim. Hope he somehow makes it through....Also, lets try and stay respect','2018-6-12','admin@gmail.com');
insert into reply values(12,41, 'Gaming','That headline hit me a lot harder then I thought it would.I havent kept up with TB in a long time','2018-6-26','deskrage@gmail.com');
insert into reply values(13,41, 'Gaming','Hes put up one hell of a fight for the last several years hes had cancer. I lost my mom to cancer,','2018-6-15','nabstua@gmail.com');
insert into reply values(14,41, 'Gaming','Ive been following him on twitter and YouTube since I was 14. Its really flooring to think he coul','2018-6-16','admin@gmail.com');

insert into reply values(5,42, 'Gaming','There is a [secret message](https://i.imgur.com/sYWoSV4.png) (better version from /u/Arvi833) right ','2018-4-25','admin@gmail.com');
insert into reply values(6,42, 'Gaming','Pretending to end the conference and then surprising me just when I thought Cyberpunk wouldnt show ','2018-4-22','nonadmin@gmail.com');
insert into reply values(7,42, 'Gaming','Ive become a sucker for Synthwave, Outrun and all that stuff in the recent months.And holy, this ','2018-4-19','catdog@gmail.com');
insert into reply values(8,42, 'Gaming','BORN TOO LATE TO EXPLORE EARTHBORN TOO EARLY TO EXPLORE THE UNIVERSEBORN JUST IN TIME FOR CYBERP','2018-4-23','json@hotmail.com');
insert into reply values(9,42, 'Gaming','The codes shown on the video were codes for [The Witcher 3 + Expansions](https://cdn.discordapp.com/','2018-4-20','vybaby@gmail.com');
insert into reply values(10,42, 'Gaming','Looks more Transmetropolitan than Blade Runner, which I like. Almost everything cyberpunk goes the n','2018-4-28','deskrage@gmail.com');
insert into reply values(11,42, 'Gaming','So does this game have a custom protagonist? That dude seemed pretty set in stone, unless this is a ','2018-4-17','nabstua@gmail.com');
insert into reply values(12,42, 'Gaming','No release date. Bummer. Well it certainly looks very impressive. They definitely nailed the cyberpu','2018-4-23','deskrage@gmail.com');
insert into reply values(13,42, 'Gaming','That looked more colorful than I expected. I was imagining something in line with Blade Runner. That','2018-4-18','catdog@gmail.com');
insert into reply values(14,42, 'Gaming','This looks like CDPR is finally ready to put the punk back into the cyberpunk genre. I dont know ','2018-4-28','snowstorm@outlook.com');

insert into reply values(5,43, 'Gaming','There was a brief time between PopCaps early days and PvZ2 & Co when casual games were actually p','2018-5-26','nonadmin@gmail.com');
insert into reply values(6,43, 'Gaming','Thats something that has bothered me for a while now. Devs, especially in AAA are usually unknown b','2018-5-17','vybaby@gmail.com');
insert into reply values(7,43, 'Gaming','Plants vs. Zombies 2 was awful.  It was technically possible to do f2p but there was a serious grind','2018-5-25','greenearth@yahoo.ca');
insert into reply values(8,43, 'Gaming','I will never forgive them for what they did to PvZ 2.I used to play the first one for hours with m','2018-5-28','greenearth@yahoo.ca');
insert into reply values(9,43, 'Gaming','I had such fond memories of Plants vs. Zombies. I played it for quite a while.When Plants vs. Zomb','2018-5-22','catdog@gmail.com');
insert into reply values(10,43, 'Gaming','A bonus middle finger goes to them for removing the original, IAP-free version of PvZ from the iOS A','2018-5-16','mad@yahoo.ca');
insert into reply values(11,43, 'Gaming','Where in the video is that?','2018-5-17','itsdatboi@gmail.com');
insert into reply values(12,43, 'Gaming','https://twitter.com/octogeddonGeorge Fans new game coming is an immediate purchase for me.  I LOV','2018-5-17','catdog@gmail.com');
insert into reply values(13,43, 'Gaming','PvZ 2 had less than half of the content of the first game at launch.And I checked few years later,','2018-5-20','mad@yahoo.ca');
insert into reply values(14,43, 'Gaming','If you have time and like PC gaming and indie games I highly suggest listening to the whole podcast.','2018-5-23','mad@yahoo.ca');

insert into reply values(5,44, 'Gaming','So if you log into fortnite on PS4, it locks that account to only be played on PS4? ','2018-2-22','vybaby@gmail.com');
insert into reply values(6,44, 'Gaming','my favorite part of this is that i have never played an epic game on PS4, but im also blocked becaus','2018-2-17','json@hotmail.com');
insert into reply values(7,44, 'Gaming','Not a Fortnite player but I really hope this story continues to gain traction, while blocking cross ','2018-2-15','greenearth@yahoo.ca');
insert into reply values(8,44, 'Gaming','I get that people are upset about the lack of cross-play, but thats not even the biggest issue. The','2018-2-4','mad@yahoo.ca');
insert into reply values(9,44, 'Gaming','When even Nintendo agrees to crossplay, you have to know youre doing something wrong when you block','2018-2-18','mad@yahoo.ca');
insert into reply values(10,44, 'Gaming','As they absolutely fucken should. Its absolutely crazy that they can hold you Epic account hostage.','2018-2-4','snowstorm@outlook.com');
insert into reply values(11,44, 'Gaming','The most scummy part of this whole thing is that PlayStation released a free exclusive skin *the* da','2018-2-9','deskrage@gmail.com');
insert into reply values(12,44, 'Gaming','I honestly do hope this is where cracks begin to form in the dam that is Sonys bewildering desire t','2018-2-11','json@hotmail.com');
insert into reply values(13,44, 'Gaming','I just think its ridiculous that the PS4 started this generation so for the gamer and capitalized','2018-2-19','deskrage@gmail.com');
insert into reply values(14,44, 'Gaming','Sony won a console generation by telling kids theyd still be able to trade in their games at gamest','2018-2-21','superfoody@live.com');

insert into reply values(5,45, 'Gaming','Dont forget that Benzies is also gone. Apparently he saved the first RDR. > When Red Dead Redem','2018-1-27','catdog@gmail.com');
insert into reply values(6,45, 'Gaming','Not to de-rail the point of this post, but my honest lead concern with the game is the working condi','2018-1-18','nabstua@gmail.com');
insert into reply values(7,45, 'Gaming','Ive never played GTA Online, honestly, and I will never play it. If the single player is good, Ill','2018-1-21','greenearth@yahoo.ca');
insert into reply values(8,45, 'Gaming','Of all the game devs that get hate for their practices, Rockstar doesnt get their fair share.They','2018-1-22','catdog@gmail.com');
insert into reply values(9,45, 'Gaming','I loved GTAV, and while I was interested in the multiplayer portion of it, I didnt end up playing i','2018-1-16','snowstorm@outlook.com');
insert into reply values(10,45, 'Gaming','You could add to your list that they fake sales to get onto Steam Sales.They keep the price of the','2018-1-15','deskrage@gmail.com');
insert into reply values(11,45, 'Gaming','I think its very interesting to see the Im not interested in Online so it doesnt bother me ment','2018-1-22','vybaby@gmail.com');
insert into reply values(12,45, 'Gaming','its funny that rockstar gets to sidestep all the controversies that plague other top companies. ea/','2018-1-21','itsdatboi@gmail.com');
insert into reply values(13,45, 'Gaming','Late to the thread but Ive had meetings with Strauss Zelnick. The dude is a prick. Corporate, not a','2018-1-21','snowstorm@outlook.com');
insert into reply values(14,45, 'Gaming','I paid $60 on day one for Gtav, I didnt even know there was an online mode coming.  The hours lost','2018-1-23','nonadmin@gmail.com');

insert into reply values(5,46, 'Gaming','They need to make online effortless. I mean no friend codes. No accounts locked to the device. Just ','2018-6-17','admin@gmail.com');
insert into reply values(6,46, 'Gaming','Fuck the Switch. I want these peoples lives.Come on bring your video games to our roof party!','2018-6-14','deskrage@gmail.com');
insert into reply values(7,46, 'Gaming','Didnt think it would happen so soon.https://www.reddit.com/r/Games/comments/1c6itx/eas_montreal_o','2018-6-28','catdog@gmail.com');
insert into reply values(8,46, 'Gaming','I think the best thing to take away from this is that Nintendo is no longer going to have to split d','2018-6-22','snowstorm@outlook.com');
insert into reply values(9,46, 'Gaming','My main concern with this is what is the battery life like on the tablet? If its anything like the ','2018-6-24','json@hotmail.com');
insert into reply values(10,46, 'Gaming','You know what. I like the name. Its not stupid, easy to say and it actually makes sense. Not sure','2018-6-23','mad@yahoo.ca');
insert into reply values(11,46, 'Gaming','The amount of times they show the name/logo in this trailer shows theyve learned from the WiiU mark','2018-6-28','mad@yahoo.ca');
insert into reply values(12,46, 'Gaming','I damn near died laughing when they showed skyrim on it. There is no way anyone saw that coming. Swi','2018-6-26','greenearth@yahoo.ca');
insert into reply values(13,46, 'Gaming','Will it have more cpu/gpu power when plugged into the base? Are the slide out controllers motion ena','2018-6-16','admin@gmail.com');

insert into reply values(5,47, 'Music','To help kick the discussion off some, I wrote up a list of songs that I felt make good entryways int','2018-5-25','nonadmin@gmail.com');
insert into reply values(6,47, 'Music','Thought I would breakdown some hip-hop subgenres since no one else has gone much in depth with it.','2018-5-25','catdog@gmail.com');
insert into reply values(7,47, 'Music','THE HIGH BAROQUE (about 1690-1750)Before I talk too much - consider who this music was written for','2018-5-14','snowstorm@outlook.com');
insert into reply values(8,47, 'Music','Trip Hop: Massive Attack - [Inertia Creeps](https://www.youtube.com/watch?v=sE7xyn28wjg)Combines e','2018-5-25','deskrage@gmail.com');
insert into reply values(9,47, 'Music','I find post rock to be very interesting as a genre. Sure a lot of it is crescendocore like God is ','2018-5-14','snowstorm@outlook.com');
insert into reply values(10,47, 'Music','Black Metal: Bathory - [Enter the Eternal Fire](http://www.youtube.com/watch?v=hS8yDlAUzRA) (1987)','2018-5-26','snowstorm@outlook.com');
insert into reply values(11,47, 'Music','I think probably the most important thing is for the song to be something pretty universally relatab','2018-5-12','json@hotmail.com');
insert into reply values(12,47, 'Music','Boards of Canada - Dayvan Cowboy got me into whatever genre they are. Electronica maybe? (ambient ','2018-5-18','admin@gmail.com');
insert into reply values(13,47, 'Music','To introduce someone to **Americana** music, Id probably start with [Lucinda Williams Car Wheels ','2018-5-21','nonadmin@gmail.com');
insert into reply values(14,47, 'Music','Deepest thanks, coffeezombie and to everyone who contributed to this.  Ive been looking for a list ','2018-5-26','vybaby@gmail.com');

insert into reply values(5,48, 'Music','If the essay doesnt end with Carly revealing who killed Tupac I will be sorely disappointed.','2018-1-28','snowstorm@outlook.com');
insert into reply values(6,48, 'Music','Im at Part 5 Epilogue and itching to write an SCP about a pop singer stuck in thematic purgatory.','2018-1-28','nonadmin@gmail.com');
insert into reply values(7,48, 'Music','There. I did it. I read the whole thing.Okay. Where does that leave me?I talked about it with ot','2018-1-28','greenearth@yahoo.ca');
insert into reply values(8,48, 'Music','Fucking hell, dude. That was a god-damned wild ride.I actually am very familiar with your stuff, a','2018-1-28','json@hotmail.com');
insert into reply values(9,48, 'Music','Abandon all hope, Ye who enter here. Saint Pablo Tour Description','2018-1-26','json@hotmail.com');
insert into reply values(10,48, 'Music','As someone who does not really like pop music, reading this much about Carly Rae Jepsen is not how I','2018-1-26','json@hotmail.com');
insert into reply values(11,48, 'Music','Apart from being one of the most gratifying experiences I have ever been lucky enough to stumble upo','2018-1-26','json@hotmail.com');
insert into reply values(12,48, 'Music','Is this like an AMA or something? Cause youre asking me to read a *lot* to be able to even ask you','2018-1-28','snowstorm@outlook.com');
insert into reply values(13,48, 'Music','Alright, I just want to say that this incredible essay has consumed basically my entire life for my ','2018-1-26','vybaby@gmail.com');
insert into reply values(14,48, 'Music','Lasciate ogne speranza, voi chintrate is Italian (Florentine dialect), not Latin. ','2018-1-26','deskrage@gmail.com');

insert into reply values(5,49, 'Music','You covered the by part. These composers were basically servants of the nobility/aristocracy, defi','2018-3-28','itsdatboi@gmail.com');
insert into reply values(6,49, 'Music','Who can afford to hire a live ensemble to play this music?Youre fooling yourself. Without rich pa','2018-3-21','json@hotmail.com');
insert into reply values(7,49, 'Music','Honestly I had no idea about the lives of those composers until I read what you just wrote. Thinking','2018-3-24','greenearth@yahoo.ca');
insert into reply values(8,49, 'Music','The problem i have seen is that, in order to become a musician worth your salt, most of the time, es','2018-3-22','nabstua@gmail.com');
insert into reply values(9,49, 'Music','Classical music was gentrified long ago and most recently so was Jazz. Eventually, so will Rock musi','2018-3-24','nonadmin@gmail.com');
insert into reply values(10,49, 'Music','I seem to recall that the film *Amadeus* did touch upon the popularity of Mozarts work with the wor','2018-3-23','mad@yahoo.ca');
insert into reply values(11,49, 'Music','I go to opera and symphony performances here occasionally and a good proportion of people are *so pr','2018-3-21','greenearth@yahoo.ca');
insert into reply values(12,49, 'Music','First, I think youre certainly on to something.  There are many working class pursuits that now s','2018-3-24','admin@gmail.com');
insert into reply values(13,49, 'Music','>User Reports>1) Nobody gives a shitthats the spirit','2018-3-22','greenearth@yahoo.ca');
insert into reply values(14,49, 'Music','>Yes, rich people might have paid for a lot of it, but it tells the emotions and hardships of ordina','2018-3-22','nabstua@gmail.com');

insert into reply values(5,50, 'Music','Know any punk albums that deal with politics?Check out this weeks [Album Discussion Club category]','2018-6-17','superfoody@live.com');
insert into reply values(6,50, 'Music','This was the first thing I thought when I woke up to the news this morning. Ive been waiting for an','2018-6-14','deskrage@gmail.com');
insert into reply values(7,50, 'Music','Not punk *rock* but I think plenty of music thats new nowadays is rife with aggressive social comme','2018-6-18','mad@yahoo.ca');
insert into reply values(8,50, 'Music','God I fucking HOPE SO. It doesnt have to be punk but it needs to be angry, smart, and have attitude','2018-6-15','itsdatboi@gmail.com');
insert into reply values(9,50, 'Music','Id say no, at least not in the mainstream. American Idiot was a great politically charged Pop-Punk ','2018-6-15','nonadmin@gmail.com');
insert into reply values(10,50, 'Music','Lame attempts at political punk will probably go up but there are already bands like Night Birds and','2018-6-28','greenearth@yahoo.ca');
insert into reply values(11,50, 'Music','It didnt happen during Bush Jrs presidency so I doubt it will happen for this. But I did have th','2018-6-22','catdog@gmail.com');
insert into reply values(12,50, 'Music','I hope not. Punk was protest music for the end of the 70s.Lets have kids in 2016 protest with th','2018-6-17','admin@gmail.com');
insert into reply values(13,50, 'Music','I think a Trump presidency gives us a very real chance of the new SOAD album being great. ','2018-6-23','catdog@gmail.com');
insert into reply values(14,50, 'Music','If he does, itll only be because this idea has been spread around as a joke, moreso since last nigh','2018-6-26','greenearth@yahoo.ca');

insert into reply values(5,51, 'Music','One of my favorite albums of all time is **Revolutionary Pekinese Opera Ver. 1.28 by Ground Zero**, ','2018-5-22','json@hotmail.com');
insert into reply values(6,51, 'Music','To be fair, you have to have a very high IQ to understand Big Blacks Atomizer. The music is extreme','2018-5-19','snowstorm@outlook.com');
insert into reply values(7,51, 'Music','**Tales From Topographic Oceans** by Yes.There are a lot of pretentious albums out there that get ','2018-5-17','catdog@gmail.com');
insert into reply values(8,51, 'Music','**A Rainbow In Curved Air** by **Terry Riley** is probably too sophisticated for anyone here to have','2018-5-23','itsdatboi@gmail.com');
insert into reply values(9,51, 'Music','**The Death Defying Unicorn - A Fanciful and Fairly Far-Out Musical Fable** by **Motorpsycho** in co','2018-5-19','json@hotmail.com');
insert into reply values(10,51, 'Music','I listen to algorithmically composed melodies based on probability distributions. My favorite algori','2018-5-19','json@hotmail.com');
insert into reply values(11,51, 'Music','[Naked City - Torture Garden](https://m.youtube.com/watch?v=AZSw73DLq-0)John Zorn, an avant garde ','2018-5-21','json@hotmail.com');
insert into reply values(12,51, 'Music','Uh, that would be Maggie Bjrklunds _Shaken_. (Yes, with the umlauts, you fucking philistine). If y','2018-5-17','vybaby@gmail.com');
insert into reply values(13,51, 'Music','This thread is a goldmine of amazingly pretentious and/or obscure music. Youre all gloriously filth','2018-5-17','json@hotmail.com');
insert into reply values(14,51, 'Music','Trout Mask Replica. Its the pinnacle of music as an art form. From the composition, the recording p','2018-5-27','snowstorm@outlook.com');

insert into reply values(5,52, 'Music','This is a good thing. I never liked Pitchfork. They are way too holier-than-thou and their reviews a','2018-1-24','mad@yahoo.ca');
insert into reply values(6,52, 'Music','People saying that Pitchfork has stayed more or less the same sound like theyve not followed Pitchf','2018-1-23','catdog@gmail.com');
insert into reply values(7,52, 'Music','The trajectory of moving on from Pitchfork and into Chris Otts Shallow Rewards is quite well worn. ','2018-1-26','snowstorm@outlook.com');
insert into reply values(8,52, 'Music','> What do you use to find your music? What review sites do you think still have integrity?[Rate Yo','2018-1-22','catdog@gmail.com');
insert into reply values(9,52, 'Music','I started reading Pitchfork around 2009-2010 as a sophomore in high school and had much the same rea','2018-1-24','catdog@gmail.com');
insert into reply values(10,52, 'Music','People here are going to try to make you out to be a lunatic but Pitchfork definitely did change pos','2018-1-22','json@hotmail.com');
insert into reply values(11,52, 'Music','So this is what its come down to, huh? With the crowning of Bodak Yellow as 2017s single greates','2018-1-26','snowstorm@outlook.com');
insert into reply values(12,52, 'Music','There is a lot to unpack here. First off Pitchfork has always been what it is (they once gave the ba','2018-1-27','nonadmin@gmail.com');
insert into reply values(13,52, 'Music','The best way I can summarize my thoughts on P4k is the following: the publication began and grew as ','2018-1-27','mad@yahoo.ca');
insert into reply values(14,52, 'Music','I use pitchfork as a news source and have for years. That is: I go on there every week to check what','2018-1-27','catdog@gmail.com');

insert into reply values(5,53, 'Music','Easy. They dont care. Its happening far away.My girlfriend is in it for the pretty boys, well ch','2018-1-27','admin@gmail.com');
insert into reply values(6,53, 'Music','K-pop is just following the same trends of western pop music. Not sure whether its more or less exp','2018-1-21','nabstua@gmail.com');
insert into reply values(7,53, 'Music','Devils advocate probably but people arent listening to k-pop because they think its soulful, and ','2018-1-24','catdog@gmail.com');
insert into reply values(8,53, 'Music','When you hear kpop fans talk about their music, how often do you actually hear them say good things','2018-1-21','deskrage@gmail.com');
insert into reply values(9,53, 'Music','/u/-weeg, is that you?J-Pop is worse. If youre a teen boy and want to be a singer, you have to go','2018-1-24','greenearth@yahoo.ca');
insert into reply values(10,53, 'Music','This is fascinating. I had no idea kpop had any foothold on english speaking populations. Where are ','2018-1-28','nonadmin@gmail.com');
insert into reply values(11,53, 'Music','i totally agree with you on your first point. the kpop industry is pretty fucked, ethically. the who','2018-1-23','snowstorm@outlook.com');
insert into reply values(12,53, 'Music','I dont necessarily have a pessimistic world view, but I think its not entirely wrong to say ethica','2018-1-21','nonadmin@gmail.com');
insert into reply values(13,53, 'Music','I say good things about the songwriting.On this sub about a month ago I mentioned kpop, and how so','2018-1-20','itsdatboi@gmail.com');
insert into reply values(14,53, 'Music','Kpop is not worse than american pop to me. Is it possible that you have a bias because of your own c','2018-1-20','nonadmin@gmail.com');

insert into reply values(5,54, 'Music','I think that we probably arent going to get our rock answer to To Pimp a Butterfly but that isnt a','2018-1-22','greenearth@yahoo.ca');
insert into reply values(6,54, 'Music','I think there were a lot of signs that To Pimp a Butterfly would elevate the competition. In intervi','2018-1-21','json@hotmail.com');
insert into reply values(7,54, 'Music','There are a lot of exciting and fresh releases in the last 5 years in the rock/indie/post-rock world','2018-1-21','snowstorm@outlook.com');
insert into reply values(8,54, 'Music','I would consider the last 2 Swans albums to be close to classics. For comparison, Merriweather has','2018-1-20','mad@yahoo.ca');
insert into reply values(9,54, 'Music','Unfortunately, we have to go pretty far back to find rock albums with the same level of cultural rel','2018-1-23','vybaby@gmail.com');
insert into reply values(10,54, 'Music','Id like to say that 2010 saw the release of The Monitor by Titus Andronicus which is an odd kind ','2018-1-20','mad@yahoo.ca');
insert into reply values(11,54, 'Music','Personally, if theres gonna be a To Pimp a Butterfly from rock this decade, I think it has to come ','2018-1-24','deskrage@gmail.com');
insert into reply values(12,54, 'Music','Thats kind of an interesting point. There hasnt really been an album that defines a new flavor or ','2018-1-22','greenearth@yahoo.ca');
insert into reply values(13,54, 'Music','>Will Tame Impala step it up (once more) and give us a masterpiece with their third LP this year?i','2018-1-20','vybaby@gmail.com');

insert into reply values(5,55, 'Music','Station To Station by David Bowie was recorded at the height of his cocaine addiction, when he survi','2018-4-15','mad@yahoo.ca');
insert into reply values(6,55, 'Music','Mayhems black metal classic De Mysteriis Dom Sathanas takes the cake here I feel.Lyricist Dead ','2018-4-18','json@hotmail.com');
insert into reply values(7,55, 'Music','Smile by The Beach Boys. Basically came about in the midst of a Brian Wilson mental breakdown. I bel','2018-4-17','greenearth@yahoo.ca');
insert into reply values(8,55, 'Music','Misfits - Static Age. They were given free recording studio time in exchange for the rights of the','2018-4-26','deskrage@gmail.com');
insert into reply values(9,55, 'Music','Theres the classic story of Sleeps *Dopesmoker* where the record label gave them something like $5','2018-4-20','itsdatboi@gmail.com');
insert into reply values(10,55, 'Music','Nick Drake is a classic story - he was great in the studio, working with members of Fairport Convent','2018-4-17','deskrage@gmail.com');
insert into reply values(11,55, 'Music','Mayhems De Mysteriis Dom Sathanas (1994).Why is it crazy?The to-be lead singer shot himself p','2018-4-18','greenearth@yahoo.ca');
insert into reply values(12,55, 'Music','https://en.wikipedia.org/wiki/The_Bedlam_in_Goliathtl:dr: They bought a cursed Ouija board and cra','2018-4-27','itsdatboi@gmail.com');
insert into reply values(13,55, 'Music','Bill Holts Dreamies has always fascinated me. Had a cookie-cutter life and worked as a junior exec ','2018-4-23','nonadmin@gmail.com');
insert into reply values(14,55, 'Music','Manic Street PreachersLeading up to their breakthrough album (*Everything Must Go*), the Manics ','2018-4-19','vybaby@gmail.com');

insert into reply values(5,56, 'Music','I just finished my first listen and really enjoyed it. Unfortunately I felt that the 10 minute rever','2018-5-14','itsdatboi@gmail.com');
insert into reply values(6,56, 'Music','Am I the only long time fan to find this album boring and a little on the pretentious side?','2018-5-22','deskrage@gmail.com');
insert into reply values(7,56, 'Music','Thanks for pointing out a new album was out, Ill have to give it a listen... I was disappointed by ','2018-5-25','superfoody@live.com');
insert into reply values(8,56, 'Music','Just finishing up side 1. I am truly amazed so far. The darker tone, the hooks are catchier, James M','2018-5-19','mad@yahoo.ca');
insert into reply values(9,56, 'Music','A lot of the lyrics, while good in isolation as poetry, dont sound right when sang. Theyre a bit s','2018-5-12','nonadmin@gmail.com');
insert into reply values(10,56, 'Music','I havent listened yet, but I have REALLY high expectations. Im trying not to, but with Funeral, Ne','2018-5-24','snowstorm@outlook.com');
insert into reply values(11,56, 'Music','100% FLAC went up on what just after I left for work...knew I should have left a little later for th','2018-5-24','nabstua@gmail.com');
insert into reply values(12,56, 'Music','One thing that Im grateful for is that you still will never hear a thinking person say that Arcade ','2018-5-12','itsdatboi@gmail.com');
