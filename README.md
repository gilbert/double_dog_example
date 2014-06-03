# Double Dog PoS

A Point of Sales system built for Double Dog Hot Dogs.

----
## User Stories

- As a manager, I want the first account created to be my admin account
- As a manager, I want to sign in
- As a manager, I want to create items for order
- As a manager, I want to see all orders
- As a manager, I want to see all orders created by a given employee.
- As a manager, I want to create employee accounts
- As an employee, I want to sign into Double Dog PoS
- As an employee, I want to create orders
  - Each order will have at least one item

##Discussion

The first thing I note is that there are at least four active domains
here: 
* **Authentication**
	
  Any time you see "As a XXX", "sign in", etc you're dealing with this one. 

* **Authorization**

  Also implied by "As a XXX"—the role of the user matters

* **Inventory**

  Order taking systems will generally have an inventory associated with them

* **Orders**

  Customer order tracking

