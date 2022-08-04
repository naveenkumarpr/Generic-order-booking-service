**Generic-order-booking-service**
   This application will provide sevice to book an order for any kind of services, e.g. Groceries, BusTicket, MovieTicket, etc.
   
**APIs:**
1. Order Placement API: Given a valid payload, will be processing this to create purchase record along with other helper records(address, purchase_items, billing & shipping address and payment methods)

2. Order Status Update: It would be required to update an order's status.
3. Order Listing API: List API of purchase records with pagination (default page size should be 10 and maximum 50). This should also support filtering options by following fields:
start_date, end_date -> to filter out purchase records bases on its creation date.
status -> filter based on its status.
 
**Tools and Tech Stack:**
Ruby, Rails and MySQL.
PostMan to test and organize APIs.
GitHub for version control.
