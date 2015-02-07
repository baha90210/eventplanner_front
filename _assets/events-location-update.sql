# SQL om ook een locatie aan de performancetabel toe te voegen en deze te vullen.

ALTER TABLE `performance` ADD `location_id` INT NULL AFTER `artist_id`;

UPDATE `performance` SET `location_id`=3 WHERE `performance_id`=19;
UPDATE `performance` SET `location_id`=3 WHERE `performance_id`=20;
UPDATE `performance` SET `location_id`=3 WHERE `performance_id`=21;
UPDATE `performance` SET `location_id`=3 WHERE `performance_id`=22;
UPDATE `performance` SET `location_id`=4 WHERE `performance_id`=23;
UPDATE `performance` SET `location_id`=4 WHERE `performance_id`=24;
UPDATE `performance` SET `location_id`=4 WHERE `performance_id`=25;
UPDATE `performance` SET `location_id`=4 WHERE `performance_id`=26;
UPDATE `performance` SET `location_id`=6 WHERE `performance_id`=27;
UPDATE `performance` SET `location_id`=6 WHERE `performance_id`=28;
UPDATE `performance` SET `location_id`=8 WHERE `performance_id`=29;
UPDATE `performance` SET `location_id`=8 WHERE `performance_id`=30;
UPDATE `performance` SET `location_id`=9 WHERE `performance_id`=31;
UPDATE `performance` SET `location_id`=9 WHERE `performance_id`=32;
UPDATE `performance` SET `location_id`=9 WHERE `performance_id`=33;
UPDATE `performance` SET `location_id`=10 WHERE `performance_id`=34;
UPDATE `performance` SET `location_id`=10 WHERE `performance_id`=35;
UPDATE `performance` SET `location_id`=10 WHERE `performance_id`=36;
UPDATE `performance` SET `location_id`=11 WHERE `performance_id`=37;
UPDATE `performance` SET `location_id`=11 WHERE `performance_id`=38;