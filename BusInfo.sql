go
use master
go
CREATE DATABASE [BusInfo]
go
use [BusInfo]
go
CHECKPOINT

create table BusInfo
 (
  BusID int primary key identity(1,1),
  BoardingPoint varchar(3),
  TravelDate datetime,
  Amount float,
  Rating int
  ) 
select * from BusInfo

--stored procedure for inserting table records
CREATE PROCEDURE [dbo].[BusInformation]
(
														 @BoardingPoint VARCHAR(3),
														 @TravelDate DATETIME,
														 @Amount FLOAT,
														 @Rating INT
)
AS
	BEGIN

		INSERT INTO BusInfo
		(
		BoardingPoint,
		TravelDate,
		Amount,
		Rating
		)
		VALUES
		(
		@BoardingPoint,
		@TravelDate,
		@Amount,
		@Rating
		)
	END

	--INSERTING RECORDS
	EXEC BusInformation @BoardingPoint='BGL',@TravelDate='2017-06-18',@Amount=400.65,@Rating=2;
	EXEC BusInformation @BoardingPoint='HYD',@TravelDate='2017-10-05',@Amount=600.00,@Rating=3;
	EXEC BusInformation @BoardingPoint='CHN',@TravelDate='2016-07-25',@Amount=445.95,@Rating=3;
	EXEC BusInformation @BoardingPoint='PUN',@TravelDate='2017-12-10',@Amount=543.00,@Rating=4;
	EXEC BusInformation @BoardingPoint='MUM',@TravelDate='2017-01-28',@Amount=500.50,@Rating=4;
	EXEC BusInformation @BoardingPoint='PUN',@TravelDate='2016-03-26',@Amount=333.55,@Rating=3;
	EXEC BusInformation @BoardingPoint='MUM',@TravelDate='2016-11-06',@Amount=510.00,@Rating=4;



	select * from BusInfo
---------Queries-------------

select BoardingPoint,TravelDate from BusInfo where Amount>450


 CREATE VIEW Bus_View AS
 SELECT BusID,BoardingPoint
 FROM BusInfo
  WHERE rating >3;

  select * from Bus_View

select BusID,BoardingPoint from BusInfo where TravelDate='2017-12-10'