-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 07, 2023 lúc 07:36 PM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 7.4.3

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
  `ngaynop` date NOT NULL
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
  `ngaylamhokhau` date NOT NULL
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
  `ngaytao` date NOT NULL,
  `thoihan` date NOT NULL,
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
  `loaithaydoi` varchar(255) NOT NULL,
  `thoigian` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `token` varchar(255) NOT NULL,
  `deviceid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`token`, `deviceid`, `username`, `time`) VALUES
('18a35037377897f77f9e9645457fbdba', NULL, 'admin', '2023-01-07 10:12:25'),
('24aeafccb23efe8bdba357e813deb984', NULL, 'admin', '2023-01-07 23:02:51'),
('431b923d6d803dc0d954ad8f5fbdf7cc', NULL, 'admin', '2023-01-07 14:37:59'),
('7f3dd2ebe62fc70f51c4a8044bd2d503', NULL, 'admin', '2023-01-07 16:02:36'),
('b8feee21eef244ceec6e8e3989d96744', NULL, 'admin', '2023-01-07 17:05:22'),
('c1b530d89ea0c68c7af44c62069ae695', NULL, 'admin', '2023-01-07 17:08:58'),
('f7c0ca95abb0679987609c17aa72f412', NULL, 'admin', '2023-01-07 10:59:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhankhau`
--

CREATE TABLE `nhankhau` (
  `id` int NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` tinyint(1) NOT NULL,
  `quequan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dantoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tongiao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sohokhau` int DEFAULT NULL,
  `quanhevoichuho` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cccd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `capngay` date DEFAULT NULL,
  `noicap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nghenghiep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ngaydangkythuongtru` date DEFAULT NULL,
  `ngaythemnhankhau` date DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nhankhau`
--

INSERT INTO `nhankhau` (`id`, `hoten`, `ngaysinh`, `gioitinh`, `quequan`, `dantoc`, `tongiao`, `sohokhau`, `quanhevoichuho`, `cccd`, `capngay`, `noicap`, `nghenghiep`, `ngaydangkythuongtru`, `ngaythemnhankhau`, `ghichu`) VALUES
(1, 'Trần Văn Phúc batoong', '2001-04-22', 1, 'Hưng Yên', 'Kinh', 'Không', NULL, 'Là chủ hộ', '12345678910', '2022-12-01', 'Bách Khoa Hà Nội', 'Sinh viên', '2022-12-01', '2022-12-01', 'Okay'),
(4, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 1, 'Là con', '12345678912', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tamtrutamvang`
--

CREATE TABLE `tamtrutamvang` (
  `id` int NOT NULL,
  `idnhankhau` int NOT NULL,
  `trangthai` varchar(255) NOT NULL,
  `diachitamtru` varchar(255) NOT NULL,
  `diachitamchutamvang` varchar(255) NOT NULL,
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
('admin', 'admin', 'tranphuc8a@gmail.com', '2');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhankhau`
--
ALTER TABLE `nhankhau`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
