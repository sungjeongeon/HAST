CREATE TABLE IF NOT EXISTS `hast`.`export_table` (
  `export_event_id` BIGINT NOT NULL,
  `export_root_code` VARCHAR(10) NULL DEFAULT NULL,
  `export_base_code` VARCHAR(10)NULL DEFAULT NULL,   
  `export_code` VARCHAR(10) NULL DEFAULT NULL, 
  `export_country_code` VARCHAR(10) NULL DEFAULT NULL, 
  `export_lat` DOUBLE NULL DEFAULT NULL,  
  `export_long` DOUBLE NULL DEFAULT NULL,
  `export_date` DATE NULL DEFAULT NULL,
  `export_datetime` TIMESTAMP NULL DEFAULT NULL,
  `export_url` TEXT NULL DEFAULT NULL,
  `export_score` DOUBLE NULL DEFAULT NULL,
  `export_row_count` BIGINT NULL DEFAULT NULL,
  
  PRIMARY KEY (`export_event_id`)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `hast`.`point_table` (
  `point_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  `point_event_id` BIGINT NOT NULL,
  `point_country_code` CHAR(10) NULL DEFAULT NULL,
  `point_kor_comment` VARCHAR(255) NULL DEFAULT NULL,   
  `point_eng_comment` VARCHAR(255) NULL DEFAULT NULL, 
  `point_sentence` INT NULL DEFAULT NULL, 
  `point_confidence` DOUBLE NULL DEFAULT NULL,  
  `point_mentions_tone` DOUBLE NULL DEFAULT NULL,
  `point_gkg_tone` DOUBLE NULL DEFAULT NULL,
  `point_gkg_positive` DOUBLE NULL DEFAULT NULL,
  `point_gkg_negative` DOUBLE NULL DEFAULT NULL,
  `point_gkg_activity` DOUBLE NULL DEFAULT NULL,
  `point_gkg_news` DOUBLE NULL DEFAULT NULL,
  `point_gkg_count` INT NULL DEFAULT NULL,
  `point_event_datetime` TIMESTAMP NULL DEFAULT NULL,
  `point_datetime` TIMESTAMP NULL DEFAULT NULL,
  `point_time_diff` BIGINT NULL DEFAULT NULL,
  `point_source` TEXT NULL DEFAULT NULL,
  `point_url` TEXT NULL DEFAULT NULL,
  `point_image` TEXT NULL DEFAULT NULL,
  `point_theme_crime` DOUBLE NULL DEFAULT NULL,
  `point_theme_accident` DOUBLE NULL DEFAULT NULL,
  `point_theme_disease` DOUBLE NULL DEFAULT NULL,
  `point_theme_disaster` DOUBLE NULL DEFAULT NULL,
  `point_theme_politic` DOUBLE NULL DEFAULT NULL,
  `point_theme_total` DOUBLE NULL DEFAULT NULL,
  `point_category` INT NULL DEFAULT NULL,
  `point_year` CHAR(4) NULL DEFAULT NULL,
  `point_month` CHAR(2) NULL DEFAULT NULL,
  `point_score` DOUBLE NULL DEFAULT NULL
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `hast`.`statistics_table` (
  `statistics_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `statistics_year` CHAR(4) NOT NULL,
  `statistics_month` CHAR(2) NULL DEFAULT NULL,
  `statistics_country_code` CHAR(2) NOT NULL,
  `statistics_gkg_tone` FLOAT NULL DEFAULT NULL,     
  `statistics_row_count` INT NULL DEFAULT NULL,   
  `statistics_etc_count` INT NULL DEFAULT NULL,  
  `statistics_crime_count` INT NULL DEFAULT NULL,
  `statistics_accident_count` INT NULL DEFAULT NULL,    
  `statistics_disease_count` INT NULL DEFAULT NULL,   
  `statistics_disaster_count` INT NULL DEFAULT NULL,   
  `statistics_politic_count` INT NULL DEFAULT NULL
) ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8MB4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `hast`.`cameo_table` (
  `cameo_code` CHAR(10) NOT NULL,
  `cameo_eng_comment` VARCHAR(255) NULL DEFAULT NULL,
  `cameo_kor_comment` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`cameo_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = UTF8MB4_UNICODE_CI;



insert into cameo_table (cameo_code, cameo_eng_comment, cameo_kor_comment) values 
('13', 'Political Threats', '정치적 위협'),
('130', 'Other Political Threats', '기타 정치적 위협'),
('131', 'Administrative sanctions threats', '행정 제재 위협'),
('1311', 'Material disruption threats', '자재 공급 중단 위협'),
('1312', 'Economic threat', '경제적 위협'),
('1313', 'National-relational threat', '국가 관계적 위협'),
('132', 'Other administrative sanctions threats', '기타 행정 제재 위협'),
('1321', 'Restricting freedom of speech threats', '언론 자유 제한 위협'),
('1322', 'Restricting political activities threats', '정치 활동 제한 위협'),
('1323', 'Curfew threats', '통금령 선언 위협'),
('1324', 'Martial law threats', '계엄령 선포 위협'),
('133', 'Political protest threats', '정치적 시위 위협'),
('134', 'Halt negotiations threats', '국가 협상 중단 위협'),
('135', 'Halt mediation threats', '국가 중재 중단 위협'),
('136', 'Halt international involvement threats', '국제 개입 중단 위협'),
('137', 'Violent repression threats', '폭력 억압 위협'),
('138', 'Other threats to military use', '기타 군사력 사용 위협'),
('1381', 'National blockade threats', '국가 봉쇄 위협'),
('1382', 'National occupation threats', '국가 점령 위협'),
('1383', 'Unconventional violence', '비상식적인 폭력 위협 (예: 테러)'),
('1384', 'Conventional attack', '보복 공격 위협'),
('1385', 'Attack with WMD', '대량살상무기 공격 위협'),
('139', 'Ultimatum', '최후 통첩'),
('14', 'Protest', '시위'),
('140', 'Other political protests', '기타 정치적 시위'),
('141', 'Demonstration or rally', '시위 또는 집회'),
('1411', 'Leadership change demo', '정권 교체 시위'),
('1412', 'Policy change demo', '정치 개혁 시위'),
('1413', 'Demo for rights', '권리 요구 시위'),
('1414', 'Demo to change the national system', '제도 교체 시위'),
('142', 'Other hunger strikes', '기타 단식투쟁 '),
('1421', 'Leadership change hunger strike', '정권 반대 단식투쟁'),
('1422', 'Hunger strike for policy change', '정치 개혁 단식투쟁'),
('1423', 'Hunger strike for rights', '권리 요구 단식투쟁'),
('1424', 'Hunger strike for institutional change', '제도 교체 단식투쟁'),
('143', 'Other strikes', '기타 파업'),
('1431', 'Strike for leadership change', '정치 교체 목적 파업'),
('1432', 'Strike for policy change', '정치 개혁 목적 파업'),
('1433', 'Strike for rights', '권리 요구 목적 파업'),
('1434', 'Strike for institutional change', '제도 교체 목적 파업'),
('144', 'Obstruct passage', '시설 봉쇄'),
('1441', 'Obstruct passage for leadership change', '정권 교체 목적 시설 봉쇄'),
('1442', 'Obstruct passage for policy change', '정치 개혁 목적 시설 봉쇄'),
('1443', 'Obstruct passage for rights', '권리 요구 목적 시설 봉쇄'),
('1444', 'Obstruct passage for institutional change', '제도 교체 목적 시설 봉쇄'),
('145', 'Violent demo', '폭력 시위'),
('1451', 'Violent demo for regime change', '정권 교체 폭력 시위'),
('1452', 'Violent demo for policy change', '정치 개혁 폭력 시위'),
('1453', 'Violent demo for rights', '권리 요구 폭력 시위'),
('1454', 'Violent demo for institutional change', '제도 교체 폭력 시위'),
('15', 'EXHIBIT FORCE POSTURE', '군사력 동원'),
('150', 'Demo military, police power', '기타 군사력 동원'),
('151', 'Increase police alert status', '경찰 경계 태세 강화'),
('152', 'Increase military alert status', '군사 경계 태세 강화'),
('153', 'Mobilize police power', '경찰력 동원'),
('154', 'Mobilize armed forces', '군사력 동원'),
('16', 'REDUCE RELATIONS', '관계 축소'),
('160', 'Other reduce relations', '기타 관계 축소'),
('161', 'Reduce diplomatic exchanges', '외교 교류 축소'),
('162', 'Other Reduce aid', '기타 국가 원조 축소'),
('1621', 'Reduce economic assistance', '경제적 지원 축소'),
('1622', 'Reduce military assistance', '군사 지원 축소'),
('1623', 'Reduce humanitarian assistance', '인도적 지원 축소'),
('163', 'Impose embargo', '단체 제재'),
('164', 'Halt negotiations', '협상 중단'),
('165', 'Halt mediation', '조정 중단'),
('166', 'Other expel', '기타 철수'),
('1661', 'Other expel peacekeepers', '평화유지군 철수'),
('1662', 'Expel inspectors', '사찰관 철수, 추방'),
('1663', 'Expel aid agencies', '구호 기관 추방 또는 철수'),
('17', 'COERCE', '강압'),
('170', 'Other coerece', '기타 강압'),
('171', 'Other property damages', '기타 재산 침해'),
('1711', 'Confiscate property', '재산 압수'),
('1712', 'Destroy property', '재산 파괴'),
('172', 'Other administrative sanctions', '기타 행정 체재 제한'),
('1721', 'Restrictions on political freedoms', '정치적 자유 제한'),
('1722', 'Ban political politicians', '정치 활동 제한'),
('1723', 'Impose curfew', '통행금지령 선언'),
('1724', 'Impose material law', '계엄령 선포'),
('173', 'Charge with legal action', '형사 및 정치적 구금'),
('174', 'Expel individuals', '개인, 단체 국가 추방'),
('175', 'Use repression', '군중 통제'),
('18', 'ASSAULT', '폭력 사용'),
('180', 'Other violence', '기타 폭력 사용'),
('181', 'Abduct', '납치'),
('182', 'Other assults', '기타 폭행'),
('1821', 'Sexually assault', '성폭행'),
('1822', 'Torture', '고문'),
('1823', 'Kill by physical assault', '폭행으로 살해'),
('183', 'Other bombings', '기타 폭탄 테러'),
('1831', 'Suicide bombing', '자살 폭탄 테러'),
('1832', 'Car bombing', '자동차 폭탄 테러'),
('1833', 'Roadside bombing', '도로변 폭탄 테러'),
('184', 'Use as human shield', '인간 방패'),
('185', 'Attempt to assassinate', '암살 시도'),
('186', 'Assassinate', '암살'),
('19', 'FIGHT', '싸움'),
('190', 'Use conventional military force', '기타 무장단체에 의한 폭력'),
('191', 'Blockade, restrict movement', '봉쇄, 이동 제한'),
('192', 'Occupy territory', '영토 점령'),
('193', 'Fight with small weapons', '소형 무기 공격'),
('194', 'Fight with artillery and tanks', '포병, 전차 공격'),
('195', 'Employ aerial weapons', '공중무기 공격'),
('196', 'Violate ceasefire', '휴전 위반'),
('20', 'MASS VIOLENCE', '집단 폭력'),
('200', 'Other mass violence', '기타 집단 폭력'),
('201', 'Mass expulsion', '대량 추방'),
('202', 'Mass killings', '대량 학살'),
('203', 'Ethnic cleansing', '인종 말살'),
('204', 'Other weapons of mass destruction', '기타 대량살상무기 사건'),
('2041', 'Chemical, biological, radiologicalweapons', '화학, 생물학, 방사선 무기 사건'),
('2042', 'Detonate nuclear weapons', '핵폭발');
