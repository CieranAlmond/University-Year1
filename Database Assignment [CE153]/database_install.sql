### This is a script file, which will be executed in MySQL using batch mode

### Lines that start with # are comments

# 

###Create a database (remember to drop it if it exists first)

DROP DATABASE IF EXISTS world_news_corp_cms;

CREATE DATABASE world_news_corp_cms;



USE world_news_corp_cms;


###Author


CREATE TABLE Author (

	NI BIGINT NOT NULL,

	FirstName VARCHAR (30) NOT NULL,

	Surname VARCHAR (30) NOT NULL,

	Gender ENUM ('M', 'F') NOT NULL,

	Age INT UNSIGNED NOT NULL,

	Salary DECIMAL (8,2),

	Country VARCHAR (30) NOT NULL,
	PRIMARY KEY (NI)

);


###NewsArticle

CREATE TABLE NewsArticle (

	NewsArticleID BIGINT,
	Topic VARCHAR (20) NOT NULL,
	Title VARCHAR (50) NOT NULL,

	PublishDate DATE NOT NULL,

	Content VARCHAR (250) NOT NULL,

	Country VARCHAR (20) NOT NULL,

	NI BIGINT NOT NULL,
	PRIMARY KEY (NewsArticleID)
);

###Comments

CREATE TABLE Comments (

        CommentID BIGINT UNSIGNED NOT NULL,
	NewsArticleID BIGINT,
	Username VARCHAR (20) NOT NULL,

	TimeSet TIME NOT NULL,

	Content VARCHAR (100) NOT NULL,
	PRIMARY KEY (CommentID)
);


###Likes

CREATE TABLE Likes (

	LikeID INT,
	NewsArticleID BIGINT,
	TimeSet TIME NOT NULL,

	Publish_date DATE NOT NULL,

	PRIMARY KEY (LikeID)

);
###insert data

### Author values from spreadsheet

INSERT INTO Author VALUES (1987234920, 'John','Smith','M',34,20000,'England');

INSERT INTO Author VALUES (9348098234, 'Tom','Potter','M',32,32000,'Scotland');

INSERT INTO Author VALUES (4564547547, 'Jack','Kingman','M',23,14000,'India');

INSERT INTO Author VALUES (5654674575, 'Chris','Trethick','M',45,24000,'India');

INSERT INTO Author VALUES (5675675675, 'Dave','Carter','M',56,40000,'Ireland');

INSERT INTO Author VALUES (7775656765, 'Ian','Packwood','M',33,19000,'England');

INSERT INTO Author VALUES (8964334324, 'Lucy','Teague','F',18,20000,'America');

INSERT INTO Author VALUES (6612355667, 'Jane','Connor','F',19,49000,'France');

INSERT INTO Author VALUES (3456456457, 'Mary','Van Schmidt','F',42,32000,'France');

INSERT INTO Author VALUES (1875432325, 'Liz','Fogarty','F',53,34000,'America');

INSERT INTO Author VALUES (1134576877, 'Emma','Baker','F',37,20000,'England');

INSERT INTO Author VALUES (2345457654, 'Anne','Nuttley','F',43,34000,'Indonesia');



### NewsArticle values from spreadsheet
INSERT INTO NewsArticle VALUES (1,'Politics','Europe crackdown on jihadist network',CURDATE(),'Police target 17 people in raids in several European countries on suspicion of links to a jihadist network.','England',1987234920);

INSERT INTO NewsArticle VALUES (2,'Politics','Modi visit historic opportunity for UK',CURDATE(),'Indian prime minister arrives in the UK for a three day visit, described by David Cameron as a historic opportunity for both countries.','India',9348098234);

INSERT INTO NewsArticle VALUES (3,'Politics','Sweden brings in migrant border checks',CURDATE(),'Sweden brings in temporary border checks to control the flow of migrants into the country, as an EU Africa summit continues.','Sweden',5675675675);

INSERT INTO NewsArticle VALUES (4,'Financial','Apple apologises after racism outcry',CURDATE(),'Apple apologises to six schoolboys who were asked to leave one of their shops in Australia, in what the students described as a racist incident.','Australia',7775656765);

INSERT INTO NewsArticle VALUES (5,'Financial','HMRC reveals tax office shake-up',CURDATE(),'The UKs tax authority will close 137 local offices and replace them with 13 regional centres, raising fears over job losses.','England',1134576877);

INSERT INTO NewsArticle VALUES (6,'Entertainment','Film star visits cafe for homeless',CURDATE(),'Hollywood star George Clooney visits a sandwich shop which helps homeless people during a visit to Edinburgh.','Scotland',1987234920);

INSERT INTO NewsArticle VALUES (7,'Financial','Rolls-Royce shares dive on profit woes',CURDATE(),'Shares in aerospace group RollsRoyce sink after it warns that its profits will be hit by sharply weaker demand.','England',1134576877);

INSERT INTO NewsArticle VALUES (8,'Politics','Ex-MPs GBP13,700 on shredding and skips',CURDATE(),'The Independent Parliamentary Standards Authority releases expenses claims for 182 MPs who left the Commons at the election - with GBP705,000 spent on closing down their offices.','England',1134576877);

INSERT INTO NewsArticle VALUES (9,'Science','Action needed to protect UK coast',CURDATE(),'The UK is ignoring known risks of flood and erosion at the coast and immediate action is needed to manage the threats, the National Trust warns.','England',3456456457);

INSERT INTO NewsArticle VALUES (10,'Science','Venus twin excites astronomers',CURDATE(),'Astronomers hunting distant worlds say they have made one of their most significant discoveries to date, what could be a kind of hot twin to our Venus.','America',2345457654);

###Comments for commenter
INSERT INTO Comments VALUES (1,1,'2evan2',CURTIME(),'great article!');
INSERT INTO Comments VALUES (2,1,'blinkenlicten',CURTIME(),'very interesting read!');
INSERT INTO Comments VALUES (3,3,'axepear',CURTIME(),'what a load of rubbish');
INSERT INTO Comments VALUES (4,4,'cinnamon123',CURTIME(),'inspiring read');
INSERT INTO Comments VALUES (5,5,'shojalace',CURTIME(),'wow, what a twist. I cant believe it');

INSERT INTO Comments VALUES (6,7,'piero',CURTIME(),'didnt rate it');
INSERT INTO Comments VALUES (7,7,'mac008',CURTIME(),'commenting is very fun');
INSERT INTO Comments VALUES (8,10,'lee',CURTIME(),'tá, mo chara');
INSERT INTO Comments VALUES (9,9,'weirdybeardyman',CURTIME(),'whens the next article?');
INSERT INTO Comments VALUES (10,10,'avantar',CURTIME(),'journalism at its finest');

INSERT INTO Comments VALUES (11,3,'drax0',CURTIME(),'jag blir så irriterad just nu');
INSERT INTO Comments VALUES (12,2,'melkor',CURTIME(),'mitt liev är en meme');
INSERT INTO Comments VALUES (13,5,'axepear',CURTIME(),'jag kommer nu');
INSERT INTO Comments VALUES (14,6,'09willisc',CURTIME(),'wie gehts');
INSERT INTO Comments VALUES (15,1,'bayorn',CURTIME(),'die nacht ist is mir');


###likes
INSERT INTO Likes VALUES (1,1,NOW(),CURDATE());
INSERT INTO Likes VALUES (2,2,NOW(),CURDATE());
INSERT INTO Likes VALUES (3,3,NOW(),CURDATE());
INSERT INTO Likes VALUES (4,4,NOW(),CURDATE());
INSERT INTO Likes VALUES (5,5,NOW(),CURDATE());
INSERT INTO Likes VALUES (6,6,NOW(),CURDATE());
INSERT INTO Likes VALUES (7,7,NOW(),CURDATE());
INSERT INTO Likes VALUES (8,8,NOW(),CURDATE());
INSERT INTO Likes VALUES (9,9,NOW(),CURDATE());
INSERT INTO Likes VALUES (10,9,NOW(),CURDATE());
INSERT INTO Likes VALUES (11,8,NOW(),CURDATE());
INSERT INTO Likes VALUES (12,7,NOW(),CURDATE());
INSERT INTO Likes VALUES (13,6,NOW(),CURDATE());
INSERT INTO Likes VALUES (14,6,NOW(),CURDATE());
INSERT INTO Likes VALUES (15,4,NOW(),CURDATE());



#














## Query world_news_corp;

SELECT * FROM Author;

SELECT * FROM NewsArticle;

SELECT * FROM Comments;

SELECT * FROM Likes;
