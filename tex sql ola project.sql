use  oLA;
show tables    ; /*SQL Questions:
1. Retrieve all successful bookings:
2. Find the average ride distance for each vehicle type:
3. Get the total number of cancelled rides by customers:
4. List the top 5 customers who booked the highest number of rides:
5. Get the number of rides cancelled by drivers due to personal and car-related issues:
6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
7. Retrieve all rides where payment was made using UPI:
8. Find the average customer rating per vehicle type:
9. Calculate the total booking value of rides completed successfully:
10. List all incomplete rides along with the reason:*/
   select  * from booking;
   select * from booking where booking_status = 'success';
   create view  successful_bookings as  select * from booking where booking_status = 'success'; 
   select * from successful_bookings;
   drop table successful_bookings; 
DESC booking; 
 # 2. Find the average ride distance for each vehicle type:
 create view ride_distance  as 
 select vehicle_type  , avg (ride_distance )from booking  group by vehicle_type ;
 select * from ride_distance;
 #3. Get the total number of cancelled rides by customers;
select * from booking;
          SELECT COUNT(*) FROM booking WHERE booking_status LIKE '%Canceled by Customer%';
 select count(  booking_status) from booking  where booking_status=' success' ;
 create view Canceled_Drive as 
 SELECT COUNT(*) FROM booking WHERE booking_status LIKE '%Canceled by Customer%';
 select * from Canceled_Drive;
 # 4. List the top 5 customers who booked the highest number of rides:;
 create view top_5_customer as
 select   Customer_ID, count(booking_id)  as total_rides from booking      group by customer_id order by  total_rides desc 
 limit 5;
 select * from top_5_customer;
 
 #5. Get the number of rides cancelled by drivers due to personal and car-related issues
  create view  cancelled_by_drivers as 
 select count(*) from booking where  canceled_rides_by_driver = 'Personal & Car related issue';
 select * from  cancelled_by_drivers;
   
   select * from booking;

 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create view max_mai_drivers as 
 select max(Driver_Ratings) max_retings ,min(Driver_Ratings) min_ratings from booking where Vehicle_Type ='Prime Sedan';
 select * from max_mai_drivers;
 
 
 
#7. Retrieve all rides where payment was made using UPI:
create view mode_upi as
select  * from booking where Payment_Method ='UPI';
select * from mode_upi;

#8. Find the average customer rating per vehicle type: 
create view  customer_rating as
select Vehicle_Type ,avg(Customer_Rating) as customer_rating  from booking  group by vehicle_type   order by customer_rating ;   
select * from customer_rating;
#9. Calculate the total booking value of rides completed successfully:
create view rides_completed_successfully as
 select sum(booking_value)  from booking where  booking_status = 'success';
 select * from rides_completed_successfully;
 
#10. List all incomplete rides along with the reason:
create view incomplete_rides as
select booking_id,  Incomplete_Rides_Reason from booking where Incomplete_Rides = 'yes';
 select * from incomplete_rides ;


