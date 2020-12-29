BEGIN TRANSACTION;

CREATE TABLE temp_Jobs_630327709
(
    Id INTEGER PRIMARY KEY UNIQUE,
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
    DurationInMin INTEGER DEFAULT 0,
    BoundaryUuid text,
    LastModification INTEGER,
    Uuid Text
);

INSERT INTO temp_Jobs_630327709 (Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,BoundaryUuid,LastModification,Uuid,DurationInMin) SELECT Id,IsDeleted,Address,OrderedBy,Type,Description,Worker,Date,InitialLongitude,InitialLatitude,CenterOffset,Overlap,VehicleWidth,AvarageSpeed,Path,CultivatedArea,BoundaryUuid,LastModification,Uuid,(0) AS DurationInMin FROM Jobs;


DROP TABLE Jobs;
ALTER TABLE temp_Jobs_630327709 RENAME TO Jobs;

ALTER TABLE ReferenceLines ADD COLUMN NavigationMode NUMERIC DEFAULT -1;

COMMIT TRANSACTION;
