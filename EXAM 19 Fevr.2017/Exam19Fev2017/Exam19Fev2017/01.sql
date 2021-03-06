GO

CREATE DATABASE Bakery
GO

USE Bakery



CREATE TABLE Countries(
Id INT Primary Key IDENTITY,
Name NVARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE Customers(
Id INT Primary Key IDENTITY,
FirstName NVARCHAR(25) NOT NULL,
LastName NVARCHAR(25) NOT NULL,
Gender CHAR(1) CHECK(Gender IN('M', 'F')) NOT NULL,
Age INT NOT NULL,
PhoneNumber CHAR(10) NOT NULL,
CountryId INT FOREIGN KEY REFERENCES Countries(Id) NOT NULL,
)

CREATE TABLE Products(
Id INT Primary Key IDENTITY,
Name NVARCHAR(25) UNIQUE NOT NULL,
Description NVARCHAR(250) NOT NULL,
Recipe NVARCHAR(max) NOT NULL,
Price MONEY CHECK(Price >= 0) NOT NULL
)


CREATE TABLE Feedbacks(
Id INT Primary Key IDENTITY,
Description NVARCHAR(255),
Rate DECIMAL(4, 2) NOT NULL,
ProductId INT FOREIGN KEY REFERENCES Products(Id) NOT NULL,
CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
)

CREATE TABLE Distributors(
Id INT Primary Key IDENTITY,
Name NVARCHAR(25) UNIQUE NOT NULL,
AddressText NVARCHAR(30) NOT NULL,
Summary NVARCHAR(200) NOT NULL,
CountryId INT FOREIGN KEY REFERENCES Countries(Id) NOT NULL
)


CREATE TABLE Ingredients(
Id INT Primary Key IDENTITY,
Name NVARCHAR(30) NOT NULL,
Description NVARCHAR(200) NOT NULL,
OriginCountryId INT FOREIGN KEY REFERENCES Countries(Id) NOT NULL,
DistributorId INT FOREIGN KEY REFERENCES Distributors(Id) NOT NULL,
)

CREATE TABLE ProductsIngredients(
ProductId INT FOREIGN KEY REFERENCES Products(Id) NOT NULL,
IngredientId INT FOREIGN KEY REFERENCES Ingredients(Id) NOT NULL,
CONSTRAINT  pk_ProductsIngredients
PRIMARY KEY(ProductId, IngredientId)
)
