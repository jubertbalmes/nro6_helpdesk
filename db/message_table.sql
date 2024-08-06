CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `is_read` int(1) NOT NULL DEFAULT 0,
  `is_read_admin` int(1) NOT NULL DEFAULT 0,
  `is_read_hod` int(1) NOT NULL DEFAULT 0,
  `is_read_owner` int(1) NOT NULL DEFAULT 0,
  `is_read_tech` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


-- composer require pusher/pusher-php-server
-- PUSHER_APP_ID=1408571
-- PUSHER_APP_KEY=25d41187bf7243dd6f99
-- PUSHER_APP_SECRET=d9ce0dcfc05c4eb33fa0
-- PUSHER_APP_CLUSTER=ap2