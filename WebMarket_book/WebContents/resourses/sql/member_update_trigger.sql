CREATE DEFINER=`root`@`localhost` TRIGGER `history_member_UPDATE` AFTER UPDATE ON `member` FOR EACH ROW BEGIN
insert into history_memberUpdate values(null, old.id, old.password,old.name,old.gender,old.birth,old.mail,
        old.phone,old.zipcode,old.roadAddress, old.jibunAddress, old.detailAddress, old.extraAddress,
        new.password,new.name,new.gender,new.birth,new.mail,
        new.phone,new.zipcode,new.roadAddress, new.jibunAddress, new.detailAddress, new.extraAddress,
        curdate());
END