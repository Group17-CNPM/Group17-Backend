-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th2 02, 2023 lúc 06:26 PM
-- Phiên bản máy phục vụ: 8.0.32
-- Phiên bản PHP: 7.4.3-4ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlynhankhau`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhsachnopphi`
--

CREATE TABLE `danhsachnopphi` (
  `id` int NOT NULL,
  `idkhoanthu` int NOT NULL,
  `sohokhau` int NOT NULL,
  `sotien` int NOT NULL,
  `nguoinop` varchar(255) NOT NULL,
  `ngaynop` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hokhau`
--

CREATE TABLE `hokhau` (
  `sohokhau` int NOT NULL,
  `idchuho` int NOT NULL,
  `sonha` varchar(255) NOT NULL,
  `duong` varchar(255) NOT NULL,
  `phuong` varchar(255) NOT NULL,
  `quan` varchar(255) NOT NULL,
  `ngaylamhokhau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hokhau`
--

INSERT INTO `hokhau` (`sohokhau`, `idchuho`, `sonha`, `duong`, `phuong`, `quan`, `ngaylamhokhau`) VALUES
(1, 1, '123', '113', 'Bách Khoa', 'Hai Bà Tưng', '2022-12-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoanthu`
--

CREATE TABLE `khoanthu` (
  `id` int NOT NULL,
  `ngaytao` varchar(255) NOT NULL,
  `thoihan` varchar(255) NOT NULL,
  `tenkhoanthu` varchar(255) NOT NULL,
  `batbuoc` tinyint(1) NOT NULL,
  `ghichu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsu`
--

CREATE TABLE `lichsu` (
  `id` int NOT NULL,
  `sohokhau` int NOT NULL,
  `idnhankhau` int NOT NULL,
  `loaithaydoi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '0: tạo mới hộ khẩu, 1: Thêm nhân khẩu vào hộ khẩu, 2: Xóa nhân khẩu khỏi hộ khẩu',
  `thoigian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsu`
--

INSERT INTO `lichsu` (`id`, `sohokhau`, `idnhankhau`, `loaithaydoi`, `thoigian`) VALUES
(29, 1, 7, '1', '2023-01-15 21:41:43'),
(30, 1, 9, '1', '2023-1-16 16:7:1'),
(31, 1, 15, '1', '2023-1-16 16:9:6'),
(32, 1, 7, '2', '2023-2-2 23:49:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `token` varchar(255) NOT NULL,
  `deviceid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`token`, `deviceid`, `username`, `time`) VALUES
('35574194036a0b6e43f5297240ba7ab7', NULL, 'ketoan', '2023-2-2 23:40:36'),
('db0fcf473f6d2c1458044326c928e228', NULL, 'admin', '2023-2-2 23:46:5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhankhau`
--

CREATE TABLE `nhankhau` (
  `id` int NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ngaysinh` varchar(255) NOT NULL,
  `gioitinh` tinyint(1) NOT NULL,
  `quequan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dantoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tongiao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sohokhau` int DEFAULT NULL,
  `quanhevoichuho` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cccd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `capngay` varchar(255) DEFAULT NULL,
  `noicap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nghenghiep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ngaydangkythuongtru` varchar(255) DEFAULT NULL,
  `ngaythemnhankhau` varchar(255) DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nhankhau`
--

INSERT INTO `nhankhau` (`id`, `hoten`, `ngaysinh`, `gioitinh`, `quequan`, `dantoc`, `tongiao`, `sohokhau`, `quanhevoichuho`, `cccd`, `capngay`, `noicap`, `nghenghiep`, `ngaydangkythuongtru`, `ngaythemnhankhau`, `ghichu`) VALUES
(1, 'Trần Văn Phúc', '2001-04-22', 1, 'Hưng Yên', 'Kinh', 'Không', 1, 'Là chủ hộ', '12345678910', '2022-12-12', 'Bách Khoa Hà Nội', 'Sinh viên', '2022-12-12', '2022-12-12', 'Okay babeêrere'),
(4, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là con', '12345678912', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(5, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là con', '12345678913', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(6, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là con', '12345678914', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(7, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là con', '12345678915', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(8, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là con', '12345678916', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(9, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 1, 'Là con', '12345678917', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(15, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 1, 'Là con', '12345678920', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tamtrutamvang`
--

CREATE TABLE `tamtrutamvang` (
  `id` int NOT NULL,
  `idnhankhau` int NOT NULL,
  `trangthai` tinyint(1) NOT NULL,
  `diachitamtrutamvang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `thoigian` varchar(255) DEFAULT NULL,
  `noidungdenghi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `vaitro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1: Ban quản lý, 2: Kế toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `vaitro`) VALUES
('admin', 'admin', 'tranphuc8a@gmail.com', '1'),
('ketoan', 'admin', 'tranphuc8a@gmail.com', '1'),
('ketoan2', 'admin', 'tranphuc8b@gmail.com', '1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `danhsachnopphi`
--
ALTER TABLE `danhsachnopphi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `danhsachnopphi_fk0` (`idkhoanthu`),
  ADD KEY `danhsachnopphi_fk1` (`sohokhau`);

--
-- Chỉ mục cho bảng `hokhau`
--
ALTER TABLE `hokhau`
  ADD PRIMARY KEY (`sohokhau`),
  ADD KEY `idchuho` (`idchuho`);

--
-- Chỉ mục cho bảng `khoanthu`
--
ALTER TABLE `khoanthu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lichsu`
--
ALTER TABLE `lichsu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lichsu_fk0` (`sohokhau`),
  ADD KEY `idnhankhau` (`idnhankhau`);

--
-- Chỉ mục cho bảng `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`token`),
  ADD KEY `Login_fk0` (`username`);

--
-- Chỉ mục cho bảng `nhankhau`
--
ALTER TABLE `nhankhau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhankhau_fk0` (`sohokhau`);

--
-- Chỉ mục cho bảng `tamtrutamvang`
--
ALTER TABLE `tamtrutamvang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idnhankhau` (`idnhankhau`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hokhau`
--
ALTER TABLE `hokhau`
  MODIFY `sohokhau` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `khoanthu`
--
ALTER TABLE `khoanthu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lichsu`
--
ALTER TABLE `lichsu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `nhankhau`
--
ALTER TABLE `nhankhau`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tamtrutamvang`
--
ALTER TABLE `tamtrutamvang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `danhsachnopphi`
--
ALTER TABLE `danhsachnopphi`
  ADD CONSTRAINT `danhsachnopphi_fk0` FOREIGN KEY (`idkhoanthu`) REFERENCES `khoanthu` (`id`),
  ADD CONSTRAINT `danhsachnopphi_fk1` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau` (`sohokhau`);

--
-- Các ràng buộc cho bảng `hokhau`
--
ALTER TABLE `hokhau`
  ADD CONSTRAINT `hokhau_ibfk_1` FOREIGN KEY (`idchuho`) REFERENCES `nhankhau` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `lichsu`
--
ALTER TABLE `lichsu`
  ADD CONSTRAINT `lichsu_fk0` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau` (`sohokhau`),
  ADD CONSTRAINT `lichsu_ibfk_1` FOREIGN KEY (`idnhankhau`) REFERENCES `nhankhau` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `Login_fk0` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `nhankhau`
--
ALTER TABLE `nhankhau`
  ADD CONSTRAINT `nhankhau_fk0` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau` (`sohokhau`);

--
-- Các ràng buộc cho bảng `tamtrutamvang`
--
ALTER TABLE `tamtrutamvang`
  ADD CONSTRAINT `tamtrutamvang_ibfk_1` FOREIGN KEY (`idnhankhau`) REFERENCES `nhankhau` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
