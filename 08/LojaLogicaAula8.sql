/* LojaLogicaAula8: */

CREATE TABLE Client (
    ID_Client Number(3),
    Delivery_Address String(15),
    Name Number(8),
    Email Number(10)
);

CREATE TABLE Regular_Client (
    Loyalty_Discount Number(5),
    Register_Date Number(8)
);

CREATE TABLE Vip_Client (
    Vip_Level Number(3),
    Register_Date Number(8)
);

CREATE TABLE Corp_Client (
    Company_Name Number(6),
    Credit_Limit Number(3),
    CNPJ Number(11)
);

CREATE TABLE Product_Order_Order (
    Quantity Number(3),
    ID_Order Number(3) PRIMARY KEY,
    Order_Date Number(8),
    Payment_Method String(8),
    fk_Delivery_Status_Delivery_Status_PK INT,
    fk_Product_ID_Product Number(6)
);

CREATE TABLE Product (
    ID_Product Number(6) PRIMARY KEY,
    Name String(8),
    Price Number(5),
    fk_Category_ID_Category Number(3),
    fk_Stock_ID_Stock Number(3)
);

CREATE TABLE Provider (
    ID_Provider Number(3),
    Name String(15),
    Contact Number(8)
);

CREATE TABLE Category (
    ID_Category Number(3) PRIMARY KEY,
    Name String(8)
);

CREATE TABLE Stock (
    ID_Stock Number(3) PRIMARY KEY,
    Available_Quantity Number(6)
);

CREATE TABLE Delivery_Status (
    Delivery_Status_PK INT NOT NULL PRIMARY KEY,
    Ready_Pickup BOOL,
    Delivered BOOL,
    Displatched BOOL,
    Placed BOOL,
    Canceled BOOL
);

CREATE TABLE Supply (
    fk_Product_ID_Product Number(6)
);
 
ALTER TABLE Product_Order_Order ADD CONSTRAINT FK_Product_Order_Order_2
    FOREIGN KEY (fk_Delivery_Status_Delivery_Status_PK)
    REFERENCES Delivery_Status (Delivery_Status_PK);
 
ALTER TABLE Product_Order_Order ADD CONSTRAINT FK_Product_Order_Order_3
    FOREIGN KEY (fk_Product_ID_Product)
    REFERENCES Product (ID_Product);
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_2
    FOREIGN KEY (fk_Category_ID_Category)
    REFERENCES Category (ID_Category)
    ON DELETE CASCADE;
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_3
    FOREIGN KEY (fk_Stock_ID_Stock)
    REFERENCES Stock (ID_Stock)
    ON DELETE RESTRICT;
 
ALTER TABLE Supply ADD CONSTRAINT FK_Supply_1
    FOREIGN KEY (fk_Product_ID_Product)
    REFERENCES Product (ID_Product)
    ON DELETE RESTRICT;