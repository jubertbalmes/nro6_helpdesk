--SELECT * FROM `helpdesk_user` WHERE full_name LIKE '%jarabata%'

DROP VIEW IF EXISTS `helpdesk_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_user` AS (
SELECT                  `t1`.`employee_id`, 
                                `t1`.`user_id`, 
                                `t1`.`full_name`, 
                                `t1`.`assumption_date`,
                                `t2`.`contact_value` AS `cpno`,
                                `t3`.`contact_value` AS `telno`,
                                `t4`.`contact_value` AS `email`,
                                `t5`.`contact_value` AS `alt_email`,
                                `t6`.`birth_date`,
                                `t7`.`position_id`,
                                `t7`.`org_code`
FROM                   ((((((`hr_employees` `t1`
LEFT JOIN            `hr_emp_contacts` `t2` ON (`t1`.`employee_id` = `t2`.`employee_id` AND `t2`.`contact_type_id` = 1))
LEFT JOIN            `hr_emp_contacts` `t3` ON (`t1`.`employee_id` = `t3`.`employee_id` AND `t3`.`contact_type_id` = 2))
LEFT JOIN            `hr_emp_contacts` `t4` ON (`t1`.`employee_id` = `t4`.`employee_id` AND `t4`.`contact_type_id` = 3))
LEFT JOIN            `hr_emp_contacts` `t5` ON (`t1`.`employee_id` = `t5`.`employee_id` AND `t5`.`contact_type_id` = 4))
LEFT JOIN            `hr_emp_personal_info` `t6` ON (`t1`.`employee_id` = `t6`.`employee_id`))
LEFT JOIN		(SELECT	`t8`.`emp_work_exp_id`, `t8`.`employee_id`, `t9`.`position_id`, `t9`.`org_code`, `t8`.`start_date` 
			FROM	
				(SELECT 
					`emp_work_exp_id`,
					`employee_id`, 
					MAX(`start_date`) AS `start_date` 
				FROM
					`hr_emp_work_experiences`
				WHERE	`position_id` IS NOT NULL AND `org_code` IS NOT NULL
				GROUP BY `employee_id`
				) `t8`
			JOIN
				`hr_emp_work_experiences` `t9`
				ON `t8`.`employee_id` = `t9`.`employee_id` AND `t9`.`start_date` = `t8`.`start_date` AND `t9`.`start_date` = `t8`.`start_date` 
			) `t7` 
			ON (`t1`.`employee_id` = `t7` .`employee_id`))
WHERE 			`t7`.`position_id` IS NOT NULL AND 
			`t7`.`org_code` IS NOT NULL

);