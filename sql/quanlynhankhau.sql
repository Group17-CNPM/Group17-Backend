-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th2 19, 2023 lúc 05:59 PM
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
  `ngaynop` varchar(255) NOT NULL,
  `ghichu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danhsachnopphi`
--

INSERT INTO `danhsachnopphi` (`id`, `idkhoanthu`, `sohokhau`, `sotien`, `nguoinop`, `ngaynop`, `ghichu`) VALUES
(2, 12, 12, 12000, 'Phúc', '2023-02-16', 'Quá đẹp trai'),
(15, 100, 12, 10000, 'nghia', '2023-2-13 17:2:5', '1'),
(16, 100, 59, 1000000, 'Phúc', '2023-2-19 23:45:4', NULL);

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
(12, 8, '171212', 'Lê Thanh Nghị 16', 'Đồng Tâm', 'Hai Bà Trưng', '1221-12-12'),
(59, 25, '989', 'Sandy Neck', 'Lake Zariaville', 'Kreigerborough', '1987-08-28'),
(66, 4, '249', 'Nicholaus Island', 'South Aleenland', 'New Mustafa', '1980-09-24'),
(67, 88, '249', 'Rowe Via', 'South Ryleigh', 'Raymundoland', '1970-11-14'),
(70, 154, '68', 'Guiseppe Expressway', 'Port Dereck', 'Reingerside', '1994-09-10'),
(83, 92, '669', 'Zachery Row', 'North Laurieville', 'Cotytown', '1972-05-31'),
(85, 3, '177', 'Stefan Landing', 'Shirleyberg', 'Hazelborough', '1979-11-26'),
(87, 163, '479', 'Cierra Shoal', 'West Emie', 'New Mackenzie', '1998-07-07'),
(91, 18, '567', 'Denesik Throughway', 'West Cotystad', 'Itzelton', '2008-07-20'),
(98, 67, '997', 'Marilyne Shores', 'South Maeveside', 'Port Angelaland', '2012-10-28'),
(102, 2, '11', 'Lê Thanh Nghị', 'Đồng Tâm', 'Hai Bà Trưng', '2001-11-11 0:0:0'),
(104, 16, '123', '123', '123', '123', '2122-12-31'),
(112, 257, '12', 'nghia', 'nghia', 'nghia', '1212-12-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoanthu`
--

CREATE TABLE `khoanthu` (
  `id` int NOT NULL,
  `ngaytao` varchar(255) NOT NULL,
  `thoihan` varchar(255) NOT NULL,
  `tenkhoanthu` varchar(255) NOT NULL,
  `money` int DEFAULT NULL,
  `batbuoc` tinyint(1) NOT NULL COMMENT '1: Bắt buộc, 0: Không bắt buộc',
  `ghichu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `khoanthu`
--

INSERT INTO `khoanthu` (`id`, `ngaytao`, `thoihan`, `tenkhoanthu`, `money`, `batbuoc`, `ghichu`) VALUES
(12, '1989-07-23', '2003-05-31', 'Et aut vitae ducimus laborum accusantium a.', NULL, 0, 'Consequatur ab soluta placeat ab minima. Eveniet et sint et nihil. Illo dolorem fugiat dolore. Maxime quo molestiae dolores tempora itaque necessitatibus.'),
(17, '2001-10-09', '2005-12-31', 'Sunt corporis id dolore labore libero quo.', 123000, 1, 'Dolorum sit dolores odit quia natus. Quaerat culpa iusto ad autem ut occaecati exercitationem omnis. Tempore sit est rerum aut aut at sunt. Totam magni atque laudantium quia quo reprehenderit adipisci.'),
(22, '1991-06-29', '1994-12-13', 'Tempora accusantium enim vel recusandae earum provident.', NULL, 0, 'Nulla et libero recusandae sunt soluta quasi voluptate. Adipisci amet qui est eveniet ut.'),
(100, '1900-12-12', '1900-12-13', 'nghia ne ', 100000, 1, 'Không có ghi chú'),
(101, '2023-2-11 24:19:18', '2023-12-12', 'Khoản thu số 1', 50000, 1, 'Không có ghi chú');

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
(336, 59, 19, '1', '2016-2-13 26:16:47'),
(337, 102, 20, '1', '2022-8-5 20:52:26'),
(338, 12, 22, '1', '2015-3-26 18:28:33'),
(339, 59, 23, '1', '1971-2-8 14:3:13'),
(343, 87, 29, '1', '1986-12-27 12:31:51'),
(344, 67, 30, '1', '1982-12-22 11:6:44'),
(346, 85, 34, '1', '2009-11-22 10:57:26'),
(347, 83, 37, '1', '2017-6-22 22:54:23'),
(348, 91, 38, '1', '2001-8-4 27:19:23'),
(349, 12, 39, '1', '1987-5-24 30:57:6'),
(350, 102, 40, '1', '1996-3-19 17:37:46'),
(351, 98, 41, '1', '2005-7-13 28:56:57'),
(354, 87, 45, '1', '2013-1-17 27:10:58'),
(355, 102, 46, '1', '1988-10-5 8:7:35'),
(356, 70, 47, '1', '1982-7-8 11:3:55'),
(357, 83, 48, '1', '1974-7-6 17:11:7'),
(358, 83, 50, '1', '1999-4-29 19:50:43'),
(359, 104, 51, '1', '1985-1-22 8:30:7'),
(360, 59, 52, '1', '2012-6-14 19:26:52'),
(362, 85, 54, '1', '2017-9-21 15:30:15'),
(363, 12, 55, '1', '1972-1-20 10:31:21'),
(364, 87, 57, '1', '1983-9-11 30:53:19'),
(365, 59, 59, '1', '1985-6-7 27:0:13'),
(366, 12, 61, '1', '1985-2-26 22:49:25'),
(367, 70, 63, '1', '1974-11-2 21:51:57'),
(368, 91, 64, '1', '2010-3-27 22:22:33'),
(371, 104, 70, '1', '2011-2-7 17:34:14'),
(372, 59, 71, '1', '2016-5-29 16:40:11'),
(373, 102, 72, '1', '2000-12-5 17:40:47'),
(374, 70, 73, '1', '1973-8-15 21:16:32'),
(376, 98, 75, '1', '2020-3-28 18:1:55'),
(377, 59, 76, '1', '2022-10-10 25:17:32'),
(378, 67, 81, '1', '2019-6-16 11:12:39'),
(380, 67, 83, '1', '2001-1-2 20:41:31'),
(381, 104, 84, '1', '1977-8-18 7:6:41'),
(383, 67, 89, '1', '1986-9-6 27:29:11'),
(384, 70, 90, '1', '2006-11-25 21:10:2'),
(386, 85, 94, '1', '1978-11-14 17:55:1'),
(388, 87, 96, '1', '2002-1-16 10:6:56'),
(391, 91, 100, '1', '1971-4-18 24:14:3'),
(393, 87, 102, '1', '1976-4-13 28:20:27'),
(394, 67, 103, '1', '2021-9-15 10:49:24'),
(395, 70, 106, '1', '1997-10-18 10:42:30'),
(397, 87, 108, '1', '1997-9-10 11:20:26'),
(398, 91, 109, '1', '1988-11-3 29:45:20'),
(399, 98, 110, '1', '1971-2-20 25:44:45'),
(400, 85, 111, '1', '2014-1-15 11:27:21'),
(401, 85, 113, '1', '1972-2-6 26:0:11'),
(403, 67, 116, '1', '2005-7-4 28:58:48'),
(404, 98, 117, '1', '1993-2-26 15:10:48'),
(405, 83, 118, '1', '1975-7-12 20:23:46'),
(406, 87, 119, '1', '1970-2-24 29:14:31'),
(407, 59, 120, '1', '1987-9-14 30:39:45'),
(409, 83, 125, '1', '2000-6-2 23:13:4'),
(410, 87, 126, '1', '1976-6-3 11:48:8'),
(413, 102, 130, '1', '1986-2-24 13:12:0'),
(416, 83, 136, '1', '1977-5-21 22:11:43'),
(417, 98, 138, '1', '2021-7-26 29:14:53'),
(418, 104, 139, '1', '1981-12-7 12:32:28'),
(419, 98, 140, '1', '1970-7-25 19:44:54'),
(420, 70, 141, '1', '2009-6-25 23:33:42'),
(422, 98, 143, '1', '2006-3-18 21:48:23'),
(424, 102, 147, '1', '1983-12-24 19:55:28'),
(425, 87, 148, '1', '2015-12-21 28:58:33'),
(428, 104, 152, '1', '2019-4-4 19:44:59'),
(429, 70, 153, '1', '2011-8-30 27:1:46'),
(430, 83, 155, '1', '2010-6-10 15:41:39'),
(431, 83, 156, '1', '1974-10-16 14:38:47'),
(432, 87, 157, '1', '1987-10-28 14:27:45'),
(433, 67, 159, '1', '2017-11-28 10:35:15'),
(435, 98, 161, '1', '2015-12-22 29:21:39'),
(436, 85, 162, '1', '1982-6-12 26:43:16'),
(438, 104, 168, '1', '1975-1-14 13:39:20'),
(440, 59, 170, '1', '1971-7-27 24:53:16'),
(441, 102, 172, '1', '2005-3-11 14:22:7'),
(442, 59, 173, '1', '2010-6-12 23:32:42'),
(443, 98, 175, '1', '2020-8-7 26:52:45'),
(446, 104, 178, '1', '2011-9-20 18:24:55'),
(447, 98, 179, '1', '2020-9-20 15:18:2'),
(448, 87, 180, '1', '2017-7-11 29:21:28'),
(449, 70, 181, '1', '2006-12-18 14:7:19'),
(451, 87, 183, '1', '2019-5-27 25:7:20'),
(453, 87, 188, '1', '1997-2-11 28:20:2'),
(455, 91, 190, '1', '2015-8-27 16:5:16'),
(457, 85, 192, '1', '1981-4-1 7:48:35'),
(458, 67, 193, '1', '2000-5-5 21:49:35'),
(459, 67, 196, '1', '1997-4-22 14:4:42'),
(460, 67, 197, '1', '1997-4-12 13:59:13'),
(463, 104, 207, '1', '1989-8-19 18:21:56'),
(465, 70, 211, '1', '1988-6-1 27:16:11'),
(466, 70, 217, '1', '1972-6-29 17:18:45'),
(469, 102, 221, '1', '1995-12-7 24:37:3'),
(470, 102, 224, '1', '2020-2-1 27:39:32'),
(472, 104, 231, '1', '2009-3-10 15:5:57'),
(473, 104, 232, '1', '2006-7-12 26:8:18'),
(474, 91, 235, '1', '1988-11-18 9:39:15'),
(475, 98, 236, '1', '1998-12-24 28:38:4'),
(476, 91, 237, '1', '2012-6-25 20:10:2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `token` varchar(255) NOT NULL,
  `deviceid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`token`, `deviceid`, `username`, `time`, `active`) VALUES
('U2FsdGVkX1//T7N5nXrcY/bsLwTBUFKlA/i/PVwHmXtAjdaNwJpiMb88wRzqCzzi', NULL, 'admin', '2023-2-17 25:11:10', 1),
('U2FsdGVkX1/+7pvB2my40Eol6rwe8Zujx7TamqhIFy7FofQ6tJHjChHkm7mkuI1L', NULL, 'admin', '2023-2-10 22:16:3', 1),
('U2FsdGVkX1/0sfyt2oqrSPJUmYoEcYwvnipOyKiP7KLc/Lx9WtxOSE5nQq4eN15f', NULL, 'admin', '2023-2-10 24:34:40', 1),
('U2FsdGVkX1/1quctRNu+3HfmmeR0vGWMVsy2EA+YVMFV0bQeKom/TReTuRo6GbfK', NULL, 'admin', '2023-2-13 17:24:47', 1),
('U2FsdGVkX1/2PAGll+rqHGSWR8bzIPjTZ7Jy8WafiKXf6d0wXn0CZtQRQdjen6lT', NULL, 'admin', '2023-2-12 20:31:43', 1),
('U2FsdGVkX1/4BojcrUf4rY0M/2wlwE0KU9+SUgJyN+5ubCj67nqAzjqGMkT6zGzf', NULL, 'admin', '2023-2-11 12:25:8', 1),
('U2FsdGVkX1/4IceNa/XoDZk/c1nB0Ddx/j5dL01bJf+QW8HVcujpmjfPPqZm9P00', NULL, 'admin', '2023-2-10 21:27:30', 1),
('U2FsdGVkX1/6B+Vs4iRxI5UlJ4b6sLqq74JJqePitOlHM6fDggqdNqKPJpwOD5e7', NULL, 'admin', '2023-2-10 21:17:34', 1),
('U2FsdGVkX1/6C61+zK4AURoeNFbaVwGTLNDe4ESRPF7i1MoXp8D4UzQf3fh0eGPn', NULL, 'admin', '2023-2-10 21:17:37', 1),
('U2FsdGVkX1/6hNZLyirxGl8W/5j+E5HV51JoFdI6QzTw2jefH0XLG+ClIY6AJROb', NULL, 'admin', '2023-2-11 13:58:48', 1),
('U2FsdGVkX1/6O7LEBe/1Hc4XqfI5CxlEREBacywoAnL4gtDarI16k2OiOpWULcah', NULL, 'admin', '2023-2-19 22:32:6', 1),
('U2FsdGVkX1/6S7L4t46O87VNRa20Tuc31dql15XaQZPpLroH1jXTnFwNYhlSjuKt', NULL, 'admin', '2023-2-13 17:24:8', 1),
('U2FsdGVkX1/6ShfpxmH2sJPNpiIXWnEOgD+ZCOW43tbSt9VflMZHV4uHD+UX1WWf', NULL, 'admin', '2023-2-10 24:40:6', 1),
('U2FsdGVkX1/6x3FEV09FPKcFgsdQdDoL9oTSKZBbE+AUXFtbgjR/fdk129BW8iya', NULL, 'admin', '2023-2-5 16:58:17', 1),
('U2FsdGVkX1/76pk4Zf9mX9CBDL+DCTC3uQg7MBSFwGWauxqJfbnA71/+KutSdSAu', NULL, 'admin', '2023-2-12 25:36:11', 1),
('U2FsdGVkX1/7bCz9pPhsETcn4fE+vF7WP8AJf9JuMalyN+j+m6C8qiPvm5SZVIRH', NULL, 'admin', '2023-2-10 21:19:57', 1),
('U2FsdGVkX1/977F+xtB12nn6j1uShoqHKh1y4iAceFOdG16oeE6bSsHUmysThjB/', NULL, 'admin', '2023-2-11 10:7:50', 1),
('U2FsdGVkX1/ag9343RAiSfb9pbxmJj5CAljdwBLMxAjOH5dI1dlhDQqhrurtZgcM', NULL, 'admin', '2023-2-11 10:17:21', 1),
('U2FsdGVkX1/ALMpmmOaQzrDT2eGPdak5ZJwYD2ASkBqIg9YVeUfykRzckZVG7A9/', NULL, 'admin', '2023-2-3 16:42:22', 0),
('U2FsdGVkX1/BNl4cxwPhjl100kHC38MNaAdHSvUu18AnCay4aWS6IBJ4wVBdRmKD', NULL, 'admin', '2023-2-10 21:49:55', 1),
('U2FsdGVkX1/cIhl21Vl+CXzZLJlWnmYAlT2lVLmqFDI3stAjPysRNw5tIk/MNRh1', NULL, 'admin', '2023-2-12 22:45:6', 1),
('U2FsdGVkX1/CoH2KwDgXAghlSwJ9jCOx6CSduAwji2neu0gyNLF3LyPZnLWu3JGm', NULL, 'admin', '2023-2-13 22:36:23', 1),
('U2FsdGVkX1/cRu3Tz7+b80vauVRXYSsVfWmwIY4Ndt7Iy7XR8rheJOYeihbCPFxj', NULL, 'admin', '2023-2-12 26:58:51', 1),
('U2FsdGVkX1/Cyi3cQIjfLhEgv1m6mJfNWtgm4MHL+EhAvWloYy3Npzn6GXVavfTf', NULL, 'admin', '2023-2-10 21:17:53', 1),
('U2FsdGVkX1/d96qgi43HwQrqxjNI6YmkeMSCuY1SP+uxWrhFgeqd3MjZdCvmL1TT', NULL, 'admin', '2023-2-12 27:10:22', 1),
('U2FsdGVkX1/dd9nM+O+Iea17g4vN6M56mIkbzn/9c1TLrRaC2269rxNC2iVSfj2d', NULL, 'admin', '2023-2-13 12:41:58', 1),
('U2FsdGVkX1/Dh77utGfCthSh2xg7BXK1GtgAsCI2g3d50f7lZ9vqDy+/nMSR84jo', NULL, 'admin', '2023-2-10 24:46:21', 1),
('U2FsdGVkX1/dycDSzR9h50cH5TxKisn5HBUS2IuEGmh9m/c0dTr6kRGCnEYE1dxM', NULL, 'admin', '2023-2-10 25:26:30', 1),
('U2FsdGVkX1/EEMMUiBwq7nL/inwbJClj/Zlm71Ld49w+f2OHCkK/s0mjDZyN2fmI', NULL, 'admin', '2023-2-10 21:17:21', 1),
('U2FsdGVkX1/eoW82C8Dduoi7dPAP3+cijoohJDc4N54eFddZUCcE3feOkcQ0WDVa', NULL, 'admin', '2023-2-13 16:22:43', 1),
('U2FsdGVkX1/eZX5pwByCDGnua3cAVW+/Uti714fwHkg+GxFeseJ5Sz5AcwxP0vyn', NULL, 'admin', '2023-2-10 21:39:22', 1),
('U2FsdGVkX1/fmXdSdQODjGXXnudOTyG3vIMl3+UPFG5R4c02Gr2B6aRtz5k6zFzq', NULL, 'admin', '2023-2-13 22:28:41', 1),
('U2FsdGVkX1/fYyuCi2GhbKedIuRP7veQhLv/ZgW0Y/8f29fFrX36EkujupVSq7bB', NULL, 'admin', '2023-2-11 13:50:1', 1),
('U2FsdGVkX1/gepKO6b6C7B6j5RQBKnZ36ofuiz9ymMef8sO1N7OvNeuqotyO8Eb3', NULL, 'admin', '2023-2-10 25:42:6', 1),
('U2FsdGVkX1/gMvVGzqnSB8IcCH/4x2Mu98TbNqDCcnsjQpuefeCa12+d0OEnXvhA', NULL, 'admin', '2023-2-10 25:21:12', 1),
('U2FsdGVkX1/gRJV84C2qfbxy4Nt0S73feVq7DI4nJJ5eSvpkzluqn1YG8D/ya6+Y', NULL, 'admin', '2023-2-12 24:41:9', 1),
('U2FsdGVkX1/gzAakvGQTQm2i3q2mnjhSyLJf8SOQYgTpLlQkQjoxlyQBY6DQ5rpa', NULL, 'admin', '2023-2-10 21:52:40', 1),
('U2FsdGVkX1/htcnMYTEHrynY76AlUN5sJbPxBaFIt8IHrBcKsNZwz23je6KKNlLZ', NULL, 'admin', '2023-2-11 18:9:40', 1),
('U2FsdGVkX1/I4lKn85pH5mkFPVKZlEaQmsjNBcxF+N80NuGRL1VUaVLgyjuTHiNq', NULL, 'admin', '2023-2-11 13:0:48', 1),
('U2FsdGVkX1/Ie2JOGt5GcMwMspAKpMPb+ICgdJ0hFDA609no5GZuAkNACJ0Uad/X', NULL, 'admin', '2023-2-13 20:9:29', 1),
('U2FsdGVkX1/IP9tHF/mPx3Qxg5WsgFnkGdOuLj6crWLsVaiumN2v0TBD2B90U9rB', NULL, 'admin', '2023-2-19 11:19:45', 1),
('U2FsdGVkX1/K3P9LfHJh+nXDJueYX9emrRvnXzkOehZlbc7hV7TJSWDWNQmCaqE6', NULL, 'admin', '2023-2-14 10:53:7', 1),
('U2FsdGVkX1/lhfu5b6ITYxYsxYT4Rluo7lk0j5S1GZ44Tl+jbcxLgYCXZtkTAztr', NULL, 'admin', '2023-2-8 22:47:52', 1),
('U2FsdGVkX1/lYZ184t7Umt7jlzzWbXdNs+8/OGXgwRKT1lqdV3mj/mJdNHUOpW99', NULL, 'admin', '2023-2-10 21:47:38', 1),
('U2FsdGVkX1/myOxW8YgTBsfG26UmF1GMv3Pxycm2Rir4IeJuuj9pSfOzeeWGfhIq', NULL, 'admin', '2023-2-10 21:49:52', 1),
('U2FsdGVkX1/n9scPFXAsVqdEe9S4VGPocJUVt4qWB1gd3k+nUjuSnPYiM/3Ofmti', NULL, 'admin', '2023-2-10 21:28:38', 1),
('U2FsdGVkX1/new9iibDFQ1RvuJB76Ji7yiY0B+yM+GW+dRvkfauMTkc/ldHri3dY', NULL, 'admin', '2023-2-10 25:26:19', 1),
('U2FsdGVkX1/NkQ2igDnPogXkNWJZFN7Xw35MXZn7fISKIUuMOpFazi65+TQLxNf0', NULL, 'admin', '2023-2-10 21:49:54', 1),
('U2FsdGVkX1/NNWeZtJS0P+DoXSl6AHK9hDV/nP5MAuhe7Ap6JglJuz08E0mPX0Hh', NULL, 'admin', '2023-2-10 25:55:34', 1),
('U2FsdGVkX1/nSEckV9JQvKgRppwxZvne++YbRujKbPSrZBoHAmCrm0hVQzL3PAIr', NULL, 'admin', '2023-2-13 18:34:25', 1),
('U2FsdGVkX1/O0zZtoVGTcwCu2SavvNLHmcqpJtdAZcwUvXjikrQcAzigun+0f1Wh', NULL, 'admin', '2023-2-13 12:34:4', 1),
('U2FsdGVkX1/OhoJF4XdHQJ3T9/ZvUZ6K3ASciL7PFzlBYAyRXeujRXA9YW+P0lfa', NULL, 'admin', '2023-2-14 8:45:58', 1),
('U2FsdGVkX1/P/FcLPXhYuZrd5CcDWXyd8Jqgo1Z6KXPuZSgDIVGjis+uo/XMCi/0', NULL, 'admin', '2023-2-11 12:23:43', 1),
('U2FsdGVkX1/pJeLGOUVtt1gLrOxkep+H7U2WnFmpah6msvLoxakfrr6xzmW3eVyW', NULL, 'admin', '2023-2-13 15:34:46', 1),
('U2FsdGVkX1/pVA48DGLKQRfFx/Jr4jwQlkaT2Nmv8ykdwq+j3cXVnHXr55FwxOkX', NULL, 'admin', '2023-2-10 25:28:30', 1),
('U2FsdGVkX1/pXOlD9zCn1qUdQU58N2zr229yrJxcP2L4SVuKWexihvcpo8eNsqhx', NULL, 'admin', '2023-2-10 22:20:11', 1),
('U2FsdGVkX1/Qeb0T5XtHL906te85GXapOTmDFcEMCa6jVu9OEOLLidtPuLJh+4lD', NULL, 'admin', '2023-2-13 12:37:50', 1),
('U2FsdGVkX1/RijrJS7FA1yweYv/g3GzSsoLY4gT1i3fXOokJE/3RZlkOx3m1fjDG', NULL, 'admin', '2023-2-12 22:34:26', 1),
('U2FsdGVkX1/sgPgbAba7eELCyDiiudgIj0Zal29iELBp6pdv/atNwfZngmVulygO', NULL, 'admin', '2023-2-10 22:17:21', 1),
('U2FsdGVkX1/t7IyoZtfaksEGgyPDZL/OU4sQ0Bh8VS0w34wa9Pk2Nsvohj34hsuf', NULL, 'admin', '2023-2-6 23:10:49', 1),
('U2FsdGVkX1/tG1r5tghJ8equICCzJNL/4WbJCJQzSuQAk643XaWgl6RxBvtbUuFP', NULL, 'admin', '2023-2-10 21:27:30', 1),
('U2FsdGVkX1/TPhUePBOrHJIjYka8fkPHN0vNa6ub0bQdsJh6ywQEqkLdptYRCvuc', NULL, 'admin', '2023-2-13 17:1:41', 1),
('U2FsdGVkX1/tpzAcm6HmVR1F7dSDhIShIEr8fX4LUe2YHMLqA+W6S/8q1nhA/dsC', NULL, 'admin', '2023-2-13 16:17:3', 1),
('U2FsdGVkX1/ufb1KHbxm7RHGVnZggI4gCdzbrHkY6oDm4j0qhk7fytS2N9dzcywF', NULL, 'admin', '2023-2-10 20:29:39', 1),
('U2FsdGVkX1/UfUS7M70hUmlcYx2+3iyLo4PfR+ZQCnzkIk/rlh/yj9LVSnkOGuJ0', NULL, 'admin', '2023-2-13 13:56:29', 1),
('U2FsdGVkX1/ULpqI+bK11olSzuLKYpNXsxuiF+lOFcVbX+7cWAX7ua/s1Kf+ByN6', NULL, 'admin', '2023-2-13 15:2:27', 1),
('U2FsdGVkX1/Unbh2gGifV3WZogBV4nImiruRrrX2SVodUbuJqauCkEG45ed0qp8D', NULL, 'admin', '2023-2-12 26:9:55', 1),
('U2FsdGVkX1/urLGfzBVb0koxpAmHdgsOxgIt0rSb/EQprFjeEFvcnRNqoh4tRLZj', NULL, 'admin', '2023-2-14 10:10:59', 1),
('U2FsdGVkX1/v4N2lVrYsZFOj54tmHc21Ov7YdVvQkR34z/UtVWOV7JC9Z7MJtMky', NULL, 'admin', '2023-2-11 10:21:36', 1),
('U2FsdGVkX1/vlgbBuCWdLzGzG54wznAxTrv9ewf1BBeyenqWm5eLFtvjpWCOCFab', NULL, 'admin', '2023-2-14 8:53:14', 1),
('U2FsdGVkX1/vRs6cqmn4NZO1BNoRn665YOGlvoqyyJY23zB2zS5JbO7AlFmpdovl', NULL, 'admin', '2023-2-12 24:53:43', 1),
('U2FsdGVkX1/w/oScx8mF/c1ZYjODpDFhV9yGvvHECgvWghxfNJQ8/Tn8h5+CQybp', NULL, 'admin', '2023-2-12 22:16:16', 1),
('U2FsdGVkX1/wTs3R1wRcofofCkFqGt8IsVRI7FpT8G8cewelrcFZflJcScMRlTzk', NULL, 'admin', '2023-2-10 24:52:40', 1),
('U2FsdGVkX1/X79nzHLu9nYvcqQ+aY9IPvlqU1DlfK0gXhB9jQ5NJ/lw19cnojdwm', NULL, 'admin', '2023-2-12 20:31:10', 1),
('U2FsdGVkX1/XgQo4t/Xdu5iyObHtdd7s/8VhsBxredYRkZnMzw3tXNMQSnMAcFNy', NULL, 'admin', '2023-2-10 21:29:8', 1),
('U2FsdGVkX1/XKNV0xpkt67yso67CcCvaL+eZTKvy+iv8tnxss3J3oAEOkegBemzZ', NULL, 'admin', '2023-2-10 21:37:17', 1),
('U2FsdGVkX1/xNAuroV+akbIEZH1CGYwvkwoVTvTzScTU1EYovV/G7JfEF6Vzib2a', NULL, 'admin', '2023-2-10 21:35:1', 1),
('U2FsdGVkX1/Xp0/tkA47jO/I6zwZ2FCAT93dEGJlekbKV6jwpIjlxaVJgP6bjXwX', NULL, 'admin', '2023-2-12 26:53:31', 1),
('U2FsdGVkX1/XpgEz4IMq7DATo5qOUpPh81dLG9rsKQNVBngW4d9kmHoC+kVPVtCg', NULL, 'admin', '2023-2-11 11:24:2', 1),
('U2FsdGVkX1/XRa1/livKQYqzspwR3SK0/G1FzN+xoHS7bL/TaQ6G5+ivKqEFmRvu', NULL, 'admin', '2023-2-3 16:42:53', 0),
('U2FsdGVkX1/YaqmDeR06YRMJfd91Yob3qhK4XZgIqI9LdmgLvN5loHyoumSj8kVU', NULL, 'admin', '2023-2-13 20:39:15', 1),
('U2FsdGVkX1/YCZuHB32ViTpJoFsknV4lYIUO+fToRrUDJcM1ygovVjTf2xDRu+dn', NULL, 'admin', '2023-2-13 10:32:6', 1),
('U2FsdGVkX1/zgP7EpeMQ6ZHWgpjA49Hli44P2rkJqe/lqsho99LmdmZxw2tDjPgy', NULL, 'admin', '2023-2-14 10:52:7', 1),
('U2FsdGVkX1/zuwMic12cvNYpQy40KvT3w8hovVT7YEZqjFJXcACcYfSCJiG9kzWj', NULL, 'admin', '2023-2-10 21:29:9', 1),
('U2FsdGVkX1+/s5Zle2VC+dikk3YUC3ap61nIzGzueW1IToPt+A65NR2UAJxCCfLN', NULL, 'admin', '2023-2-10 20:28:57', 1),
('U2FsdGVkX1++B8qRGwn6Czol4astnbPZJsc2Ff6gW3EekXS36YoQ3qOIvxoImM0U', NULL, 'admin', '2023-2-10 25:23:0', 1),
('U2FsdGVkX1++kN7mz6kg+HtzYPQsWdjI8ULWT5cEOFKXW+t596//HfFL0+vauXXF', NULL, 'admin', '2023-2-10 25:22:30', 1),
('U2FsdGVkX1+00YZiqcTmhK1G48YTWdtsduzkhM8VArL97BXmUfaW8+1iHo7eACLD', NULL, 'admin', '2023-2-10 24:46:28', 1),
('U2FsdGVkX1+06v7MuOVOEGqhQFqkm5HDB2D10xys0+hfndUbuCJEcnKIgcwrA2hk', NULL, 'admin', '2023-2-11 9:48:35', 1),
('U2FsdGVkX1+0alfOlHFDpI+3bDTQnQlcnsBfQx+GDKP4YhuYqdOwy66P3xLuGGon', NULL, 'admin', '2023-2-14 10:51:56', 1),
('U2FsdGVkX1+0sR+hC7eth135aOEHCFFCYWIuJSBnSbQV/Dr67rkC7RqP7WtUorO2', NULL, 'admin', '2023-2-3 16:44:34', 0),
('U2FsdGVkX1+2l2Umxr3iV+FGoSlo78GtkpsA7rUGmOVKpAyFvkUsEYoiS+9v3Hcc', NULL, 'admin', '2023-2-12 26:25:57', 1),
('U2FsdGVkX1+2WxXSfxYQL7mUn5yfIZYiHmrpEc1BErPEM4DqNm18eh8sTNQRQgC8', NULL, 'admin', '2023-2-14 8:19:17', 1),
('U2FsdGVkX1+31S1LqR27haK/tz3TnKVU+/kJNHck/QzX21e0EjdncCh8jbxJPsoh', NULL, 'admin', '2023-2-10 24:35:57', 1),
('U2FsdGVkX1+3XZMn24FVmzatLHbC2C8GvsKumO/tZpPpyPtQwpnWn5HuRlpBmyPy', NULL, 'admin', '2023-2-12 25:26:53', 1),
('U2FsdGVkX1+47X1QB+wTdFJcFMqK9YjzeALJUzCtdH87/I1Rnpqlg4pMImBkxziJ', NULL, 'admin', '2023-2-11 11:21:27', 1),
('U2FsdGVkX1+5CMTKGVXkAOI+3E6WKs+/RQES2E2VsMHP5GmPPNTJxBLbX4hGMluI', NULL, 'admin', '2023-2-13 15:6:30', 1),
('U2FsdGVkX1+5OjhsfNbi4gZpUeOl4hWiPd6FOVAaX6YmL3vIohxEfawX06jdiH/X', NULL, 'admin', '2023-2-12 20:54:22', 1),
('U2FsdGVkX1+6WXr83jo1XT/UKKPjUs1u8Mx46bpaBhyzC2dCs6sOQ3k1Bfl9Emo3', NULL, 'admin', '2023-2-10 24:46:22', 1),
('U2FsdGVkX1+7Ap56YhXnhZJJNzbhdm1fi9CIyMnsqLRlsryr/5hih+Q8ltIaSlUD', NULL, 'admin', '2023-2-13 14:3:35', 1),
('U2FsdGVkX1+7Xtsj7J43JXd7V4urNQtNfCp7TSz12jVPCAFVrfKXh+1+Jf5SwJDl', NULL, 'admin', '2023-2-12 26:37:28', 1),
('U2FsdGVkX1+82JBbaE/oS4zvnPiaPYwbFWACUaAoV+07PNECggan0b5AY9XqCsL1', NULL, 'admin', '2023-2-11 12:32:38', 1),
('U2FsdGVkX1+9OlMHWzlJPS0yCe4+UpgLdzkXuvc+EJWEtCwGGZXON3EyUcwUGTHj', NULL, 'admin', '2023-2-10 21:29:10', 1),
('U2FsdGVkX1+ahGwjAIXhLA72xziEkCPIqFAFIWWZhDyydxZ4ZBV+0RCU8SbveU/7', NULL, 'admin', '2023-2-13 10:22:46', 1),
('U2FsdGVkX1+AIvPZT7HwFj+Y6MAtri2MqBXte5a1wP1E5ZQ8/h9sfTzrlHcG6Ka6', NULL, 'admin', '2023-2-10 24:53:32', 1),
('U2FsdGVkX1+avKDnjP+uWNHFcjv71n6TJ4tvrQNNh8U60R7YEE4CHOItCykI6EVZ', NULL, 'admin', '2023-2-3 16:42:40', 0),
('U2FsdGVkX1+b1A4AXNT/uoaW1wnewfxes2jLtJsdpauITtOsfb/oltLXtr1ZPM/S', NULL, 'admin', '2023-2-19 21:26:1', 1),
('U2FsdGVkX1+bbAtdfDkYKsu4ka2VvL5NyNzHdIXUndaHQP1d01savHOp+43WGO0q', NULL, 'admin', '2023-2-3 17:6:34', 0),
('U2FsdGVkX1+BBsgDqY5whk49OW1oiMEacbd6+Ba+bkitcqGJY3lRC2Zglu4BeG/J', NULL, 'admin', '2023-2-11 13:59:10', 1),
('U2FsdGVkX1+bFnobupiuSJEQT5N2i/OUjwb2ckALxVP2HfbjNSnd8ddySBRhY2es', NULL, 'admin', '2023-2-10 20:27:14', 1),
('U2FsdGVkX1+bhs3lwDBXaG+549bW9l7y7+SV0ObxJBgiKOwz1kx/phg7dEDQSOf7', NULL, 'admin', '2023-2-11 14:12:46', 1),
('U2FsdGVkX1+BIxIlL+b1kCLMEH+f5dvLn2fP1dox4TEyKbkFBytt0+9dCAilk8TV', NULL, 'admin', '2023-2-10 21:48:1', 1),
('U2FsdGVkX1+bR2kklbZhcsNBaYeixHm9JOc41gPkcHLegDFx60NqVwe/khX30ILU', NULL, 'admin', '2023-2-13 22:51:10', 1),
('U2FsdGVkX1+CBDpbgvMMDZ9OPj7F5+zy+HaTVh3MDpE54eCHwsXCLYLKEtyEv4SV', NULL, 'admin', '2023-2-13 12:34:12', 1),
('U2FsdGVkX1+CV8z9Ie2QdGTfnyQwAOuwW6Q/0k6PabmAhi9j/dTkA6oDejHUx22b', NULL, 'admin', '2023-2-13 18:17:18', 1),
('U2FsdGVkX1+D991v2NvZscSq+AjOentASzsBEVyR2AWR7gJHnVuhPc8GuMa2uKrL', NULL, 'admin', '2023-2-13 22:21:4', 1),
('U2FsdGVkX1+Djv5hW691dco1e3Bng7Q5e+/Kb3vMo4t7dXajzDHMq4CqN+44NKgH', NULL, 'admin', '2023-2-10 25:22:43', 1),
('U2FsdGVkX1+DtKByBL/kW03LaEj7og53Bhb1wQmIJG02KDCuaa4PWXLNbDlZSKIk', NULL, 'admin', '2023-2-19 19:11:44', 1),
('U2FsdGVkX1+dw/leIJJm/ippglfH2DUhK/lBXPAAZ9ZS07Sk4ioR3XGgBcb9aQnw', NULL, 'admin', '2023-2-12 23:49:57', 1),
('U2FsdGVkX1+eJGHeTwDSfyrkDC9ecmF0nWH6KfM/hXz4Hbz2Rsv1Wb/RZY4meyq/', NULL, 'admin', '2023-2-19 23:44:5', 1),
('U2FsdGVkX1+eP2TMWilXOhNR8m2/urPtdYgQaoljHllwQsoQKrtu/m5Ogheth6J+', NULL, 'admin', '2023-2-12 20:50:7', 1),
('U2FsdGVkX1+EVRXwK8fa9iljOMTLrmq1bVKQaCr/Lxchr1p2MgqjdSHYTE6S9Tk2', NULL, 'admin', '2023-2-19 23:16:53', 1),
('U2FsdGVkX1+feQaNbRZkefQMcwzES6IZJsH/aZEZm6Hjw7mPafE5B3MlQ3UYUncJ', NULL, 'admin', '2023-2-12 23:34:2', 1),
('U2FsdGVkX1+FpGaTKSwMul+Myoh85LUlz7lBMPdh2J/s3aSrtbzpEBKaVN3kWoik', NULL, 'admin', '2023-2-12 22:37:33', 1),
('U2FsdGVkX1+fsSEEr6Bx85tXFZIpqQCgbz4jFdR32+mlI9STj8IZkBrTfOIpBDX7', NULL, 'admin', '2023-2-7 20:38:10', 1),
('U2FsdGVkX1+GdJvf5Yg/0J0/YHmt2byuQ194cDLA709y7q/BsjB96zEvlPnkbOzb', NULL, 'admin', '2023-2-10 21:20:31', 1),
('U2FsdGVkX1+iH4wd8OJDzytneDH5MRf7ZGMsr19wYAD4uvAzuWGkQs9+uN8IYi9p', NULL, 'admin', '2023-2-10 21:52:38', 1),
('U2FsdGVkX1+iyjIieVfrxHzJ3MRc844tyPAhIM1+IwRjcNUp4Lfhv3w7CaDExQcd', NULL, 'admin', '2023-2-7 23:25:14', 1),
('U2FsdGVkX1+J4HSY1+di8RwCcE+JulpM99pw6SA8a6VIznbxeHYJ/ewDr7BCmNil', NULL, 'admin', '2023-2-13 23:1:59', 1),
('U2FsdGVkX1+jLRpO8sERgDErsaV59Cn6B7sB1jfIFwzmY3boVMVBoU7ZKKBF4MaX', NULL, 'admin', '2023-2-10 21:19:58', 1),
('U2FsdGVkX1+jpBMRXpqDJJhO57p7aLvCfh6LPEmVDREXAg52mCntpYFTspc1JSXN', NULL, 'admin', '2023-2-12 25:31:16', 1),
('U2FsdGVkX1+JX2wXalGzKR6lNbpT3SrU+J4FJA7UIXLtEisHDjmDAEp7SPFqEysh', NULL, 'admin', '2023-2-10 22:19:56', 1),
('U2FsdGVkX1+KAuwVYq6BVXpZPjcJKRcstuSKqQbVu2oHnClwZYjnqGKhFC7sMD+3', NULL, 'admin', '2023-2-10 21:20:30', 1),
('U2FsdGVkX1+kc8khiU1Can6notqNlRJggIVjjhz5ZEKSKEPokf0JtC6ZEp8mbZQh', NULL, 'admin', '2023-2-11 9:43:6', 1),
('U2FsdGVkX1+kdlilaYydRKNa82HepXSxDi6ckFbtbORiEDRHPNip/ShVCihYaTWW', NULL, 'admin', '2023-2-10 21:49:38', 1),
('U2FsdGVkX1+KpOUcaNwXB+b+I+jnelm12ZW6Slzx3gpQOz1WRBg4A8qLInCFaWNv', NULL, 'admin', '2023-2-13 22:28:14', 1),
('U2FsdGVkX1+lEyjpIKJWqH50Vew/b0dKKyykBXA4cx7H+YEnZT97FsX8QoXhH39L', NULL, 'admin', '2023-2-10 21:12:35', 1),
('U2FsdGVkX1+lUN/oyOasa1cbK94UNXCJVvXgmeallX4hNwQ2wgDMjPhtL3OEtRb7', NULL, 'admin', '2023-2-11 13:56:29', 1),
('U2FsdGVkX1+LYgJBpXaGyA1lmGgmGRg0Cwo5hZmI92aWQwVIVQe5gJl5JcdbpTZ6', NULL, 'admin', '2023-2-10 25:22:58', 1),
('U2FsdGVkX1+Mg8tHngJ1yisxV671H9qsrtPILsL5L0BhI2IAzaAviO8TKbrpp8oE', NULL, 'admin', '2023-2-11 15:18:12', 1),
('U2FsdGVkX1+nAaAXbgjS5Q88xHOLNMFFo1PkIiindyBTPTGtmBjJ3sLN0CRSf7jS', NULL, 'admin', '2023-2-19 11:20:3', 1),
('U2FsdGVkX1+NBx8PghajTqc+WTBtZliZKn7Q35qhIvMn/Q8U1wBvEDbUtN0GJNKd', NULL, 'admin', '2023-2-11 10:5:25', 1),
('U2FsdGVkX1+nJFuRtcZNwTbdN/idPkuSRQeJ7d+b2kmfe1xMpNWqjkQepW6bURon', NULL, 'admin', '2023-2-13 13:13:9', 1),
('U2FsdGVkX1+nSZUXOOqpsoN9p41aRM8u0qcOtfpAlUZnfflr+D5sULX0A+FSvrki', NULL, 'admin', '2023-2-10 21:29:36', 1),
('U2FsdGVkX1+NXfE0ghwzSJ0sotK4rWTXLectNZtqt4qeLrldW3quBjcH4iX0e7Q2', NULL, 'admin', '2023-2-3 17:10:52', 1),
('U2FsdGVkX1+ofgfOQTunXx005HFgX/08jgkZestjAiyetpiLsmZtnptrLNaoI0Dn', NULL, 'admin', '2023-2-10 21:52:53', 1),
('U2FsdGVkX1+Ok3lut9zmGssi3NkztQ19Vigfn6CIuC+SSfUe94Dirh1oPTRQkvJt', NULL, 'admin', '2023-2-14 10:52:50', 1),
('U2FsdGVkX1+OkaQvKiv7NP0o/8l/2IY+B2qZbtEQHVOhoKJLr7VLGQ3GqrhOT818', NULL, 'admin', '2023-2-10 19:53:41', 1),
('U2FsdGVkX1+oNg7SUqZOYLceDpOBdyNgYEi2z49KfDA20ZqGh+z2nPXZDiX6xiG7', NULL, 'admin', '2023-2-10 24:53:38', 1),
('U2FsdGVkX1+OonITGKWAEK+xWzQWTKGVjBP+xjaRDzYB79wwb0l2/uZ1bz0YCNdl', NULL, 'admin', '2023-2-12 25:21:29', 1),
('U2FsdGVkX1+oWS97jE4sM3q8FoJ7BgDJR5/kJJqUckyaePI96bxNgGh1FlCfUa0/', NULL, 'admin', '2023-2-10 22:17:22', 1),
('U2FsdGVkX1+oWu+B9cv9PZOLrwB7NysOHeo+8qvgUWHRT6zdbJJYvZH9h2KT65tK', NULL, 'admin', '2023-2-12 23:34:8', 1),
('U2FsdGVkX1+payFmjaEhQ9uxVKD37AUHjxiYSWejT6Zg6Gk59OHPpNYlGRxKVLbC', NULL, 'admin', '2023-2-7 21:29:11', 1),
('U2FsdGVkX1+pewW7gU8Z1dDvvTyFb6y22le7VaseckAnOHbFVlrPNNT7/dL4X91j', NULL, 'admin', '2023-2-12 26:3:48', 1),
('U2FsdGVkX1+PwITAD14Dyj7YjDyNx5G61aLC8oFdWv/8gg9wTQ7S7uMwtcNQq/iJ', NULL, 'admin', '2023-2-18 11:54:5', 1),
('U2FsdGVkX1+pyC0Lhxgv6cH44ExAJKTU+8Wuo5uUPPS8RImIxOOlSygypah5Yjmp', NULL, 'admin', '2023-2-12 22:45:16', 1),
('U2FsdGVkX1+rnTxF8Uwvu3ZSmIcyUZ5CFfWcPwZkds0ex16pwcle6bhT7EOhrUdJ', NULL, 'admin', '2023-2-11 9:43:8', 1),
('U2FsdGVkX1+rS6aG5MrHtkSKCIjRIBw8NnTF3A15GYPicXWlCbyEFiSqCnq3Ulcg', NULL, 'admin', '2023-2-11 12:35:2', 1),
('U2FsdGVkX1+S0lAOP6uYyZxk+H1n7f5hxOfW0Vg4YpDldhCI6DU8FalYkMAa8d7D', NULL, 'admin', '2023-2-10 21:47:39', 1),
('U2FsdGVkX1+s6TYTZ+J+uc3jkXRkCGOwJxXckUp9JR163X1r1l0MsvPdB9mScCO1', NULL, 'admin', '2023-2-12 25:32:45', 1),
('U2FsdGVkX1+SBYQ4LVKjfJ8xAo2F1BEt6Vjexq+3SnMryn2lOkNRF3UJlj1dHhe6', NULL, 'admin', '2023-2-12 23:52:51', 1),
('U2FsdGVkX1+ScGRlC4GPPcC+ToQn9TzNySs2204OUR5Y24PTYM58s3k70PIgmiAU', NULL, 'admin', '2023-2-12 24:52:43', 1),
('U2FsdGVkX1+sfhgijBwU/rGCi4O/ZufaMt/Fre3gM4y+OGCIYb7Y6SJauQjBQbnU', NULL, 'admin', '2023-2-19 21:54:4', 1),
('U2FsdGVkX1+SME2kqKS7DJA0k217gsEBpBRiUHy7/yw0782B5mPo6mo45kjn0Yio', NULL, 'admin', '2023-2-19 21:8:34', 1),
('U2FsdGVkX1+soJT1WkrCRsrQUB4R04sCjScHCz3ZXqGOBvmDkJo7bL0X4CbqtIEN', NULL, 'admin', '2023-2-10 21:17:30', 1),
('U2FsdGVkX1+Sx01gu1zBUFTHaPdLHt0AVw2X+ZUe5wyiX9RX62+Eqj2tZJDNm43u', NULL, 'admin', '2023-2-10 21:12:48', 1),
('U2FsdGVkX1+TWt8cASlRxk/hRIq5SHwQPGxZf0n1KdfBCGW3UJulT2rKNJq6jsPx', NULL, 'admin', '2023-2-12 25:15:32', 1),
('U2FsdGVkX1+u652F6C7Q6Xblw49kejrILI1DE9/nM2mqFX7Nnphot3tf1LQQzFl0', NULL, 'admin', '2023-2-17 24:12:43', 1),
('U2FsdGVkX1+uE432C1ylOvgD9zEMOdopqe6bt1Q7tRa2dxZbg/01VmqZYKhMhTxh', NULL, 'admin', '2023-2-10 21:39:20', 1),
('U2FsdGVkX1+Uhl3+4j416+NdxjrajL6N9ZNg3y6o/ShkA8I4YEKnryJeVGB/glIW', NULL, 'admin', '2023-2-11 17:18:19', 1),
('U2FsdGVkX1+uhvNqIdw5IrAo+ZlmNPCf6zGnX8aVWsCDta8FBkrY7ArID92Oh3PG', NULL, 'admin', '2023-2-10 22:16:49', 1),
('U2FsdGVkX1+ujUBXWYCSXZ3Q80zvfTBYKXXjkqLcVZgEIAisue80eqyLVEbN39F1', NULL, 'admin', '2023-2-13 10:18:25', 1),
('U2FsdGVkX1+UkV8Noq4VCUHPj3XzmxtadqBDqh3tl3lmTQ5tFVunbEeUhhGqGUAV', NULL, 'admin', '2023-2-13 10:29:53', 1),
('U2FsdGVkX1+UMOAWk1zrS0horoTpZ4zYPX7yfBaXoNqGRXYrB6xk4Fy+XfDQS/PU', NULL, 'admin', '2023-2-12 26:22:7', 1),
('U2FsdGVkX1+WAybcoLAngaAmthvQ0301uZEKG4SrjqjaooRLiskCLruaRB/UK0dg', NULL, 'admin', '2023-2-10 25:26:29', 1),
('U2FsdGVkX1+wEpZ6yuH50lR4EaaTrBmLa0jPdjBWc9aFfT7gp0s4jfHQXDF6HRa7', NULL, 'admin', '2023-2-7 20:39:12', 1),
('U2FsdGVkX1+woneei2sWpZmQ72HV8KlfFJMG2Z8LPsBFhs2O+ktX+sYX5gPM14as', NULL, 'admin', '2023-2-19 21:37:40', 1),
('U2FsdGVkX1+WsVt3w/0+L2lvrfBFgXxxN9FVpoTeX/f/TdC5xEEPnBpTYHtbJeAf', NULL, 'admin', '2023-2-11 18:7:38', 1),
('U2FsdGVkX1+wVD0BM7l9M6ErqavFRTcLQNKdW527GIpyNzkShU9jVQzM//jUiIb4', NULL, 'admin', '2023-2-19 11:21:8', 1),
('U2FsdGVkX1+WyxpOWA3Dy22+juD4l4ZMR8jSfi10LR4/uYAVzjOwuPiinxEc/D3u', NULL, 'admin', '2023-2-10 21:29:34', 1),
('U2FsdGVkX1+x8xykNUwmtoNW4G52jEf7JokVurNw9597siYdYcsT1S10xgAAphwx', NULL, 'admin', '2023-2-10 25:33:7', 1),
('U2FsdGVkX1+xaP+XyebkVemmBu3fJqQ5gk0o1MvH28RSQd8IwglIaTzZJtkxXrTy', NULL, 'ketoan', '2023-2-10 19:53:32', 1),
('U2FsdGVkX1+XmUVVNdsOY6gibiwP+sogYcT4tz4tjc9UBlbrq5k6X/8syn6aokpH', NULL, 'admin', '2023-2-10 25:25:46', 1),
('U2FsdGVkX1+xpHhJIibEzd00hFAyRRVa1PQZgvKhwWFb6DUzOCp/0oJBlC+X6xNE', NULL, 'admin', '2023-2-10 19:51:22', 1),
('U2FsdGVkX1+XRwndvE0NhSw0fbsEAcgU/+UqgyhOwCqOq8KQMbpGoO9kN5FHDgCf', NULL, 'admin', '2023-2-10 24:52:41', 1),
('U2FsdGVkX1+XscyBv9GPgwm58LsjBdXBwcLoWgADhk2wf4JNfMwU+FhXRqgjkST2', NULL, 'admin', '2023-2-12 23:24:6', 1),
('U2FsdGVkX1+xYsb6Fp38M+7SqYjUr2+G+FZ08S1e8d7v+gSYJfm9WCTgPP9DuRxD', NULL, 'admin', '2023-2-11 12:45:47', 1),
('U2FsdGVkX1+Yerypxfp21JjSwuFjv+sfYwqtz8RCj2AGo4ow+wHzDAnh1Xq0Ih4O', NULL, 'admin', '2023-2-12 27:7:55', 1),
('U2FsdGVkX1+Yg3Kx9hZBFihVCzxSybrIV4D3YnmazI7ewkOyB8Cg5w2vUD+Cqc2T', NULL, 'admin', '2023-2-10 21:27:31', 1),
('U2FsdGVkX1+zwRNXhoPsGmjB3C6GJsX6QUENFJCOD8p1BF8EOdbOAb3b9xK9WUzh', NULL, 'admin', '2023-2-10 25:21:12', 1),
('U2FsdGVkX18/7bmQau/BgkgEcap26/+X7WdPxqBTRI0Z78CO3CIOQ/VuRAeDTbMJ', NULL, 'admin', '2023-2-10 25:26:24', 1),
('U2FsdGVkX18/cAvggnryC5aWKXrrmKApWpg+pTpRxKW/rcyIu7dvbdNGD0poFDH9', NULL, 'admin', '2023-2-10 21:17:43', 1),
('U2FsdGVkX18/snJWbGkc/na9PoF0QzSows+Wg5sb+sKeuzu2Y77WUTjz+AIimVXM', NULL, 'admin', '2023-2-11 17:18:13', 1),
('U2FsdGVkX18+j88Dz0o+ROJkgalORYLJRxh4aFDT9tKNEVdlk0y51Bt6arlXEfGF', NULL, 'admin', '2023-2-10 21:39:13', 1),
('U2FsdGVkX181JabMmvGIRab2aMrzFR3YBHYo2hWTRHLLgJ+1w8f/zPI33IDPw4FA', NULL, 'admin', '2023-2-10 25:27:6', 1),
('U2FsdGVkX182QSe3ySsAmGTc/+YO86ml398c9jJz3X3L04khUSb3Me0HO43evB2f', NULL, 'admin', '2023-2-3 22:56:51', 1),
('U2FsdGVkX182RHYimqsXY8ecNmoBzRRAC7VeOvvJiBQWA/a8H8kcVhOu37ibO91B', NULL, 'admin', '2023-2-10 25:26:12', 1),
('U2FsdGVkX18572fk48uD+n59Ub0vah6D8gdJwsQHTLlsVGdLiHA2JC1Wlej9Ky66', NULL, 'admin', '2023-2-10 22:20:10', 1),
('U2FsdGVkX186OR3+ooIZLaizvZmYbLaMp3FT3iWVwce6zklADiPxfDnTLhRCOnjf', NULL, 'admin', '2023-2-10 25:27:11', 1),
('U2FsdGVkX188mMzB8MpzAU5EorfyNmZs15rjbwmiMVbc59W4DZHpESm6Wqeb7db2', NULL, 'admin', '2023-2-10 24:35:50', 1),
('U2FsdGVkX188uzDNCayRrPahkuH8n9OWDOmEwVLZchZU7yGLTiSKaFTeaBrzsDIS', NULL, 'admin', '2023-2-10 21:13:33', 1),
('U2FsdGVkX189/jh4HLF+Q8kbco+9KWOyyhxX7nO0Ws8svcAIJTOdWaN3cL10WWjM', NULL, 'admin', '2023-2-14 10:21:48', 1),
('U2FsdGVkX189bV/dOOcO3vPcKzCXlSG+2g9hWWk4/iDytEQY+qMtZloGsv81d2bs', NULL, 'admin', '2023-2-19 11:20:56', 1),
('U2FsdGVkX189Xh2fF0bI2JbiH9htcpZmCtWHP/BHnrhPBEvaR4vjJ5rX1e8YwJI7', NULL, 'admin', '2023-2-10 25:29:8', 1),
('U2FsdGVkX18ABhygC2DIg1/gxH3lZCcrhYiqDF4ld8OaSwQEIsJ29BTxFnseaXeb', NULL, 'admin', '2023-2-13 15:39:3', 1),
('U2FsdGVkX18ANOaqtBohbKQjK8ksU2zABpaLkx7G8DorMBdfKMO3V4vatETvDOhO', NULL, 'admin', '2023-2-10 22:19:49', 1),
('U2FsdGVkX18aZZNwdULN8JY0DtYLaR0W2rMGNGLMAS0/yHyOf3k9y+dWkoSKMIgB', NULL, 'admin', '2023-2-13 10:28:2', 1),
('U2FsdGVkX18BCbpbjDnSUzRflNBl9i5bqzYpkRQQ2mxcCcCGDU8D8ZHGvAx/f/bF', NULL, 'admin', '2023-2-10 25:21:4', 1),
('U2FsdGVkX18Behj1RFHroSJmg48h7WnI1mVWOusRXbmjolh0MF4RhZsTG3qPtDlD', NULL, 'admin', '2023-2-3 17:10:35', 0),
('U2FsdGVkX18BVIeWd08ePVZNhKPPROqtHdxZvlnsnMIJwrSJlci2L6rjCXHYf7QF', NULL, 'admin', '2023-2-10 21:19:54', 1),
('U2FsdGVkX18CbSMzasv1zHegAF4gvEnTtG10GhZEaPb2/w7Vfg2hj/rZo85P0tbb', NULL, 'admin', '2023-2-13 18:42:30', 1),
('U2FsdGVkX18CdkDtHwXR8wVVpid2d4k3DAy1Y8e4hoNhIchb/9DTWgzGuYu+bFwI', NULL, 'admin', '2023-2-10 24:46:28', 1),
('U2FsdGVkX18dO+2Gt7bEHugnNZj0yEIq5JLKWal3mpYIoOzOxumSkNrL14zP26rr', NULL, 'admin', '2023-2-14 10:19:27', 1),
('U2FsdGVkX18eBkGgbAdFdqyVFyQ0KzLQZkJPg3suf48kBZIpnHHorX4NIMZw54kY', NULL, 'admin', '2023-2-12 27:0:52', 1),
('U2FsdGVkX18EDK5JHxYoNlVXOE6eWNz9/fTXjhhdyVv26cl27UE456OsYUybhb9K', NULL, 'admin', '2023-2-12 25:34:21', 1),
('U2FsdGVkX18eV/ZwzkUH4tZoOKOK5SWb2HQSTOFEiPJ04DhmoxQefsQjYgfpjAel', NULL, 'admin', '2023-2-12 25:40:50', 1),
('U2FsdGVkX18EXjHqjpUsfAQEo8HJK3WTzbGoRg16A/EnMODBYon7aeTICbhv79D4', NULL, 'admin', '2023-2-11 11:21:0', 1),
('U2FsdGVkX18F/j8/RIlrs3UJoSs0BZxnucpIynAdwCEx1rv8h90BMYtlrouzIT0v', NULL, 'admin', '2023-2-13 22:46:4', 1),
('U2FsdGVkX18FW+GpjM8fBYKLbJZW+9mHAZU416+pmDeTa/f1+gw8BpnTsraD6rEr', NULL, 'admin', '2023-2-10 24:43:49', 1),
('U2FsdGVkX18gF5r18nY4Fsz0G9KOrPErgYfT36ofmpvIyPRTs++8nvsrxjeuGCNy', NULL, 'admin', '2023-2-10 21:20:20', 1),
('U2FsdGVkX18H9vjyQCDvYAxTwM9f9rVW/UkNtSI7vTaMbTrSp28oavhHON2nZJM9', NULL, 'admin', '2023-2-10 21:28:47', 1),
('U2FsdGVkX18heKUuVUfmJwuYZZi2ow5Ea75FrHXTRKpxe8KwUtZ4toqBtTEqIr53', NULL, 'admin', '2023-2-14 9:21:54', 1),
('U2FsdGVkX18HmUn3wB+gEbzos32Y9EPOScOXHTGkH29VLgRWoZYYAN9E2vRi7YBJ', NULL, 'admin', '2023-2-11 14:12:58', 1),
('U2FsdGVkX18HO9gV/Z4w8uV2fadb3U5Dfeb4ZOlpVC6vVtziPq63EijCqmo0TUwO', NULL, 'admin', '2023-2-10 21:52:41', 1),
('U2FsdGVkX18HR0pctR/ohX+dgnJEVQ/EcDDvq5OdnmHryTAIvELBwDpNdaBthRBG', NULL, 'admin', '2023-2-19 22:56:16', 1),
('U2FsdGVkX18htO3eeWFcMMBTon/t3TVBfYPW3xyvYX3HYDdObUYzxwtSBKeegN2p', NULL, 'admin', '2023-2-12 23:23:58', 1),
('U2FsdGVkX18IhkQPD4SVJDFEWXYyG9vhifaQRM+yD+bcOGo1fX1p7Ifcw+2EQacF', NULL, 'admin', '2023-2-10 25:26:14', 1),
('U2FsdGVkX18IpA7zVk4kRoemfgI/paaxk4LMBqUJZqJHVmF+rOtGaoiLOdx33Pqk', NULL, 'admin', '2023-2-12 26:9:41', 1),
('U2FsdGVkX18iUe1WiTlNpIl7vTYZOZzsN1bV8VSSuL7vDy6Z39xSCJOMEDiaV3mV', NULL, 'admin', '2023-2-11 14:2:47', 1),
('U2FsdGVkX18JaESUKAI19UPL1oC7hTxLdNR/OvQHGo8u678ibLUTzF7qrxqpfHEC', NULL, 'admin', '2023-2-12 26:19:52', 1),
('U2FsdGVkX18jefxhGYky3JSh2F8RHiMiX5/FZ5N8NtVgJ8EYZItuRONo7dU38iwP', NULL, 'admin', '2023-2-12 26:9:47', 1),
('U2FsdGVkX18JZA/XjzONJ5JmWZv0ytxQQSEP2q0VjJw6emBKdNksCFcuhRdgGhw6', NULL, 'admin', '2023-2-10 21:39:21', 1),
('U2FsdGVkX18KNfezohaHlYRTXKfKRuuJHDiJy49idmEByV8m86FcIfV4QTWlBhAM', NULL, 'admin', '2023-2-12 20:32:27', 1),
('U2FsdGVkX18LeI6ilWEILnGVEc2t+VPgSFoItcUqtcfisKu95TswfewvOoWKNSP0', NULL, 'admin', '2023-2-10 24:44:18', 1),
('U2FsdGVkX18lGdw1rdO5pNn7WT9CZvvdkVSI2mlA4WSXHSKwxf8Z43FX9zl0khDE', NULL, 'admin', '2023-2-10 21:54:31', 1),
('U2FsdGVkX18Lm7z1Nlu+UPe3laCF8TeQQAFH/KqGX0DmAv1ejGUaGPYnqoptMg4N', NULL, 'admin', '2023-2-12 26:19:59', 1),
('U2FsdGVkX18lwkt0fKNfmA0Nqx6dZoUmeEOQx0vGg+PewmN4Cpu7+pbCo6TEhXqd', NULL, 'admin', '2023-2-13 15:3:55', 1),
('U2FsdGVkX18m6GZLWXKcF4Td9FRv0zS4iUgNqckJM1Z+ZDM7yNvqpauDs7Ffsr0f', NULL, 'admin', '2023-2-13 10:17:57', 1),
('U2FsdGVkX18Mirwsvk32VqZHksm3tjzIA5hGnUEeO5hMVxTFCwyX3Hkbkj1p7BP8', NULL, 'admin', '2023-2-12 23:53:48', 1),
('U2FsdGVkX18MjwUc1MSUTH4OlU70hdF4FazSCZPgYXYpP6M/gDQbTFAGBcISD3v6', NULL, 'admin', '2023-2-10 21:19:57', 1),
('U2FsdGVkX18MUOVacJPZfZ5lkh+OqKD+jhQWyBPMtJsSJOLsnpZNnXj9beKAjf0E', NULL, 'admin', '2023-2-14 19:11:52', 1),
('U2FsdGVkX18mx0HZrchRER66WnVwQTh4QnTNIluJ1CraM+KdO13JZQqyo+yjOVYq', NULL, 'admin', '2023-2-10 21:52:40', 1),
('U2FsdGVkX18nFOnOHnkQKc4tvGePm7E8wvVGMRu+1BNYrIrGlHWvuHvl5VK6BEeL', NULL, 'admin', '2023-2-10 21:34:57', 1),
('U2FsdGVkX18oYG3TeKogimpWxn2+XMG0lonO6ZIyJFud/MbeY+iuetWDvhh+iWFt', NULL, 'admin', '2023-2-14 10:1:4', 1),
('U2FsdGVkX18P2ebZB2UiOdUfvJInRBVKolyt9EsFJxK5qqTktgOXnsj4otiUVRfb', NULL, 'admin', '2023-2-10 24:43:48', 1),
('U2FsdGVkX18P3pbd8a/y2RKTPw6hObl3CPn80Q4DW40t/JVC2UW/pHkHbGBj7YLH', NULL, 'admin', '2023-2-7 21:28:51', 1),
('U2FsdGVkX18P8dytA9IJm4du3Nhz7jCbPaOzxUnTXCjzqnoM8Ih9cIndH0azNwz6', NULL, 'admin', '2023-2-13 10:32:12', 1),
('U2FsdGVkX18PLDF0avfFMfM5tMjT2/jc7gFnF3JvaMBtEWJsEVskzRUF0lxdvBTw', NULL, 'admin', '2023-2-19 20:58:56', 1),
('U2FsdGVkX18Q1y/DaqP+8qo5oD6SexJNl0JjI+Nw1iZk5eUaO9zI+AjlpLmkiGi6', NULL, 'admin', '2023-2-10 21:38:23', 1),
('U2FsdGVkX18q5gMbDwmHZPYpiM+q1N/tpbFYa+A2ycIbKg8c0lliinvWOARRMGnY', NULL, 'admin', '2023-2-13 17:24:30', 1),
('U2FsdGVkX18QEcq+vw31pVjF4WaE8carU5t6Xlj9EWPEpAFXt2DNERi1ips8tBSt', NULL, 'admin', '2023-2-10 25:26:14', 1),
('U2FsdGVkX18QFcnKsvEFB7S6P/82rovKF3UV+DThMODx6wZv7BqHOjvCN1j4MkIJ', NULL, 'admin', '2023-2-13 13:59:49', 1),
('U2FsdGVkX18qrenIhySp0JAO8Qxy3C2feE7K41o+9j2sXICNz2VvBef39uDb9KJh', NULL, 'admin', '2023-2-10 26:21:15', 1),
('U2FsdGVkX18qt7nKAY+5DC7ljvWBlBXP6xN9NxV17jHEWp0KiiAWoTtAexIeJoMV', NULL, 'admin', '2023-2-12 26:50:2', 1),
('U2FsdGVkX18R1tY6al5ui0By1RmdF1T0hwp2v+uNEeroYLrMzUpjwv1rJEX0+3eQ', NULL, 'admin', '2023-2-10 25:26:24', 1),
('U2FsdGVkX18RcEIhFjMEgB1cJMf6IPPXnULA86SHP5+TehH63cFKfdx8UqWAYbV4', NULL, 'admin', '2023-2-12 21:18:3', 1),
('U2FsdGVkX18rtz7s1R3HFt5a8MpySCc8sNFwBZRtqMeYhejnfNor4W0q+yKzIO5K', NULL, 'admin', '2023-2-13 20:47:9', 1),
('U2FsdGVkX18S28cK22Csj5n+SaLq6hv5VgBCzhRZQj6hDGxHNBWhOQUsZQWn0nC5', NULL, 'admin', '2023-2-10 21:12:38', 1),
('U2FsdGVkX18sz1bSNOF86x9nmLUHpq0MFYFOXgzsrHBDL+Qe+eXhSEMUN7JActsG', NULL, 'admin', '2023-2-11 12:26:44', 1),
('U2FsdGVkX18T9wceP+H2D6yR8wrUKyrOSwED2zWix5g+ga6UaMz4Gn5Qw7lErBSV', NULL, 'admin', '2023-2-19 11:21:34', 1),
('U2FsdGVkX18u5Mm8mppzkTJ4rUzfJjl8SP00vXcyEnMPk3HjrcSGK3i8jxxr+2on', NULL, 'admin', '2023-2-10 24:34:39', 1),
('U2FsdGVkX18u8J8wFzwNpzYo7vGCoY728etPiAof0/6EjbhvePddUklXHXMUfRhj', NULL, 'admin', '2023-2-10 22:23:39', 1),
('U2FsdGVkX18UxB/KWYM2dN+mmh6y6d8zEHLizfKvGnW1NUC0n8ORvfweNEqk53k8', NULL, 'admin', '2023-2-10 21:17:52', 1),
('U2FsdGVkX18WAMfS8gQBD1W8Uvhx536r9bpfDciFkLDUJiv6ViRru8rz2ZCddE9s', NULL, 'admin', '2023-2-11 11:20:55', 1),
('U2FsdGVkX18WHOy/UPDQufIvmKyzKFpJEjMSAlADlLs4m//It53quoZDLUHDFq0O', NULL, 'admin', '2023-2-13 15:12:25', 1),
('U2FsdGVkX18WUaD2xAhd0ko+SuFZX+E4pzpl5Ye9/2oBKZBNUp1cAaCpWD+8cTxf', NULL, 'admin', '2023-2-10 21:20:19', 1),
('U2FsdGVkX18WZSEvKCihaO3L1rCpB+D7Ior17mjequrwpsgWYMtbEoBFbeIZe/h4', NULL, 'admin', '2023-2-12 26:39:34', 1),
('U2FsdGVkX18wZZ/mGFlnmjvbPXHEIrDkgA0iJcW8Bpvw8NccAzbOxEkR4SSBAfUB', NULL, 'admin', '2023-2-10 25:22:31', 1),
('U2FsdGVkX18Xq0NFUZ6KFmEgWYLjhtdahwZ87kAz/W4hdGzPRziay93/LvwrD0kv', NULL, 'admin', '2023-2-10 21:49:55', 1),
('U2FsdGVkX18XxzdB89FK9atRUfOEQtCeGZ/Qd0JGTaSt6xOzxIPseRLtWHWUdYO0', NULL, 'admin', '2023-2-17 25:8:15', 1),
('U2FsdGVkX18YcaNVHUxK3aFZL/0P/KXHz5SJaROqlOaTlH9nB1zoGc1y4X/gvuqR', NULL, 'admin', '2023-2-10 21:27:24', 1),
('U2FsdGVkX18Ywlq7klg15QaiSShKpZk/PelV50Thk1/87JYgMSXi6cfR9F25HfaJ', NULL, 'admin', '2023-2-10 22:20:9', 1),
('U2FsdGVkX18z4z00Bau2K/BKejmW2bXrfihRVwjdJx2291wxbYgcLlWXf38/4+Is', NULL, 'admin', '2023-2-12 25:9:34', 1),
('U2FsdGVkX18z72v0P8sNHDnrpptkJprqOtM50H0yCd6K947m3Jkj14tizlyyR36U', NULL, 'admin', '2023-2-19 21:10:24', 1),
('U2FsdGVkX18zK5/1VM9L0/iNaXJwFVudGDyExIOxGqInukywFmtArTkRicumtYRV', NULL, 'admin', '2023-2-10 22:16:21', 1),
('U2FsdGVkX19//wQ++/oOk0kMWNhnoS5giddfRfMNYv7bbhMRFVuOXPhOub2c6I6P', NULL, 'admin', '2023-2-11 17:16:19', 1),
('U2FsdGVkX19/C/B1MijYu4pD2CTh+xVSwf3lbe1I8wiB/3O9RyRMrdKUcaYAgDgJ', NULL, 'admin', '2023-2-10 24:53:32', 1),
('U2FsdGVkX19+gbx+4INDSGKYcdwZdzecSDkAeBGtauRwnA1HYCmYrMtQZXdsxu1k', NULL, 'admin', '2023-2-12 26:33:39', 1),
('U2FsdGVkX19+H1CMsGK6M9PwQXIkupOn6NLAxlboqVMjHPfO2+aWrMuBWbs2+Pnd', NULL, 'admin', '2023-2-11 13:47:18', 1),
('U2FsdGVkX190wjWeQZwsZatTsWsSE7jaum6xV21yue0YNvnL+VDdGxcmBn/HJbnn', NULL, 'admin', '2023-2-11 18:7:34', 1),
('U2FsdGVkX1915gi4wd9MaejMt0yrbZmmfHUErvPw9R28qepkCHQ1sMAJ9uqQSgU8', NULL, 'admin', '2023-2-9 16:26:14', 1),
('U2FsdGVkX191cI+QxnXgq9PtMS4R64tKMxR3TVEX7dmmMM1iBpBxiNCgqdeIdVMG', NULL, 'admin', '2023-2-12 27:3:20', 1),
('U2FsdGVkX191M2f3jLlvSI5CJ8pGqsUXFu6exSSdEIshFH3ZbcJVa3HBbcug1plI', NULL, 'admin', '2023-2-12 24:48:32', 1),
('U2FsdGVkX192bw5RQuYahK5xEGHINhbPo7aTsH1jS+AmaY2FygkkxmhDnNNl4O7p', NULL, 'admin', '2023-2-12 27:8:13', 1),
('U2FsdGVkX192peENVjPboJpc8AGJpLuXelWxbIqIuSW7amkqPi4ly5iaZnbFYb1l', NULL, 'admin', '2023-2-12 25:34:55', 1),
('U2FsdGVkX193C6HVcElWKsZaugXLTDomIkv+D/lfJPI6FH8nFFmgjRGAqKq/dlHf', NULL, 'admin', '2023-2-11 9:48:52', 1),
('U2FsdGVkX194Vgq38QYz9RGSYxKnOjH7ScjvHOmjLD5eWqxThYAKyLAupIafXmCr', NULL, 'admin', '2023-2-19 21:23:31', 1),
('U2FsdGVkX194xQgJCZKwSo4dxkxMfqUz+7YxrvX93jxCzhoNITKpegzcL9L6t42j', NULL, 'admin', '2023-2-10 21:17:52', 1),
('U2FsdGVkX194yche4zJSpjd6OmuYZ6wzhXekYShRKNWVzhfiavbGaUzANTR6kDeJ', NULL, 'admin', '2023-2-10 25:48:36', 1),
('U2FsdGVkX1959KHDDZ+VNBhUk0o7UnKVYdmxMdKgF6Uil7bx9k62vfECUQyZOz6+', NULL, 'admin', '2023-2-14 9:15:15', 1),
('U2FsdGVkX196VaG4euY5CAVu67p10UMsV8wOZ8dHVFM6MX91CtT/7OOTZmMta6/Y', NULL, 'admin', '2023-2-3 23:10:11', 1),
('U2FsdGVkX197gbja4m9uLKvbIDZ7PEUNKDW1EJw+6StbqLHxxjm+nJFDVoEZr2uh', NULL, 'admin', '2023-2-11 17:0:57', 1),
('U2FsdGVkX1987ELSslC0PZvqGL53btO7SslQ/AqaqPzpbMUoPHQA1Jc71B0n8mud', NULL, 'admin', '2023-2-10 21:12:55', 1),
('U2FsdGVkX198KH+H23udK/dNnx6OhYFOFqDRP0WbbUokmLOvYAh64QGyyvnZo6sb', NULL, 'admin', '2023-2-7 20:39:21', 1),
('U2FsdGVkX198mLguAow2xCqdOiynjqgZa8FqnYMSUQxWEt3df0T40MNyiGsgGd7j', NULL, 'admin', '2023-2-14 10:28:38', 1),
('U2FsdGVkX199/ZoVOrYzQAlETrJCe6tL+s2EqOnwA2IWvdOFRbinJIX9ovz5pOox', NULL, 'admin', '2023-2-11 17:15:58', 1),
('U2FsdGVkX19aDgWkMXvLKKAfjUw4ZvdiGIA9XLokBnlTD/nN3KYiIMydqqPZpE3D', NULL, 'admin', '2023-2-11 13:55:47', 1),
('U2FsdGVkX19AguFCJZuydTjHYc1dMYNU6Ucb1eCCES6X282ilnf+bKoHIcu6HQYq', NULL, 'admin', '2023-2-10 26:2:46', 1),
('U2FsdGVkX19APEIVbCenot5JWh6KRWVNbgp53kzdUJ8Ui42S1O8vUGMsExEBpuKU', NULL, 'admin', '2023-2-11 13:58:22', 1),
('U2FsdGVkX19bYRYuf2cb8PzqbkTWy+oR7tBBGVH5O57/RekyWWPev47nUIGu8CDF', NULL, 'admin', '2023-2-11 12:28:36', 1),
('U2FsdGVkX19C+sHEDopc4IJPiiLH727zb7pVfBadYLHwX8G2nfR/4T2eh1X1u3Sd', NULL, 'admin', '2023-2-12 26:50:51', 1),
('U2FsdGVkX19cLpB3ltXNa7+xKJMHvN4+NQMQ9Wq2f7XYsnef4avqc1cxw5Qp1t0u', NULL, 'admin', '2023-2-19 22:57:39', 1),
('U2FsdGVkX19cLYqwmsK1i/rWbelPp7IPzp3dzCZQxZ+O5k39LUSST3xdNbV1lna/', NULL, 'admin', '2023-2-11 10:1:8', 1),
('U2FsdGVkX19d+t1JvTDXvUTGlw085ypkEy1GVvlnnuq/ZEvlGwD4qtV/3wFpoQ2j', NULL, 'admin', '2023-2-19 9:55:22', 1),
('U2FsdGVkX19dj9cB1B9to38AkcR7WHF03x4vIqAWroQeSaHk/8ErgbM32P8Ek8sy', NULL, 'admin', '2023-2-10 21:35:1', 1),
('U2FsdGVkX19dY1QB9/veI8/s4aHtTK3jP21t0N+Iy/2aPmMBp2DDMxtZTF1yrkDE', NULL, 'admin', '2023-2-10 26:40:18', 1),
('U2FsdGVkX19E/mj5y4U4u8thYaCPU+wKiL8SfFPwjOKwYHx5NceS0cvOsJdSIXZ+', NULL, 'admin', '2023-2-12 26:53:11', 1),
('U2FsdGVkX19feOwec97b1xsX4iXe1E2Qe106Z5Qh3I1tipDcGsq4nXaA75WfAq6e', NULL, 'admin', '2023-2-12 27:10:9', 1),
('U2FsdGVkX19fgHUIHPK0eVDiHLkHDnczfMSdPUMl+/H2xL+0AblYBRVPoK20sRrZ', NULL, 'admin', '2023-2-13 23:4:37', 1),
('U2FsdGVkX19FWdRWPNI/mqKqKptU2vxXSHfpt+w7jlAZylAFWywlXBedLvS+aVc6', NULL, 'admin', '2023-2-10 21:24:22', 1),
('U2FsdGVkX19fx0U7gqacTGz2MHVU8VPEi3FTyqTb5nK/93Ju8NXp3wzVH6JCG9BB', NULL, 'admin', '2023-2-10 21:35:0', 1),
('U2FsdGVkX19Fz/3RfY3CewEjys5aRAGeTDYjilktG7pCBS/CSElwWVY2BOl4s2zH', NULL, 'admin', '2023-2-12 24:37:4', 1),
('U2FsdGVkX19G7DbGC99NOfsUxLaXu5NjrGS2rUsmlK7AcMdwOd7rSW0HmLwXZlFR', NULL, 'admin', '2023-2-14 9:27:47', 1),
('U2FsdGVkX19GDBiCUTYQ+rhjIPTJCQNb4BqeUUe/Exlw7R1A7yS7mIDR1HtlubP4', NULL, 'admin', '2023-2-14 10:53:24', 1),
('U2FsdGVkX19gRXS0lCKUBAgtnK+g/UPk64czdduRMfdhCn/EZgNqQau5KkMB9eEF', NULL, 'admin', '2023-2-14 10:52:29', 1),
('U2FsdGVkX19HFtaF5S/CI2GnPG2I0FCMIg7W05INufWQzr2QbnEPBYoerYzkOYyJ', NULL, 'admin', '2023-2-10 22:17:31', 1),
('U2FsdGVkX19IG+UTa7gfIpCRjGKerCYMFrhWeIyrcTogGac6LDQeor+CVUU8zUfZ', NULL, 'admin', '2023-2-10 24:44:17', 1),
('U2FsdGVkX19IzzNj2PYn/1vNZIVOJSqYLYhc0HWnwQka/03O+E9Nt+uvLTjiaP4y', NULL, 'admin', '2023-2-11 14:2:33', 1),
('U2FsdGVkX19J62iVv5w8VtJ4CpjxJxMdgEQ+9CPwJS2lp7bNSfHucCrc5faojbWT', NULL, 'admin', '2023-2-10 22:16:2', 1),
('U2FsdGVkX19J6HZ10spjlawkTBlPBmzCcPMmkjNNXI81jRc19PsYjrXSpz98kbn8', NULL, 'admin', '2023-2-10 21:28:3', 1),
('U2FsdGVkX19JsEzq6SV1eefrK+vzTmgPBWXm7yDPh6OJ1wZmw61udqknWim2cHS5', NULL, 'admin', '2023-2-10 22:16:59', 1),
('U2FsdGVkX19L2KlIHUztJ9XGAw9ZDrKBAabJ9ib11vOAZss9Bqc8hZwEZa9kF+u2', NULL, 'admin', '2023-2-12 24:36:57', 1),
('U2FsdGVkX19l6FeGg9IQaFldb/5Jieu9QtX0OIZQIqJAfSkK2CZErZ7TH91lqmbH', NULL, 'admin', '2023-2-11 17:15:50', 1),
('U2FsdGVkX19lk2JFcKU8NI/8xfFJ/WqfbeA8Li52zAsFlvJr2BVZg20cZgBaCyYm', NULL, 'admin', '2023-2-10 21:35:25', 1),
('U2FsdGVkX19lt4BzSKibu5GeBV2a5dNca3aROblE/Cq1dtdx7vmsme/He1xMssVy', NULL, 'admin', '2023-2-12 26:56:48', 1),
('U2FsdGVkX19mEJfmrT30tNLt/u/LzfTe77CEvz/k6ZC8GIHnyI6o6GWhKmklD54y', NULL, 'admin', '2023-2-12 24:52:39', 1),
('U2FsdGVkX19MujtjmwZCocGdYhoBBXHDfPiK7QCzPF4rmQCriI76NXzjuuYg+bFn', NULL, 'admin', '2023-2-11 24:2:16', 1),
('U2FsdGVkX19N3PbMax4KAe/b0iACEL3d/rm9qVO3Yf2CQnBLH9ePGbt7qukhKtVx', NULL, 'admin', '2023-2-14 11:11:39', 1),
('U2FsdGVkX19ng5q8EgimNkKWdfXAy8WZhU3L82WzREmYGEQiBmU6RGGLTWLqSYI9', NULL, 'admin', '2023-2-10 21:47:38', 1),
('U2FsdGVkX19nISIGPE8mOHxmvFLv/ZSaGh49EEym5C8ovBp/5O8Hh8BAoR+bYw2P', NULL, 'admin', '2023-2-10 24:40:6', 1),
('U2FsdGVkX19oAtXQ+/yybhzOhp5HaxMX9T5S3Zja8aqogbgtXcuvU3K/aQ5pLYQy', NULL, 'admin', '2023-2-11 9:48:18', 1),
('U2FsdGVkX19OZLM5uJJEX7h2yxSurLE5E44qvM1XeB6+mFLEMa2SesCJRvPryJpf', NULL, 'admin', '2023-2-12 24:35:16', 1),
('U2FsdGVkX19p5nRXzWcp8saa1KTcASU80cKpA0uGAlZwVW100+b1/SG0dwGmATyT', NULL, 'admin', '2023-2-12 20:34:12', 1),
('U2FsdGVkX19PDO7vUxSZxkCULmiTcbiQoH6v2l7Jv2JbPSTdWf6CTr8c63o9ushf', NULL, 'admin', '2023-2-3 21:13:47', 1),
('U2FsdGVkX19pFqeGxP9+rShrc3fjHgZb1IC1jxya63/IFBWpmvxSK4eOSejfdcCU', NULL, 'admin', '2023-2-12 25:17:49', 1),
('U2FsdGVkX19pns1a0cpGH2EC0nbx/i9Cf2JRBELY8/NvrCBJk4mOSUG5RPz5Q+BD', NULL, 'admin', '2023-2-13 22:23:51', 1),
('U2FsdGVkX19pQrmapCpRLPgW8bJOjqIcI9WLDMvOUfTlxV3y3HtbiRUP+656DaPi', NULL, 'admin', '2023-2-13 15:18:45', 1),
('U2FsdGVkX19rc5qhCWKOQcVaQKN8dzPz4ZcqF+xiKiqPSNf52qWGbv0lVw08RjNs', NULL, 'admin', '2023-2-11 17:0:46', 1),
('U2FsdGVkX19S6/IyIWi6TNb4fh1cWPmVySJyG23js6SmjWF220QVH2tZHgWc+Zpj', NULL, 'admin', '2023-2-19 21:16:10', 1),
('U2FsdGVkX19sAJrfVoXd8d4JRyMqPBnbzxKvoUNtZZ3BmabH7bP27TyUfk77WSg3', NULL, 'admin', '2023-2-10 22:19:51', 1),
('U2FsdGVkX19tN1+JYvx4C1GqYwPHx4Rv+oVjP8TkCHakWRwA1ft01Qgus7vTqKB9', NULL, 'admin', '2023-2-10 22:28:14', 1),
('U2FsdGVkX19TVkKOyz6Wx6l3gGoBpj2Fk83PChm7IqGQIuc/hAE0K13gvxxIq2aE', NULL, 'admin', '2023-2-10 21:20:31', 1),
('U2FsdGVkX19VcmhWA+qAeGmuHz77BVJoeH9QE+1l5dbXbBQWezjcyHUJh7d3cSE0', NULL, 'admin', '2023-2-17 25:20:10', 1),
('U2FsdGVkX19X6EfLzEm4oP/NeP/FquuN6ytsTb2+zBXQwv2AdlmGyBeUc+TsJpZl', NULL, 'admin', '2023-2-14 9:15:3', 1),
('U2FsdGVkX19xj0xcFwMLrJsSgXAToGuLZDWC0z42ICRC2tH1ihNufNbR30JKHCWC', NULL, 'admin', '2023-2-10 21:20:18', 1),
('U2FsdGVkX19YAwe7tVxEhRsiFrGXj6ake3JHKAcuVoLz0exmtTEmTYmU7GFKO6RU', NULL, 'admin', '2023-2-11 18:7:45', 1),
('U2FsdGVkX19YExktRnhTmE9CuX/jNcPDVGTWGEy+1eqyJhjN8w6lozNlNdJ7whp2', NULL, 'admin', '2023-2-10 24:35:56', 1),
('U2FsdGVkX19yi/spFNAwcXvzqBV6pbHGg3pIKidgcycPWDOlcKHW9q6v/6WEs3ze', NULL, 'admin', '2023-2-19 21:4:31', 1),
('U2FsdGVkX19YkNfKbuRyqG7RDTFTtcK9lYNLJhKIAnvDsFoYFXHgNPs5NSDFzh4r', NULL, 'admin', '2023-2-19 23:13:11', 1),
('U2FsdGVkX19Yq4Hys1XrPLv2QOMhu0QexrgscxFy9AlBYfjZzwBotaEuocAqL8vN', NULL, 'admin', '2023-2-19 20:46:39', 1),
('U2FsdGVkX19YvF3q7dtw3+3YxcuoQ4ei6+zBQJ6WnRHfM9wHieDVstIaKsXrFy06', NULL, 'admin', '2023-2-10 25:26:12', 1),
('U2FsdGVkX19YYMXx4rXGs9S3eyv6ZLEe6WRYUIRV0UJ81yPKSu9PWY8tAWi1Kd/7', NULL, 'admin', '2023-2-7 23:16:42', 1),
('U2FsdGVkX19zG+1ZwXD87MJnZKdnV6bcEJfSxew9IM9KxfuOakx7Zs6NoowoW7On', NULL, 'admin', '2023-2-13 21:25:37', 1),
('U2FsdGVkX19zJ9muoA7M7BEFw0mxP+bbvsdvPXJZUTqOVBe5mosMeCOrYYwY0RTs', NULL, 'admin', '2023-2-12 25:46:29', 1);

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
(2, 'Jeremie Harber', '2014-11-08', 1, 'Taiwan 1 ', 'ok', 'Không', 102, 'Là chủ hộ', '72248832112465', '0023-12-31', '123', 'nong dan', NULL, '0012-12-12', NULL),
(3, 'Mr. Damion Green I', '2017-05-11', 0, 'Vietnam', 'Mường', 'Tin lành', 85, 'Là chủ hộ', '988793177', '1979-09-12', NULL, NULL, '2008-02-16', NULL, NULL),
(4, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 66, 'Là chủ hộ', '12345678912', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(6, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '12345678914', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(8, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 12, 'Là chủ hộ', '12345678916', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(9, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '12345678917', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(13, 'Johathan Gibson I', '2009-01-03', 0, 'Saint Kitts and Nevis', 'Mường', 'Bà la môn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1974-07-01', 'Odio ipsa facere et. Consequatur dolores eveniet optio quia. Dolorem commodi itaque eos magni ut optio.'),
(14, 'Crystel Feest', '1975-09-24', 1, 'Peru', 'Kinh', 'Không', NULL, NULL, NULL, '1982-05-18', NULL, NULL, NULL, NULL, NULL),
(16, 'Maia Stokes', '1998-02-20', 0, 'Somalia', 'Kinh', 'Không', 104, 'Là chủ hộ', '30231255104874', NULL, NULL, NULL, '2020-07-24', '1988-08-04', 'Cum quidem quod qui rerum. Id quia dignissimos nemo dolore. Sequi veritatis molestias itaque quam molestiae commodi laboriosam.'),
(17, 'Devyn Heathcote', '1986-03-06', 1, 'Somalia', 'Kinh', 'Không', NULL, NULL, '79063498384997', '1980-09-15', NULL, NULL, NULL, '2022-03-10', 'Est possimus est omnis quo. Voluptas aut consequatur rerum amet. Voluptatem nisi cum delectus culpa fugiat sit placeat quisquam.'),
(18, 'Mikayla Pacocha', '2000-07-11', 0, 'Nepal', 'Kinh', 'Không', 91, 'Là chủ hộ', '32438318506895', NULL, NULL, NULL, '1979-09-27', NULL, 'Veritatis voluptas ullam et iure voluptatem molestiae. Dolorum cum laboriosam dignissimos dolores quis. Laudantium quae et fuga cumque architecto est corrupti.'),
(19, 'Trần Văn Phúc 12 3', '1970-01-20', 1, 'Mexico', 'Kinh', 'Không', 12, 'Là con', '123456789101', '1221-12-12', 'ha noi 1 ', 'nong dan', NULL, '1976-03-14', 'Okay babeêrere'),
(20, 'Mrs. Mylene Batz Sr.', '1977-01-05', 0, 'Palestinian Territory', 'Kinh', 'Phật giáo', 102, 'Là mẹ', NULL, '2019-09-21', NULL, NULL, '2018-01-11', NULL, NULL),
(21, 'Kamren Brekke', '1978-04-06', 1, 'Cambodia', 'Tày', 'Không', NULL, NULL, '20149925314684', NULL, NULL, NULL, '2018-09-14', NULL, 'Porro quis omnis doloribus qui. Aperiam optio quis consectetur est. Est cupiditate est itaque sunt aliquam laudantium.'),
(22, 'Evangeline Quitzon', '2020-09-15', 0, 'Cook Islands', 'Kinh', 'Không', 12, 'Là con', NULL, '1970-01-14', NULL, 'IT', '1981-02-28', '2222-02-22', NULL),
(23, 'Mr. Elwin Cassin', '1984-06-02', 0, 'Indonesia', 'Kinh', 'Không', 59, 'Là mẹ', '39185576698241', '1998-01-16', NULL, NULL, '2008-06-25', NULL, NULL),
(24, 'Gail Armstrong DDS', '2019-08-12', 0, 'Antigua and Barbuda', 'Kinh', 'Tin lành', NULL, NULL, '5224821383226', NULL, NULL, NULL, '1996-04-07', '2000-08-05', NULL),
(25, 'Dr. Glenda Okuneva DVM', '2005-07-02', 0, 'Netherlands Antilles', 'Kinh', 'Không', 59, 'Là chủ hộ', '82348439973124', '1973-09-08', NULL, NULL, '2008-10-03', NULL, NULL),
(26, 'Billy Bartell', '1987-12-02', 0, 'Albania', 'Kinh', 'Phật giáo', NULL, NULL, '84197064240707', '2002-04-12', NULL, NULL, '2005-10-09', '2013-12-05', NULL),
(27, 'Nicolette Grant', '2017-07-20', 0, 'Uruguay', 'Dao', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1977-03-18', NULL, NULL),
(28, 'Anastacio Willms', '2022-04-25', 0, 'Chile', 'Kinh', 'Không', NULL, NULL, '89475304807083', NULL, NULL, NULL, '1991-12-30', '1981-09-07', 'Quasi a totam eius id omnis. Est est dolorem est.'),
(29, 'Jeanette Beatty', '1984-05-01', 0, 'Wallis and Futuna', 'Khmer', 'Không', 87, 'Là vợ', '31148986364787', NULL, NULL, NULL, '2005-05-11', NULL, 'Eligendi mollitia sed alias. Unde suscipit ex quod officiis rerum eum corrupti. Voluptatem magnam amet id velit in. Labore aut ut qui ipsam cum harum ea.'),
(30, 'Ms. Violette Gusikowski MD', '1989-08-08', 0, 'Samoa', 'Kinh', 'Tin lành', 67, 'Là cha', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Mrs. Maurine Stracke', '1987-11-11', 1, 'Azerbaijan', 'Khmer', 'Không', NULL, NULL, '62169790011830', NULL, NULL, NULL, NULL, '1976-10-03', NULL),
(32, 'Tommie Reichel', '1975-12-27', 1, 'Libyan Arab Jamahiriya', 'Nùng', 'Tin lành', NULL, NULL, '71334301848237', NULL, NULL, NULL, NULL, '1997-09-16', 'Explicabo ratione vel voluptas eum accusamus illum et. Consequatur at ut autem est tempora ipsum. Facere dolor rerum ipsa nihil illo quia quidem. Eaque autem aliquam quia quis. Et accusantium totam sed dolor.'),
(33, 'Issac Lemke', '1975-10-13', 1, 'China', 'Kinh', 'Bà la môn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sit sequi itaque ut non impedit veniam. Ut consequuntur vel a reprehenderit impedit. Nobis ut consequatur voluptatibus ab officiis. Et sit quia ducimus dolorum quo.'),
(34, 'Ervin Weber', '1998-11-02', 1, 'United Arab Emirates', 'Thái', 'Không', 85, 'Là chị', '56639861873185', '2013-04-05', NULL, NULL, '1981-07-03', NULL, NULL),
(35, 'Ezra Kulas', '2005-04-27', 1, 'French Polynesia', 'Dao', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ullam sunt est excepturi. Quam quia atque molestiae doloremque et.'),
(36, 'Shane Brakus DVM', '1987-02-18', 1, 'Tanzania', 'Kinh', 'Công giáo', NULL, NULL, '80671123703064', '1987-05-07', NULL, NULL, NULL, '1989-10-06', NULL),
(37, 'Jamie Murazik', '2008-07-12', 0, 'Norfolk Island', 'Kinh', 'Phật giáo', 83, 'Là vợ', '36801075601095', '1987-10-31', NULL, NULL, '2008-03-17', NULL, NULL),
(38, 'Clovis Hyatt', '2015-10-26', 1, 'Micronesia', 'Kinh', 'Không', 91, 'Là chị', NULL, NULL, NULL, NULL, '1992-03-12', '2002-09-28', NULL),
(39, 'Fanny Murazik', '1979-12-17', 1, 'Palestinian Territory', 'Mường', 'Không', 12, 'Là em', NULL, NULL, NULL, NULL, NULL, '2007-03-09', NULL),
(40, 'Garrison Reichel', '1994-03-17', 1, 'Niger', 'Kinh', 'Không', 102, 'Là con', NULL, '2015-12-27', NULL, NULL, NULL, '2010-05-16', NULL),
(41, 'Marjolaine Towne', '2012-09-29', 1, 'Zimbabwe', 'Kinh', 'Không', 98, 'Là cha', '72820816973124', NULL, NULL, NULL, '1986-11-15', NULL, 'Veniam dicta sit temporibus et aut. Dolor laudantium quia qui magni. Sunt delectus in sed ut dignissimos.'),
(42, 'Mrs. Paula Brown', '2008-11-28', 0, 'Togo', 'Kinh', 'Không', NULL, NULL, '2275858738424', NULL, NULL, NULL, '1999-01-15', NULL, NULL),
(43, 'Dr. Emmitt VonRueden III', '1997-12-11', 0, 'Namibia', 'Kinh', 'Không', NULL, NULL, '83608758331996', '2008-01-29', NULL, NULL, NULL, NULL, 'Aut est ducimus optio qui consequatur est pariatur et. Et sapiente aut cumque voluptatem est ab. Ex inventore numquam fuga voluptas.'),
(45, 'Jose Hermann I', '1974-05-15', 0, 'Palestinian Territory', 'Kinh', 'Không', 87, 'Là cha', NULL, NULL, NULL, NULL, '2000-11-20', NULL, 'Ipsum libero a maiores in. Qui officiis vitae adipisci explicabo earum ex fugit. Veritatis aperiam quisquam ut quam.'),
(46, 'Kelvin Greenfelder III', '2011-03-19', 0, 'Algeria', 'Khmer', 'Bà la môn', 102, 'Là chồng', NULL, '1989-08-16', NULL, NULL, '2022-05-18', '1990-02-25', NULL),
(47, 'Prof. Kaia Spencer MD', '1999-03-30', 0, 'Paraguay', 'Kinh', 'Tin lành', 70, 'Là chị', '95086746664312', '1999-09-09', NULL, NULL, NULL, '2014-03-21', 'Debitis cum libero velit corrupti et in. Dolores inventore mollitia omnis similique. Ut sunt ullam quod aliquam ut molestias.'),
(48, 'Jaqueline Bednar', '2017-08-23', 0, 'Bangladesh', 'Khmer', 'Không', 83, 'Là mẹ', NULL, '1996-04-23', NULL, NULL, '1988-02-13', '2001-01-05', NULL),
(49, 'Dr. Anahi Ratke', '1977-06-10', 1, 'Greece', 'Nùng', 'Tin lành', NULL, NULL, '32077239091383', '1980-01-19', NULL, NULL, '1990-11-07', NULL, NULL),
(50, 'Louisa Wintheiser', '1999-01-07', 1, 'Guernsey', 'Chăm', 'Tin lành', 83, 'Là chồng', NULL, '2010-04-19', NULL, NULL, '1995-05-26', '1971-04-04', NULL),
(51, 'Prof. Jayne Schumm', '1990-02-23', 1, 'British Indian Ocean Territory (Chagos Archipelago)', 'Tày', 'Không', 104, 'Là anh', NULL, NULL, NULL, NULL, NULL, '1999-08-19', 'Sit laudantium voluptas dolorum incidunt dolorum quo. Sed consequatur distinctio deleniti reprehenderit est sunt quia. Qui et iusto hic quos aliquid quisquam. Eos nihil veniam ducimus similique asperiores.'),
(52, 'Cristina Dooley', '2020-06-15', 1, 'Taiwan', 'Thái', 'Không', 59, 'Là chồng', '14698273220596', NULL, NULL, NULL, '1997-08-24', '2015-10-16', 'Possimus excepturi rerum accusamus. Dolorum impedit cupiditate facere et aut animi. Omnis deleniti quia impedit molestiae sapiente nemo voluptatem blanditiis. Veritatis accusantium in est ea eius.'),
(54, 'Rory Miller', '2023-01-24', 1, 'Ghana', 'Kinh', 'Bà la môn', 85, 'Là chồng', '18261496267238', '2002-05-01', NULL, NULL, '2016-05-29', NULL, NULL),
(55, 'Dr. Walter Beatty PhD', '1994-03-10', 0, 'Uzbekistan', 'Kinh', 'Bà la môn', 12, 'Là mẹ', '9448876055086', NULL, NULL, NULL, NULL, NULL, 'Omnis repellendus tenetur minus. Qui commodi quas ipsa et autem at.'),
(56, 'Pasquale Wilderman', '2012-08-19', 0, 'Iceland', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1991-10-18', NULL, NULL),
(57, 'Edgardo McGlynn', '1970-03-07', 1, 'Mauritius', 'Thái', 'Không', 87, 'Là ông', NULL, NULL, NULL, NULL, NULL, '1985-01-25', NULL),
(59, 'Eli Spencer DDS', '1997-08-30', 1, 'Iraq', 'Kinh', 'Không', 59, 'Là con', NULL, NULL, NULL, NULL, NULL, '1994-08-24', 'A et sit et in. Autem aut mollitia facilis commodi dolorum aut sapiente. Ipsa voluptas non consequatur nam perspiciatis qui dicta.'),
(60, 'Roslyn Carter', '1976-03-22', 1, 'Greece', 'Kinh', 'Không', NULL, NULL, '13691664617214', NULL, NULL, NULL, '1991-04-17', '1995-09-17', 'Ut quia commodi est repudiandae ipsa ut possimus. Sunt id eos ipsam sint qui.'),
(61, 'Santina Hand', '2013-06-24', 1, 'Saint Pierre and Miquelon', 'Kinh', 'Không', 12, 'Là em', NULL, NULL, NULL, NULL, '2009-12-28', '2012-12-05', NULL),
(62, 'Mr. Troy Hyatt III', '2006-03-03', 0, 'Northern Mariana Islands', 'Kinh', 'Không', NULL, NULL, '65601261733901', '1970-10-07', NULL, NULL, NULL, NULL, NULL),
(63, 'Mrs. Margot Zboncak V', '1980-03-31', 0, 'Faroe Islands', 'Kinh', 'Không', 70, 'Là cha', '10182003915385', '1981-04-11', NULL, NULL, '1993-04-29', '1970-11-28', 'Natus odit velit expedita aut fugiat a sunt. Qui eos laudantium necessitatibus qui aperiam. Delectus illo est consectetur soluta repellat iste.'),
(64, 'Mr. Braeden Streich', '1977-10-29', 0, 'Samoa', 'Kinh', 'Không', 91, 'Là em', '29088792781408', NULL, NULL, NULL, NULL, '1986-08-11', NULL),
(65, 'Violette Barrows', '1991-01-27', 1, 'Lithuania', 'Kinh', 'Không', NULL, NULL, '60107024749178', NULL, NULL, NULL, NULL, '2000-08-02', 'Optio fugit autem repellendus odit et temporibus. Consequatur dolorem et tenetur voluptate voluptatibus dolore distinctio. Voluptatem pariatur fugit aut aliquam perspiciatis. Eos qui suscipit dignissimos ipsum placeat repellat aut.'),
(66, 'Ferne Johnson DVM', '1972-07-11', 0, 'Norway', 'Kinh', 'Không', NULL, NULL, '41039118007438', '1988-08-20', NULL, NULL, '1979-06-20', NULL, NULL),
(67, 'Jonas Rempel', '2002-07-25', 1, 'Indonesia', 'Tày', 'Công giáo', 98, 'Là chủ hộ', '448885247', NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Dr. Marian Eichmann', '1987-01-10', 0, 'Botswana', 'Mường', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-13', '2007-06-29', 'Deserunt et unde molestiae dolores. Dolor ipsum iste aut qui. Saepe eos aut perferendis earum quisquam quo nihil.'),
(69, 'Forest Murphy', '1972-10-18', 1, 'Bhutan', 'Thái', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-07-31', 'Expedita consequuntur omnis ut quia. Beatae voluptatem debitis qui. Qui molestias praesentium non quia.'),
(70, 'Consuelo Rodriguez III', '2003-11-09', 1, 'Monaco', 'Kinh', 'Không', 104, 'Là em', NULL, '1997-08-19', NULL, NULL, '1990-03-13', '1995-04-23', NULL),
(71, 'Emerson Stiedemann', '2008-03-10', 1, 'Palau', 'Kinh', 'Phật giáo', 59, 'Là vợ', '73328297692098', NULL, NULL, NULL, '1975-07-20', '1993-08-30', NULL),
(72, 'Lukas Boehm', '1976-01-02', 1, 'Turks and Caicos Islands', 'Thái', 'Không', 102, 'Là vợ', '47827976208091', NULL, NULL, NULL, NULL, '2003-06-23', 'Autem modi fuga qui quia totam explicabo. Occaecati nulla magnam quam nesciunt omnis tempore. Vitae quas enim est et dicta.'),
(73, 'Ms. Cleora Rolfson', '1979-10-01', 1, 'Iraq', 'Kinh', 'Không', 70, 'Là mẹ', NULL, '2009-03-04', NULL, NULL, '1974-05-18', NULL, NULL),
(75, 'Agustin Grimes PhD', '2000-10-21', 1, 'Tajikistan', 'Tày', 'Bà la môn', 98, 'Là chị', NULL, NULL, NULL, NULL, NULL, '2007-08-05', NULL),
(76, 'Elenora Gibson', '1983-05-11', 1, 'Australia', 'Kinh', 'Không', 59, 'Là cháu', NULL, '1999-08-03', NULL, NULL, NULL, NULL, NULL),
(77, 'Prof. Antwon Rempel DVM', '1985-10-20', 1, 'Kenya', 'Tày', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Beulah Boehm', '1997-11-04', 0, 'Iran', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'Nathen Jacobi', '2018-04-22', 1, 'Mauritania', 'Chăm', 'Không', NULL, NULL, '67271165583752', NULL, NULL, NULL, '1988-06-15', NULL, NULL),
(80, 'Tony Rau', '1983-04-20', 1, 'Bosnia and Herzegovina', 'Nùng', 'Công giáo', NULL, NULL, NULL, '1987-02-08', NULL, NULL, NULL, '2022-02-03', NULL),
(81, 'Mack Luettgen', '1970-04-25', 0, 'Nepal', 'Khmer', 'Không', 67, 'Là anh', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'Modesta Mertz', '1997-12-12', 0, 'Paraguay', 'Kinh', 'Không', NULL, NULL, '85331516261901', NULL, NULL, NULL, '2014-04-17', '2003-11-20', 'Reprehenderit vero aut voluptatibus quae. Ipsa placeat maiores officiis nemo autem. Porro veritatis provident nemo sed. Debitis beatae voluptas tempore.'),
(83, 'Ms. Colleen Wehner V', '2016-06-13', 0, 'Brunei Darussalam', 'Kinh', 'Không', 67, 'Là vợ', '24840465464977', NULL, NULL, NULL, '2016-08-10', NULL, NULL),
(84, 'Lionel Reinger', '1990-02-06', 0, 'Tunisia', 'Kinh', 'Không', 104, 'Là anh', '28615134080504', NULL, NULL, NULL, NULL, '1989-06-30', NULL),
(85, 'Efrain Altenwerth', '1999-01-07', 1, 'Switzerland', 'Kinh', 'Không', NULL, NULL, '4421211397917', '1987-02-24', NULL, NULL, '2005-08-08', NULL, NULL),
(86, 'Prof. Garnett Nienow', '1971-08-01', 0, 'Lithuania', 'Kinh', 'Công giáo', NULL, NULL, '85943829518956', NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Oda Yundt', '1994-08-02', 1, 'Indonesia', 'Thái', 'Công giáo', NULL, NULL, '91698520674576', '1986-06-13', NULL, NULL, '2008-12-17', '2011-09-16', 'Omnis vero ut vel cumque. Voluptatem velit pariatur eaque ea atque recusandae deserunt. Doloribus sint qui eveniet accusantium. Expedita sunt sed ad quam culpa iure nisi.'),
(88, 'Andre Corwin', '1979-08-22', 1, 'Dominican Republic', 'Kinh', 'Không', 67, 'Là chủ hộ', '68491631', '2003-03-29', NULL, NULL, NULL, NULL, 'Voluptas veritatis eos quod aut sed recusandae aperiam voluptatem. Officiis assumenda tempore enim ipsa corrupti dolorem. Earum quidem quia voluptas impedit officia unde autem. Quo optio molestiae est.'),
(89, 'Jaylon Oberbrunner', '1983-08-26', 1, 'Oman', 'Dao', 'Công giáo', 67, 'Là mẹ', '60245738982111', NULL, NULL, NULL, '2018-02-27', '2010-02-21', NULL),
(90, 'Eulah Schaden V', '1986-09-12', 1, 'Dominica', 'Khmer', 'Phật giáo', 70, 'Là mẹ', '95805522194088', '2018-11-07', NULL, NULL, NULL, '1989-01-21', 'Possimus esse esse corporis et temporibus officia saepe. Et eos impedit quisquam assumenda ex et. Deserunt corrupti quam quia enim est. Possimus id ut aliquid repellat nostrum.'),
(91, 'Letitia Koelpin Sr.', '2007-07-30', 1, 'Hungary', 'Kinh', 'Thiên chúa', NULL, NULL, '26585837408894', NULL, NULL, NULL, '2017-08-18', '2006-02-04', NULL),
(92, 'Mr. Angus Hammes PhD', '2006-12-30', 1, 'Guam', 'Kinh', 'Không', 83, 'Là chủ hộ', '937771833', NULL, NULL, NULL, NULL, '1986-04-08', 'Vel est fugit quae quis aspernatur sunt animi. Nihil explicabo facere itaque natus iste occaecati voluptatem.'),
(93, 'Dion Wuckert', '1970-04-10', 1, 'Belgium', 'Mường', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1984-07-04', '2016-10-28', NULL),
(94, 'Mr. Kenneth Wiza', '2022-04-18', 0, 'Romania', 'Nùng', 'Không', 85, 'Là cháu', '15465845537397', '2019-04-25', NULL, NULL, NULL, '1994-08-10', 'Rerum eum ex rerum. Voluptatem praesentium quae est unde corporis consequuntur. Autem aliquam expedita voluptates omnis.'),
(95, 'Triston Okuneva', '1987-12-20', 0, 'Denmark', 'Dao', 'Công giáo', NULL, NULL, '45406754348818', '2002-04-11', NULL, NULL, NULL, NULL, NULL),
(96, 'Prof. Marty Pacocha PhD', '2013-07-01', 1, 'Hungary', 'Kinh', 'Không', 87, 'Là mẹ', NULL, NULL, NULL, NULL, NULL, NULL, 'Quia quis sed culpa nihil voluptas voluptates dolorem. Voluptatem voluptate illum impedit veritatis. Quia et laudantium modi.'),
(97, 'Maxwell Koepp', '1986-09-13', 0, 'Belize', 'Kinh', 'Không', NULL, NULL, NULL, '1996-04-23', NULL, NULL, '1978-11-30', '2018-05-18', 'Illo qui quo est placeat commodi repudiandae. Iste laboriosam blanditiis sint non.'),
(98, 'Louisa Lang', '2020-08-18', 0, 'Samoa', 'Thái', 'Không', NULL, NULL, '85652068040164', NULL, NULL, NULL, '1983-05-07', NULL, NULL),
(99, 'Savanah Brown', '2008-07-18', 0, 'Hong Kong', 'Tày', 'Không', NULL, NULL, '39480260539736', NULL, NULL, NULL, '1971-06-02', NULL, 'Excepturi maxime fugit sit est quas est. Aspernatur sed beatae ipsam voluptate consequatur laborum.'),
(100, 'Maggie Powlowski', '2005-09-12', 1, 'Brunei Darussalam', 'Kinh', 'Không', 91, 'Là bà', '39224654738740', NULL, NULL, NULL, '2007-09-04', NULL, 'Omnis incidunt totam quam quam. Corrupti quod qui modi dolor fuga voluptas mollitia. Est inventore dolorum quod est. Soluta velit vitae et maxime.'),
(102, 'Prof. Arianna Crooks', '1982-04-21', 0, 'Saint Helena', 'Kinh', 'Không', 87, 'Là chị', NULL, '1990-07-04', NULL, NULL, '2004-04-14', NULL, 'Et quis incidunt autem voluptatem a. Aspernatur totam sunt excepturi quidem rerum. Consequatur vel nemo modi qui qui ad totam unde. Architecto temporibus blanditiis quod cupiditate ut in.'),
(103, 'Emerald Hauck', '1995-03-03', 1, 'Paraguay', 'Kinh', 'Không', 67, 'Là cháu', '4686828619803', NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'Andrew Mitchell III', '1980-06-02', 0, 'Isle of Man', 'Chăm', 'Không', NULL, NULL, NULL, '1970-01-03', NULL, NULL, NULL, NULL, NULL),
(105, 'Dr. Jaden Strosin', '1980-03-26', 0, 'Equatorial Guinea', 'Kinh', 'Bà la môn', NULL, NULL, '3842738463953', NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'Ms. Germaine Hegmann', '1983-11-07', 1, 'Japan', 'Kinh', 'Không', 70, 'Là chị', NULL, '1993-04-30', NULL, NULL, NULL, NULL, NULL),
(107, 'Audra Considine I', '2017-01-06', 1, 'Jamaica', 'Dao', 'Không', NULL, NULL, '11744574415939', '1995-04-18', NULL, NULL, NULL, NULL, 'Ex suscipit dolores accusantium aut et quia non. Tempore accusamus quaerat qui blanditiis molestiae.'),
(108, 'Mrs. Libbie Keebler', '1988-01-05', 1, 'Antigua and Barbuda', 'Chăm', 'Không', 87, 'Là bà', NULL, NULL, NULL, NULL, '2022-08-05', NULL, NULL),
(109, 'Sven Baumbach', '2007-01-29', 0, 'Micronesia', 'Kinh', 'Phật giáo', 91, 'Là ông', NULL, '1991-08-10', NULL, NULL, '2015-01-08', NULL, 'Autem animi veniam officia eius earum a illum. Id voluptas et omnis explicabo et dolores. Inventore veritatis ut qui magnam est minima. Ut qui voluptates labore sed quasi unde vero.'),
(110, 'Kali Marvin', '1980-01-06', 1, 'Swaziland', 'Nùng', 'Công giáo', 98, 'Là cháu', NULL, NULL, NULL, NULL, '2004-06-12', '2022-06-24', 'Ea rerum quos ipsam id unde voluptates. Sit quas qui soluta enim autem. Ex consequatur quae sint fugit.'),
(111, 'Evans Kuphal', '1983-11-10', 1, 'Cayman Islands', 'Kinh', 'Thiên chúa', 85, 'Là chị', NULL, NULL, NULL, NULL, '1971-12-04', NULL, 'Adipisci esse in et. Eius laborum cum ratione voluptates perferendis non. Dolorem est ea et nobis qui cumque.'),
(112, 'Hanna Crist', '1970-07-28', 0, 'Brunei Darussalam', 'Dao', 'Công giáo', NULL, NULL, NULL, '2017-10-13', NULL, NULL, NULL, NULL, 'Aperiam nihil voluptas perspiciatis qui amet consequuntur labore. Illum eaque ab quibusdam autem commodi ut hic. Laboriosam quia dolore veritatis laboriosam non saepe.'),
(113, 'Arvel Dickens', '2004-03-25', 1, 'Greece', 'Kinh', 'Không', 85, 'Là bà', NULL, '1992-07-24', NULL, NULL, NULL, NULL, NULL),
(115, 'Hollie Stiedemann', '1985-02-07', 0, 'Tajikistan', 'Tày', 'Không', NULL, NULL, '20121910518116', '1996-08-18', NULL, NULL, NULL, '1973-07-07', NULL),
(116, 'Miss Herminia Thompson III', '2014-09-09', 1, 'Bolivia', 'Kinh', 'Không', 67, 'Là cha', NULL, '1998-04-25', NULL, NULL, '1976-04-04', '2000-03-28', 'Consequatur odio incidunt necessitatibus nihil. Ex facilis non et cum vitae tempore. Nihil ut tempora suscipit qui qui minus. Adipisci eligendi sed autem architecto ratione iure.'),
(117, 'Jalen Reynolds', '1993-05-19', 0, 'Switzerland', 'Khmer', 'Không', 98, 'Là cha', NULL, NULL, NULL, NULL, NULL, '1975-03-17', 'Blanditiis voluptas similique nobis qui. Voluptatum et qui debitis reprehenderit quis. Eum omnis aliquam ut at eaque nemo et voluptas. Enim sequi dolor dolorem nostrum quia.'),
(118, 'Mrs. Stefanie Carroll I', '2012-02-17', 0, 'Guadeloupe', 'Nùng', 'Phật giáo', 83, 'Là ông', '4194877566638', NULL, NULL, NULL, '1982-09-01', '1976-09-21', 'Et voluptates quidem eum quod id eum ut. Sapiente commodi dolorem id. Quia similique autem iste aliquam impedit impedit. Nobis deleniti tenetur laborum.'),
(119, 'Marley Wyman I', '2000-07-25', 0, 'Kiribati', 'Kinh', 'Công giáo', 87, 'Là bà', NULL, '2021-09-03', NULL, NULL, NULL, NULL, NULL),
(120, 'Miss Estefania Batz', '2009-10-02', 1, 'Yemen', 'Nùng', 'Không', 59, 'Là anh', '41362963367555', NULL, NULL, NULL, '2005-03-01', NULL, 'Similique architecto est debitis quia praesentium iusto. Neque aut consectetur eligendi quia est nisi quia. Iste corrupti ratione maxime natus quibusdam est nostrum. Expedita accusantium explicabo sint ut exercitationem corrupti ullam.'),
(121, 'Susanna Rohan', '1977-01-08', 1, 'Hong Kong', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1970-01-13', '1971-01-10', 'Ducimus eius modi quia et consequatur consequuntur. Qui qui saepe voluptatum ut officiis occaecati aut. Cupiditate animi est et aut voluptas. Et voluptates nisi sed dolorum et sit et.'),
(122, 'Mia Ruecker', '1990-07-22', 1, 'Puerto Rico', 'Kinh', 'Không', NULL, NULL, '59462981147121', '2009-07-03', NULL, NULL, '2016-01-29', '2013-09-27', NULL),
(123, 'June Nicolas II', '2019-07-08', 0, 'Madagascar', 'Dao', 'Thiên chúa', NULL, NULL, NULL, '1997-10-31', NULL, NULL, NULL, '2001-08-26', NULL),
(124, 'Scottie Kuphal', '2001-03-15', 1, 'Rwanda', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'Corrine Schaden DDS', '1991-04-07', 0, 'Guatemala', 'Kinh', 'Thiên chúa', 83, 'Là vợ', NULL, '1989-06-08', NULL, NULL, '1988-04-27', '2017-06-22', 'Quis ut facilis repudiandae officia itaque facere eius. Iusto voluptatum dignissimos aspernatur eos asperiores dolorem. Non nemo quaerat fuga. Quasi laudantium omnis rem id ea.'),
(126, 'Dashawn Hane', '1999-06-09', 1, 'British Virgin Islands', 'Khmer', 'Phật giáo', 87, 'Là chồng', NULL, '2014-08-14', NULL, NULL, NULL, NULL, 'Reiciendis ut provident beatae commodi et hic mollitia. Mollitia nisi est eaque tenetur et dolores. Accusantium maiores dolorem ut suscipit esse rerum ex. Accusantium quia eveniet adipisci error natus qui magni.'),
(127, 'Wendy Kuvalis', '1974-02-01', 1, 'Bhutan', 'Thái', 'Không', NULL, NULL, '49681795105082', '2010-10-10', NULL, NULL, NULL, NULL, 'In eos labore minima excepturi nihil voluptatem fuga. Labore rerum deserunt facilis velit fugiat molestiae odio. Neque labore et ut facilis. Sed quis sint sit quia.'),
(128, 'Ida Cronin', '2013-01-09', 1, 'Saint Helena', 'Chăm', 'Không', NULL, NULL, '51302807794066', NULL, NULL, NULL, '1981-05-24', NULL, 'Rerum quibusdam animi voluptas magni consectetur. Vitae voluptas sit et delectus quia pariatur dolores. Officia ipsam est totam et vel vel. Maxime adipisci et et soluta sit.'),
(129, 'Miss Amalia Zboncak', '1974-06-29', 1, 'Portugal', 'Tày', 'Không', NULL, NULL, '61432061127638', '1978-09-22', NULL, NULL, '1981-03-07', NULL, 'Ut qui laborum consequatur facere rem blanditiis. Libero doloremque adipisci impedit a aspernatur rem quaerat. Ea labore reprehenderit distinctio esse harum nemo. Aperiam odio modi voluptatem est ab.'),
(130, 'Meredith Goldner', '2006-06-30', 0, 'Burkina Faso', 'Kinh', 'Không', 102, 'Là ông', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'Myra Kuvalis', '2006-01-21', 1, 'Qatar', 'Thái', 'Không', NULL, NULL, '935177553939', '1980-09-04', NULL, NULL, NULL, NULL, NULL),
(132, 'Olen Larson V', '1982-10-17', 1, 'French Southern Territories', 'Kinh', 'Không', NULL, NULL, NULL, '1987-10-05', NULL, NULL, '1997-03-29', NULL, NULL),
(133, 'Dr. Tate Adams I', '1974-05-03', 1, 'Argentina', 'Chăm', 'Không', NULL, NULL, '53449957799391', NULL, NULL, NULL, NULL, '1971-08-13', 'Et iusto doloribus facilis voluptas. Tempora distinctio eos in ducimus qui eaque at. Nulla voluptas fuga architecto sapiente vero est et. Esse sint autem et enim maiores et in.'),
(134, 'Morton Sanford', '1984-12-01', 0, 'Brunei Darussalam', 'Kinh', 'Không', NULL, NULL, '44538710113515', NULL, NULL, NULL, '1996-09-30', '2020-10-16', NULL),
(136, 'Mr. Riley Daugherty Sr.', '2016-01-26', 1, 'Bolivia', 'Chăm', 'Không', 83, 'Là con', '89219429158546', '2012-05-29', NULL, NULL, '2017-03-23', '1971-11-18', NULL),
(137, 'Prof. Joesph Johnson III', '2022-08-30', 1, 'Holy See (Vatican City State)', 'Nùng', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-08', NULL, 'Delectus ut aliquam esse saepe cupiditate voluptatum. Nam in dolorem doloremque nihil quam. Qui minus eos quo enim hic.'),
(138, 'Valentine Upton DVM', '1988-12-07', 1, 'Kuwait', 'Chăm', 'Phật giáo', 98, 'Là ông', NULL, NULL, NULL, NULL, '1993-08-20', '2021-02-11', 'Impedit dolorem id corrupti itaque et. Expedita et sit ut asperiores quisquam quis qui. Maxime qui recusandae in molestiae est sit eligendi sunt. Rerum eligendi magnam repudiandae velit tenetur.'),
(139, 'Xander OHara III', '1990-10-11', 0, 'Germany', 'Chăm', 'Phật giáo', 104, 'Là cha', NULL, '1989-02-09', NULL, NULL, '1984-01-13', NULL, NULL),
(140, 'Xander Miller', '2010-01-28', 1, 'Slovakia (Slovak Republic)', 'Dao', 'Bà la môn', 98, 'Là ông', '691825252108', '1976-04-05', NULL, NULL, NULL, '1970-08-09', 'Impedit sunt vel esse occaecati eos. Amet iure laborum id autem tenetur et ex. Ut ex illo tempore optio.'),
(141, 'Meghan OReilly', '2020-04-04', 1, 'Central African Republic', 'Kinh', 'Phật giáo', 70, 'Là anh', '56582897155678', '1997-06-09', NULL, NULL, '2000-05-30', NULL, NULL),
(143, 'Humberto Bergstrom IV', '2002-04-29', 1, 'Cayman Islands', 'Dao', 'Không', 98, 'Là em', NULL, '2021-03-10', NULL, NULL, '1983-04-03', NULL, 'Quam nihil repudiandae deserunt incidunt quo laborum consequatur. Quo provident esse dolores fuga totam doloremque. Sit aut libero sunt aperiam. Quas earum nesciunt eveniet et earum.'),
(144, 'Dr. Lonie Dibbert', '2006-07-10', 0, 'Cote dIvoire', 'Mường', 'Không', NULL, NULL, '51626353850704', NULL, NULL, NULL, '1991-06-20', '1998-08-17', 'Voluptatem sunt et amet architecto eligendi fuga ipsa voluptatem. Aut a soluta earum quis eveniet et nihil. Sint magnam officia praesentium asperiores ut atque nihil enim. Sit sed suscipit quo qui qui iusto.'),
(145, 'Dr. Seth Murphy', '1975-06-09', 1, 'Antarctica (the territory South of 60 deg S)', 'Kinh', 'Không', NULL, NULL, NULL, '1999-01-20', NULL, NULL, NULL, '1997-05-30', NULL),
(146, 'Courtney Stoltenberg', '2019-08-26', 1, 'Kuwait', 'Nùng', 'Công giáo', NULL, NULL, '61581966512366', '1975-02-18', NULL, NULL, NULL, '2008-02-13', NULL),
(147, 'Dr. Wendell Barrows', '1979-01-07', 0, 'Brazil', 'Kinh', 'Không', 102, 'Là con', NULL, NULL, NULL, NULL, NULL, NULL, 'Qui iste quisquam voluptate minus consequuntur. In fugit id magnam voluptate et et. Dolor ratione id neque ut tempora eum magnam. Doloremque sit voluptates et minus qui debitis corporis.'),
(148, 'Tyrique Douglas', '2014-04-19', 1, 'Pitcairn Islands', 'Kinh', 'Bà la môn', 87, 'Là mẹ', NULL, NULL, NULL, NULL, '1992-04-15', NULL, 'Non est et unde quos nemo omnis. Corrupti voluptas accusantium quo asperiores accusantium est. Aperiam cumque quia sint exercitationem.'),
(149, 'Geovanni Weissnat', '2011-12-12', 0, 'Austria', 'Chăm', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1972-05-03', NULL, 'Autem laborum vel sunt doloribus vel eos cumque repellat. Quos facilis eveniet dicta sed voluptatem at. Possimus eum rerum animi.'),
(151, 'Dr. Johnathon Koch MD', '2008-07-20', 0, 'Barbados', 'Tày', 'Không', NULL, NULL, '8383036274274', '2007-05-18', NULL, NULL, NULL, NULL, NULL),
(152, 'Karlee Powlowski', '1980-09-13', 0, 'Barbados', 'Mường', 'Thiên chúa', 104, 'Là anh', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'Prof. Geovanni Rohan', '2007-11-19', 1, 'Svalbard & Jan Mayen Islands', 'Khmer', 'Công giáo', 70, 'Là chị', '49892787410053', NULL, NULL, NULL, NULL, '2017-05-17', 'Dolores provident at necessitatibus enim laborum. Soluta nesciunt explicabo occaecati architecto qui. Enim aut qui aliquid at explicabo nisi. Dolore est doloribus alias architecto ea facere.'),
(154, 'Rosalee Johns', '2008-12-18', 1, 'New Zealand', 'Tày', 'Không', 70, 'Là chủ hộ', '970232756', NULL, NULL, NULL, NULL, '1970-09-15', 'Laborum totam fugiat sunt voluptatibus laudantium neque ut. Cum blanditiis omnis dolorem est corporis. Doloribus nesciunt officia eos aliquam aliquid voluptas vitae. Est quia consectetur saepe nesciunt reprehenderit.'),
(155, 'Marquis Nienow', '1991-04-17', 0, 'United Kingdom', 'Dao', 'Không', 83, 'Là mẹ', NULL, NULL, NULL, NULL, '1970-03-30', '1976-05-15', NULL),
(156, 'Josiane Smitham', '2005-01-01', 0, 'Gambia', 'Mường', 'Bà la môn', 83, 'Là vợ', NULL, '1989-10-05', NULL, NULL, '2006-07-30', '1991-03-29', NULL),
(157, 'Prof. Marge Crist', '2001-12-13', 0, 'Netherlands', 'Kinh', 'Không', 87, 'Là chị', NULL, NULL, NULL, NULL, NULL, '1998-03-19', NULL),
(158, 'Hope Muller', '2017-11-10', 0, 'South Africa', 'Nùng', 'Không', NULL, NULL, '73533494835827', '1983-04-06', NULL, NULL, '1973-01-22', NULL, 'Molestias magni provident architecto voluptatem in explicabo asperiores. Numquam maiores ipsa facilis rem blanditiis. Iste a numquam vel nam nemo veniam sit illo. Molestiae impedit nesciunt veritatis iste.'),
(159, 'Lynn Hilpert IV', '2003-08-31', 0, 'Cambodia', 'Kinh', 'Bà la môn', 67, 'Là vợ', NULL, '2018-10-27', NULL, NULL, NULL, '1996-08-23', NULL),
(161, 'Mr. Juvenal Gorczany', '2010-05-20', 0, 'Brazil', 'Mường', 'Không', 98, 'Là ông', '87544064337913', '1989-02-24', NULL, NULL, '2016-11-18', '1976-11-12', 'Voluptatum ipsa et unde quasi. Illum hic minima ipsa provident. Atque maxime et autem at sunt similique officiis.'),
(162, 'Miss Fay Conn', '1977-05-18', 1, 'Marshall Islands', 'Kinh', 'Không', 85, 'Là mẹ', '32869831770326', '1983-11-19', NULL, NULL, NULL, NULL, NULL),
(163, 'Eldon Carter', '1972-11-28', 1, 'Slovakia (Slovak Republic)', 'Kinh', 'Không', 87, 'Là chủ hộ', '541544097', '1985-10-14', NULL, NULL, '1985-04-25', NULL, 'Fuga voluptas doloribus ab exercitationem. Sapiente ipsum ut maiores ipsa sit explicabo.'),
(164, 'Dr. Lilian Hegmann', '2020-02-23', 1, 'Montenegro', 'Kinh', 'Thiên chúa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-12-12', 'Sit veritatis nesciunt aut porro. Accusamus suscipit dolor quaerat. Sit omnis voluptates vel voluptates assumenda dolorem illum.'),
(165, 'Vicenta Jacobson II', '2006-08-10', 0, 'Ethiopia', 'Kinh', 'Không', NULL, NULL, NULL, '1992-05-22', NULL, NULL, NULL, NULL, NULL),
(166, 'Prof. Justine Schroeder', '2001-09-01', 1, 'Puerto Rico', 'Kinh', 'Không', NULL, NULL, '93085377025722', NULL, NULL, NULL, '1991-09-02', '2018-12-20', NULL),
(167, 'Lauriane Jacobson', '2002-07-07', 1, 'Albania', 'Kinh', 'Không', NULL, NULL, NULL, '1990-06-12', NULL, NULL, '1992-11-21', NULL, NULL),
(168, 'Briana Brekke', '1998-07-18', 1, 'Saint Kitts and Nevis', 'Mường', 'Bà la môn', 104, 'Là con', '43249310364997', '2018-02-05', NULL, NULL, '2021-12-06', '2012-04-18', NULL),
(170, 'Bret Reichel', '1972-09-13', 0, 'Spain', 'Kinh', 'Không', 59, 'Là mẹ', NULL, NULL, NULL, NULL, NULL, NULL, 'Quam odio ut provident repellendus enim magni odit. Sed possimus autem est aut quo quia iusto.'),
(171, 'Haven Thompson', '2014-07-21', 0, 'Barbados', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1984-04-30', NULL, 'Adipisci tempore id voluptas qui numquam incidunt consequatur. Et explicabo cum et quia quia in dolore quidem. Corporis architecto cumque quo ut consequatur odio quasi optio.'),
(172, 'Mrs. Karlee Spencer DDS', '2009-07-15', 1, 'Cocos (Keeling) Islands', 'Kinh', 'Thiên chúa', 102, 'Là bà', NULL, NULL, NULL, NULL, NULL, '1978-02-14', NULL),
(173, 'Mrs. Liza Stanton IV', '1982-05-28', 1, 'Colombia', 'Kinh', 'Bà la môn', 59, 'Là mẹ', '69570474481185', NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'Garry Wiza', '1991-12-24', 1, 'Macao', 'Kinh', 'Thiên chúa', NULL, NULL, '80276229776482', '1979-03-22', NULL, NULL, NULL, '1998-03-14', 'Consequatur iusto aut eos autem fugit aut. Hic ut dicta laborum aperiam. Earum illo suscipit fuga qui facere.'),
(175, 'Annamarie Zieme', '1977-10-08', 0, 'Bulgaria', 'Thái', 'Không', 98, 'Là ông', '82794661885515', '1977-05-22', NULL, NULL, NULL, NULL, 'Molestiae et autem amet voluptatem. Blanditiis qui architecto qui voluptatem reiciendis occaecati. Eaque nemo quasi quia fugiat. Magni assumenda voluptate eaque error fugit.'),
(177, 'Rollin Howe', '2011-07-19', 1, 'Latvia', 'Kinh', 'Tin lành', NULL, NULL, '67398201348297', NULL, NULL, NULL, NULL, NULL, 'Occaecati est harum ipsa labore numquam repudiandae. Voluptas facere quos tempore ipsum non sit aut. Cupiditate cumque quia aspernatur alias eum quaerat iure. Qui nihil sed voluptatem saepe.'),
(178, 'Miss Willow Bernier', '2010-04-27', 0, 'Oman', 'Tày', 'Không', 104, 'Là ông', '44859478767410', '2008-12-29', NULL, NULL, NULL, '1982-03-11', NULL),
(179, 'Prof. Geovanny Kris IV', '2018-12-21', 1, 'Singapore', 'Tày', 'Bà la môn', 98, 'Là em', NULL, '2001-05-08', NULL, NULL, NULL, NULL, NULL),
(180, 'Anabelle Dickinson', '2005-08-21', 0, 'Slovenia', 'Kinh', 'Không', 87, 'Là chị', '76521911048261', '1988-07-06', NULL, NULL, NULL, '2015-11-29', 'Et molestias voluptates consequuntur. Repellat numquam in assumenda hic quis ipsa possimus. Adipisci sunt perspiciatis non alias. Voluptas quaerat veritatis perspiciatis et. Eum vel enim magnam quo ut molestiae quaerat occaecati.'),
(181, 'Lenna Ebert', '1998-10-25', 0, 'Suriname', 'Tày', 'Không', 70, 'Là cháu', '2519943593378', '2016-04-14', NULL, NULL, '1999-11-26', '2004-03-29', NULL),
(183, 'Prof. Irma Koss IV', '1997-10-17', 1, 'Monaco', 'Tày', 'Không', 87, 'Là ông', NULL, '2014-10-02', NULL, NULL, NULL, '1971-06-27', NULL),
(185, 'Mr. Milton Huels IV', '2006-12-01', 1, 'Guam', 'Mường', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-21', 'Incidunt nostrum enim nemo sapiente eum. Maxime quia eum velit sit. Maiores velit consequatur sit maiores magni. Sunt nobis dolor et totam ad omnis.'),
(186, 'Dr. Nelle Mohr I', '1976-11-18', 1, 'Guinea-Bissau', 'Mường', 'Phật giáo', NULL, NULL, '53388170799216', NULL, NULL, NULL, '1971-10-12', NULL, NULL),
(187, 'Hailie Walker IV', '1972-03-01', 1, 'Lithuania', 'Khmer', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-06-17', NULL),
(188, 'Erika Stracke', '2014-07-05', 0, 'Jersey', 'Mường', 'Bà la môn', 87, 'Là bà', '6736207287162', NULL, NULL, NULL, NULL, NULL, 'Eveniet unde vel voluptatum excepturi. Placeat nulla adipisci alias voluptatibus autem vel aut voluptatum.'),
(190, 'Karianne Keebler I', '2017-09-09', 0, 'Uganda', 'Kinh', 'Tin lành', 91, 'Là vợ', NULL, NULL, NULL, NULL, '1988-02-19', NULL, 'Voluptatem deleniti quae vitae omnis atque aut. Consequatur distinctio adipisci id vel pariatur et at quia. Rerum sint eos voluptas nam et dolores et.'),
(191, 'Celia Brown', '1994-05-26', 1, 'Sri Lanka', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, '1986-04-26', '1970-03-13', NULL),
(192, 'Ms. Maria Kuhn', '1989-02-21', 1, 'Tajikistan', 'Mường', 'Không', 85, 'Là ông', '22219014535836', NULL, NULL, NULL, NULL, '2015-04-22', NULL),
(193, 'Assunta Casper', '2000-01-14', 1, 'Romania', 'Kinh', 'Không', 67, 'Là chị', '4943835230019', '2018-12-10', NULL, NULL, '1986-06-08', NULL, NULL),
(196, 'Duane Gorczany', '2007-11-19', 1, 'Iran', 'Nùng', 'Không', 67, 'Là ông', NULL, '1999-09-16', NULL, NULL, NULL, '1981-04-11', 'Rem rerum voluptas natus nisi nemo totam nisi. Omnis itaque architecto autem consequatur magnam suscipit voluptas. Accusamus atque deleniti ut doloribus velit qui et.'),
(197, 'Raphaelle Jacobi', '1978-05-25', 1, 'Slovenia', 'Kinh', 'Không', 67, 'Là bà', NULL, NULL, NULL, NULL, '1982-10-28', NULL, 'Dolor rerum temporibus ut delectus repellendus sunt dolores. Praesentium et occaecati incidunt aut quis. Aliquam nostrum fuga accusamus illo non. Sint voluptates voluptatem ut et molestias.'),
(198, 'Michael Cruickshank', '1980-12-06', 0, 'Holy See (Vatican City State)', 'Kinh', 'Không', NULL, NULL, '16710109929768', '1976-08-20', NULL, NULL, '2014-11-23', '2000-06-23', 'Autem et dolor repellendus quis maiores. Laudantium quod expedita quos non id consectetur. Doloribus tempora molestiae deserunt blanditiis at qui vel. Eligendi quo fugit rerum voluptate accusamus sunt.'),
(199, 'Al Willms', '2004-08-29', 1, 'Czech Republic', 'Kinh', 'Không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-11-20', NULL),
(200, 'Ilene Hickle', '1982-03-30', 1, 'France', 'Kinh', 'Tin lành', NULL, NULL, '42574972387051', '1977-10-26', NULL, NULL, '1979-10-09', '1998-07-20', 'Veniam quis voluptatibus animi praesentium laudantium cupiditate ut. Qui qui nihil fuga itaque saepe inventore veniam magni. Libero esse minus est qui.'),
(202, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '12121212', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(207, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 104, 'Là chồng', '123456789111', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(208, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '121212121212', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(210, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '1212121212', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(211, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 70, 'Là chồng', '1212121212121212', '2022-12-20', 'Công an tỉnh Nam Định', 'Sinh viên', NULL, NULL, 'Không có ghi chú'),
(212, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '121212121212121', '2022-12-20', 'Công an tỉnh Nam Định', 'Sinh viên', NULL, NULL, NULL),
(217, 'nghia', '1111-11-11', 1, 'Ha Noi', 'khinh', 'khong', 70, 'Là em', '1212111', '1111-11-11', 'nghe an', 'IT', NULL, '1111-11-11', '1'),
(220, 'nghia', '1212-12-12', 1, '12', '12', '12', NULL, NULL, '1234123', '0012-12-12', '12', '12', NULL, '0012-12-12', '1212'),
(221, 'nghia', '1212-12-12', 1, '12', '12', '12', 102, 'Là mẹ', '12', '0012-12-12', '12', '12', NULL, '0012-12-12', '12'),
(224, 'nghia', '1212-12-12', 1, '12', '12', '12', 102, 'Là anh', '1212', '1212-12-12', '12', '12', NULL, '1212-12-12', '12'),
(226, 'nam', '1212-12-12', 1, '12', '12', '12', NULL, NULL, '121212111111', '1212-12-12', '112', '12', NULL, '1212-12-12', '12'),
(229, 'nghia', '1212-12-12', 0, '12', '12', '12', NULL, NULL, '765712', '1212-12-12', '12', '12', NULL, '1212-12-12', '12'),
(231, 'nghia', '0231-12-31', 1, '123', '123', '123', 104, 'Là con', '5453453', '3123-12-12', '123', '31231', NULL, '2312-12-31', NULL),
(232, 'nghia', '0001-12-12', 0, '12', '12', '12', 104, 'Là con', '12312111132', '0002-12-31', '12', '12', NULL, '0012-12-12', '12'),
(233, '123', '0012-12-31', 0, '123', '123', '123', NULL, NULL, '123123', '0023-12-31', '123', '12', NULL, '2312-12-31', '12'),
(234, '12', '0231-12-31', 1, '123123', '123', '123', NULL, NULL, '12312312312', '0023-12-31', '123', '2312', NULL, '2312-12-31', '123'),
(235, '123', '0003-12-12', 0, '12312', '123', '123', 91, 'Là anh', '1231311222111', '0232-12-31', '123', '123', NULL, '0023-12-31', '123'),
(236, '123', '0002-12-21', 0, '1212', '121', '12', 98, 'Là chị', '12312311112', '0002-11-21', '12', '12', NULL, '0012-12-12', '12'),
(237, 'nam112', '0011-11-11', 0, '11', '11', '11', 91, 'Là cha', '2122211', '1111-11-11', '11', '1', NULL, '0001-11-11', '11'),
(239, '123', '0231-12-31', 0, '123', '123', '123', NULL, NULL, '1222211', '0123-12-23', '123', '3123', NULL, '0023-12-31', '123123'),
(246, 'nghia', '0001-11-11', 0, '11', '11', '11', NULL, '', '213123111', '0011-11-11', '11', '11', NULL, '0001-11-11', '11'),
(247, 'Nam 1', '1212-12-12', 0, '1212', '1212', '1212', 98, 'la con', '12312312', '1212-12-31', '123', '12', NULL, '0121-12-12', '1212'),
(248, 'Nam 1', '1212-12-12', 0, '1212', '1212', '1212', 98, 'la con', '1231231212111', '1212-12-31', '123', '12', NULL, '0121-12-12', '1212'),
(249, 'Nam 1', '1212-12-12', 0, '1212', '1212', '1212', 98, 'la con trai', '1231231212111111', '1212-12-31', '123', '12', NULL, '0121-12-12', '1212'),
(250, '2231', '0023-12-31', 0, '123123', '123123', '123', NULL, '', '16545', '0023-12-31', '123', '123', NULL, '0023-12-31', '123'),
(251, 'sao ', '1221-12-31', 0, '21', '12', '23', NULL, '111', '122543', '0121-12-31', '123', '21', NULL, '1231-12-31', '1'),
(257, 'Tran Van Nghia', '1111-11-11', 0, '1', '1', '1', 112, 'Là chủ hộ', '123123321', '1111-11-11', '111', '1', NULL, '1111-11-11', '1'),
(258, 'nam', '1111-11-11', 0, 'ha noi', 'k ', 'k', 112, 'la con', '1111111', '1111-11-11', 'ha noi', '', NULL, '1111-11-11', ''),
(259, 'Nghia', '2001-02-06', 1, 'ha noi', 'kinh', 'khong', NULL, NULL, '123456787', '2001-12-12', 'ha noi', 'sinh vien ', NULL, '2022-12-02', ''),
(260, 'Phúc TV', '2023-02-14', 1, 'Vinh, Nghệ An', 'Kinh', 'Không', NULL, '', '123321123', '2023-02-16', 'Công An thành phố Vinh', '', NULL, '2023-02-24', ''),
(263, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là con', '12345678921', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tamtrutamvang`
--

CREATE TABLE `tamtrutamvang` (
  `id` int NOT NULL,
  `idnhankhau` int NOT NULL,
  `trangthai` tinyint(1) NOT NULL,
  `diachitamtrutamvang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `noidungdenghi` varchar(255) DEFAULT NULL,
  `thoigian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tamtrutamvang`
--

INSERT INTO `tamtrutamvang` (`id`, `idnhankhau`, `trangthai`, `diachitamtrutamvang`, `noidungdenghi`, `thoigian`) VALUES
(3, 9, 1, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', 'tôi không đề nghị gì thêm', '2001-11-11'),
(101, 60, 1, '44446 Muriel Dale Suite 005\nHahnbury, AL 25831-5247', 'Facilis non corrupti vel labore quia voluptatum deleniti. At aut labore ut distinctio temporibus aut. Officiis ea aliquid adipisci aut.', '1992-06-07'),
(103, 99, 1, '47814 Hermiston Parkway\nSouth Garthstad, CO 25398', 'Vitae et ut voluptatem saepe minus esse. Sed modi nesciunt non esse id distinctio nostrum natus. Ipsa nulla nihil et aperiam eum quia quaerat et.', '2021-12-27'),
(105, 8, 1, '931 Towne Road Apt. 911\nJettiebury, KY 93284', 'Corrupti vel aut magnam ipsam eius perferendis iste. Molestiae dolor natus accusantium accusamus sint nobis hic. Maiores excepturi aut dicta molestiae culpa dignissimos quaerat. Ut et veritatis enim dignissimos aut ut atque.', '2011-12-15'),
(115, 2, 1, '12116 Baumbach Point\nGulgowskiside, ND 61583', 'Id nulla ex error et veniam beatae aliquam. A quos cumque eum aliquid nulla voluptatem cumque.', '2000-12-13'),
(124, 38, 1, '389 Otis Rest Suite 643\nPort Malachiland, AK 40726', 'Cumque adipisci voluptas occaecati eos molestiae amet eos odit. Enim voluptatum velit soluta dolorem quae est sit explicabo. Animi non et quia quas impedit.', '2021-12-20'),
(126, 90, 1, '610 Mitchell Common Apt. 799\nIdatown, WA 29945', 'Nobis id expedita placeat modi repellendus veniam minima. Consequatur id odit temporibus at omnis. Nesciunt aut id aperiam cumque inventore ex et. Rerum eius aut tempora fuga officiis ratione quia error. Molestiae qui eaque perspiciatis eligendi ut omnis.', '2009-04-02'),
(154, 4, 0, '335 Flatley Shore\nDoraland, VA 28096-5719', 'Sit sit in maxime. Ea doloremque officiis quibusdam saepe voluptas harum distinctio. Repudiandae similique ut ut pariatur ut.', '2017-08-31'),
(160, 43, 1, '6284 Vernon Plaza Apt. 688\nWest Monroe, TN 28929-3430', 'Perferendis dolorem beatae aut corrupti reiciendis reprehenderit libero. Perspiciatis quis sed quis dolorem quaerat iusto enim molestiae. Quae consequatur qui eum tenetur qui non et.', '1999-12-12'),
(161, 3, 1, '0731 Koepp Fields Apt. 703\nNew Coltonland, MD 93570', 'Eius quos aperiam sapiente odit qui. Sunt accusamus odit ut quia sed dolor illum.', '2013-11-13'),
(166, 54, 1, '14179 Ansel Road Suite 565\nLake Albertobury, NC 49008-0917', 'Iure harum voluptatem quis at dolores. Sint omnis consequatur non vero sint. Maiores sed dolorem minima in voluptas.', '1978-08-06'),
(168, 28, 0, '687 Kyla Isle\nLake Esperanza, MS 04878-3193', 'Quis architecto rem est autem eum. Omnis tempore in dolor dolore.', '2016-02-11'),
(170, 16, 0, '018 Eloisa Skyway Apt. 187\nHettingerport, GA 24839', 'Sapiente sunt sint vel dolorum a. Laborum est delectus ea. Cum mollitia perspiciatis unde quia error quod. Alias sunt quia aut commodi culpa.', '1993-07-19'),
(188, 95, 0, '4319 Roy Fields Apt. 011\nLizabury, RI 37390', 'Aut omnis eius ex exercitationem. Aperiam reiciendis architecto aut excepturi esse maiores.', '1970-03-17'),
(194, 2, 0, '45792 Waelchi Forks\nJacobsonfurt, NE 32360', 'Non impedit sint aut neque atque qui. Incidunt dolor laudantium sit est consequatur sed dolore.', '1981-04-15'),
(199, 82, 1, '80336 Weber Points Apt. 241\nEdytheburgh, WV 98221-0487', 'Nesciunt dignissimos quam qui omnis sint eum. Pariatur a expedita voluptas rerum voluptatem rerum ut. Nihil omnis qui dolorem nihil fugiat vel ut eaque. Et labore est aut amet molestiae aut.', '1987-02-05'),
(201, 115, 1, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', 'tôi không đề nghị gì thêm', '2021-1-1'),
(202, 17, 0, '1', '', '3212-12-12'),
(203, 41, 0, '1212', '', '0012-12-12'),
(204, 42, 0, '1', '', '0012-12-12'),
(205, 263, 1, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', '', '2021-1-1'),
(206, 260, 1, '23', '', '1111-11-11');

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
('brando61', '134556', 'oreilly@hotmail.com', '1'),
('brooklyn.gaylord', '637763', 'larissa57@gmail.com', '1'),
('cberge', '203406', 'ckoelpin@hotmail.com', '1'),
('cmarquardt', '712155', 'lyric63@gmail.com', '2'),
('collier.jaclyn', '855392', 'dickens.marley@yahoo.com', '1'),
('dbotsford', '344340', 'ccormier@hotmail.com', '2'),
('fritz55', '791500', 'nannie.stark@yahoo.com', '1'),
('gleason.conor', '322845', 'skessler@yahoo.com', '2'),
('gleichner.maya', '320787', 'adolph.dicki@hotmail.com', '2'),
('heidenreich.sven', '583077', 'adela.kuhic@hotmail.com', '1'),
('jarod05', '278006', 'sauer.kelsi@gmail.com', '2'),
('joanny.barton', '401812', 'glover.richmond@gmail.com', '1'),
('kathlyn21', '827849', 'anissa.farrell@yahoo.com', '1'),
('ketoan', 'admin', 'tranphuc8a@gmail.com', '1'),
('ketoan2', 'admin', 'tranphuc8b@gmail.com', '1'),
('king.hector', '653989', 'mkling@gmail.com', '2'),
('korey.schneider', '333836', 'ilind@gmail.com', '1'),
('kozey.bethel', '107459', 'gay18@hotmail.com', '2'),
('mueller.marie', '277366', 'jerrod.frami@yahoo.com', '1'),
('oquitzon', '263013', 'gabrielle.jacobi@yahoo.com', '2'),
('raynor.margie', '542650', 'suzanne23@hotmail.com', '1'),
('ynienow', '224583', 'demarco.swift@hotmail.com', '2');

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
-- AUTO_INCREMENT cho bảng `danhsachnopphi`
--
ALTER TABLE `danhsachnopphi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `hokhau`
--
ALTER TABLE `hokhau`
  MODIFY `sohokhau` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `khoanthu`
--
ALTER TABLE `khoanthu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `lichsu`
--
ALTER TABLE `lichsu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- AUTO_INCREMENT cho bảng `nhankhau`
--
ALTER TABLE `nhankhau`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT cho bảng `tamtrutamvang`
--
ALTER TABLE `tamtrutamvang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

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
