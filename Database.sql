CREATE TABLE `garagedoordatabase`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `firstname` VARCHAR(120) NOT NULL,
  `lastname` VARCHAR(120) NOT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`id`));
