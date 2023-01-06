-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 06, 2023 lúc 05:25 PM
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
  `cccdchuho` varchar(255) NOT NULL,
  `sonha` varchar(255) NOT NULL,
  `duong` varchar(255) NOT NULL,
  `phuong` varchar(255) NOT NULL,
  `quan` varchar(255) NOT NULL,
  `ngaylamhokhau` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hokhau`
--

INSERT INTO `hokhau` (`sohokhau`, `cccdchuho`, `sonha`, `duong`, `phuong`, `quan`, `ngaylamhokhau`) VALUES
(1, '12345678910', '123', '113', 'Bách Khoa', 'Hai Bà Tưng', '2022-12-01');

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
  `cccd` varchar(255) NOT NULL,
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
('4b3219d81f61d2a429f73ed3a35d1011', NULL, 'admin', '2023-01-06 14:44:00'),
('5ff771b4238c536bce77b50ee25a3302', NULL, 'admin', '2023-01-05 22:48:45'),
('6ba492312512bf77c99edb6b26f4bca6', NULL, 'admin', '2023-01-06 14:43:12'),
('9cab06b7372af6c59ac8884becf8d65a', NULL, 'admin', '2023-01-06 14:43:32'),
('e05b45c7c3a3f50372ec8d77abb22064', NULL, 'admin', '2023-01-06 15:18:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhankhau`
--

CREATE TABLE `nhankhau` (
  `cccd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sohokhau` int DEFAULT NULL,
  `quanhevoichuho` varchar(255) NOT NULL,
  `capngay` date NOT NULL,
  `noicap` varchar(255) NOT NULL,
  `hoten` varchar(255) NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` tinyint(1) NOT NULL,
  `quequan` varchar(255) NOT NULL,
  `dantoc` varchar(255) NOT NULL,
  `tongiao` varchar(255) NOT NULL,
  `nghenghiep` varchar(255) NOT NULL,
  `ngaydangkythuongtru` date NOT NULL,
  `ngaythemnhankhau` date NOT NULL,
  `ghichu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nhankhau`
--

INSERT INTO `nhankhau` (`cccd`, `sohokhau`, `quanhevoichuho`, `capngay`, `noicap`, `hoten`, `ngaysinh`, `gioitinh`, `quequan`, `dantoc`, `tongiao`, `nghenghiep`, `ngaydangkythuongtru`, `ngaythemnhankhau`, `ghichu`) VALUES
('12345678910', NULL, 'Là chủ hộ', '2022-12-01', 'Bách Khoa Hà Nội', 'Trần Văn Phúc', '2001-04-22', 1, 'Hưng Yên', 'Kinh', 'Không', 'Sinh viên', '2022-12-01', '2022-12-01', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tamtrutamvang`
--

CREATE TABLE `tamtrutamvang` (
  `id` int NOT NULL,
  `cccd` varchar(255) NOT NULL,
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
  `vaitro` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `vaitro`) VALUES
('admin', 'admin', 'tranphuc8a@gmail.com', 'banquanly');

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
  ADD KEY `hokhau_fk0` (`cccdchuho`);

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
  ADD KEY `lichsu_fk1` (`cccd`);

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
  ADD PRIMARY KEY (`cccd`),
  ADD KEY `nhankhau_fk0` (`sohokhau`);

--
-- Chỉ mục cho bảng `tamtrutamvang`
--
ALTER TABLE `tamtrutamvang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tamtrutamvang_fk0` (`cccd`);

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
  ADD CONSTRAINT `hokhau_fk0` FOREIGN KEY (`cccdchuho`) REFERENCES `nhankhau` (`cccd`);

--
-- Các ràng buộc cho bảng `lichsu`
--
ALTER TABLE `lichsu`
  ADD CONSTRAINT `lichsu_fk0` FOREIGN KEY (`sohokhau`) REFERENCES `hokhau` (`sohokhau`),
  ADD CONSTRAINT `lichsu_fk1` FOREIGN KEY (`cccd`) REFERENCES `nhankhau` (`cccd`);

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
  ADD CONSTRAINT `tamtrutamvang_fk0` FOREIGN KEY (`cccd`) REFERENCES `nhankhau` (`cccd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
