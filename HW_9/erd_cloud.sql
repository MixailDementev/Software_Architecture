CREATE TABLE `Cloud` (
	`id` INT NOT NULL,
	`server_id` INT NOT NULL,
	`os_id` INT NOT NULL,
	`ip_adress` INT NOT NULL,
	`total_price` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Order` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`cloud_ip` INT NOT NULL,
	`CPU` INT NOT NULL,
	`RAM` INT NOT NULL,
	`SSD` INT NOT NULL,
	`static_ip` BOOLEAN NOT NULL,
	`OS` varchar(255) NOT NULL,
	PRIMARY KEY (`id`,`customer_id`)
);

CREATE TABLE `Customer` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`FIO` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`hash_password` INT NOT NULL,
	`address` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Server` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`CPU` INT NOT NULL,
	`CPU_price` DECIMAL NOT NULL,
	`RAM` INT NOT NULL,
	`RAM_price` DECIMAL NOT NULL,
	`SSD` INT NOT NULL,
	`SSD_price` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `OS` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`version_os` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Ip_address` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ip_address` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Cloud` ADD CONSTRAINT `Cloud_fk0` FOREIGN KEY (`server_id`) REFERENCES `Server`(`id`);

ALTER TABLE `Cloud` ADD CONSTRAINT `Cloud_fk1` FOREIGN KEY (`os_id`) REFERENCES `OS`(`id`);

ALTER TABLE `Cloud` ADD CONSTRAINT `Cloud_fk2` FOREIGN KEY (`ip_adress`) REFERENCES `Ip_address`(`id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk1` FOREIGN KEY (`cloud_ip`) REFERENCES `Cloud`(`id`);







