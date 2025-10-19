

DROP TABLE Order_info cascade constraints;
DROP TABLE Customer_Info cascade constraints;
DROP TABLE Order_Items cascade constraints;
DROP TABLE Menu cascade constraints;
DROP TABLE Management cascade constraints;
DROP TABLE Restaurants cascade constraints;


Create table Customer_Info(
	CustomerID varchar(20)NOT NULL,
	Fname varchar(20),
	Lname varchar(20),
	Phone varchar(20),
	Town varchar(20),
    RestaurantID varchar(20),
	PRIMARY KEY(CustomerID)
    
);

Create table Order_info(
	OrderID varchar(20)NOT NULL,
	CustomerID varchar(20),
	Dat Date,
	PRIMARY KEY (OrderID)
	
);
Create table Management(
 	ManagementID varchar(20)NOT NULL,
 	Name varchar(20),
 	Designation varchar(20),
 	PRIMARY KEY (ManagementID)
 );

Create table Menu(
	ItemID varchar(20)NOT NULL,
	Name varchar(20),
	Description varchar(30),
	Price number(20),
	RestaurantID varchar(20),
	PRIMARY KEY (ItemID)
	
);
Create table Order_Items(
 	OrderItemsID varchar(20) NOT NULL,
 	ItemID varchar(20) ,
   OrderID varchar(20),
 	Quantity number(20),
 	PRIMARY KEY ( OrderItemsID )
 	
     	
 );


Create table Restaurants(
 	RestaurantID varchar(20) NOT NULL,
 	Town varchar(20),
    ManagementID varchar(20),
    ItemID varchar(20),
    PRIMARY KEY ( RestaurantID )
 	
    
    
 );
 
alter table Customer_Info add FOREIGN KEY (RestaurantID) References Restaurants (RestaurantID);
alter table Order_info add FOREIGN KEY (Email) References Customer_Info (CustomerID);
alter table Menu add FOREIGN KEY (UserID) References Restaurants(RestaurantID);
alter table Order_Items add FOREIGN KEY(ItemID) References Menu(ItemID);
alter table Order_Items add FOREIGN KEY(OrderID) References Order_info(OrderID);
alter table Restaurants add FOREIGN KEY(ManagementID) References Management(ManagementID);
alter table Restaurants add FOREIGN KEY(ItemID) References Menu(ItemID);

DESCRIBE Customer_Info;
DESCRIBE Order_info;
DESCRIBE Management;
DESCRIBE Menu;
DESCRIBE Order_Items;
DESCRIBE Restaurants;

Commit;


INSERT INTO Customer_Info VALUES ('1','Adam','Karim','01521453995','LosAngeles','1');
INSERT INTO Customer_Info VALUES ('2','Paul','Hamim','01767564223','New York','Rangpur','2');
INSERT INTO Customer_Info VALUES ('3','Shariful','Ollie','01831925544','SanAndreas','3');
INSERT INTO Customer_Info VALUES ('4','Victor','Billah','01674304054','California','4');
INSERT INTO Customer_Info VALUES ('5','Zoey','Alam','01832467598','Florida','5');


SELECT * FROM Customer_Info;


INSERT INTO Order_info VALUES ('1','1','4-APR-2020');
INSERT INTO Order_info VALUES ('2','2','7-APR-2020');
INSERT INTO Order_info VALUES ('3','3','8-APR-2020');
INSERT INTO Order_info VALUES ('4','4','6-APR-2020');
INSERT INTO Order_info VALUES ('5','5','7-APR-2020');



SELECT * FROM Order_info;


INSERT INTO Management VALUES ('1','Mathias Rana','Employee');
INSERT INTO Management VALUES ('2','Alex Banter','Cook');
INSERT INTO Management VALUES ('3','Harry Iris','Manager');
INSERT INTO Management VALUES ('4','Tammil Hoarder','Employee');
INSERT INTO Management VALUES ('5','Mathila Kundu','Cook');


SELECT * FROM Management;

INSERT INTO Menu VALUES ('1','Kebab','Fastfood',10,'1');
INSERT INTO Menu VALUES ('2','Steak','Main Course',20,'2');
INSERT INTO Menu VALUES ('3','Chicken Wings','Fastfood',5,'3');
INSERT INTO Menu VALUES ('4','Pizza','Fastfood',15,'4');
INSERT INTO Menu VALUES ('5','Burger','Fastfood',10,'5');

SELECT * FROM Menu;

INSERT INTO Order_Items VALUES ('1','1','1',1);
INSERT INTO Order_Items VALUES ('2','2','1',2);
INSERT INTO Order_Items VALUES ('3','3','2',3);
INSERT INTO Order_Items VALUES ('4','4','2',1);
INSERT INTO Order_Items VALUES ('5','5','3',2);
INSERT INTO Order_Items VALUES ('6','1','3',3);
INSERT INTO Order_Items VALUES ('7','2','4',1);
INSERT INTO Order_Items VALUES ('8','3','4',2);
INSERT INTO Order_Items VALUES ('9','4','5',3);
INSERT INTO Order_Items VALUES ('10','5','5',1);

SELECT * FROM Order_Items;

INSERT INTO Restaurants VALUES ('1','LosAngeles','1','1');
INSERT INTO Restaurants VALUES ('2','New York','2','2');
INSERT INTO Restaurants VALUES ('3','SanAndreas','3','3');
INSERT INTO Restaurants VALUES ('4','California','4','4');
INSERT INTO Restaurants VALUES ('5','Florida','5','5');

SELECT * FROM Restaurants;



DECLARE 
   TYPE c2 IS TABLE OF VARCHAR2(10); 
   TYPE orders IS TABLE OF VARCHAR2(10);  
   c c2; 
   o orders; 
   total integer; 
BEGIN 
   c := c2('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz'); 
   o:= orders('Steak', 'Pizza', 'Steak','Pizza', 'Burger'); 
   total := c.count; 
   dbms_output.put_line('All '|| total || ' Orders'); 
   FOR i IN 1 .. total LOOP 
      dbms_output.put_line('Customer:'||c(i)||', Order:' || o(i)); 
   end loop; 
END; 
/ 




ALTER TABLE Order_Items
ADD TotalPrice integer;

CREATE or REPLACE TRIGGER TR_1 
BEFORE UPDATE OR INSERT ON Order_Items
FOR EACH ROW 
BEGIN
IF :NEW.ItemID = '1' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 60) ;
ELSIF :NEW.ItemID = '2' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 125) ;
ELSIF :NEW.ItemID = '3' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 125) ;
ELSIF :NEW.ItemID = '4' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 150) ;
ELSIF :NEW.ItemID = '5' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 70) ;
ELSIF :NEW.ItemID = '6' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 50) ;
 ELSIF :NEW.ItemID = '7' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 250) ;
END IF;
END TR_1;
/

INSERT INTO Order_Items VALUES ('11','3','4','5',NULL);
INSERT INTO Order_Items VALUES ('12','3','2','3',NULL);
INSERT INTO Order_Items VALUES ('13','2','1','4',NULL);
INSERT INTO Order_Items VALUES ('14','2','1','4',NULL);

SELECT * FROM Order_Items;


CREATE or REPLACE TRIGGER TR_2 
AFTER Delete ON Order_Items 
BEGIN
dbms_output.put_line('Ati sters o comanda!'); 
END TR_2;
/
DELETE FROM Order_Items  WHERE OrderItemsID='2';


CREATE or REPLACE TRIGGER TR_3
AFTER Create ON Schema
BEGIN
dbms_output.put_line('Ati creat un tabel nou!'); 
END TR_3;
/

Create table Brand(
	BrandID varchar(20)NOT NULL,
	Name varchar(20),
	PRIMARY KEY(BrandID)
    
);




DECLARE
     CURSOR item_cur IS
     
     SELECT Name,Description,Price
     FROM Menu;
     
  item_details item_cur%ROWTYPE;

BEGIN
OPEN item_cur;
      LOOP
        FETCH item_cur INTO item_details;
        
      DBMS_OUTPUT.PUT_LINE ('Name : ' || item_details.Name || '  Description :' || item_details.Description || ' Price :' || item_details.Price );
      EXIT WHEN item_cur%ROWCOUNT =5;
      END LOOP;
      CLOSE item_cur;   
END;
/


CREATE OR REPLACE PROCEDURE proc
is
p_nr number(4);
p_id Order_info.OrderID%TYPE;
p_id2 customer_info.CustomerID%TYPE;
p_id3 restaurants.RestaurantID%TYPE;

CURSOR c(x number) IS
SELECT r.RestaurantID,cus.CustomerID,oif.OrderID , COUNT(m.ItemID)
FROM  Order_info oif,Order_Items oit,Menu m,customer_info cus,restaurants r
where r.RestaurantID=cus.RestaurantID
and cus.CustomerID=oif.CustomerID
and oif.OrderID=oit.OrderID
and oit.ItemID=m.ItemID
and oit.ItemID=x
group by  r.RestaurantID, cus.CustomerID,oif.OrderID
;


BEGIN
OPEN c(1);
--OPEN c;
LOOP
FETCH c INTO p_id3,p_id2,p_id,p_nr;
EXIT WHEN c%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Restaurantul numarul '|| p_id3||' are clientul numarul '|| p_id2||' cu comanda numarul '|| p_id||
' ce are '|| p_nr||' tipuri de mancare ');
END LOOP;
CLOSE c;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE (' tabelul este gol ' ||SQLCODE || ' - ' ||
SQLERRM);
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE (' prea multe randuri ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE (' numarul este invalid ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN CURSOR_ALREADY_OPEN THEN
DBMS_OUTPUT.PUT_LINE (' cursorul este deja deschis ' ||SQLCODE || '
- ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('eroare!'||SQLCODE || ' - ' || SQLERRM);


END proc;
/
begin
proc;
end;
/




CREATE OR REPLACE FUNCTION func
RETURN number is nr integer;
BEGIN
SELECT Count(COUNT(m.ItemID)) into nr
FROM  Order_info oif,Order_Items oit,Menu m
where oif.OrderID=oit.OrderID
and oit.ItemID=m.ItemID
group by  oif.OrderID
;
RETURN nr;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE (' tabelul este gol ' ||SQLCODE || ' - ' ||
SQLERRM);
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE (' prea multe randuri ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE (' numarul este invalid ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('eroare!'||SQLCODE || ' - ' || SQLERRM);



END func;
/
BEGIN
DBMS_OUTPUT.PUT_LINE('Numarul de comenzi este '|| func);
END;
/


CREATE OR REPLACE PACKAGE p AS
FUNCTION func
RETURN number ;
PROCEDURE proc;

END p;
/
CREATE OR REPLACE PACKAGE BODY p AS
 FUNCTION func
RETURN number is nr integer;
BEGIN
SELECT Count(COUNT(m.ItemID)) into nr
FROM  Order_info oif,Order_Items oit,Menu m
where oif.OrderID=oit.OrderID
and oit.ItemID=m.ItemID
group by  oif.OrderID
;
RETURN nr;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE (' no data found: ' ||SQLCODE || ' - ' ||
SQLERRM);
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE (' too many rows: ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE (' invalid number: ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN CURSOR_ALREADY_OPEN THEN
DBMS_OUTPUT.PUT_LINE (' cursor already open: ' ||SQLCODE || '
- ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE (SQLCODE || ' - ' || SQLERRM);


END func;


PROCEDURE proc
is
p_nr number(4);
p_id Order_info.OrderID%TYPE;
p_id2 customer_info.CustomerID%TYPE;
p_id3 restaurants.RestaurantID%TYPE;

CURSOR c IS
SELECT r.RestaurantID,cus.CustomerID,oif.OrderID , COUNT(m.ItemID)
FROM  Order_info oif,Order_Items oit,Menu m,customer_info cus,restaurants r
where r.RestaurantID=cus.RestaurantID
and cus.CustomerID=oif.CustomerID
and oif.OrderID=oit.OrderID
and oit.ItemID=m.ItemID
group by  r.RestaurantID, cus.CustomerID,oif.OrderID
;


BEGIN
OPEN c;
LOOP
FETCH c INTO p_id3,p_id2,p_id,p_nr;
EXIT WHEN c%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Restaurantul numarul '|| p_id3||' are clientul numarul '|| p_id2||' cu comanda numarul '|| p_id||
' ce are '|| p_nr||' tipuri de mancare ');
END LOOP;
CLOSE c;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE (' no data found: ' ||SQLCODE || ' - ' ||
SQLERRM);
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE (' too many rows: ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE (' invalid number: ' ||SQLCODE || ' - '
|| SQLERRM);
WHEN CURSOR_ALREADY_OPEN THEN
DBMS_OUTPUT.PUT_LINE (' cursor already open: ' ||SQLCODE || '
- ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE (SQLCODE || ' - ' || SQLERRM);


END proc;

END p;
/





