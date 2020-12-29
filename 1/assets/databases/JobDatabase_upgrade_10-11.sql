BEGIN TRANSACTION;

CREATE TABLE MachineConfig
(
    Uuid TEXT,
    SymbolId NUMERIC DEFAULT 0,
    Arrangement NUMERIC DEFAULT 0,
    TrailedWheelDistance NUMERIC DEFAULT 0,
    TrailedShaftAndImplementDistance NUMERIC DEFAULT 0,
    WristAndTrailedShaftDistance NUMERIC DEFAULT 0,
    RearShaftAndWristDistance NUMERIC DEFAULT 0,
    RearShaftAndImplementDistance NUMERIC DEFAULT 0,
    FrontAndRearShaftDistance NUMERIC DEFAULT 0,
    RearWheelDistance NUMERIC DEFAULT 0,
    FrontWheelDistance NUMERIC DEFAULT 0,
    AntennaHeight NUMERIC DEFAULT 0,
    TabletHeight NUMERIC DEFAULT 0,
    AntennaDistanceFromFrontShaft NUMERIC DEFAULT 0,
    IsAutoSectionSwitchEnabled NUMERIC DEFAULT 0,
    IsSectionControlEnabled NUMERIC DEFAULT 0,
    SectionsWidth TEXT DEFAULT 0,
    SectionControlNumber NUMERIC DEFAULT 0,
    Model3DType NUMERIC DEFAULT 0,
    AllowedOverlap NUMERIC DEFAULT 0,
    CenterOffset NUMERIC DEFAULT 0,
    MachineConfigLastModification NUMERIC DEFAULT 0,
    MachineConfigCreationDate NUMERIC DEFAULT 0,
    MachineConfigName TEXT,
    Id INTEGER PRIMARY KEY
);

COMMIT TRANSACTION;
