CREATE TABLE `projectlogs` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `projectlogs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `projectlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;