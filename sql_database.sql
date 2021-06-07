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
