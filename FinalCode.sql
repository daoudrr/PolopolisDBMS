CREATE TABLE RESIDENT (
    MicrochipID CHAR(15) PRIMARY KEY,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Other')),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    SpecID CHAR(9) NOT NULL,
    NeighborhoodN VARCHAR(30) NOT NULL,
    HousingID CHAR(9) NOT NULL,
    Vet_RID CHAR(9) NOT NULL,
    Housing_MoveInDate DATE NOT NULL,
    OccupID CHAR(9)
);

CREATE TABLE SPECIES (
    SpeciesID CHAR(9) PRIMARY KEY,
    NameOfSpecies VARCHAR(50) NOT NULL,
    Classification VARCHAR(20) NOT NULL CHECK (
        Classification IN ('Mammal', 'Bird', 'Reptile', 'Fish', 'Amphibian', 'Invertebrate')
    ),
    NaturalHabitat VARCHAR(50),
    SpeciesPop INT DEFAULT 0 CHECK (SpeciesPop >= 0),
    DietType VARCHAR(20) NOT NULL CHECK (DietType IN ('Herbivore', 'Carnivore', 'Omnivore'))
);

CREATE TABLE NEIGHBORHOOD (
    NeighborhoodName VARCHAR(30) PRIMARY KEY,
    Area DECIMAL(5, 2) NOT NULL,
    ClimateType VARCHAR(30) NOT NULL CHECK (
        ClimateType IN ('Humid', 'Dry', 'Cold', 'Temperate', 'Tropical')
    ),
    Population INT DEFAULT 0 CHECK (Population >= 0)
);

CREATE TABLE HOUSE (
    HouseID CHAR(9) PRIMARY KEY,
    HouseType VARCHAR(50) NOT NULL,
    Capacity INT DEFAULT 1 CHECK (Capacity > 0),
    StreetName VARCHAR(50),
    NH_Name VARCHAR(30) NOT NULL,
    FOREIGN KEY (NH_Name) REFERENCES NEIGHBORHOOD(NeighborhoodName)
);

CREATE TABLE OCCUPATION (
    OccupationID CHAR(9) PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) DEFAULT 0 CHECK (Salary >= 0),
    Sector VARCHAR(30) CHECK (Sector IN ('Public', 'Private', 'Non-Profit')),
    CompanyID CHAR(9)
);

CREATE TABLE VETERINARY_RECORD (
    VetRecordID CHAR(9) PRIMARY KEY,
    VaccinationStatus VARCHAR(20) NOT NULL CHECK (VaccinationStatus IN ('Vaccinated', 'Not Vaccinated', 'Awaiting Vaccination')),
    LastCheckUpDate DATE NOT NULL
);

CREATE TABLE BUSINESS (
    BusinessID CHAR(9) NOT NULL UNIQUE,
    LicenseNumber CHAR(9) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(30),
    WorkingHours CHAR(19) NOT NULL,
    OwnerID CHAR(15),
    PRIMARY KEY (BusinessID, LicenseNumber),
    FOREIGN KEY (OwnerID) REFERENCES RESIDENT(MicrochipID)
);

CREATE TABLE COMMUNITY_ACTIVITY (
    ActivityID CHAR(9) PRIMARY KEY,
    ActivityType VARCHAR(50),
    ActivityName VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    OperatingHours CHAR(19),
    Fee DECIMAL(5, 2) DEFAULT 0 CHECK (Fee >= 0),
    Location VARCHAR(30) NOT NULL,
    FOREIGN KEY (Location) REFERENCES NEIGHBORHOOD(NeighborhoodName)
);

CREATE TABLE MUNICIPALITY_OFFICIAL (
    OfficialID CHAR(9) PRIMARY KEY,
    MicroCID CHAR(15) NOT NULL,
    Department VARCHAR(50),
    Position VARCHAR(50),
    TermStart DATE NOT NULL,
    TermEnd DATE,
    FOREIGN KEY (MicroCID) REFERENCES RESIDENT(MicrochipID)
);
-- Remaining tables without direct foreign key constraints

CREATE TABLE PUBLIC_SERVICE (
    FacilityID CHAR(9) PRIMARY KEY,
    ServiceType VARCHAR(50) NOT NULL,
    OperatingHours CHAR(19) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    LocID VARCHAR(30) NOT NULL,
    FOREIGN KEY (LocID) REFERENCES NEIGHBORHOOD(NeighborhoodName)
);

CREATE TABLE ANIMAL_CONTROL_INCIDENT (
    MicrochipID CHAR(15) NOT NULL,
    IncidentID CHAR(9) NOT NULL,
    IncidentDate DATE NOT NULL,
    IncidentDescription VARCHAR(255) NOT NULL CHECK (LENGTH(IncidentDescription) > 0),
    ActionsTaken VARCHAR(255),
    PRIMARY KEY (MicrochipID, IncidentID),
    FOREIGN KEY (MicrochipID) REFERENCES RESIDENT(MicrochipID)
);

CREATE TABLE IS_CONNECTED_TO (
    MicrochipID CHAR(15) NOT NULL,
    IncidentID CHAR(9) NOT NULL,
    PRIMARY KEY (MicrochipID, IncidentID),
    FOREIGN KEY (MicrochipID) REFERENCES RESIDENT(MicrochipID),
    FOREIGN KEY (MicrochipID, IncidentID) REFERENCES ANIMAL_CONTROL_INCIDENT(MicrochipID, IncidentID)
);

CREATE TABLE SPECIES_ALLERGY (
    SpeciesID CHAR(9) NOT NULL,
    Allergy VARCHAR(100) NOT NULL,
    PRIMARY KEY (SpeciesID, Allergy),
    FOREIGN KEY (SpeciesID) REFERENCES SPECIES(SpeciesID)
);

CREATE TABLE OCCUPATION_REQUIRED_SKILL (
    OccupationID CHAR(9) NOT NULL,
    RequiredSkill VARCHAR(100) NOT NULL,
    PRIMARY KEY (OccupationID, RequiredSkill),
    FOREIGN KEY (OccupationID) REFERENCES OCCUPATION(OccupationID)
);

CREATE TABLE VET_RECORD_CHRONIC_CONDITION (
    VetRecordID CHAR(9) NOT NULL,
    ChronicCondition VARCHAR(100) NOT NULL,
    PRIMARY KEY (VetRecordID, ChronicCondition),
    FOREIGN KEY (VetRecordID) REFERENCES VETERINARY_RECORD(VetRecordID)
);

CREATE TABLE BUSINESS_ADDRESS (
    BusinessID CHAR(9) NOT NULL,
    LicenseNumber CHAR(9) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PRIMARY KEY (BusinessID, LicenseNumber, Address),
    FOREIGN KEY (BusinessID, LicenseNumber) REFERENCES BUSINESS(BusinessID, LicenseNumber)
);

-- Add foreign keys using ALTER TABLE with revised syntax
ALTER TABLE RESIDENT ADD FOREIGN KEY (SpecID) REFERENCES SPECIES(SpeciesID);
ALTER TABLE RESIDENT ADD FOREIGN KEY (NeighborhoodN) REFERENCES NEIGHBORHOOD(NeighborhoodName);
ALTER TABLE RESIDENT ADD FOREIGN KEY (HousingID) REFERENCES HOUSE(HouseID);
ALTER TABLE RESIDENT ADD FOREIGN KEY (OccupID) REFERENCES OCCUPATION(OccupationID);
ALTER TABLE RESIDENT ADD FOREIGN KEY (Vet_RID) REFERENCES VETERINARY_RECORD(VetRecordID);
ALTER TABLE OCCUPATION ADD FOREIGN KEY (CompanyID) REFERENCES BUSINESS(BusinessID);
