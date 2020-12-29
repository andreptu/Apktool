
BEGIN TRANSACTION;


CREATE TABLE temp_Boundary_1752227528
(
    Id INTEGER UNIQUE,
    Address TEXT,
    Area INTEGER,
    Path double,
    Comment TEXT,
    PRIMARY KEY (Id)
);


INSERT INTO temp_Boundary_1752227528 (Id,Address,Area,Path,Comment) SELECT Id,Address,Area,Path,NULL AS Comment FROM Boundary;

DROP TABLE Boundary;
ALTER TABLE temp_Boundary_1752227528 RENAME TO Boundary;


CREATE TABLE temp_BoundaryLocations_726643700
(
    BoundaryTableId INTEGER,
    Longitude double,
    Latitude double,
    PRIMARY KEY (BoundaryTableId)
);

INSERT INTO temp_BoundaryLocations_726643700 (BoundaryTableId,Longitude,Latitude) SELECT BoundaryTableId,Longitude,Latitude FROM BoundaryLocations;

DROP TABLE BoundaryLocations;
ALTER TABLE temp_BoundaryLocations_726643700 RENAME TO BoundaryLocations;


ALTER TABLE Locations RENAME TO JobLocations;


CREATE TABLE temp_Jobs_1848543519
(
    Id INTEGER UNIQUE,
    IsDeleted NUMERIC,
    Address TEXT,
    OrderedBy TEXT,
    Type TEXT,
    Description TEXT,
    Worker TEXT,
    Date TEXT,
    InitialLongitude double,
    InitialLatitude double,
    CenterOffset double,
    Overlap double,
    VehicleWidth double,
    AvarageSpeed double,
    Path double,
    CultivatedArea double,
    DurationHour INTEGER,
    DurationMinute INTEGER,
    BoundaryId integer,
    PRIMARY KEY (Id)
);


INSERT INTO temp_Jobs_1848543519 (Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute,BoundaryId) SELECT Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute,NULL AS BoundaryId FROM Jobs;

DROP TABLE Jobs;
ALTER TABLE temp_Jobs_1848543519 RENAME TO Jobs;

DROP TABLE PerimeterLocations;

COMMIT TRANSACTION;
