CREATE TABLE `survey` ( `id` int NOT NULL AUTO_INCREMENT, `fullname` varchar(255) DEFAULT NULL, `email` varchar(255) DEFAULT NULL, `mobile_country_code` varchar(255) DEFAULT NULL, 
  `mobile_number` varchar(255) DEFAULT NULL, `linkedin` varchar(255) DEFAULT NULL, `gender` varchar(255) DEFAULT NULL, `prompt_engg` varchar(255) DEFAULT NULL, `job_role` varchar(255) DEFAULT NULL, 
  `timestamp` varchar(255) DEFAULT NULL, `location` varchar(255) DEFAULT NULL, `other_product_names` varchar(255) DEFAULT NULL, `message` text, `logged_in_user` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) ) 
  ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `skills` ( `id` int NOT NULL AUTO_INCREMENT, `skill_name` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `products` ( `id` int NOT NULL AUTO_INCREMENT, `product_name` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `skills_survey` ( `id` int NOT NULL AUTO_INCREMENT, `survey_id` int DEFAULT NULL, `skill_name` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `products_survey` ( `id` int NOT NULL AUTO_INCREMENT, `survey_id` int DEFAULT NULL, `product_name` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `respondent_cities` ( `id` int NOT NULL AUTO_INCREMENT, `city_name` varchar(255) DEFAULT NULL, `survey_id` int DEFAULT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `functional_jobs` ( `id` int NOT NULL AUTO_INCREMENT, `job` varchar(255) DEFAULT NULL, `experience` varchar(255) DEFAULT NULL, `survey_id` int NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `technical_jobs` ( `id` int NOT NULL AUTO_INCREMENT, `job` varchar(255) DEFAULT NULL, `experience` varchar(255) DEFAULT NULL, `survey_id` int NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `managerial_jobs` ( `id` int NOT NULL AUTO_INCREMENT, `job` varchar(255) DEFAULT NULL, `experience` varchar(255) DEFAULT NULL, `survey_id` int NOT NULL, `other` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
