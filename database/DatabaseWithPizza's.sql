PRAGMA foreign_keys=OFF;
 BEGIN TRANSACTION;
CREATE TABLE user_level(
ULKEY INTEGER,
UserLevel TEXT,
UNIQUE(UserLevel),
PRIMARY KEY (ULKey)
);
CREATE TABLE log_in(
TwitterUsername TEXT,
Password TEXT,
ULKey INTEGER,
PizzaPoints INTEGER,
FOREIGN KEY(ULKey) REFERENCES user_level(ULKey)
PRIMARY KEY(TwitterUsername)
);
INSERT INTO "log_in" VALUES('CatalinMares1','catalinmares',2,0);
INSERT INTO "log_in" VALUES('rshah','lol',2,0);
CREATE TABLE personal_details(
TwitterUsername TEXT,
Name TEXT,
Surname TEXT,
Email TEXT,
ContactNumber TEXT,
Address TEXT,
StoreLocation TEXT,
FOREIGN KEY(TwitterUsername) REFERENCES log_in(TwitterUsername)
);
INSERT INTO "personal_details" VALUES('CatalinMares1','Catalin','Mares','mares_barosan@mareleBarosan.plm','07454282020','29 Milward Gardens, Binfield','Sheffield');
INSERT INTO "personal_details" VALUES('CatalinMares1','Catalin','Mares','mares_barosan@yahoo.com','07454282020','Sheffield','29 Milward Gardens, Binfield');
INSERT INTO "personal_details" VALUES('CatalinMares1','Catalin','Mares','mares@yahoo.com','07454282020','Sheffield','29 Milward Gardens, Binfield');
INSERT INTO "personal_details" VALUES('rshah','Rushil','Shah','rushil@me.com','0759283920','Sheffield','Some place in Sheffield');
CREATE TABLE pizza_info(
PizzaID INTEGER,
PizzaName TEXT,
Ingredients TEXT,
PRIMARY KEY(PizzaID)
);
INSERT INTO "pizza_info" VALUES(1,'Milano','Ventricina Salami and Prosciutto Ham.');
INSERT INTO "pizza_info" VALUES(2,'Ardente (H)','Ventricina Salami, Jalapeños and Pepper Pearls.');
INSERT INTO "pizza_info" VALUES(3,'Sicilia','Chicken Breast Strips, Cajun Seasoning, Red Onions and Pepper Pearls.');
INSERT INTO "pizza_info" VALUES(4,'Verona','Prosciutto Ham and Chicken Breast.');
INSERT INTO "pizza_info" VALUES(5,'Roma (V)','Goats Cheese, Red Onions and Pepper Pearls.');
INSERT INTO "pizza_info" VALUES(6,'Cheese and Tomato (V)','Original Cheese and Tomato.');
INSERT INTO "pizza_info" VALUES(7,'Mighty Meat','Tomato sauce, Pepperoni, Ham, Ground Beef, Sausage, Red Onions, Mushrooms and Mozzarella Cheese.');
INSERT INTO "pizza_info" VALUES(8,'Pepperoni passion','Extra Pepperoni and Extra Mozzarella Cheese with Tomato Sauce Base.');
INSERT INTO "pizza_info" VALUES(9,'Texas BBQ','Tangy BBQ Sauce Topped with Smoky Bacon, Succulent Roast Chicken, Red Onions, Green and Red Peppers.');
INSERT INTO "pizza_info" VALUES(10,'Vegi Supreme (V)','Red Onions, Green and Red Peppers, Sweetcorn, Mushrooms and Tomatoes.');
INSERT INTO "pizza_info" VALUES(11,'Tandoori Hot (H)','Tandoori Chicken, Red Onions, Mushrooms, Green, Red and Jalapeño Peppers.');
INSERT INTO "pizza_info" VALUES(12,'Chicken feast','Chicken, Mushrooms and Sweetcorn.');
INSERT INTO "pizza_info" VALUES(13,'Hot And Spicy (H)','Red onions, Ground Beef, Green, Red and Jalapeño peppers.');
INSERT INTO "pizza_info" VALUES(14,'Vegi Volcano','Red Onions, Green and Red peppers, Tomatoes, Jalapeño Peppers and Extra Mozzarella Cheese.');
INSERT INTO "pizza_info" VALUES(15,'New Yorker','Pepperoni, Ham, Bacon and Mushrooms.');
CREATE TABLE pizza_size(
SizeID INTEGER,
Size TEXT,
Price INTEGER,
PizzaPoints INTEGER,
PRIMARY KEY(SizeID)
);
INSERT INTO "pizza_size" VALUES(1,'Small',10,5);
INSERT INTO "pizza_size" VALUES(2,'Medium',12,10);
INSERT INTO "pizza_size" VALUES(3,'Large',14,20);
CREATE TABLE menu(
ItemID INTEGER NOT NULL,
PizzaID INTEGER,
SizeID INTEGER,
FOREIGN KEY(PizzaID) REFERENCES pizza_info(PizzaID),
FOREIGN KEY(SizeID) REFERENCES pizza_size(SizeID),
PRIMARY KEY(ItemID)
);
CREATE TABLE orders(
OrderID INTEGER NOT NULL,
TwitterUsername TEXT,
PizzaID INTEGER,
StatusID INTEGER,
PRIMARY KEY(OrderID),
FOREIGN KEY(TwitterUsername) REFERENCES log_in(TwitterUsername),
FOREIGN KEY(PizzaID) REFERENCES pizza_info(PizzaID),
FOREIGN KEY(StatusID) REFERENCES pizza_status(StatusID)
);
CREATE TABLE pizza_status(
StatusID INTEGER NOT NULL,
StatusDescription TEXT,
PRIMARY KEY(StatusID)
);
CREATE TABLE feedback(
FeedbackID INTEGER NOT NULL,
TwitterUsername TEXT,
Feedback TEXT,
PRIMARY KEY(FeedbackID)
);
PRAGMA writable_schema=OFF;
COMMIT;
