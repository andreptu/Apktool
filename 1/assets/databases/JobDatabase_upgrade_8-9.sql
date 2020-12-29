BEGIN TRANSACTION;

CREATE TABLE temp_BoundaryLocations_534011718
(
    BoundaryTableId INTEGER,
    Longitude double,
    Latitude double,
    Id integer UNIQUE,
    LastModification INTEGER,
    PRIMARY KEY (Id)
);


INSERT INTO temp_BoundaryLocations_534011718 (BoundaryTableId,Longitude,Latitude,Id,LastModification) SELECT BoundaryTableId,Longitude,Latitude,Id,NULL AS LastModification FROM BoundaryLocations;


DROP TABLE IF EXISTS BoundaryLocations;
ALTER TABLE temp_BoundaryLocations_534011718 RENAME TO BoundaryLocations;

DROP TABLE IF EXISTS CouldSync;

DROP TABLE IF EXISTS DBInfo;

CREATE TABLE DBInfo
(
    Time NUMERIC DEFAULT 0,
    Id INTEGER DEFAULT 0,
    PRIMARY KEY (Id)
);


CREATE TABLE temp_JobLocations_1655911537
(
    TimeStamp NUMERIC,
    IsLineOn NUMERIC,
    Longitude double,
    Id INTEGER,
    JobId NUMERIC,
    Latitude double,
    LastModification INTEGER,
    PRIMARY KEY (Id)
);


INSERT INTO temp_JobLocations_1655911537 (TimeStamp,IsLineOn,Longitude,Id,JobId,Latitude,LastModification) SELECT TimeStamp,IsLineOn,Longitude,Id,JobId,Latitude,NULL AS LastModification FROM JobLocations;


DROP TABLE IF EXISTS JobLocations;
ALTER TABLE temp_JobLocations_1655911537 RENAME TO JobLocations;


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
    LastModification INTEGER,
    Uuid Text,
    PRIMARY KEY (Id)
);


INSERT INTO temp_Jobs_630327709 (Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute,BoundaryUuid,LastModification,Uuid) SELECT Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,DurationHour,DurationMinute,BoundaryUuid,LastModification,Uuid FROM Jobs;

DROP TABLE IF EXISTS Jobs;
ALTER TABLE temp_Jobs_630327709 RENAME TO Jobs;

DROP TABLE IF EXISTS NavigationCrossPoints;

DROP TABLE IF EXISTS NavigationLines;

DROP TABLE IF EXISTS NavigationMode;

DROP TABLE IF EXISTS NavigationPoints;

DROP TABLE IF EXISTS NavigationState;

DROP TABLE IF EXISTS ReferenceLinePoints;

CREATE TABLE ReferenceLinePoints
(
    JobId INTEGER,
    Longitude double,
    Latitude double,
    PointType double,
    Id INTEGER NOT NULL,
    LastModification INTEGER,
    PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS ReferenceLines;

DROP TABLE IF EXISTS StartEndPoints;

COMMIT TRANSACTION;
