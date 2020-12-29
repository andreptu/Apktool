BEGIN TRANSACTION;

CREATE TABLE temp_Boundary_534011718
(
    Id INTEGER UNIQUE,
    Address TEXT,
    Area double,
    Path double,
    Comment TEXT,
    InitialLongitude double,
    InitialLatitude double,
    IsDeleted integer,
    LastModification integer,
    Uuid Text,
    PRIMARY KEY (Id)
);

INSERT INTO temp_Boundary_534011718 (Id,Address,Area,Path,Comment,InitialLongitude,InitialLatitude,IsDeleted,LastModification,Uuid) SELECT Id,Address,Area,Path,Comment,NULL AS InitialLongitude,NULL AS InitialLatitude,NULL AS IsDeleted,NULL AS LastModification,NULL AS Uuid FROM Boundary;

DROP TABLE Boundary;
ALTER TABLE temp_Boundary_534011718 RENAME TO Boundary;

CREATE TABLE temp_BoundaryLocations_1655911537
(
    BoundaryTableId INTEGER,
    Longitude double,
    Latitude double,
    Id integer PRIMARY KEY UNIQUE
);

INSERT INTO temp_BoundaryLocations_1655911537 (BoundaryTableId,Longitude,Latitude,Id) SELECT BoundaryTableId,Longitude,Latitude,NULL AS Id FROM BoundaryLocations;

DROP TABLE BoundaryLocations;
ALTER TABLE temp_BoundaryLocations_1655911537 RENAME TO BoundaryLocations;

CREATE TABLE CouldSync
(
    Id integer,
    LocalLastModificationTimestamp integer,
    LastSyncTimestamp integer
);

CREATE TABLE temp_Jobs_630327709
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
    BoundaryUuid text,
    LastModification integer,
    Uuid Text,
    PRIMARY KEY (Id)
);

INSERT INTO temp_Jobs_630327709 (Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute,BoundaryUuid,LastModification,Uuid) SELECT Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute,NULL AS BoundaryUuid,NULL AS LastModification,NULL AS Uuid FROM Jobs;

DROP TABLE Jobs;
ALTER TABLE temp_Jobs_630327709 RENAME TO Jobs;

COMMIT TRANSACTION;
