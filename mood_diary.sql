-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: mydatabase202607
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mood_diary`
--

DROP TABLE IF EXISTS `mood_diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mood_diary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `record_date` date NOT NULL COMMENT '日期',
  `record_time` enum('早晨','上午','中午','下午','晚上') COLLATE utf8mb4_general_ci DEFAULT '晚上' COMMENT '记录时段',
  `weather` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '天气状况（如：晴、多云、小雨、大雾）',
  `weight` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mood_score` tinyint DEFAULT NULL COMMENT '整体心情(1极糟-10极好)',
  `anxiety_score` tinyint DEFAULT NULL COMMENT '焦虑程度(1极低-10濒死)',
  `energy_score` tinyint DEFAULT NULL COMMENT '精力(1瘫软-10亢奋)',
  `suicidal_ideation` tinyint DEFAULT NULL COMMENT '自杀意念(0无-10强烈/明确计划/紧急)',
  `sleep_hours` decimal(3,1) DEFAULT NULL COMMENT '昨夜睡眠时长(小时)',
  `sleep_quality` tinyint DEFAULT NULL COMMENT '昨夜睡眠质量(1极差-10极好)',
  `dream` tinyint(1) DEFAULT '0' COMMENT '昨夜梦境(0无梦,1有梦,2噩梦)',
  `functioning_score` tinyint DEFAULT NULL COMMENT '日常做事效率(1极差-10极好)',
  `highlight` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '今日亮点',
  `struggle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '今日困扰',
  `body_feeling` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身体感受',
  `social_contact` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '无事' COMMENT '社交状态',
  `diary_content` text COLLATE utf8mb4_general_ci COMMENT '自由书写日记正文',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `mood_diary_chk_1` CHECK ((`mood_score` between 1 and 10)),
  CONSTRAINT `mood_diary_chk_2` CHECK ((`anxiety_score` between 1 and 10)),
  CONSTRAINT `mood_diary_chk_3` CHECK ((`energy_score` between 1 and 10)),
  CONSTRAINT `mood_diary_chk_4` CHECK ((`suicidal_ideation` between 0 and 10)),
  CONSTRAINT `mood_diary_chk_5` CHECK ((`sleep_quality` between 1 and 10)),
  CONSTRAINT `mood_diary_chk_6` CHECK ((`dream` in (0,1,2))),
  CONSTRAINT `mood_diary_chk_7` CHECK ((`functioning_score` between 1 and 10))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='心情日记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood_diary`
--

LOCK TABLES `mood_diary` WRITE;
/*!40000 ALTER TABLE `mood_diary` DISABLE KEYS */;
INSERT INTO `mood_diary` VALUES (1,'2026-07-28','中午','多云',NULL,6,5,5,0,10.0,7,1,6,'今日进行GAHT复诊体检，包括血常规和激素六项等，因为能借机骑车出门了所以很开心。','医院的“数据孤岛”导致缴费、确认和检查流程不顺畅，需要多次排队和等待。','无碍，但可能因为药物原因仍旧乏力','在家无事','总体无事，但终究还是想play，无论是室外还是线上。但是夏天又晒又热，就算到了晚上还是很热；线上的话自己又没有很充足的精力去玩游戏，所以只能看看MySQL。下午：取回了检查结果，E2的水平终于高于100了。还有就是和🐋老师聊了聊认知扭曲（cognitive distortion）的问题，结论就是“做自己吧”……不要把专业/职业作为终点，而是起点。','2026-07-28 03:37:25','2026-07-30 11:02:11'),(2,'2026-07-29','下午','多云有雨','71.65kg',5,7,5,1,7.0,8,1,2,'更深入地了解了SQL而已。','我想更熟练于数据分析，这也跟CPA有关。','长时间使用电子产品眼睛有点累。','在家','查了好多关于CICPA和他们写的教材的相关信息，只能说确实有明显的局限性，在AI（vibe coding）发展及会计界与计算机技术（如编程）进一步融合的大势下，仍有不少人认为“会计就是会计，审计就是审计，不应该过多接触与计算机（如编程）相关的事。”我不想被限制，我想自由而全面地发展。还有就是我做了很舒服的梦，我梦见和我的同学们（他们很友善，我似乎也是trans的形象）一起上课、考试，他们还带我一起逛霓虹城市，最后还是回到了教学楼前小小的角落。教学楼似乎已经不是教学楼了，正在被拆除。然后我就看着一面trans flag落到了地上……我还梦见了和她一起去找Rentable……','2026-07-29 08:05:17','2026-07-30 03:11:44'),(3,'2026-07-30','中午','多云有雨','71.9kg',6,4,5,0,7.5,8,1,6,'明确了IT和CPA的关系，即“CS≠IT，CS∩IT≠Ø，IT∩CPA≠Ø。”','了解了一下CPA（收入、费用与利润）的难处。','无事，但觉右眼散光严重。','在家','打算先考CPA《会计》《经济法》《公司战略与风险管理》，一是确保了核心科目《会计》的通过，二是确保通过尽可能多的科目。Plus, now I can just say my GitHub username is Xiayigongheqiu meow~','2026-07-30 03:28:56','2026-07-30 11:02:01'),(4,'2026-07-31','下午','多云','71.45kg',6,5,5,1,8.5,8,1,5,'开始学自考的课了……起到了一个连接学习的作用','学历','感觉需要更多的抗焦虑药物','在家','如果明年能考过CPA的两三门科目那也行，我也不会多说什么，能挣钱当然是好的。有些人整天嚷嚷着“CPA没什么性价比”，那只是他们的断言，他们又不了解我……我想说一些很丧的话，还是算了，大家都知道，大家也知道trans乃至大部分公民的生存处境。人呐……最宝贵的就是健康/理性/道德/知识。','2026-07-31 07:38:48','2026-07-31 07:38:48');
/*!40000 ALTER TABLE `mood_diary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-31 15:43:14
