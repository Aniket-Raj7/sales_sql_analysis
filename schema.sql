CREATE TABLE `order_details` (
  `order_details_id` BIGINT,
  `order_id` BIGINT,
  `pizza_id` VARCHAR(1024),
  `quantity` BIGINT
);


CREATE TABLE `pizzas` (
  `pizza_id` VARCHAR(1024),
  `pizza_type_id` VARCHAR(1024),
  `size` VARCHAR(1024),
  `price` DOUBLE
);


CREATE TABLE `pizza_types` (
  `pizza_type_id` VARCHAR(1024),
  `name` VARCHAR(1024),
  `category` VARCHAR(1024),
  `ingredients` VARCHAR(1024)
);

CREATE TABLE orders (
  order_id VARCHAR(255),
  order_date date,
  order_time time
);
