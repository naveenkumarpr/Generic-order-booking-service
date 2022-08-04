
**APIs:**
1. Order Placement API: Given a valid payload, you would be processing this to create purchase record along with other helper records(address, purchase_items, billing & shipping address and payment methods)

2. Order Status Update: It would be required to update an order's status.
3. Order Listing API: List API of purchase records with pagination (default page size should be 10 and maximum 50). This should also support filtering options by following fields:
start_date, end_date -> to filter out purchase records bases on its creation date.
status -> filter based on its status.
 search based on 'order_number' -> Exact matching using DB query.
 
**Tools and Tech Stack:**
Use Ruby, Rails and MySQL.
Use PostMan to test and organize your APIs.
Use GitHub for version control.
