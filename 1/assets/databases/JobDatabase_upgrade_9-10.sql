BEGIN TRANSACTION;

CREATE TABLE temp_ReferenceLinePoints_534011718
(
    LineId NUMERIC,
    Longitude double,
    Latitude double,
    PointType double,
    Id INTEGER PRIMARY KEY,
    LastModification INTEGER
);


INSERT INTO temp_ReferenceLinePoints_534011718 (Longitude,Latitude,PointType,Id,LastModification,LineId) SELECT Longitude,Latitude,PointType,Id,LastModification,NULL AS LineId FROM ReferenceLinePoints;

DROP TABLE IF EXISTS CouldSync;

DROP TABLE IF EXISTS DBInfo;

CREATE TABLE DBInfo
(
    Time NUMERIC DEFAULT 0,
    Id INTEGER DEFAULT 0,
    PRIMARY KEY (Id)
);

DROP TABLE ReferenceLinePoints;
ALTER TABLE temp_ReferenceLinePoints_534011718 RENAME TO ReferenceLinePoints;

CREATE TABLE ReferenceLines
(
    LastModification NUMERIC,
    LineId INTEGER PRIMARY KEY,
    JobId NUMERIC
);

COMMIT TRANSACTION;
