

USE world_news_corp_cms;


### For each author retrieve the first name, last name and age only.
SELECT FirstName, Surname, Age
FROM Author;

###Find the average age of male authors.
SELECT AVG(Age) 
AS AgeAverage 
FROM Author 
WHERE Gender = 'M';

###Find the best paid author retrieve first name, last name and salary only.
SELECT FirstName, Surname, Salary
FROM Author
WHERE Salary = (
SELECT MAX(Salary)
AS HighestSalary 
FROM Author);

###List the authors (first and last name only) who have not written any news articles
SELECT FirstName, Surname
FROM Author
WHERE NI NOT IN (
SELECT NI
FROM NewsArticle);

###Find any articles that mention George Clooney or David Cameron and list the title topic  and author and first last name.
SELECT FirstName, Surname, Title, Topic
FROM NewsArticle, Author
WHERE (Content LIKE '%David Cameron%' OR Content LIKE '%George Clooney%')
AND NewsArticle.NI = Author.NI;

