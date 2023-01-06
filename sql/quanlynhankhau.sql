

CREATE TABLE `users` (
	`id` INT NOT NULL,
	`username` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`vaitro` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`username`)
);

CREATE TABLE `nhankhau` (
	`id` INT NOT NULL,
	`sohokhau` INT NOT NULL,
	`quanhevoichuho` VARCHAR(255) NOT NULL,
	`cccd` VARCHAR(255) NOT NULL,
	`capngay` DATE NOT NULL,
	`noicap` VARCHAR(255) NOT NULL,
	`hoten` VARCHAR(255) NOT NULL,
	`ngaysinh` DATE NOT NULL,
	`gioitinh` BOOLEAN NOT NULL,
	`quequan` VARCHAR(255) NOT NULL,
	`dantoc` VARCHAR(255) NOT NULL,
	`tongiao` VARCHAR(255) NOT NULL,
	`nghenghiep` VARCHAR(255) NOT NULL,
	`ngaydangkythuongchu` DATE NOT NULL,
	`ngaythemnhankhau` DATE NOT NULL,
	`ghichu` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`cccd`)
);

CREATE TABLE `hokhau` (
	`sohokhau` INT NOT NULL AUTO_INCREMENT,
	`cccdchuho` VARCHAR(255) NOT NULL,
	`sonha` VARCHAR(255) NOT NULL,
	`duong` VARCHAR(255) NOT NULL,
	`phuong` VARCHAR(255) NOT NULL,
	`quan` VARCHAR(255) NOT NULL,
	`ngaylamhokhau` DATE NOT NULL,
	PRIMARY KEY (`sohokhau`)
);


CREATE TABLE `tamtrutamvang` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`cccd` VARCHAR(255) NOT NULL,
	`trangthai` VARCHAR(255) NOT NULL,
	`diachitamtru` VARCHAR(255) NOT NULL,
	`diachitamchutamvang` VARCHAR(255) NOT NULL,
	`noidungdenghi` VARCHAR(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE `lichsu` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`sohokhau` INT NOT NULL,
	`cccd` VARCHAR(255) NOT NULL,
	`loaithaydoi` VARCHAR(255) NOT NULL,
	`thoigian` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `khoanthu` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ngaytao` DATE NOT NULL,
	`thoihan` DATE NOT NULL,
	`tenkhoanthu` VARCHAR(255) NOT NULL,
	`batbuoc` BOOLEAN NOT NULL,
	`ghichu` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `danhsachnopphi` (
	`id` INT NOT NULL,
	`idkhoanthu` INT NOT NULL,
	`sohokhau` INT NOT NULL,
	`sotien` INT NOT NULL,
	`nguoinop` VARCHAR(255) NOT NULL,
	`ngaynop` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Login` (
	`token` VARCHAR(255) NOT NULL,
	`deviceid` VARCHAR(255) NOT NULL,
	`username` VARCHAR(255) NOT NULL,
	`time` DATETIME NOT NULL,
	PRIMARY KEY (`token`)
);

ALTER TABLE `hokhau` ADD CONSTRAINT `hokhau_fk0` FOREIGN KEY (`cccdchuho`) REFERENCES `nhankhau`(`cccd`);

ALTER TABLE `nhankhau` ADD CONSTRAINT `nhankhau_fk0` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau`(`sohokhau`);

ALTER TABLE `tamtrutamvang` ADD CONSTRAINT `tamtrutamvang_fk0` FOREIGN KEY (`cccd`) REFERENCES `nhankhau`(`cccd`);

ALTER TABLE `lichsu` ADD CONSTRAINT `lichsu_fk0` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau`(`sohokhau`);

ALTER TABLE `lichsu` ADD CONSTRAINT `lichsu_fk1` FOREIGN KEY (`cccd`) REFERENCES `nhankhau`(`cccd`);

ALTER TABLE `danhsachnopphi` ADD CONSTRAINT `danhsachnopphi_fk0` FOREIGN KEY (`idkhoanthu`) REFERENCES `khoanthu`(`id`);

ALTER TABLE `danhsachnopphi` ADD CONSTRAINT `danhsachnopphi_fk1` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau`(`sohokhau`);

ALTER TABLE `Login` ADD CONSTRAINT `Login_fk0` FOREIGN KEY (`username`) REFERENCES `users`(`username`);









