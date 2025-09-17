use OLA;
select*from olabookings;

#1. Retrieve all successful bookings:
 CREATE VIEW Successful_bookings AS
 SELECT * FROM olabookings WHERE Booking_Status = 'Success';
 
 SELECT * FROM Successful_bookings;
 
#2. Find the average ride distance for each vehicle type:
 CREATE VIEW Avg_vehicle_ride_distance AS
 SELECT Vehicle_Type , AVG(Ride_Distance) AS Avg_distance FROM 
 olabookings GROUP BY Vehicle_Type;
 
 SELECT * FROM Avg_vehicle_ride_distance;
 
#3. Get the total number of cancelled rides by customers:
 CREATE VIEW Num_of_cancelled_rides AS
 SELECT COUNT(*) FROM olabookings WHERE Booking_Status = 'Canceled by Customer';
 
 SELECT * FROM Num_of_cancelled_rides;
 
#4. List the top 5 customers who booked the highest number of rides:
 CREATE VIEW Top5_Customers AS
 SELECT Customer_ID, COUNT(Booking_ID) AS NumOfRides
 FROM olabookings 
 GROUP BY Customer_ID
 ORDER BY NumOfRides DESC LIMIT 5;
 
 SELECT * FROM Top5_Customers;
 
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 CREATE VIEW NumOf_cancelled_rides_by_driver AS
 SELECT COUNT(*)  FROM olabookings
 WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
 
 SELECT * FROM  NumOf_cancelled_rides_by_driver;
 
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 CREATE VIEW Max_and_min_ratings AS
 SELECT MAX(Driver_Ratings) AS Max_ratings,
 MIN(Driver_Ratings) AS Min_ratings FROM olabookings WHERE Vehicle_Type = 'Prime Sedan';
 
 SELECT * FROM Max_and_min_ratings;
 
#7. Retrieve all rides where payment was made using UPI:
 CREATE VIEW UPI_Payments AS
 SELECT * FROM olabookings WHERE Payment_Method = 'UPI';
 
 SELECT * FROM UPI_Payments;
 
#8. Find the average customer rating per vehicle type:
 CREATE VIEW Avg_customer_rating_per_vehicle AS
 SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_rating
 FROM olabookings
 GROUP BY Vehicle_Type;
 
 SELECT * FROM Avg_customer_rating_per_vehicle;
 
#9. Calculate the total booking value of rides completed successfully:
 CREATE VIEW Total_successful_booking_value AS
 SELECT SUM(Booking_Value) AS Total_successful_bookings 
 FROM olabookings
 WHERE Booking_Status = 'Success';
 
 SELECT * FROM Total_successful_booking_value;
 
#10. List all incomplete rides along with the reason:
 CREATE VIEW Incomplete_rides_with_reasons AS
 SELECT Booking_ID, Incomplete_Rides_Reason 
 FROM olabookings WHERE Incomplete_Rides = 'Yes';
 
 SELECT * FROM Incomplete_rides_with_reasons;