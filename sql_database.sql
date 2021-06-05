create DataBase CinemaTicketBooking;

create table MOIVE (
    Movie_ID integer not null,
    Name varchar(20)  not null,
    Rate decimal,
    ReleaseDate date ,
    Duration datetime,
    Type char not null ,
    Country varchar(20),
    Language char not null,
    Translated boolean ,
    Status char not null,

     PRIMARY KEY (Movie_ID)
);

create table AUDITORIUM_STATUS (
Auditorium_ID integer ,FOREIGN KEY (Auditorium_ID) REFERENCES AUDITORIUM(Auditorium_ID),
Show_ID integer ,FOREIGN KEY (Show_ID) REFERENCES SHOW(Show_ID),
);
