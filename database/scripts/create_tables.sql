-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2019 at 10:11 PM
-- Server version: 10.1.36-MariaDB

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `florom`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` varchar(100) NOT NULL DEFAULT '',
  `post_id` varchar(100) DEFAULT '',
  `target_id` varchar(100) DEFAULT '',
  `user_id` varchar(100) DEFAULT '',
  `content` varchar(5000) NOT NULL DEFAULT '',
  `posted_on` int(50) DEFAULT NULL,
  `modified_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment_reaction`
--

CREATE TABLE IF NOT EXISTS `comment_reaction` (
  `comment_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `reaction` varchar(100) DEFAULT '',
  `react_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` varchar(100) NOT NULL DEFAULT '',
  `department_name` varchar(100) DEFAULT '',
  `created_by` varchar(100) DEFAULT '',
  `created_on` int(50) DEFAULT NULL,
  `hod_id` varchar(100) DEFAULT '',
  `status` varchar(20) DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_list`
--

CREATE TABLE IF NOT EXISTS `email_list` (
  `email` varchar(100) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `activated_on` int(50) DEFAULT NULL,
  `subscribe_to_news` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employment_history`
--

CREATE TABLE IF NOT EXISTS `employment_history` (
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `interview_by` varchar(100) DEFAULT '',
  `interview_on` int(50) DEFAULT NULL,
  `role_id` varchar(100) DEFAULT '',
  `qualification` varchar(100) DEFAULT '',
  `offered_by` varchar(100) DEFAULT '',
  `offered_on` int(50) DEFAULT NULL,
  `offer_accepted_on` int(50) DEFAULT NULL,
  `offer_rejected_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
  `interest_id` varchar(100) NOT NULL DEFAULT '',
  `interest_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

CREATE TABLE IF NOT EXISTS `invitation` (
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `invited_by` varchar(100) DEFAULT '',
  `invited_on` int(50) DEFAULT NULL,
  `role_id` varchar(100) DEFAULT '',
  `reason` varchar(1000) DEFAULT '',
  `accepted_on` int(50) DEFAULT NULL,
  `rejected_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE IF NOT EXISTS `nationality` (
  `nation_id` varchar(100) NOT NULL DEFAULT '',
  `nation_name` varchar(100) DEFAULT '',
  `created_by` varchar(100) DEFAULT '',
  `created_on` int(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` varchar(100) DEFAULT '',
  `title` varchar(100) DEFAULT '',
  `content` varchar(5000) NOT NULL DEFAULT '',
  `posted_on` int(50) DEFAULT NULL,
  `modified_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_interest`
--

CREATE TABLE IF NOT EXISTS `post_interest` (
  `post_id` varchar(100) NOT NULL DEFAULT '',
  `interest_id` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_reaction`
--

CREATE TABLE IF NOT EXISTS `post_reaction` (
  `post_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `reaction` varchar(100) DEFAULT '',
  `react_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` varchar(100) NOT NULL DEFAULT '',
  `role_name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT '',
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` int(50) DEFAULT NULL,
  `can_create` tinyint(100) DEFAULT NULL,
  `can_read` tinyint(100) DEFAULT '1',
  `can_update` tinyint(100) DEFAULT NULL,
  `can_delete` tinyint(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` varchar(100) NOT NULL DEFAULT '',
  `department_id` varchar(100) DEFAULT '',
  `d_o_b` varchar(100) DEFAULT '',
  `sex` varchar(100) DEFAULT '',
  `phone` varchar(100) DEFAULT '',
  `nation_id` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_role`
--

CREATE TABLE IF NOT EXISTS `staff_role` (
  `staff_id` varchar(100) NOT NULL DEFAULT '',
  `role_id` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `about` varchar(500) DEFAULT '',
  `status` varchar(20) DEFAULT 'INACTIVE',
  `register_on` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE IF NOT EXISTS `user_address` (
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `street_no` varchar(100) DEFAULT '',
  `street_name` varchar(100) DEFAULT '',
  `city` varchar(100) DEFAULT '',
  `province` varchar(100) DEFAULT '',
  `postal_code` varchar(100) DEFAULT '',
  `state` varchar(100) DEFAULT '',
  `country` varchar(100) DEFAULT '',
  `status` varchar(20) DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_interest`
--

CREATE TABLE IF NOT EXISTS `user_interest` (
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `interest_id` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_name`
--

CREATE TABLE IF NOT EXISTS `user_name` (
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) DEFAULT '',
  `other` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_pass`
--

CREATE TABLE IF NOT EXISTS `user_pass` (
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `comment_reaction`
--
ALTER TABLE `comment_reaction`
  ADD PRIMARY KEY (`comment_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `hod_id` (`hod_id`);

--
-- Indexes for table `email_list`
--
ALTER TABLE `email_list`
  ADD PRIMARY KEY (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `interview_by` (`interview_by`),
  ADD KEY `offered_by` (`offered_by`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`interest_id`),
  ADD UNIQUE KEY `interest_name` (`interest_name`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `invited_by` (`invited_by`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`nation_id`),
  ADD UNIQUE KEY `nation_name` (`nation_name`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_interest`
--
ALTER TABLE `post_interest`
  ADD PRIMARY KEY (`post_id`,`interest_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- Indexes for table `post_reaction`
--
ALTER TABLE `post_reaction`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `nation_id` (`nation_id`);

--
-- Indexes for table `staff_role`
--
ALTER TABLE `staff_role`
  ADD PRIMARY KEY (`staff_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_interest`
--
ALTER TABLE `user_interest`
  ADD PRIMARY KEY (`user_id`,`interest_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- Indexes for table `user_name`
--
ALTER TABLE `user_name`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_pass`
--
ALTER TABLE `user_pass`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `comment` (`comment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `comment_reaction`
--
ALTER TABLE `comment_reaction`
  ADD CONSTRAINT `comment_reaction_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_reaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`hod_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `email_list`
--
ALTER TABLE `email_list`
  ADD CONSTRAINT `email_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD CONSTRAINT `employment_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employment_history_ibfk_2` FOREIGN KEY (`interview_by`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employment_history_ibfk_3` FOREIGN KEY (`offered_by`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employment_history_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`invited_by`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invitation_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `nationality`
--
ALTER TABLE `nationality`
  ADD CONSTRAINT `nationality_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `post_interest`
--
ALTER TABLE `post_interest`
  ADD CONSTRAINT `post_interest_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_interest_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`interest_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_reaction`
--
ALTER TABLE `post_reaction`
  ADD CONSTRAINT `post_reaction_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_reaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`nation_id`) REFERENCES `nationality` (`nation_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `staff_role`
--
ALTER TABLE `staff_role`
  ADD CONSTRAINT `staff_role_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_interest`
--
ALTER TABLE `user_interest`
  ADD CONSTRAINT `user_interest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_interest_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`interest_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_name`
--
ALTER TABLE `user_name`
  ADD CONSTRAINT `user_name_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_pass`
--
ALTER TABLE `user_pass`
  ADD CONSTRAINT `user_pass_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;