CREATE SCHEMA pizzaPlace;

GO

CREATE TABLE pizzaPlace.orders (
    customerId VARCHAR (25) NOT NULL,
    order VARCHAR (25) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    PRIMARY KEY (customerId)
)

GO

INSERT INTO pizzaPlace.orders (
    customerId,
    order,
    orderDate
)
VALUES 
(1,'Margherita', '2022-05-01'), 
(1,'Prosciutto', '2022-05-23'),
(1,'Hawaii', '2022-02-13'),
(2,'Hawaii', '2022-07-01'),
(3,'Salami', '2021-02-01'),
(3,'Margherita', '2021-03-01'),
(4,'Margherita', '2022-05-01'), 
(4,'Prosciutto', '2022-05-23'),
(4,'Hawaii', '2022-02-13'),
(4,'Salami', '2022-05-01'), 
(5,'Prosciutto', '2022-05-23'),
(5,'Hawaii', '2022-02-13'),
(5,'Margherita', '2021-02-13')