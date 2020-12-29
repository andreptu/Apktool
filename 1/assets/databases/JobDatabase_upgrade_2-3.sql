
BEGIN TRANSACTION;




CREATE TABLE temp_Locations_534011718
(
    TimeStamp NUMERIC,
    IsLineOn NUMERIC,
    Longitude double,
    Id INTEGER PRIMARY KEY,
    JobId NUMERIC,
    Latitude double
);



INSERT INTO temp_Locations_534011718 (TimeStamp,IsLineOn,Longitude,Id,JobId,Latitude) SELECT TimeStamp,IsLineOn,Longitude,Id,JobId,Latitude FROM Locations;



DROP TABLE Locations;
ALTER TABLE temp_Locations_534011718 RENAME TO Locations;

CREATE TABLE NavigationCrossPoints
(
    JobId NUMERIC,
    Point0x NUMERIC,
    Point0y NUMERIC
);

CREATE TABLE NavigationLines
(
    JobId NUMERIC,
    Point0x NUMERIC,
    Point0y NUMERIC,
    Point1x NUMERIC,
    Point1y NUMERIC
);

CREATE TABLE NavigationMode
(
    JobId INTEGER PRIMARY KEY,
    Mode NUMERIC
);

CREATE TABLE NavigationPoints
(
    StartPointX NUMERIC,
    StartPointY NUMERIC,
    APointX NUMERIC,
    APointY NUMERIC,
    BPointX NUMERIC,
    BPointY NUMERIC,
    EndPointX NUMERIC,
    EndPointY NUMERIC,
    JobId INTEGER PRIMARY KEY
);

CREATE TABLE NavigationState
(
    JobId INTEGER PRIMARY KEY,
    State NUMERIC
);

CREATE TABLE PerimeterLocations
(
    Id INTEGER PRIMARY KEY,
    JobId NUMERIC,
    Latitude NUMERIC,
    Longitude NUMERIC
);

CREATE TABLE ReferenceLines
(
    JobId INTEGER PRIMARY KEY,
    PointAx NUMERIC,
    PointAy NUMERIC,
    PointBx NUMERIC,
    PointBy NUMERIC
);

CREATE TABLE StartEndPoints
(
    JobId INTEGER PRIMARY KEY,
    StartPointX NUMERIC,
    StartPointY NUMERIC,
    EndPointX NUMERIC,
    EndPointY NUMERIC
);

COMMIT TRANSACTION;
