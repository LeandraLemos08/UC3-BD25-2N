/* Lógico_1: */

CREATE TABLE product (
    name String(15),
    quantity_in_stock Number(3),
    id Number(3),
    price Number(5),
    average_rating Number(6),
    PRIMARY KEY (name, id)
);

CREATE TABLE mark (
    country_of_origin String(6),
    id Number(3),
    name Number(6)
);

CREATE TABLE category (
    name String(6),
    id Number(3)
);

CREATE TABLE customer (
    adress String(15),
    registration_date Number(8),
    telephone Number(8),
    date_of_birth Number(8)
);

CREATE TABLE customer_product_assesment (
    fk_product_name String(15),
    fk_product_id Number(3)
);

CREATE TABLE customer_product_shopping_cart (
    fk_product_name String(15),
    fk_product_id Number(3)
);

CREATE TABLE customer_product_order (
    fk_product_name String(15),
    fk_product_id Number(3)
);
 
ALTER TABLE customer_product_assesment ADD CONSTRAINT FK_customer_product_assesment_1
    FOREIGN KEY (fk_product_name, fk_product_id)
    REFERENCES product (name, id);
 
ALTER TABLE customer_product_shopping_cart ADD CONSTRAINT FK_customer_product_shopping_cart_1
    FOREIGN KEY (fk_product_name, fk_product_id)
    REFERENCES product (name, id);
 
ALTER TABLE customer_product_order ADD CONSTRAINT FK_customer_product_order_1
    FOREIGN KEY (fk_product_name, fk_product_id)
    REFERENCES product (name, id);