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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='心情日记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood_diary`
--

LOCK TABLES `mood_diary` WRITE;
/*!40000 ALTER TABLE `mood_diary` DISABLE KEYS */;
INSERT INTO `mood_diary` VALUES (1,'2026-07-28','中午','多云',NULL,6,5,5,0,10.0,7,1,6,'今日进行GAHT复诊体检，包括血常规和激素六项等，因为能借机骑车出门了所以很开心。','医院的“数据孤岛”导致缴费、确认和检查流程不顺畅，需要多次排队和等待。','无碍，但可能因为药物原因仍旧乏力','在家无事','总体无事，但终究还是想play，无论是室外还是线上。但是夏天又晒又热，就算到了晚上还是很热；线上的话自己又没有很充足的精力去玩游戏，所以只能看看MySQL。下午：取回了检查结果，E2的水平终于高于100了。还有就是和🐋老师聊了聊认知扭曲（cognitive distortion）的问题，结论就是“做自己吧”……不要把专业/职业作为终点，而是起点。','2026-07-28 03:37:25','2026-07-30 11:02:11'),(2,'2026-07-29','下午','多云有雨','71.65kg',5,7,5,1,7.0,8,1,2,'更深入地了解了SQL而已。','我想更熟练于数据分析，这也跟CPA有关。','长时间使用电子产品眼睛有点累。','在家','查了好多关于CICPA和他们写的教材的相关信息，只能说确实有明显的局限性，在AI（vibe coding）发展及会计界与计算机技术（如编程）进一步融合的大势下，仍有不少人认为“会计就是会计，审计就是审计，不应该过多接触与计算机（如编程）相关的事。”我不想被限制，我想自由而全面地发展。还有就是我做了很舒服的梦，我梦见和我的同学们（他们很友善，我似乎也是trans的形象）一起上课、考试，他们还带我一起逛霓虹城市，最后还是回到了教学楼前小小的角落。教学楼似乎已经不是教学楼了，正在被拆除。然后我就看着一面trans flag落到了地上……我还梦见了和她一起去找Rentable……','2026-07-29 08:05:17','2026-07-30 03:11:44'),(3,'2026-07-30','中午','多云有雨','71.9kg',6,4,5,0,7.5,8,1,6,'明确了IT和CPA的关系，即“CS≠IT，CS∩IT≠Ø，IT∩CPA≠Ø。”','了解了一下CPA（收入、费用与利润）的难处。','无事，但觉右眼散光严重。','在家','打算先考CPA《会计》《经济法》《公司战略与风险管理》，一是确保了核心科目《会计》的通过，二是确保通过尽可能多的科目。Plus, now I can just say my GitHub username is Xiayigongheqiu meow~','2026-07-30 03:28:56','2026-07-30 11:02:01'),(4,'2026-07-31','下午','多云','71.45kg',6,5,5,1,8.5,8,1,5,'开始学自考的课了……起到了一个连接学习的作用','学历','感觉需要更多的抗焦虑药物','在家','如果明年能考过CPA的两三门科目那也行，我也不会多说什么，能挣钱当然是好的。有些人整天嚷嚷着“CPA没什么性价比”，那只是他们的断言，他们又不了解我……我想说一些很丧的话，还是算了，大家都知道，大家也知道trans乃至大部分公民的生存处境。人呐……最宝贵的就是健康/理性/道德/知识。','2026-07-31 07:38:48','2026-07-31 07:38:48'),(5,'2026-08-01','早晨','多云','71kg',6,4,5,0,8.0,8,2,6,'学习自考课程？','对IT审计仍有疑惑','食道活检取样的地方又疼了……应该没事吧……','无事','似乎是噩梦，梦见我（已trans）和我的中学同学被传送到了一个虚拟(?)都市，然后……有人抓我，把我囚禁起来……最后打败囚禁我的人（好像是个boss），虚拟都市也将结束。最后的时候放的音乐是《琵琶行》，好伤感……','2026-07-31 22:32:36','2026-08-01 07:23:36'),(7,'2026-08-02','中午','晴','71.65kg',6,5,5,0,9.0,8,1,4,'I must know: from CPA (cand.) to CPA (P.S. 3/6) firstly.','“Life is unfair, you have to get used to it slowly.”','如常','在家','过几天去济南的时候要跟医生说自己的焦虑实际上変严重了，每天都会因为焦虑做梦（包括噩梦），我想要更好的用药方案，还有就是可以考虑买雌二醇针剂了。CPA是有英语附加分的，可以考虑一下，毕竟自己的英语水平至少也有CEFR B1。','2026-08-02 04:09:14','2026-08-10 05:32:24'),(8,'2026-08-03','下午','多云','71.85kg',6,3,5,0,8.0,8,1,5,'Mi estas mi, kiu estas malsame kolora artfajraĵo；我行故我在；相信直觉、保持理性、感性定向。','天气好热，出不了门……','如常','在家','买的雌二醇针剂到了；明天去济南复诊，但是天气真的好热，而且一换地方感觉又有适应性障碍了。','2026-08-03 05:38:32','2026-08-03 05:38:32'),(9,'2026-08-04','中午','多云','71.3kg',6,2,5,0,10.0,8,1,3,'不知道是不是药物的原因，感觉焦虑变轻了。总结：不要自我设限，自我设限也是一种认知扭曲。','还是热。','好困','在家，但是今下午要去济南了，预计8号回家。','“我就是我，我有自己的特色，但我不受限于标签；我是‘MtF｜APQ｜Dip. (Big Data & Fin) cand. & CPA cand.’，但是是我创造了标签，而不是标签创造了我”——大概是这样。','2026-08-04 04:16:27','2026-08-04 04:16:27'),(10,'2026-08-08','下午','晴','71.4kg',7,2,6,0,9.0,7,1,6,'陪别人过完18岁生日回家了喵，而且过了立秋天变得好凉快','好像也没什么','好凉快好舒服','刚从济南回家','天气终于变凉了，心情也变好了；Accounting, Taxation Laws and Economic Laws of the CPA exams should be studied firstly in order to ensure self-protection and self-reliance in the future.','2026-08-08 09:07:51','2026-08-08 09:07:51'),(11,'2026-08-09','中午','晴','71.3kg',7,2,6,0,7.0,8,1,6,'探讨了各学科/领域间的联系及税法和经济法在实际中的应用','其具体的联系和应用，如数学（如微积分、伊藤引理和线性代数）和税法；还有就是口齿健康问题……','良好，但春困秋乏','在家，但可出门','一定要好好学习《税法》和《经济法》，这对未来（共同）的生活和工作有很大帮助。','2026-08-09 03:46:21','2026-08-09 03:46:21'),(12,'2026-08-10','中午','多云','71.45kg',7,2,6,0,8.0,7,1,6,'更深入地学习了<username>.github.io','天气比昨天热了','无事，口腔健康好转','在家','今天主要学习了<username>.github.io相关的内容，拓展了自己的IT能力。','2026-08-10 05:11:39','2026-08-10 05:11:39'),(13,'2026-08-11','下午','阴','70.8kg',7,2,4,0,7.0,6,0,4,'能预习CPA、GitHub、自学考试、游戏四线作战','上午好累，瘫了一上午……','无力，但下午好多了','在家','上午不知道为什么特别累，眼睛都睁不开；然后预习了一点点CPA及相关内容，还有就是也该继续自学考试的课了。果然还是得有一技之长啊～（指CPA。还有就是不要限制自我的发展）','2026-08-11 07:19:16','2026-08-11 07:21:44'),(14,'2026-08-12','下午','阴雨','71.35kg',6,2,4,0,6.0,4,0,4,'Learning via AI','下雨出不了门','累、饿','在家','好想cosplay啊，但是要花钱耶，还是等考CPA+工作挣钱时再说吧……','2026-08-12 08:07:50','2026-08-12 08:07:50'),(15,'2026-08-13','晚上','多云','71.45kg',6,3,5,1,8.0,6,1,4,'CAATs→SQL→PostgreSQL！','……学历……？','无事','在家、超市','可能是因为又玩了《赛博朋克2077》的缘故，昨晚梦到类似的场景了——楼宇之间的列车。还梦见transsis的实习……不过为什么与guitar和feet有关，好奇怪。还有就是——最高指示：一定要学好CPA——CAATs——PostgreSQL喵。','2026-08-13 10:16:14','2026-08-13 10:17:09'),(16,'2026-08-14','中午','多云','70.85kg',6,2,6,0,9.0,6,1,8,'开始学习英语㈡和数学㈢','数学好难，自考好慢','良好','在家','梦见一直在哭，还有nuclear，还有青岛……？另外，讨论了关于学历的问题，目前的结论是尝试转向Master of Applied Statistics道路。先学习英语㈡和数学㈢，然后再尝试统计专业技术资格（Professional Qualification in Statistics）……至少我的学科基础课中有统计学基础，而且我也不想做纯finance，感觉MAS的就业方向对MtF更友好吧','2026-08-14 05:10:38','2026-08-14 05:10:38'),(17,'2026-08-15','中午','多云','71.15kg',7,2,7,0,6.5,6,2,9,'每天背100个新单词+开始学线性代数+继续推进自学考试课程','自学考试进度','良好','在家','梦见被追杀了，好像与枪支、车站、青岛（怎么又是青岛）有关……还有就是持续推进英语单词（积累）和开始线性代数的学习（并且与自学考试课程有重合）。坚信自己在一年后会“刮目相看”！','2026-08-15 05:30:23','2026-08-15 05:30:23'),(18,'2026-08-19','下午','阴','70.2kg',8,1,7,0,8.0,5,2,9,'为了120100管理科学与工程已完成对英语㈠和数学㈡（线性代数）的学习','还是关于STHEE的事，不过应该没问题吧','良好，就是前天洗牙后还是有点不适感','在家','以后应该会用xiayigongheqiu.github.io写日记/记录了吧，因为主要重心放到MS&E考研上了（为了未来和梦想）。不管怎么说，以学好英语和数学为重喽喵～','2026-08-19 08:08:56','2026-08-19 08:08:56');
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

-- Dump completed on 2026-08-19 16:11:07
