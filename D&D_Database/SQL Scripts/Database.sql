-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dnd
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `armor`
--

DROP TABLE IF EXISTS `armor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor` (
  `Armor_Name` varchar(20) DEFAULT NULL,
  `AC` varchar(15) DEFAULT NULL,
  `Dmg_Immune` varchar(75) DEFAULT NULL,
  `Dmg_Resist` varchar(75) DEFAULT NULL,
  `Strength` int DEFAULT NULL,
  `Stealth` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor`
--

LOCK TABLES `armor` WRITE;
/*!40000 ALTER TABLE `armor` DISABLE KEYS */;
INSERT INTO `armor` VALUES ('Chain Mail','16',NULL,NULL,13,'Disadvantage');
/*!40000 ALTER TABLE `armor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attack`
--

DROP TABLE IF EXISTS `attack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attack` (
  `Atk_Name` varchar(25) NOT NULL,
  `Mon_id` varchar(50) NOT NULL,
  `Multiattack` tinyint(1) DEFAULT NULL,
  `Hit_Bonus` int DEFAULT NULL,
  `Damage` varchar(50) DEFAULT NULL,
  `Dmg_Type` varchar(25) DEFAULT NULL,
  `Atk_Range_Ft` varchar(15) DEFAULT NULL,
  `Condition_applied` varchar(25) DEFAULT NULL,
  `Saving_Throw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Atk_Name`,`Mon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attack`
--

LOCK TABLES `attack` WRITE;
/*!40000 ALTER TABLE `attack` DISABLE KEYS */;
INSERT INTO `attack` VALUES ('Beak','Giant Eagle',1,5,'1d6+3','Piercing','5ft',NULL,NULL),('Bite','Death Dog',1,4,'1d6+2','Piercing','5ft','Poisoned','DC 12 Constitution'),('Bite','Drider',1,6,'1d4 + 2d8','Piercing, Poisoning','5ft',NULL,NULL),('Club','Acolyte',0,2,'1d4','Bludgeoning','5ft',NULL,NULL),('Greatclub','Hill Giant',1,8,'3d8+5','Bludgeoning','10FT',NULL,NULL),('Longbow','Drider',1,6,'1d8+3 + 1d8','Piercing, Poisoning','150/600ft',NULL,NULL),('Longsword','Drider',1,6,'1d10+3 (two-handed) 1d8+3 (one-handed)','Slashing','5ft',NULL,NULL),('Rock','Hill Giant',0,8,'3d10+5','Bludgeoning','60/240ft',NULL,NULL),('Talons','Giant Eagle',1,5,'2d6+3','Slashing','5ft',NULL,NULL);
/*!40000 ALTER TABLE `attack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background`
--

DROP TABLE IF EXISTS `background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `background` (
  `Back_Name` varchar(20) NOT NULL,
  `Feat_Given` varchar(20) DEFAULT NULL,
  `Personality` varchar(1500) DEFAULT NULL,
  `Ideal` varchar(1500) DEFAULT NULL,
  `Bond` varchar(1500) DEFAULT NULL,
  `Flaw` varchar(1500) DEFAULT NULL,
  `Background_items` varchar(1500) DEFAULT NULL,
  `Languages` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Back_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background`
--

LOCK TABLES `background` WRITE;
/*!40000 ALTER TABLE `background` DISABLE KEYS */;
INSERT INTO `background` VALUES ('Acolyte','Shelter of the Faith',NULL,NULL,NULL,NULL,'Holy symbol, 5 sticks of incense, vestments, a set of common clothes and a pouch containing 15 gp.','2 of your choice'),('Charlatan','False Identity',NULL,NULL,NULL,NULL,'A set of fine clothes, a disguise kit, tools of the con of your choice (ten stoppered bottles filled with colored liquid, a set of weighted dice, a deck of marked cards, or a signet ring of an imaginary duke), and a pouch containing 15 gp.',NULL),('Folk Hero','Rustic Hospitality',NULL,NULL,NULL,NULL,'A set of artisan’s tools (one of your choice), a shovel, an iron pot, a set of common clothes, and a pouch containing 10 gp.',NULL),('Knight','Retainers',NULL,NULL,NULL,NULL,'A set of fine clothes, a signet ring, a scroll of pedigree, and a purse containing 25 gp.','1 of your choice'),('Urchin','City Secrets',NULL,NULL,NULL,NULL,'A small knife, a map of the city you grew up in, a pet mouse, a token to remember your parents by, a set of common clothes, and a pouch containing 10 gp.',NULL);
/*!40000 ALTER TABLE `background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background_features`
--

DROP TABLE IF EXISTS `background_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `background_features` (
  `Back_id` varchar(20) DEFAULT NULL,
  `Feature_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_features`
--

LOCK TABLES `background_features` WRITE;
/*!40000 ALTER TABLE `background_features` DISABLE KEYS */;
INSERT INTO `background_features` VALUES ('Back_id','Features_id'),('Acolyte','Shelter of the Faithful'),('Charlatan','False Identity'),('Folk Hero','Rustic Hospitality'),('Knight','Retainers'),('Urchin','City Secrets');
/*!40000 ALTER TABLE `background_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `Class_Name` varchar(20) NOT NULL,
  `Hit_Die` varchar(4) DEFAULT NULL,
  `Starting_items` varchar(1500) DEFAULT NULL,
  `Proficiency` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`Class_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('Barbarian','1d12','a) Greataxe or b) any Martial Melee weapon, a) two handedaxes or b) any simple weapon, an Explorer\'s Pack and four Javelins','Light Armor, Medium Armor, Shields, Simple Weapons, Martial Weapons'),('Druid','1d8','a) Wooden Shield or b) any simple weapon, a) Scimitar or b) any simple melee weapon, Leather Armor, an Explorer\'s Pack, and a Druidic focus','Light Armor, Medium Armor, Shields (Will not wear armor or use shields made of metal), clubs, daggers, darts, javelins, maces, quarterstaffs, scimitars, sickles, slings, spears, herbalism kit'),('Fighter','1d10','a) Chain Mail or b) Leather armor, Lowbow, and 20 Arrows, a) Martial Weapons and a Shield, or b) two Martial Weapons, a) Light Crossbow and 20 bolts or b) two handaxes, a) a Dungeon\'s Pack or b) Explorer\'s Pack',''),('Ranger','1d10','a) Scale Mail or b) Leather Armor, a) two Shortswords or b) two simple Melee Weapons, a) a Dungeoneer\'s Pack or b) Explorer\'s Pack, a Longbow and a Quiver of 20 arrows.','Light Armor, Medium Armor, Shields, Simple Weapons, Martial Weapons'),('Rogue','1d8','a) Rapier or b) Shortsword, a) Shortbow and Quiver of 20 Arrows or b) a Shortsword, a) Burglar\'s Pack or b) Dungeon\'s Pack or c) Explorer\'s Pack, Thieve\'s Tools, Leather Armor, two daggers','Light Armor, Simple Weapons, hand crossbows, longswords, rapiers, shortswords, Thieve\'s tools');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_features`
--

DROP TABLE IF EXISTS `class_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_features` (
  `Class_id` varchar(20) DEFAULT NULL,
  `Class_lvl` int DEFAULT NULL,
  `Feature_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_features`
--

LOCK TABLES `class_features` WRITE;
/*!40000 ALTER TABLE `class_features` DISABLE KEYS */;
INSERT INTO `class_features` VALUES ('Barbarian',1,'Rage'),('Druid',1,'Druidic'),('Fighter',1,'Second Wind'),('Ranger',1,'Favored Enemy'),('Rogue',1,'Expertise'),('Barbarian',1,'Rage'),('Druid',1,'Druidic'),('Fighter',1,'Second Wind'),('Ranger',1,'Favored Enemy'),('Rogue',1,'Expertise');
/*!40000 ALTER TABLE `class_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_spell`
--

DROP TABLE IF EXISTS `class_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_spell` (
  `Class_id` varchar(20) DEFAULT NULL,
  `Spell_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_spell`
--

LOCK TABLES `class_spell` WRITE;
/*!40000 ALTER TABLE `class_spell` DISABLE KEYS */;
INSERT INTO `class_spell` VALUES ('Ranger','Chill Touch'),('Ranger','Light'),('Ranger','Sacred Flame'),('Ranger','Thaumaturgy'),('Ranger','Bless'),('Ranger','Cure Wounds'),('Ranger','Sanctuary'),('Druid','Chill Touch'),('Druid','Light'),('Druid','Sacred Flame'),('Druid','Thaumaturgy'),('Druid','Bless'),('Druid','Cure Wounds'),('Druid','Sanctuary');
/*!40000 ALTER TABLE `class_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condition_status`
--

DROP TABLE IF EXISTS `condition_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition_status` (
  `Con_Name` varchar(25) NOT NULL,
  `Descript` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`Con_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition_status`
--

LOCK TABLES `condition_status` WRITE;
/*!40000 ALTER TABLE `condition_status` DISABLE KEYS */;
INSERT INTO `condition_status` VALUES ('Blinded','A blinded creature can’t see and automatically fails any ability check that requires sight. Attack Rolls against the creature have advantage, and the creature’s Attack Rolls have disadvantage.'),('Charmed','A charmed creature can’t Attack the charmer or target the charmer with harmful Abilities or magical Effects. The charmer has advantage on any ability check to interact socially with the creature.'),('Con_Name','Descript'),('Deafened ','A deafened creature can’t hear and automatically fails any ability check that requires hearing.'),('Incapacitated ','An incapacitated creature can’t take Actions or Reactions.'),('Poisoned','A poisoned creature has disadvantage on Attack Rolls and Ability Checks.');
/*!40000 ALTER TABLE `condition_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feats`
--

DROP TABLE IF EXISTS `feats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feats` (
  `Feat_Name` varchar(25) NOT NULL,
  `Proficiency` varchar(20) DEFAULT NULL,
  `Descript` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`Feat_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feats`
--

LOCK TABLES `feats` WRITE;
/*!40000 ALTER TABLE `feats` DISABLE KEYS */;
INSERT INTO `feats` VALUES ('Alert',NULL,'Gain +5 bonus to initiative, can\'t be surprised while you are conscious, and other creatrues don\'t gain advantage on attack rolls against you as a result of being unseen by you.'),('Lightly Armored','Light Armor','Get +1 in Strength or Dexterity.'),('Lucky',NULL,'You can reroll one d20 or force to reroll an attack roll again\'st you.'),('Martial Adept',NULL,'You learn two maneuvers from Battle Master archetype and gain one superiority die (d6).'),('Poisoner','Poisoner\'s Kit','Apply bonus action and your attacks ignore resistance to poison damage.');
/*!40000 ALTER TABLE `feats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `Feature_Name` varchar(25) NOT NULL,
  `Descript` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`Feature_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES ('Additional Fighting Style','At 10th level, you can choose a second option from the Fighting Style class feature. Archery, Defense, Dueling, Great Weapon Fighting, Protection, Two-Weapon Fighting.'),('Balm of the Summer Court','At 2nd level, you become imbued with the blessings of the Summer Court. You are a font of energy that offers respite from injuries. You have a pool of fey energy represented by a number of d6s equal to your druid level. As a bonus action, you can choose one creature you can see within 120 feet of you and spend a number of those dice equal to half your druid level or less. Roll the spent dice and add them together. The target regains a number of hit points equal to the total. The target also gains 1 temporary hit point per die spent. You regain all expended dice when you finish a long rest.'),('Bestial Fury','Starting at 11th level, when you command your beast companion to take the Attack action, the beast can make two attacks, or it can take the Multiattack action if it has that action.'),('Breath Weapon','You can use your action to exhale destructive energy. Your draconic ancestry determines the size, shape, and damage type of the exhalation. When you use your breath weapon, each creature in the area of the exhalation must make a saving throw, the type of which is determined by your draconic ancestry. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level. After you use your breath weapon, you can’t use it again until you complete a short or long rest.'),('City Secrets','You know the secret patterns and flow to cities and can find passages through the urban sprawl that others would miss. When you are not in combat, you (and companions you lead) can travel between any two locations in the city twice as fast as your speed would normally allow.'),('Damage Resistance','You have resistance to the damage type.'),('Darkvision','You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can’t discern color in darkness, only shades of gray.'),('Draconic Ancestry','You have draconic ancestry. Choose one type of dragon from the Draconic Ancestry table. Your breath weapon and damage resistance are determined by the dragon type.'),('Druidic','You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message’s presence with a successful DC 15 Wisdom (Perception) check but can’t decipher it without magic.'),('Exceptional Training','Beginning at 7th level, on any of your turns when your beast companion doesn’t attack, you can use a bonus action to command the beast to take the Dash, Disengage, or Help action on its turn. In addition, the beast\'s attacks now count as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage.'),('Expertise','At 1st level, choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves’ tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 6th level, you can choose two more of your proficiencies (in skills or with thieves’ tools) to gain this benefit.'),('False Identity','You have created a second identity that includes documentation, established acquaintances, and disguises that allow you to assume that persona. Additionally, you can forge documents including official papers and personal letters, as long as you have seen an example of the kind of document or the handwriting you are trying to copy.'),('Favored Enemy','Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy. Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. Alternatively, you can select two races of humanoid (such as gnolls and orcs) as favored enemies. You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them. When you gain this feature, you also learn one language of your choice that is spoken by your favored enemies, if they speak one at all. You choose one additional favored enemy, as well as an associated language, at 6th and 14th level. As you gain levels, your choices should reflect the types of monsters you have encountered on your adventures.'),('Fey Ancestry','You have advantage on saving throws against being charmed, and magic can’t put you to sleep.'),('Frenzy','Starting when you choose this path at 3rd level, you can go into a frenzy when you rage. If you do so, for the duration of your rage you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.'),('Gnome Cunning','You have advantage on all Intelligence, Wisdom, and Charisma saving throws against magic.'),('Hidden Paths','Starting at 10th level, you can use the hidden, magical pathways that some fey use to traverse space in the blink of an eye. As a bonus action on your turn, you can teleport up to 60 feet to an unoccupied space you can see. Alternatively, you can use your action to teleport one willing creature you touch up to 30 feet to an unoccupied space you can see. You can use this feature a number of times equal to your Wisdom modifier (minimum of once), and you regain all expended uses of it when you finish a long rest.'),('Improved Critical','Beginning when you choose this archetype at 3rd level, your weapon attacks score a critical hit on a roll of 19 or 20.'),('Intimidating Presence','Beginning at 10th level, you can use your action to frighten someone with your menacing presence. When you do so, choose one creature that you can see within 30 feet of you. If the creature can see or hear you, it must succeed on a Wisdom saving throw (DC equal to 8 + your proficiency bonus + your Charisma modifier) or be frightened of you until the end of your next turn. On subsequent turns, you can use your action to extend the duration of this effect on the frightened creature until the end of your next turn. This effect ends if the creature ends its turn out of line of sight or more than 60 feet away from you. If the creature succeeds on its saving throw, you can’t use this feature on that creature again for 24 hours.'),('Keen Sense','You have proficiency in the Perception skill.'),('Menacing','You gain proficiency in the Intimidation skill.'),('Mindless Rage','Beginning at 6th level, you can’t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.'),('Rage','In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action. While raging, you gain the following benefits if you aren’t wearing heavy armor: -You have advantage on Strength checks and Strength saving throws. -When you make a melee weapon attack using Strength, you gain a bonus to the damage roll that increases as you gain levels as a barbarian, as shown in the Rage Damage column of the Barbarian table. -You have resistance to bludgeoning, piercing, and slashing damage. If you are able to cast spells, you can’t cast them or concentrate on them while raging. Your rage lasts for 1 minute. It ends early if you are knocked unconscious or if your turn ends and you haven’t attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on your turn as a bonus action. Once you have raged the number of times shown for your barbarian level in the Rages column of the Barbarian table, you must finish a long rest before you can rage again.'),('Ranger\'s Companion','At 3rd level, you gain a beast companion that accompanies you on your adventures and is trained to fight alongside you. Choose a beast that is no larger than Medium and that has a challenge rating of 1/4 or lower. Add your proficiency bonus to the beast’s AC, attack rolls, and damage rolls, as well as to any saving throws and skills it is proficient in. Its hit point maximum equals the hit point number in its stat block or four times your ranger level, whichever is higher. Like any creature, it can spend Hit Dice during a short rest to regain hit points. The beast obeys your commands as best as it can. It takes its turn on your initiative. On your turn, you can verbally command the beast where to move (no action required by you). You can use your action to verbally command it to take the Attack, Dash, Disengage, or Help action. If you don\'t issue a command, the beast takes the Dodge action. Once you have the Extra Attack feature, you can make one weapon attack yourself when you command the beast to take the Attack action. If you are incapacitated or absent, the beast acts on its own, focusing on protecting you and itself. The beast never requires your command to use its reaction, such as when making an opportunity attack. While traveling through your favored terrain with only the beast, you can move stealthily at a normal pace. If the beast dies, you can obtain a new companion by spending 8 hours magically bonding with a beast that isn’t hostile to you and that meets the requirements.'),('Relentless Endurance','When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. You can’t use this feature again until you finish a long rest.'),('Remarkable Athlete','Starting at 7th level, you can add half your proficiency bonus (round up) to any Strength, Dexterity, or Constitution check you make that doesn’t already use your proficiency bonus. In addition, when you make a running long jump, the distance you can cover increases by a number of feet equal to your Strength modifier.'),('Retainers','You have the service of three retainers loyal to your family. These retainers can be attendants or messengers, and one might be a majordomo. Your retainers are commoners who can perform mundane tasks for you, but they do not fight for you, will not follow you into obviously dangerous areas (such as dungeons), and will leave if they are frequently endangered or abused.'),('Retaliation','Starting at 14th level, when you take damage from a creature that is within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.'),('Rustic Hospitality','Since you come from the ranks of the common folk, you fit in among them with ease. You can find a place to hide, rest, or recuperate among other commoners, unless you have shown yourself to be a danger to them. They will shield you from the law or anyone else searching for you, though they will not risk their lives for you.'),('Savage Attacks','When you score a critical hit with a melee weapon attack, you can roll one of the weapon’s damage dice one additional time and add it to the extra damage of the critical hit.'),('Second Wind','You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again.'),('Share Spells','Beginning at 15th level, when you cast a spell targeting yourself, you can also affect your beast companion with the spell if the beast is within 30 feet of you.'),('Shelter of the Faithful','As an acolyte, you command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your adventuring companions can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you (but only you) at a modest lifestyle. You might also have ties to a specific temple dedicated to your chosen deity or pantheon, and you have a residence there. This could be the temple where you used to serve, if you remain on good terms with it, or a temple where you have found a new home. While near your temple, you can call upon the priests for assistance, provided the assistance you ask for is not hazardous and you remain in good standing with your temple.'),('Superior Critical','Starting at 15th level, your weapon attacks score a critical hit on a roll of 18–20.'),('Survivor','At 18th level, you attain the pinnacle of resilience in battle. At the start of each of your turns, you regain hit points equal to 5 + your Constitution modifier if you have no more than half of your hit points left. You don’t gain this benefit if you have 0 hit points.'),('Trance','Elves don’t need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day. (The Common word for such meditation is “trance.”) While meditating, you can dream after a fashion; such dreams are actually mental exercises that have become reflexive through years of practice. After resting in this way, you gain the same benefit that a human does from 8 hours of sleep.'),('Walker in Dreams','At 14th level, the magic of the Feywild grants you the ability to travel mentally or physically through dreamlands. When you finish a short rest, you can cast one of the following spells, without expending a spell slot or requiring material components: dream (with you as the messenger), scrying , or teleportation circle. This use of teleportation circle  is special. Rather than opening a portal to a permanent teleportation circle, it opens a portal to the last location where you finished a long rest on your current plane of existence. If you haven’t taken a long rest on your current plane, the spell fails but isn’t wasted. Once you use this feature, you can’t use it again until you finish a long rest.');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innate_spellcasting`
--

DROP TABLE IF EXISTS `innate_spellcasting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `innate_spellcasting` (
  `Spell_Granted` varchar(50) DEFAULT NULL,
  `Uses_per_Day` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innate_spellcasting`
--

LOCK TABLES `innate_spellcasting` WRITE;
/*!40000 ALTER TABLE `innate_spellcasting` DISABLE KEYS */;
/*!40000 ALTER TABLE `innate_spellcasting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `Item_Name` varchar(50) NOT NULL,
  `Rarity` varchar(10) DEFAULT NULL,
  `Weight_lbs` int DEFAULT NULL,
  `Price_gp` int DEFAULT NULL,
  `Magical_Properties` tinyint(1) DEFAULT NULL,
  `Descript` varchar(3000) DEFAULT NULL,
  `Item_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Item_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('Chain Mail','Common',55,75,0,'Made of interlocking metal rings, chain mail includes a layer of quilted fabric worn underneath the mail to prevent chafing and to cushion impact of blows. The suit includes gauntlets.','Heavy Armor'),('Helm of Teleportation','Rare',3,73500,1,'This helm has 3 charges. While wearing it, you can use an action and expend 1 charge to cast the teleport spell from it. The helm regains 1d3 expended charges daily at dawn.','Wondrous Item'),('Light Crossbow','Common',5,25,0,'A simple two-handed ranged weapon.','Simple Ranged Weapon'),('Longsword','Common',3,15,0,'A military one-handed melee weapon in the heavy blade weapon group. A longsword is a versatile weapon. ','Martial Melee Weapon'),('Portable hole','Rare',0,20000,0,'A portable hole is a circle of cloth spun from the webs of a phase spider interwoven with strands of ether and beams of starlight. When opened fully, a portable hole is 6 feet in diameter, but it can be folded up to be as small as a pocket handkerchief. When spread upon any surface, it causes an extradimensional space 10 feet deep to come into being. This hole can be picked up from inside or out by simply taking hold of the edges of the cloth and folding it up. Either way, the entrance disappears, but anything inside the hole remains.','Wondrous Item');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magical_properties`
--

DROP TABLE IF EXISTS `magical_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magical_properties` (
  `Item_id` varchar(50) DEFAULT NULL,
  `Attunement` tinyint(1) DEFAULT NULL,
  `Charges` int DEFAULT NULL,
  `Ability_Score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magical_properties`
--

LOCK TABLES `magical_properties` WRITE;
/*!40000 ALTER TABLE `magical_properties` DISABLE KEYS */;
INSERT INTO `magical_properties` VALUES ('Helm of Teleportation',0,3,0);
/*!40000 ALTER TABLE `magical_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magprop_class`
--

DROP TABLE IF EXISTS `magprop_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magprop_class` (
  `Item_id` varchar(20) DEFAULT NULL,
  `Class_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magprop_class`
--

LOCK TABLES `magprop_class` WRITE;
/*!40000 ALTER TABLE `magprop_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `magprop_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magprop_spell`
--

DROP TABLE IF EXISTS `magprop_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magprop_spell` (
  `Item_id` varchar(20) DEFAULT NULL,
  `Spell_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magprop_spell`
--

LOCK TABLES `magprop_spell` WRITE;
/*!40000 ALTER TABLE `magprop_spell` DISABLE KEYS */;
INSERT INTO `magprop_spell` VALUES ('Item_id','Spell_id');
/*!40000 ALTER TABLE `magprop_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_components`
--

DROP TABLE IF EXISTS `material_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_components` (
  `MC_Name` varchar(20) NOT NULL,
  `Cost_gp` float DEFAULT NULL,
  `Consumed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MC_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_components`
--

LOCK TABLES `material_components` WRITE;
/*!40000 ALTER TABLE `material_components` DISABLE KEYS */;
INSERT INTO `material_components` VALUES ('Agate',1000,1),('Brimstone',0.1,0),('Clay',0.1,0),('Glass Eye',100,0),('Jade Dust',10,1);
/*!40000 ALTER TABLE `material_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon_spell`
--

DROP TABLE IF EXISTS `mon_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mon_spell` (
  `Mon_id` varchar(50) DEFAULT NULL,
  `Spell_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon_spell`
--

LOCK TABLES `mon_spell` WRITE;
/*!40000 ALTER TABLE `mon_spell` DISABLE KEYS */;
INSERT INTO `mon_spell` VALUES ('Acolyte','Light'),('Acolyte','Sacred Flame'),('Acolyte','Thaumaturgy'),('Acolyte','Bless'),('Acolyte','Cure Wounds'),('Acolyte','Sanctuary');
/*!40000 ALTER TABLE `mon_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monster`
--

DROP TABLE IF EXISTS `monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monster` (
  `Mon_Name` varchar(50) NOT NULL,
  `Alignment` varchar(20) DEFAULT NULL,
  `Max_Hit_Point` varchar(15) DEFAULT NULL,
  `Environment` varchar(50) DEFAULT NULL,
  `CR` decimal(5,3) DEFAULT NULL,
  `Mon_Type` varchar(15) DEFAULT NULL,
  `Attributes` varchar(50) DEFAULT NULL,
  `Passive_perception` int DEFAULT NULL,
  `Characteristics` varchar(150) DEFAULT NULL,
  `Size` varchar(6) DEFAULT NULL,
  `Summonable` tinyint(1) DEFAULT NULL,
  `AC` int DEFAULT NULL,
  `Resistances` varchar(50) DEFAULT NULL,
  `Immunities` varchar(50) DEFAULT NULL,
  `Speed_ft` varchar(15) DEFAULT NULL,
  `Languages` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`Mon_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monster`
--

LOCK TABLES `monster` WRITE;
/*!40000 ALTER TABLE `monster` DISABLE KEYS */;
INSERT INTO `monster` VALUES ('Acolyte','Any','2d8','Urban',0.250,'Humanoid','Medicine +4, Religion +2',12,'Spellcasting','Medium',0,10,NULL,NULL,'30','Any one language'),('Death Dog','Neutral Evil','6d8+12','Plains, Deserts',1.000,'Monstrosity','Perception +5, Stealth +4',15,'Two-Headed, Multiattack','Medium',0,12,NULL,NULL,'40',NULL),('Drider','Chaotic Evil','13d10+52','Underdark',6.000,'Monstrosity','Perception +5, Stealth +9',15,'Fey Ancestry, Innate Spellcasting, Spider Climb, Sunlight Sensitivity, Web Walker, Multiattack','Large',0,19,NULL,NULL,'30, climb 30','Elvish, Undercommon'),('Giant Eagle','Neutral Good','4d10+4','Ice Mountains',1.000,'Beast','Perception +4',14,'Keen Sight, Multiattack','Large',1,13,NULL,NULL,'10, fly 80','Giant Eagle, Uncommon, Auran'),('Hill Giant','Chaotic Evil','10d12+40','Hill',5.000,'Giant','Perception +2',12,'Multiattack','Huge',0,13,NULL,NULL,'40','Giant');
/*!40000 ALTER TABLE `monster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_background`
--

DROP TABLE IF EXISTS `prof_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_background` (
  `Back_id` varchar(20) NOT NULL,
  `Prof_id` varchar(20) NOT NULL,
  PRIMARY KEY (`Back_id`,`Prof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_background`
--

LOCK TABLES `prof_background` WRITE;
/*!40000 ALTER TABLE `prof_background` DISABLE KEYS */;
INSERT INTO `prof_background` VALUES ('Acolyte','Insight'),('Acolyte','Religion'),('Back_id','Prof_id'),('Charlatan','Deception'),('Charlatan','Disguise Kit'),('Charlatan','Forgery Kit'),('Charlatan','Sleight of Hand'),('Folk Hero','Animal Handling'),('Folk Hero','Artisan Tools'),('Folk Hero','Survival'),('Folk Hero','Vehicles(land)'),('Knight','Gaming Sets'),('Knight','History'),('Knight','Persuasion'),('Urchin','Disguise Kit'),('Urchin','Sleight of Hand'),('Urchin','Stealth'),('Urchin','Thieve\'s Tools');
/*!40000 ALTER TABLE `prof_background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_class`
--

DROP TABLE IF EXISTS `prof_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_class` (
  `Class_id` varchar(20) DEFAULT NULL,
  `Prof_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_class`
--

LOCK TABLES `prof_class` WRITE;
/*!40000 ALTER TABLE `prof_class` DISABLE KEYS */;
INSERT INTO `prof_class` VALUES ('Barbarian','Light Armor'),('Barbarian','Medium Armor'),('Barbarian','Shields'),('Barbarian','Simple Weapons'),('Barbarian','Martial Weapons'),('Barbarian','Saving Throw Const'),('Barbarian','Saving Throw Str'),('Barbarian','Animal Handling'),('Barbarian','Athletics'),('Barbarian','Intimidation'),('Barbarian','Nature'),('Barbarian','Perception'),('Barbarian','Survival'),('Druid','Light Armor'),('Druid','Medium Armor'),('Druid','Shields'),('Druid','Clubs'),('Druid','Daggers'),('Druid','Darts'),('Druid','Javelins'),('Druid','Maces'),('Druid','Quarterstaffs'),('Druid','Scimitars'),('Druid','Sickles'),('Druid','Slings'),('Druid','Spears'),('Druid','Herbalsim Kit'),('Druid','Saving Throw Int'),('Druid','Saving Throw Wis'),('Druid','Arcana'),('Druid','Animal Handling'),('Druid','Insight'),('Druid','Medicine'),('Druid','Nature'),('Druid','Perception'),('Druid','Religion'),('Druid','Survival'),('Fighter','Light Armor'),('Fighter','Medium Armor'),('Fighter','Heavy Armor'),('Fighter','Shields'),('Fighter','Simple Weapons'),('Fighter','Martial Weapons'),('Fighter','Saving Throw Str'),('Fighter','Saving Throw Const'),('Fighter','Acrobatics'),('Fighter','Animal Handling'),('Fighter','Athletics'),('Fighter','History'),('Fighter','Insight'),('Fighter','Intimidation'),('Fighter','Perception'),('Fighter','Survival'),('Ranger','Light Armor'),('Ranger','Medium Armor'),('Ranger','Shields'),('Ranger','Simple Weapons'),('Ranger','Martial Weapons'),('Ranger','Saving Throw Str'),('Ranger','Saving Throw Dex'),('Ranger','Animal Handling'),('Ranger','Athletics'),('Ranger','Insight'),('Ranger','Investigation'),('Ranger','Nature'),('Ranger','Perception'),('Ranger','Stealth'),('Ranger','Survival'),('Rogue','Light Armor'),('Rogue','Simple Weapons'),('Rogue','Hand Crossbows'),('Rogue','Longswords'),('Rogue','Rapiers'),('Rogue','Shortswords'),('Rogue','Thieve\'s Tools'),('Rogue','Saving Throw Dex'),('Rogue','Saving Throw Int'),('Rogue','Acrobatics'),('Rogue','Athletics'),('Rogue','Deception'),('Rogue','Insight'),('Rogue','Intimidation'),('Rogue','Investigation'),('Rogue','Perception'),('Rogue','Performance'),('Rogue','Persuasion'),('Rogue','Sleight of Hand'),('Rogue','Stealth');
/*!40000 ALTER TABLE `prof_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proficiency`
--

DROP TABLE IF EXISTS `proficiency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proficiency` (
  `P_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proficiency`
--

LOCK TABLES `proficiency` WRITE;
/*!40000 ALTER TABLE `proficiency` DISABLE KEYS */;
INSERT INTO `proficiency` VALUES ('Acrobatics'),('Animal Handling'),('Arcana'),('Artisan Tools'),('Athletics '),('Clubs'),('Daggers'),('Darts'),('Deception'),('Disguise Kit'),('Forgery Kit'),('Gaming Sets'),('Hand Crossbows'),('Heavy Armor'),('Herbalism Kit'),('History'),('Insight'),('Intimidation'),('Investigation'),('Javelins'),('Light Armor'),('Longswords'),('Maces'),('Martial Weapons'),('Medicine'),('Medium Armor'),('Nature'),('Perception'),('Performance'),('Persuasion'),('Poisoner\'s Kit'),('Quarterstaffs'),('Rapiers'),('Religion'),('Saving Throw Char'),('Saving Throw Const'),('Saving Throw Dex'),('Saving Throw Int'),('Saving Throw Str'),('Saving Throw Wis'),('Scimitars'),('Shields'),('Shortswords'),('Sickles'),('Simple Weapons'),('Sleight of Hand'),('Slings'),('Spears'),('Stealth'),('Survival'),('Theieve\'s Tools'),('Vehicles(land)');
/*!40000 ALTER TABLE `proficiency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `Race_Name` varchar(20) NOT NULL,
  `Size` varchar(15) DEFAULT NULL,
  `Avg_Weight_lbs` int DEFAULT NULL,
  `Avg_Max_Age` int DEFAULT NULL,
  `Speed_ft` int DEFAULT NULL,
  `Alignment` varchar(13) DEFAULT NULL,
  `Languages` varchar(75) DEFAULT NULL,
  `Ability_Score_Inc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Race_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES ('Dragonborn','Medium',250,80,30,'Good','Draconic, Common','Str+2, Chr+1'),('Elf','Medium',150,750,30,'Chaotic','Elvish, Common','Dex+2'),('Gnome','Small',40,500,25,'Good','Gnomish, Common','Int+2'),('Half-Orc','Medium',190,75,30,'Evil','Orc, Common','Str+2, Const+1'),('Human','Medium',184,80,30,'No Particular','Common +1','All+1');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race_feature`
--

DROP TABLE IF EXISTS `race_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race_feature` (
  `Race_id` varchar(20) DEFAULT NULL,
  `Feature_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_feature`
--

LOCK TABLES `race_feature` WRITE;
/*!40000 ALTER TABLE `race_feature` DISABLE KEYS */;
INSERT INTO `race_feature` VALUES ('Dragonborn','Draconic Ancestry'),('Dragonborn','Breath Weapon'),('Dragonborn','Damage Resistance'),('Elf','Darkvision'),('Elf','Keen Senses'),('Elf','Fey Ancestry'),('Elf','Trance'),('Half-Orce','Darkvision'),('Half-Orce','Menacing'),('Half-Orce','Relentless Endurance'),('Half-Orce','Savage Attacks'),('Gnome','Darkvision'),('Gnome','Gnome Cunning');
/*!40000 ALTER TABLE `race_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race_spell`
--

DROP TABLE IF EXISTS `race_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race_spell` (
  `Race_id` varchar(20) DEFAULT NULL,
  `Spell_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_spell`
--

LOCK TABLES `race_spell` WRITE;
/*!40000 ALTER TABLE `race_spell` DISABLE KEYS */;
INSERT INTO `race_spell` VALUES ('1','Hellish Rebuke'),('1','Breath Weapon'),('1','Darkness'),('1','Faerie Fire'),('Unlimited','Dancing Lights');
/*!40000 ALTER TABLE `race_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_of_magic`
--

DROP TABLE IF EXISTS `school_of_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_of_magic` (
  `SM_Name` varchar(20) NOT NULL,
  `Descript` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`SM_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_of_magic`
--

LOCK TABLES `school_of_magic` WRITE;
/*!40000 ALTER TABLE `school_of_magic` DISABLE KEYS */;
INSERT INTO `school_of_magic` VALUES ('Abjuration','Spells that protect, block, or banish. An abjuration specialist is called an abjurer.'),('Conjuration','Spells that bring creatures or materials to the caster. A conjuration specialist is called a conjurer.'),('Divination','Spells that reveal information. A divination specialist is called a diviner. Unlike the other specialists, a diviner must give up only one other school.'),('Enchantment','Spells that imbue the recipient with some property or grant the caster power over another being. An enchantment specialist is called an enchanter.'),('Evocation','Spells that manipulate energy or create something from nothing. An evocation specialist is called an evoker.'),('Iillusion','Spells that alter perception or create false images. An illusion specialist is called an illusionist.'),('Necromancy','Spells that manipulate, create, or destroy life or life force. A necromancy specialist is called a necromancer. '),('Transmutation','Spells that transform the recipient physically or change its properties in a more subtle way. A transmutation specialist is called a transmuter.');
/*!40000 ALTER TABLE `school_of_magic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `Skill_Name` varchar(25) DEFAULT NULL,
  `Attribute` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES ('Skill_Name','Attribute'),('Acrobatics','Dex'),('Animal Handling','Wis'),('Arcana','Int'),('Athletics ','Str'),('Deception','Char'),('History','Int'),('Insight','Wis'),('Intimidation','Char'),('Investigation','Int'),('Medicine','Wis'),('Nature','Int'),('Perception','Wis'),('Performance','Char'),('Persuasion','Char'),('Religion','Int'),('Sleight of Hand','Dex'),('Stealth','Dex'),('Survival','Wis');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell`
--

DROP TABLE IF EXISTS `spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell` (
  `Spell_Name` varchar(50) NOT NULL,
  `S_Level` varchar(8) DEFAULT NULL,
  `S_Range` varchar(6) DEFAULT NULL,
  `Components` varchar(7) DEFAULT NULL,
  `Duration` varchar(20) DEFAULT NULL,
  `Casting_Time` varchar(15) DEFAULT NULL,
  `Dmg_Type` varchar(20) DEFAULT NULL,
  `Condition_Applied` varchar(25) DEFAULT NULL,
  `School` varchar(20) DEFAULT NULL,
  `Descript` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`Spell_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell`
--

LOCK TABLES `spell` WRITE;
/*!40000 ALTER TABLE `spell` DISABLE KEYS */;
INSERT INTO `spell` VALUES ('Acid Throw','2','90ft','V,S,M','instantaneous','1 action','Acid',NULL,'Evocation','A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn.'),('Chill Touch','Cantrip','120FT','V,S','1 round','1 action','Necrotic',NULL,'Necromancy','You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can’t regain hit points until the start of your next turn. Until then, the hand clings to the target. If you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn. This spell’s damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).'),('Cure Wounds','1','touch','V,S','instantaneous','1 action',NULL,NULL,'Evocation','A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.'),('Fireball','3','150ft','V,S,M','instantaneous','1 action','Fire',NULL,'Evocation','A bright streak flashes from your pointing finger to a point you choose within range and then blossoms with a low roar into an explosion of flame. Each creature in a 20-foot-radius sphere centered on that point must make a Dexterity saving throw. A target takes 8d6 fire damage on a failed save, or half as much damage on a successful one. The fire spreads around corners. It ignites flammable objects in the area that aren’t being worn or carried.'),('Gilbness','8','self','V','1 hour','1 action',NULL,NULL,'Transmutation','Until the spell ends, when you make a Charisma check, you can replace the number you roll with a 15. Additionally, no matter what you say, magic that would determine if you are telling the truth indicates that you are being truthful.'),('Light','cantrip','touch','V,M','1 hour','1 action',NULL,NULL,'Evocation','You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action. If you target an object held or worn by a hostile creature, that creature must succeed on a Dexterity saving throw to avoid the spell.'),('Sacred Flame','cantrip','60ft','V,S','instantaneous','1 action','Radiant',NULL,'Evocation','Flame-like radiance descends on a creature that you can see within range. The target must succeed on a Dexterity saving throw or take 1d8 radiant damage. The target gains no benefit from cover for this saving throw.'),('Sanctuary','1','30ft','V,S,M','1 minute','1 bonus action',NULL,NULL,'Abjuration','You ward a creature within range against attack. Until the spell ends, any creature who targets the warded creature with an attack or a harmful spell must first make a Wisdom saving throw. On a failed save, the creature must choose a new target or lose the attack or spell. This spell doesn’t protect the warded creature from area effects, such as the explosion of a fireball. If the warded creature makes an attack or casts a spell that affects an enemy creature, this spell ends.'),('Teleport','7','10ft','V','instantaneous','1 action',NULL,NULL,'Conjuration','This spell instantly transports you and up to eight willing creatures of your choice that you can see within range, or a single object that you can see within range, to a destination you select. If you target an object, it must be able to fit entirely inside a 10-foot cube, and it can\'t be held or carried by an unwilling creature. The destination you choose must be known to you, and it must be on the same plane of existence as you. Your familiarity with the destination determines whether you arrive there successfully.'),('Thaumaturgy','cantrip','30ft','V','up to 1 minute','1 action',NULL,NULL,'Transmutation','You manifest a minor wonder, a sign of supernatural power, within range. You create one of the following magical effects within range: Your voice booms up to three times as loud as normal for 1 minute, You cause flames to flicker, brighten, dim, or change color for 1 minute, You cause harmless tremors in the ground for 1 minute, You create an instantaneous sound that originates from a point of your choice within range, such as a rumble of thunder, the cry of a raven, or ominous whispers, You instantaneously cause an unlocked door or window to fly open or slam shut, You alter the appearance of your eyes for 1 minute. If you cast this spell multiple times, you can have up to three of its 1-minute effects active at a time, and you can dismiss such an effect as an action.');
/*!40000 ALTER TABLE `spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_features`
--

DROP TABLE IF EXISTS `sub_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_features` (
  `Sub_id` varchar(20) DEFAULT NULL,
  `Feature_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_features`
--

LOCK TABLES `sub_features` WRITE;
/*!40000 ALTER TABLE `sub_features` DISABLE KEYS */;
INSERT INTO `sub_features` VALUES ('Berserker','Frenzy'),('Berserker','Mindless Rage'),('Berserker','Intimidating Presence'),('Berserker','Retaliation'),('Cirlcle of Dreams','Balm of the Summer Court'),('Cirlcle of Dreams','Hidden Paths'),('Cirlcle of Dreams','Walker in Dreams'),('Champion','Improved Critical'),('Champion','Remarkable Athlete'),('Champion','Additional Fighting Style'),('Champion','Superior Critical'),('Champion','Survivor'),('Beast Master','Ranger\'s Companion'),('Beast Master','Exceptional Training'),('Beast Master','Bestial Fury'),('Beast Master','Share Spells'),('Assassin','Assassinate'),('Assassin','Infiltration Expertise'),('Assassin','Imposter'),('Assassin','Death Strike');
/*!40000 ALTER TABLE `sub_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_spell`
--

DROP TABLE IF EXISTS `sub_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_spell` (
  `Sub_id` varchar(20) DEFAULT NULL,
  `Spell_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_spell`
--

LOCK TABLES `sub_spell` WRITE;
/*!40000 ALTER TABLE `sub_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subclass`
--

DROP TABLE IF EXISTS `subclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subclass` (
  `Sub_Name` varchar(20) NOT NULL,
  `Class_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subclass`
--

LOCK TABLES `subclass` WRITE;
/*!40000 ALTER TABLE `subclass` DISABLE KEYS */;
INSERT INTO `subclass` VALUES ('Berserker','Barbarian'),('Champion','Fighter'),('Beast Master','Ranger'),('Circle of Dreams','Druid'),('Assassin','Rogue');
/*!40000 ALTER TABLE `subclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon`
--

DROP TABLE IF EXISTS `weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapon` (
  `Weap_Name` varchar(20) DEFAULT NULL,
  `Damage` varchar(5) DEFAULT NULL,
  `Dmg_Type` varchar(20) DEFAULT NULL,
  `Properties` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon`
--

LOCK TABLES `weapon` WRITE;
/*!40000 ALTER TABLE `weapon` DISABLE KEYS */;
INSERT INTO `weapon` VALUES ('Longsword','1d8','Slashing','Versatile'),('Light Crossbow','1d8','Piercing','Ammunition, Loading, Range(80/320), Two-Handed');
/*!40000 ALTER TABLE `weapon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-08  1:51:32
