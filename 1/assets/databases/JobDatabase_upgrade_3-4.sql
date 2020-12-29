
BEGIN TRANSACTION;


CREATE TABLE Boundary
(
    Id INTEGER,
    Address TEXT,
    Area INTEGER,
    Path double,
    ImagePath TEXT,
    PRIMARY KEY (Id)
);

CREATE TABLE BoundaryLocations
(
    BoundaryTableId INTEGER,
    Longitude INTEGER,
    Latitude double,
    PRIMARY KEY (BoundaryTableId)
);


CREATE TABLE temp_Jobs_1655911537
(
    Id INTEGER,
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
    PRIMARY KEY (Id)
);


INSERT INTO temp_Jobs_1655911537 (IsDeleted,CenterOffset,Id,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute) SELECT IsDeleted,CenterOffset,Id,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,Overlap,VehicleWidth,NULL AS AvarageSpeed,NULL AS Path,NULL AS CultivatedArea,NULL AS DurationHour,NULL AS DurationMinute FROM Jobs;


DROP TABLE Jobs;
ALTER TABLE temp_Jobs_1655911537 RENAME TO Jobs;

COMMIT TRANSACTION;
