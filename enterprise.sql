SELECT SCHEMA_NAME() AS defaultschema;
GO

CREATE DATABASE enterprise 
    ON (NAME = N'enterprise', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\enterprise.mdf', SIZE = 1024MB, FILEGROWTH = 256MB)
LOG ON (NAME = N'enterprise_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\enterprise_log.ldf', SIZE = 512MB, FILEGROWTH = 125MB)
GO

USE enterprise
GO

CREATE TABLE CustomersInfo
(
	CustomerID int primary key not null identity (1,1),
	FullName varchar(100),
	DateOfBirth datetime,
	JobTitle varchar(100),
	Department varchar(100),
	Gender varchar(10) check (Gender in('Male', 'Female')),
	Email varchar(100),
	Fax varchar(100),
	PhoneNumber varchar(100),
	Website text,
	Address text,
	Description text,
	TaxIdentificationNumber varchar(100),
)

CREATE TABLE CustomersCompany 
(
	CustomerID int,
	CompanyID int primary key not null identity (1,1),
	CompanyName varchar(100),
	Email varchar(100),
	Fax varchar(100),
	PhoneNumber varchar(100),
	Website text,
	Address text,
	Description text,
	TaxIdentificationNumber varchar(100),
)

CREATE TABLE PowerPlantInfo 
(
	PlantID int primary key not null identity (1,1),
	CompanyID int,
	PlantName varchar(100),
	PlantType varchar(100),
	Capacity float,
	Location varchar(100),
	VoltageLevel varchar(100), --unknown data type
	TotalINV varchar(100), --unknown data type
	TypeINV varchar(100), --unknown data type
	ManufacturerINV varchar(100),
	TotalTurbine int,
	TypeTurbine varchar(100),
	ManufacturerTurbine text,
	Email varchar(100),
	Fax varchar(100),
	PhoneNumber varchar(100),
	Address text,
	DateOfCOD datetime,
	Description text,
)

CREATE TABLE DeviceInfo 
(
	PlantID int,
	CompanyID int,
	PlantName varchar(100),
	PlantType varchar(100),
	Capacity float,
	Location varchar(100),
	VoltageLevel varchar(100), --unknown data type
	TotalINV varchar(100), --unknown data type
	TypeINV varchar(100), --unknown data type
	ManufacturerINV varchar(100),
	TotalTurbine int,
	TypeTurbine varchar(100),
	ManufacturerTurbine varchar(100),
	Email varchar(100),
	Fax varchar(100),
	PhoneNumber varchar(100),
	Address text,
	DateOfCOD datetime,
	Description text,
)

CREATE TABLE SubstationInfo 
(
	PlantID int,
	SubstationID int primary key not null identity(1,1),
	ActivePower float,
	ReActivePower float,
	PowerFactor float,
	PlantType varchar(100),
	Capacity float,
	Location varchar(100),
	VoltageLevel varchar(100),
	HightVoltage float,
	MediumVoltage float,
	TapChange varchar(100), --unknown data type
	Frequency float,
)

CREATE TABLE PPCInfo 
(
	PlantID int,
	PPCID int primary key not null identity(1,1),
	AGCStatus varchar(10) check (AGCStatus in('Good', 'Bad', 'Normal')),
	ActivePowerSetpoint float,
	ReACtivePowerStatus varchar(10) check (ReACtivePowerStatus in('Good', 'Bad', 'Normal')),
	ReActivePowerSetpoint float,
	VoltageStatus varchar(10) check (VoltageStatus in('Good', 'Bad', 'Normal')),
	VoltageSetpoint float,
)

CREATE TABLE MeterInfo 
(
	PlantID int,
	MeterID int primary key not null identity(1,1),
	MeterName varchar(100),
	DateTime datetime,
	OutputEnergy float,
	InputEnergy float,
	TotalProduction float,
)

CREATE TABLE InverterInfo 
(
	PlantID int,
	InverterID int primary key not null identity(1,1),
	INVStatus varchar(10) check (INVStatus in('Good', 'Bad', 'Normal')),
	INVName varchar(100),
	INVSN varchar(100),
	INVActivePower float,
	INVReActivePower float,
	INVPowerFactor float,
	CO2EmissionReduction float,
	DailyGridConnectionMinutes float,
	TotalDCPower float,
	TotalACPower float,
	DailyPowerYeilds float,
	MonthlyPowerYeilds float,
	TotalPowerYeilds float,
)

CREATE TABLE SolarWeatherParameters 
(
	PlantID int,
	WeatherStationID int primary key not null identity(1,1),
	WeatherStationStatus varchar(10) check (WeatherStationStatus in('Good', 'Bad', 'Normal')),
	WeatherStationName varchar(100),
	GHIRadiation float,
	POARadiationr float,
	PVTemperature float,
	AmbientTemperature float,
	Huminity float,
	WindSpeed float,
	WindDirection float,
)

CREATE TABLE WindWeatherParameters 
(
	PlantID int,
	WeatherStationID int,
	WeatherStationStatus varchar(10) check (WeatherStationStatus in('Good', 'Bad', 'Normal')),
	WeatherStationName varchar(100),
	AmbientTemperature float,
	WindSpeed float,
	WindDirection float,
)

CREATE TABLE TurbineInfo 
(
	PlantID int,
	TurbinerID int primary key not null identity(1,1),
	TurbineStatus varchar(10) check (TurbineStatus in('Good', 'Bad', 'Normal')),
	TurbineName varchar(100),
	TurbineSN varchar(100),
	TurbineAlarm varchar(100),
	TurbineActivePower float,
	TurbineReActivePower float,
	TurbinePowerFactor float,
	TurbineWindSpeed float,
	GeneratorSpeed float,
	RotorSpeed float,
	WindSpeed float,
	GridActivePower float,
	PitchAngle float,
	NacelleOrientation float,
	DailyPowerYeilds float,
	MonthlyPowerYeilds float,
	TotalPowerYeilds float,
)