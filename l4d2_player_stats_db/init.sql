CREATE DATABASE IF NOT EXISTS `player_stats` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `player_stats`;

CREATE TABLE IF NOT EXISTS `t_player` (
  `steam_id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Player Steam ID',
  `nickname` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Player nickname',
  `gametime` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Player gametime in this server (seconds)',
  `headshot` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player headshot kill count',
  `melee` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player melee kill count',
  `ci_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Common Infected count',
  `smoker_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Smoker count',
  `boomer_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Boomer count',
  `hunter_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Hunter count',
  `spitter_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Spitter count',
  `jockey_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Jockey count',
  `charger_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Charger count',
  `witch_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Witch count',
  `tank_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Tank count',
  `total_ff` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player total friendly fire',
  `total_ff_received` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player total friendly fire received',
  `teammate_protected` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player protected teammate count',
  `teammate_revived` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player revived teammate count',
  `incapacitated` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player incapacitated count',
  `ledge_hanged` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player hanged on ledge count',
  `mission_completed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player mission completed count',
  `mission_lost` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player mission lost count',
  `smoker_tongue_cut` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player cut Smoker tongue count',
  `smoker_self_cleared` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player self cleared from Smoker count',
  `hunter_skeeted` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player skeeted Hunter count',
  `charger_leveled` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player leveled Charger count',
  `witch_crowned` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player crowned Witch count',
  `tank_rock_skeeted` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player skeeted Tank rock count',
  `tank_rock_eaten` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player eaten Tank rock count',
  `alarm_triggered` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player triggered alarm count',
  PRIMARY KEY (`steam_id`),
  KEY `idx_nickname` (`nickname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Player info';


CREATE TABLE IF NOT EXISTS `t_player_connect_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `steam_id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Player Steam ID',
  `connect_ip` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Player connect ip',
  `connect_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Player join time',
  PRIMARY KEY (`id`),
  KEY `idx_steam_id` (`steam_id`) USING BTREE,
  KEY `idx_connect_time` (`connect_time` DESC) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Player connect log';


CREATE TABLE IF NOT EXISTS `t_player_round_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `steam_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Player Steam ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Record created time',
  `server_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Server ip',
  `server_port` varchar(8) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Server port',
  `server_map` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Server map',
  `server_mode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Server gamemode',
  `map_round` int unsigned NOT NULL DEFAULT '1' COMMENT 'Map round',
  `headshot` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player headshot kill count',
  `melee` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player melee kill count',
  `ci_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Common Infected count',
  `smoker_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Smoker count',
  `boomer_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Boomer count',
  `hunter_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Hunter count',
  `spitter_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Spitter count',
  `jockey_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Jockey count',
  `charger_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Charger count',
  `witch_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Witch count',
  `tank_killed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player killed Tank count',
  `si_damage_value` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player Special Infected damage value',
  `si_damage_percent` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT 'Player Special Infected damage percentage',
  `total_ff` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player total friendly fire',
  `total_ff_received` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player total friendly fire received',
  `total_ff_percent` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT 'Player total friendly fire percentage',
  `adrenaline_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player used Adrenaline count',
  `pills_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player used Pills count',
  `medkit_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player used Medkit count',
  `teammate_protected` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player protected teammate count',
  `teammate_revived` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player revived teammate count',
  `incapacitated` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player incapacitated count',
  `ledge_hanged` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player hanged on ledge count',
  `smoker_tongue_cut` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player cut Smoker tongue count',
  `smoker_self_cleared` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player self cleared from Smoker count',
  `hunter_skeeted` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player skeeted Hunter count',
  `charger_leveled` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player leveled Charger count',
  `witch_crowned` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player crowned Witch count',
  `tank_rock_skeeted` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player skeeted Tank rock count',
  `tank_rock_eaten` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player eaten Tank rock count',
  `alarm_triggered` int unsigned NOT NULL DEFAULT '0' COMMENT 'Player triggered alarm count',
  `avg_insta_clear_time` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Player average insta-clear time (seconds)',
  PRIMARY KEY (`id`),
  KEY `idx_steam_id` (`steam_id`) USING BTREE,
  KEY `idx_create_time` (`create_time` DESC) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Player round stats detail';
