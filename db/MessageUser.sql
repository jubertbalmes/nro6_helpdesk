ALTER TABLE `message_user` 
	ADD `notif` int(1) DEFAULT NULL,
	ADD `created_at` timestamp NULL DEFAULT current_timestamp() AFTER `notif`;
