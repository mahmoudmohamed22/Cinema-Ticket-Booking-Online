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
