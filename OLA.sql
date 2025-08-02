CREATE DATABASE ola ;

use ola ;

CREATE TABLE bookings (
    date DATETIME,
    time TIME,
    booking_id VARCHAR(30),
    booking_status VARCHAR(50),
    customer_id VARCHAR(30),
    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    v_tat INT,
    c_tat INT,
    canceled_rides_by_customer INT,
    canceled_rides_by_driver INT,
    incomplete_rides INT,
    incomplete_rides_reason VARCHAR(100),
    booking_value DECIMAL(10,2),
    payment_method VARCHAR(50),
    ride_distance DECIMAL(5,2),
    driver_ratings DECIMAL(3,2),
    customer_rating DECIMAL(3,2)
);

#1. Retrieve all successful bookings:
CREATE view  Sucessful_bookings as
SELECT * 
FROM bookings
where Booking_status="SUCCESS";

#1. Retrieve all successful bookings(for easy showing not write whole query in future):
select * from Sucessful_bookings;



#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT vehicle_type,avg(ride_distance)
as avg_distance from bookings
group by vehicle_type;

#2. Find the average ride distance for each vehicle type(for easy showing not write whole query in future):
select * from ride_distance_for_each_vehicle ;



#3. Get the total number of cancelled rides by customers:
CREATE VIEW total_number_of_cancelled_rides_by_customer AS
SELECT count(*) FROM BOOKINGS
WHERE booking_status='canceled by customer' ;

#3. Get the total number of cancelled rides by customers(for easy showing not write whole query in future):
select * from total_number_of_cancelled_rides_by_customer ;



#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers AS
SELECT customer_id,count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;

#4. List the top 5 customers who booked the highest number of rides(for easy showing not write whole query in future):
select * FROM top_5_customers ;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*)
FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating as
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings(for easy showing not write whole query in future):
select * from Max_Min_Driver_Rating ;



#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment as
select *
FROM bookings
WHERE Payment_Method = 'UPI';

#7. Retrieve all rides where payment was made using UPI(for easy showing not write whole query in future):
select * from UPI_Payment ;



#8. Find the average customer rating per vehicle type:
create view average_rating as
select Vehicle_Type,avg(customer_rating) as average_rating
from bookings
group by Vehicle_Type ;

#8. Find the average customer rating per vehicle type(for easy showing not write whole query in future):
select * from average_rating ;



#9. Calculate the total booking value of rides completed successfully:
create view total_successful_booking_rides as
select sum(booking_value) as total_successful_booking_rides
from bookings
where Booking_status="SUCCESS" ;

#9. Calculate the total booking value of rides completed successfully(for easy showing not write whole query in future):
select * from total_successful_booking_rides;



#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes'; 

#10. List all incomplete rides along with the reason(for easy showing not write whole query in future):
select * from Incomplete_Rides_Reason;


