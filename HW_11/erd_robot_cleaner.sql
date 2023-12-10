CREATE TABLE `Robot` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL AUTO_INCREMENT,
	`model` varchar(255) NOT NULL,
	`version` INT NOT NULL,
	`serial_number` INT NOT NULL,
	`ipv6` INT NOT NULL,
	`group_id` INT NOT NULL,
	PRIMARY KEY (`id`,`name`)
);

CREATE TABLE `Token` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`token` varchar(255) NOT NULL AUTO_INCREMENT,
	`id_robot` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Schedule` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`time_start` TIMESTAMP NOT NULL,
	`time_date` DATETIME NOT NULL,
	`id_robot` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Report` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`report` TEXT NOT NULL,
	`id_robot` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Group` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`user_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`login` varchar(255) NOT NULL,
	`hash_password` INT NOT NULL,
	`email` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Setting_robot` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`power_clean` INT NOT NULL,
	`type_clean` INT NOT NULL,
	`id_robot` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `State_robot` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`battery` INT NOT NULL,
	`brush_replace` DATE NOT NULL,
	`container_dust` INT NOT NULL,
	`filter_repleace` INT NOT NULL,
	`id_robot` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Robot` ADD CONSTRAINT `Robot_fk0` FOREIGN KEY (`group_id`) REFERENCES `Group`(`id`);

ALTER TABLE `Token` ADD CONSTRAINT `Token_fk0` FOREIGN KEY (`id_robot`) REFERENCES `Robot`(`id`);

ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_fk0` FOREIGN KEY (`id_robot`) REFERENCES `Robot`(`id`);

ALTER TABLE `Report` ADD CONSTRAINT `Report_fk0` FOREIGN KEY (`id_robot`) REFERENCES `Robot`(`id`);

ALTER TABLE `Group` ADD CONSTRAINT `Group_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Setting_robot` ADD CONSTRAINT `Setting_robot_fk0` FOREIGN KEY (`id_robot`) REFERENCES `Robot`(`id`);

ALTER TABLE `State_robot` ADD CONSTRAINT `State_robot_fk0` FOREIGN KEY (`id_robot`) REFERENCES `Robot`(`id`);









