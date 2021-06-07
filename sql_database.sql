create DataBase CinemaTicketBooking;

--create a table Cinemas
create table Cinema
(
  Cinema_ID INTEGER not null,
  Location varchar(20) not null,
  No_Hall INTEGER not null,
  Phone varchar2(20) not null ,
  constraint Cinema_location unique (Location),
  constraint Cinema_Phone unique (Phone),
  constraint Cinema_ID primary key (Cinema_ID)
);
DESCRIBE Cinema;
SELECT * FROM Cinema;


-- create a table Movies
CREATE TABLE Movie(
    Movie_ID INTEGER not null,
    Movie_Name varchar(20)  not null,
    Rate decimal,
    ReleaseDate date,
    Duration INTEGER not null,
    Type varchar(20) not null,
    Country varchar(20),
    Language varchar(20) not null,
    Translated varchar(20) ,
    Status varchar(20) not null,
    PRIMARY KEY (Movie_ID)
);
DESCRIBE Movie;
SELECT * FROM Movie;

-- create a table shows
CREATE TABLE Show (
  Show_ID INTEGER PRIMARY KEY,
  Movie_ID INTEGER not null,
  Duration INTEGER NOT NULL,
  Free_ticket INTEGER NOT NULL,
  Start_Time timestamp NOT NULL,
  Ticket_Price float NOT NULL,
  FOREIGN KEY (Movie_ID)REFERENCES Movie(Movie_ID)
);
DESCRIBE Show;
SELECT * FROM Show;


--create a table Auditoriums
CREATE TABLE Auditorium(
    Auditorium_ID INTEGER,
    Cinema_ID INTEGER not null,
    No_Seats INTEGER NOT NULL,
    Auditorium_No INTEGER NOT NULL,
    FOREIGN KEY (Cinema_ID) REFERENCES Cinema(Cinema_ID),
    primary key (Auditorium_ID)
);
DESCRIBE Auditorium;
SELECT * FROM Auditorium;

-- create a table Seats
CREATE TABLE Seat(
    Seat_ID INTEGER,
    Auditorium_ID INTEGER,    
    Status VARCHAR(4),
    Row_No INTEGER,
    Seat_No INTEGER,
    FOREIGN KEY (Auditorium_ID)REFERENCES Auditorium(Auditorium_ID),
    PRIMARY KEY (Seat_ID)
);
DESCRIBE Seat;
SELECT * FROM Seat;


-- create a table AuditoriumStatus
create table Auditorium_Status(
Auditorium_busy varchar(20),
Show_ID INTEGER,
Auditorium_ID INTEGER ,
FOREIGN KEY (Auditorium_ID) REFERENCES Auditorium(Auditorium_ID),
FOREIGN KEY (Show_ID) REFERENCES Show(Show_ID),
PRIMARY KEY (Show_ID,Auditorium_ID)
);
DESCRIBE Auditorium_Status;
SELECT * FROM Auditorium_Status;

-- create a table customers
CREATE TABLE Customer (
    Customer_ID INTEGER,
    Customer_Name varchar(50) NOT NULL ,
    Customer_Email VARCHAR(40) UNIQUE NOT NULL,
    Customer_Password VARCHAR(40) UNIQUE NOT NULL,
    Customer_Phone VARCHAR(40) UNIQUE NOT NULL,
    Customer_Address VARCHAR(40),
    PRIMARY KEY (Customer_ID)
);
DESCRIBE Customer;
SELECT * FROM Customer;

-- create a table Bookings 
CREATE TABLE Booking (
    Booking_ID INTEGER,
    Customer_ID INTEGER,
    Show_ID INTEGER,
    Seat_ID INTEGER ,
    FOREIGN KEY (Show_ID) REFERENCES Show(Show_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Seat_ID) REFERENCES Seat(Seat_ID),
    PRIMARY KEY (Booking_ID)
);
DESCRIBE Booking;
SELECT * FROM Booking;



-- Cinemas
INSERT INTO Cinema VALUES (1111, 'Cairo', 3, +201284030016);
INSERT INTO Cinema VALUES (2222, 'Alexandria', 4, +201099315074);
SELECT * FROM Cinema;

-- Auditoriums
INSERT INTO Auditorium Values (1, 1111, 200, 1);
INSERT INTO Auditorium Values (2, 1111, 300, 2);
INSERT INTO Auditorium Values (3, 1111, 200, 3);
INSERT INTO Auditorium Values (4, 2222, 150, 1);
INSERT INTO Auditorium Values (5, 2222, 200, 2);
INSERT INTO Auditorium Values (6, 2222, 150, 3);
INSERT INTO Auditorium Values (7, 2222, 200, 4);
SELECT * FROM Auditorium;

-- Administrators
INSERT INTO Administrator Values (111, 1111, 'Mourad Fawzi', 'mourad@gmail.com', '123456');
INSERT INTO Administrator Values (222, 2222, 'Hamed Mahmoud', 'hamed@gmail.com', '123456789');
SELECT * FROM Administrator;

-- Seats
INSERT INTO Seat Values (1, 1, 'free', 25, 1);
INSERT INTO Seat Values (2, 1, 'free', 25, 2);
INSERT INTO Seat Values (3, 1, 'free', 25, 3);
INSERT INTO Seat Values (4, 1, 'free', 25, 4);
INSERT INTO Seat Values (5, 1, 'free', 25, 5);
INSERT INTO Seat Values (151, 2, 'free', 25, 1);
INSERT INTO Seat Values (152, 2, 'free', 25, 2);
INSERT INTO Seat Values (153, 2, 'free', 25, 3);
INSERT INTO Seat Values (154, 2, 'free', 25, 4);
INSERT INTO Seat Values (155, 2, 'free', 25, 5);
INSERT INTO Seat Values (61, 3, 'free', 25, 1);
INSERT INTO Seat Values (62, 3, 'free', 25, 2);
INSERT INTO Seat Values (63, 3, 'free', 25, 3);
INSERT INTO Seat Values (64, 3, 'free', 25, 4);
INSERT INTO Seat Values (65, 3, 'free', 25, 5);
INSERT INTO Seat Values (176, 4, 'free', 25, 1);
INSERT INTO Seat Values (177, 4, 'free', 25, 2);
INSERT INTO Seat Values (178, 4, 'free', 25, 3);
INSERT INTO Seat Values (179, 4, 'free', 25, 4);
INSERT INTO Seat Values (180, 4, 'free', 25, 5);
INSERT INTO Seat Values (281, 5, 'free', 25, 1);
INSERT INTO Seat Values (282, 5, 'free', 25, 2);
INSERT INTO Seat Values (283, 5, 'free', 25, 3);
INSERT INTO Seat Values (284, 5, 'free', 25, 4);
INSERT INTO Seat Values (285, 5, 'free', 25, 5);
INSERT INTO Seat Values (311, 6, 'free', 25, 1);
INSERT INTO Seat Values (312, 6, 'free', 25, 2);
INSERT INTO Seat Values (313, 6, 'free', 25, 3);
INSERT INTO Seat Values (314, 6, 'free', 25, 4);
INSERT INTO Seat Values (315, 6, 'free', 25, 5);
INSERT INTO Seat Values (501, 7, 'free', 25, 1);
INSERT INTO Seat Values (502, 7, 'free', 25, 2);
INSERT INTO Seat Values (503, 7, 'free', 25, 3);
INSERT INTO Seat Values (504, 7, 'free', 25, 4);
INSERT INTO Seat Values (505, 7, 'free', 25, 5);
SELECT * FROM Seat;

-- Movies
INSERT INTO Movie Values (11, 'Army of the Dead', 5.8, '14-MAY-2021', 148, 'Action', 'Spain', 'Spanish', 'English', 'Available');
INSERT INTO Movie Values (22, 'Cruella', 7.4, '27-MAY-2021', 134, 'Comedy', 'US', 'English', 'Arabic', 'Available');
INSERT INTO Movie Values (33, 'Wrath of Man', 7.2, '13-MAY-2021', 119, 'Action', 'US', 'English', 'Arabic', 'Available');
INSERT INTO Movie Values (44, 'F9: The Fast Saga', 7.2, '13-MAY-2021', 145, 'Action', 'US', 'English', 'Arabic', 'Available');
INSERT INTO Movie Values (55, 'Spiral', 5.4, '26-MAY-2021', 93, 'Horror', 'US', 'English', 'Arabic', 'Available');
SELECT * FROM Movie;

-- Shows
INSERT INTO Show VALUES (1, 11, 3, 200, '01-JUN-2021 3.00.00 AM', 125);
INSERT INTO Show VALUES (2, 22, 3, 200, '01-JUN-2021 3.00.00 PM', 125);
INSERT INTO Show VALUES (3, 33, 3, 200, '01-JUN-2021 7.00.00 PM', 125);
INSERT INTO Show VALUES (4, 44, 3, 200, '01-JUN-2021 11.00.00 PM', 125);
INSERT INTO Show VALUES (5, 55, 3, 200, '02-JUN-2021 3.00.00 AM', 125);
SELECT * FROM Show;

-- Auditoriumstatus
INSERT INTO Auditorium_Status VALUES ('Available', 1, 1);
INSERT INTO Auditorium_Status VALUES ('Available', 1, 2);
INSERT INTO Auditorium_Status VALUES ('Available', 1, 3);
INSERT INTO Auditorium_Status VALUES ('Available', 2, 4);
INSERT INTO Auditorium_Status VALUES ('Available', 2, 5);
INSERT INTO Auditorium_Status VALUES ('Available', 2, 6);
INSERT INTO Auditorium_Status VALUES ('Available', 3, 7);
SELECT * FROM Auditorium_Status;

-- Customers
INSERT INTO Customer VALUES (1, 'Mark', 'mark@gmail.com', 'mark1234', '+2001099315074','cairo' );
INSERT INTO Customer VALUES (2, 'jo', 'jo@gmail.com', 'jo1234', '+2001099315071','alex' );
INSERT INTO Customer VALUES (3, 'ahmed', 'ahmed@gmail.com', '123456789', '+2001099315072','ainshams');
INSERT INTO Customer VALUES (4, 'mohamed', 'mohamed@gmail.com', '123485', '+2001099315079','madaai' );
INSERT INTO Customer VALUES (5, 'Mahmoud', 'mahmoud@gmail.com', '12345679', '+2001099315076','giza' );
INSERT INTO Customer VALUES (6, 'ghada ', 'ghada@gmail.com', '1346798', '+2001099315077','aswan' );
INSERT INTO Customer VALUES (7, 'marowa', 'marowa@gmail.com', 'mark234', '+2001099315073','cairo' );
INSERT INTO Customer VALUES (8, 'yasser', 'yasser@gmail.com', 'jo234', '+2001099315087','alex' );
INSERT INTO Customer VALUES (9, 'youssef', 'youssef@gmail.com', '12356789', '+2001099315082','ainshams');
INSERT INTO Customer VALUES (10, 'alien', 'alien@gmail.com', '12345', '+2001099315081','madaai');
SELECT * FROM Customer;

-- Bookings
insert into Booking values(100, 1, 2, 1);
insert into Booking values(101,2,2,151);
insert into Booking values(102,3,1,5);
insert into Booking values(103,4,1,151);
insert into Booking values(104,5,3,3);
insert into Booking values(105,6,4,4);
insert into Booking values(106,7,5,155);
insert into Booking values(107,8,5,4);
insert into Booking values(108,9,3,153);
insert into Booking values(109,10,2,2);
SELECT * FROM Booking;

SELECT Customer_Name, Movie_Name, Start_Time, Location
FROM Customer, Movie,Show, Cinema
WHERE Customer_ID=5 AND Booking.Show_ID=Show.Show_ID AND
Show.Movie_ID=Movie.Movie_ID AND Booking.Seat_ID=Seat.Seat_ID AND
Seat.Auditorium_ID=Auditorium.Auditorium_ID AND Auditorium.Cinema_ID=Cinema.Cinema_ID;

-- Queries
-- Customer_ID Customer_Name Cinema_Location Auditorium_No Movie_Name Ticket_Price
-- For Tickets..
SELECT Customer.Customer_Name, Cinema.Location, Auditorium.Auditorium_No, Movie.Movie_Name, Show.Start_Time, Show.Ticket_Price
FROM (((Booking
INNER JOIN Customer ON Booking.Customer_ID = Customer.Customer_ID)
INNER JOIN Show ON Booking.Show_ID = Show.Show_ID INNER JOIN MOVIE ON Show.Movie_ID = Movie.Movie_ID)
INNER JOIN Seat ON Booking.Seat_ID = Seat.Seat_ID INNER JOIN Auditorium ON Seat.Auditorium_ID = Auditorium.Auditorium_ID
INNER JOIN Cinema ON Auditorium.Cinema_ID = Cinema.Cinema_ID)
WHERE Booking.Customer_ID = 5
;
-- For Show List..
SELECT Booking.Booking_ID, Customer.Customer_ID, Customer.Customer_Name, Auditorium.Auditorium_No
FROM (((Booking
INNER JOIN Customer ON Booking.Customer_ID = Customer.Customer_ID)
INNER JOIN Show ON Booking.Show_ID = Show.Show_ID INNER JOIN Movie ON Show.Movie_ID = Movie.Movie_ID)
INNER JOIN Seat ON Booking.Seat_ID = Seat.Seat_ID INNER JOIN Auditorium ON Seat.Auditorium_ID = Auditorium.Auditorium_ID)
WHERE Booking.Show_ID = 1
;
