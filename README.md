# Online-Voting-System
It is an online voting site for colleges/firms/offices for conducting elections securely without physical presence of the voters.

#Prerequisites
•	Apache and mysql server.
•	Import two sql files (login.sql and authentication.sql) in PHP myAdmin.
•	Platform : Netbeans / eclipse

#Overview 
The head admin sets up an environment of the different elections going inside firm/office/college. The voter registers in the site and allowed to access the site by the entering a unique key sent to his email-id. Voters can register themselves for the various elections going at present and can view the candidates profile. He then has to authenticate himself by sending a request to admin for casting vote in a particular election. After admin authenticates him then only voter can cast his vote.
After the election time is over, a bar chart representing the no of votes of each candidate is displayed in result section.One voter can cast his vote only one time in an election.

# Admin Section
•	There is a head admin (username : Tarzen and password : 123) who has the power to add and delete other admins.
•	Admin can add a new election, add candidates, search any candidate and can authenticate the candidates.
•	Admin section is coded with Ajax so as to fast retrieval of the data.
•	Whenever admins adds a new election,two tables are formed dynamically. One in student database where details of the each election is       stored and other in authentication database.
•	Admin uses the ‘authentication’ database to keep track of the candidates.

 #Voters Section
•	There are two main sections :- Voters corner and contact us.
•	In voters corner, every election has four buttons :-
	View candidates : for viewing the profile. 
	Request for vote : to get authenticated from the admin.
	Click for vote : choose the candidate and cast the vote.
	View result : once election is over, this will show the result in form of pi-chart.
