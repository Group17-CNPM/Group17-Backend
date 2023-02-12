-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th2 11, 2023 lúc 06:32 PM
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
(1, 12, 10, 2000, 'Phúc', '2023-2-11 24:32:32', NULL);

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
(4, 5, '11', 'Lê Thanh Nghị', 'Đồng Tâm', 'Hai Bà Trưng', '2001-11-11 0:0:0'),
(10, 1, '11', 'Lê Thanh 2', 'Đồng Tâm 2', 'Hai Bà Trưng 2', '2001-11-11'),
(11, 6, '11', 'Lê Thanh 3', 'Đồng Tâm 3', 'Hai Bà Trưng 3', '2001-11-11'),
(12, 8, '12', 'asd', 'asd', 'asd', '2001-12-12'),
(51, 18, '548', 'Kshlerin Key', 'East Elnora', 'Lake Luz', '1970-06-16'),
(58, 4, '633', 'Alf Motorway', 'New Inesport', 'Desireeside', '2006-09-05'),
(59, 25, '989', 'Sandy Neck', 'Lake Zariaville', 'Kreigerborough', '1987-08-28'),
(62, 6, '909', 'Aglae Islands', 'Lorenzaside', 'New Eliezerport', '2008-11-16'),
(66, 4, '249', 'Nicholaus Island', 'South Aleenland', 'New Mustafa', '1980-09-24'),
(67, 88, '249', 'Rowe Via', 'South Ryleigh', 'Raymundoland', '1970-11-14'),
(70, 154, '68', 'Guiseppe Expressway', 'Port Dereck', 'Reingerside', '1994-09-10'),
(78, 9, '483', 'Makenzie Inlet', 'Keeganview', 'Tyshawnhaven', '2021-02-16'),
(83, 92, '669', 'Zachery Row', 'North Laurieville', 'Cotytown', '1972-05-31'),
(84, 32, '876', 'Torphy Drive', 'South Abigailton', 'East Werner', '1978-02-13'),
(85, 3, '177', 'Stefan Landing', 'Shirleyberg', 'Hazelborough', '1979-11-26'),
(87, 163, '479', 'Cierra Shoal', 'West Emie', 'New Mackenzie', '1998-07-07'),
(88, 1, '342', 'Nicklaus Cove', 'Westbury', 'West Leliaville', '1971-12-13'),
(91, 18, '567', 'Denesik Throughway', 'West Cotystad', 'Itzelton', '2008-07-20'),
(97, 15, '164', 'Waters Curve', 'Cliffordville', 'North Krystina', '2010-03-12'),
(98, 67, '997', 'Marilyne Shores', 'South Maeveside', 'Port Angelaland', '2012-10-28'),
(102, 2, '55', 'Lê Thanh Nghị', 'Đồng Tâm', 'Hai Bà Trưng', '2001-11-11'),
(103, 7, '12', 'nguyen', 'nguyen', 'nguyen', '1111-11-11'),
(104, 16, '123', '123', '123', '123', '2122-12-31'),
(105, 17, '123', '123', '123', '123', '2001-11-11'),
(106, 21, '12', 'aaa', 'aaa', 'aaa', '1212-12-12');

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
  `ghichu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `khoanthu`
--

INSERT INTO `khoanthu` (`id`, `ngaytao`, `thoihan`, `tenkhoanthu`, `batbuoc`, `ghichu`) VALUES
(1, '1998-05-12', '1987-08-02', 'Nostrum recusandae nam est ut numquam.', 1, 'Et nostrum corrupti commodi. Voluptatibus similique dolores facere ipsa. Dolor ab pariatur est quia et magni. Vero quisquam adipisci saepe non possimus quas.'),
(2, '2009-11-19', '2000-08-18', 'Accusantium quaerat voluptatem expedita et.', 1, 'Iure illum aut at fugiat dicta. Velit sequi placeat sit numquam aut et dolorem rerum. Dolores ducimus eos quia accusantium consequuntur pariatur consequuntur. Molestiae asperiores quaerat consequatur.'),
(3, '1990-03-16', '1987-04-05', 'Itaque impedit aliquam minima ut.', 0, 'Consequuntur est sit quisquam dolorum incidunt cum. Blanditiis modi delectus tempore nulla. Hic aut consequatur aut optio. Aut ullam consequatur accusantium vel a laborum distinctio animi.'),
(4, '1994-06-12', '2015-12-20', 'Rem amet consequatur ut iure.', 0, 'Nihil minus quaerat doloremque. Voluptatibus alias deleniti aut consequatur. Eligendi aut voluptatibus quia distinctio itaque saepe earum.'),
(5, '1999-11-11', '2000-01-01', 'Natus sequi quia est dolor.', 0, 'Quidem cum vel minima quo. Quia ducimus laborum corporis necessitatibus nihil doloribus. Vitae soluta alias aut consequatur autem. Soluta dolores alias vero quaerat ipsa qui. Officiis eveniet ut alias laudantium.'),
(6, '1987-06-03', '1971-06-21', 'Facilis eum tempore tenetur necessitatibus.', 0, 'Ex placeat ea ut sit. Est aut dolorum rerum non eveniet consequatur voluptas. Consectetur ipsum assumenda tempore quam quisquam neque et. Non velit error quis velit quae.'),
(7, '2010-08-03', '1990-12-30', 'Quia et atque similique beatae.', 0, 'Sint aut rerum aut sint vel officiis est. Ipsum facilis ratione reiciendis. Aut velit quos repellendus vel. Illum voluptas voluptatem consequatur molestiae ut repudiandae est.'),
(8, '2009-11-26', '2018-08-27', 'Sint ut omnis nisi labore.', 1, 'Nesciunt voluptate qui temporibus. Ut officiis cupiditate ut ex. Earum rerum suscipit quia voluptates porro culpa commodi.'),
(9, '2007-04-28', '2000-11-28', 'Et omnis aut non neque est id.', 1, 'Modi vitae dolore voluptas rerum dolore similique omnis in. Culpa ut voluptas commodi est. Pariatur quia impedit similique enim aperiam vel.'),
(10, '2008-06-12', '1973-09-23', 'Iure ut ducimus facilis.', 0, 'Ex deserunt sit et architecto. Ea voluptates aperiam quis voluptatem rem et. Suscipit debitis voluptatem aut nam libero.'),
(11, '1977-06-20', '1991-07-25', 'Cupiditate alias eius aut delectus.', 0, 'Eum vitae alias consectetur sequi nihil. Libero voluptas porro consectetur consequatur dolorem numquam ex qui. Minima ut necessitatibus aut eveniet quia illo. Iste expedita quia autem.'),
(12, '1989-07-23', '2003-05-31', 'Et aut vitae ducimus laborum accusantium a.', 0, 'Consequatur ab soluta placeat ab minima. Eveniet et sint et nihil. Illo dolorem fugiat dolore. Maxime quo molestiae dolores tempora itaque necessitatibus.'),
(15, '2016-02-19', '1997-06-01', 'Consequatur et a veniam facere mollitia qui aut.', 1, 'Ut quo aut et. Expedita ratione amet beatae eaque sed. Sint rem nemo in non repellat. Quas et a porro asperiores et.'),
(16, '2000-07-07', '2000-03-04', 'Saepe sequi dolores dolor molestiae sit facere iste sapiente.', 1, 'Voluptas est totam voluptas occaecati laboriosam eos vitae. Architecto est exercitationem vel architecto. Aut rerum aliquam perspiciatis aut.'),
(17, '2001-10-09', '2005-12-31', 'Sunt corporis id dolore labore libero quo.', 1, 'Dolorum sit dolores odit quia natus. Quaerat culpa iusto ad autem ut occaecati exercitationem omnis. Tempore sit est rerum aut aut at sunt. Totam magni atque laudantium quia quo reprehenderit adipisci.'),
(18, '1997-05-29', '1982-09-07', 'Doloremque dolore non est quis nihil.', 0, 'Qui maiores neque eum. Sint beatae enim et suscipit amet doloribus. Quos quo est suscipit sit suscipit dolor. Ut nulla voluptatem est beatae accusamus harum voluptas.'),
(19, '2005-02-24', '1987-07-01', 'Suscipit reiciendis qui atque et laborum veniam minus excepturi.', 1, 'Ut laboriosam qui quisquam blanditiis dolor culpa. Natus consequatur aliquid minima ut occaecati error laborum. Facilis expedita at sed occaecati nesciunt cum tenetur.'),
(20, '1992-06-24', '1991-06-21', 'Consequatur velit mollitia nihil.', 1, 'Qui voluptate iusto optio asperiores. Ducimus eaque earum qui dolore molestias quisquam blanditiis laboriosam. Voluptatem aut labore corrupti blanditiis ea inventore.'),
(21, '1984-01-11', '1994-08-09', 'Molestias rerum ex officiis eveniet eius voluptas.', 1, 'Incidunt velit repellendus quia. Perferendis tenetur possimus consequatur nihil. Rerum facilis eaque nam maxime dolorem iusto eius. Delectus eum illum et.'),
(22, '1991-06-29', '1994-12-13', 'Tempora accusantium enim vel recusandae earum provident.', 0, 'Nulla et libero recusandae sunt soluta quasi voluptate. Adipisci amet qui est eveniet ut.'),
(23, '2016-11-23', '2018-07-15', 'Explicabo doloribus repudiandae tempore asperiores.', 0, 'Ut repudiandae provident et deserunt ab deleniti temporibus. Nulla temporibus sit nobis ut mollitia ut rerum.'),
(24, '2011-12-03', '1989-07-21', 'Omnis veritatis similique suscipit repellat tempore.', 0, 'Repudiandae quas vel assumenda aut velit molestiae. Incidunt eveniet unde libero rerum. Rerum provident quasi veniam aut. Deleniti soluta et velit voluptatem voluptas dolores aut.'),
(25, '1992-07-13', '1970-07-05', 'Quis rerum qui quam qui omnis.', 1, 'Qui vero quia deserunt ut ut numquam corporis. Debitis porro adipisci sunt nam dolorem occaecati. Incidunt nobis sunt nobis aliquid. Consequatur quo doloremque occaecati quibusdam autem et.'),
(26, '1995-07-24', '2020-03-25', 'Et suscipit rem veritatis.', 0, 'A aut labore explicabo rem et. Amet quas non voluptas ratione cum soluta nihil placeat. Eveniet unde sit et ipsum. Consequuntur aut minus aut nobis quia.'),
(27, '2003-01-27', '1991-05-23', 'Expedita minus qui necessitatibus est ducimus optio quas.', 0, 'Et laborum doloremque veniam distinctio suscipit voluptatibus laborum. Non dolorum vero ut in ipsa. Dolor rerum expedita aliquam dolorem accusamus. Maxime asperiores quod dolore consequatur est expedita est.'),
(28, '2022-10-30', '1989-03-26', 'Officia magni repellendus atque provident officiis.', 0, 'Praesentium et eius at asperiores consequatur laborum delectus est. Cupiditate labore praesentium qui minus neque sed at.'),
(29, '1992-10-03', '2011-09-29', 'Eum ratione magnam laborum et illum.', 1, 'Vero quo veritatis atque mollitia est. Quas reprehenderit labore hic reprehenderit. Aut molestiae in ut. Et dolor et unde nihil.'),
(30, '2017-07-15', '1996-05-24', 'Est ea possimus at.', 0, 'Iste pariatur aliquam ipsam itaque. Dignissimos numquam nihil illum illum assumenda consequuntur. Ut voluptatibus earum ipsum laudantium. Omnis error similique corporis ut possimus qui est.'),
(31, '2009-09-24', '1992-05-05', 'Impedit omnis et voluptatem itaque qui aut.', 1, 'Ut consequatur qui id. Incidunt a neque hic amet quia beatae perspiciatis aut. Molestiae iusto dolorem aliquid aliquid. Recusandae sit placeat et facere consequuntur illum.'),
(32, '1971-03-18', '2001-03-24', 'Eligendi quo accusantium quos accusantium.', 0, 'Excepturi blanditiis iure at qui doloribus. Atque accusamus molestiae sint qui sint exercitationem magnam aut. Excepturi quo consequatur voluptatem dolores iusto est. Qui cupiditate ut fugiat qui distinctio sunt voluptatibus. Ipsum ut illo facilis facilis'),
(33, '1975-01-09', '2008-08-17', 'Doloribus totam nihil voluptas praesentium aut exercitationem.', 0, 'Occaecati nobis rerum sint est maxime mollitia. Iusto qui et et ut cumque quam quisquam eos. Ut rem quia facere sunt. Ut in eos voluptatem ipsa consequatur odit.'),
(34, '1974-09-19', '2010-08-01', 'Id perspiciatis officia ipsa est itaque explicabo velit qui.', 1, 'Soluta quae id perferendis sapiente et porro. Officiis illo necessitatibus officia id. Deleniti repellat dolor facilis eveniet doloremque.'),
(35, '1997-07-04', '2011-12-19', 'Debitis quia similique et tempora facere.', 0, 'Non perspiciatis quia harum. Accusamus sit rerum vel quidem sapiente. Corporis consequuntur temporibus qui consequatur. Commodi nisi eligendi officiis.'),
(36, '2003-01-16', '2016-11-12', 'Sit est aut doloribus repudiandae eveniet.', 0, 'Excepturi eius velit id et quae atque. Molestiae eos voluptas laboriosam consequatur molestias. Non consequatur harum beatae quis.'),
(37, '1975-10-03', '2019-11-29', 'Sit voluptatem omnis facilis dolorem et.', 1, 'Voluptatem qui ipsum occaecati dolor occaecati itaque enim. Aut harum eaque delectus voluptatem recusandae distinctio quisquam. Dolorem voluptatem quia harum cupiditate. Beatae blanditiis aliquid sed sit.'),
(38, '1977-02-09', '1996-02-07', 'Sint ut ea et quam tempora suscipit magnam.', 0, 'Voluptatibus sit quaerat magni corrupti deleniti neque ut. Rerum impedit porro possimus. Dignissimos quidem similique quia molestias maxime magni culpa. Amet libero illum vitae iusto quaerat sit dolor.'),
(39, '2022-08-16', '2021-03-28', 'Quidem occaecati quae rerum nihil optio iure.', 0, 'Voluptatum ipsum dignissimos quis et. Ut repellat fugit natus atque non eum est. Tempore natus hic occaecati dignissimos quisquam. Eum voluptatem consequuntur officia id.'),
(40, '1986-10-09', '2005-08-12', 'Rerum sit nihil omnis.', 1, 'Voluptas rerum expedita veritatis error vero error nesciunt. Quisquam quam eaque itaque neque atque explicabo repellendus. Laborum sit labore et dolorum a sint. Cumque aliquam aliquam quia repellat eos aperiam aspernatur est.'),
(41, '1989-09-17', '1978-04-08', 'Voluptatem veniam dolor quia.', 1, 'Eos molestias minima omnis et magnam soluta. Velit pariatur debitis aut. Molestiae consequuntur expedita magni sit esse. Aut consequatur quae dolor repellat aut fugit id.'),
(42, '2020-05-20', '1978-04-16', 'Voluptas illum rerum eius magni voluptates.', 1, 'Consequatur dolores et doloribus expedita dolorum adipisci labore. Quo sit dolore rerum eius. Facere quia et occaecati veritatis aspernatur.'),
(43, '2009-12-29', '1974-05-27', 'Natus voluptatem distinctio reiciendis corrupti qui suscipit.', 0, 'Reprehenderit quo ipsa aliquam reiciendis rerum. Dolorem et voluptas accusamus tenetur eligendi. Eum dolorum quam ad officia expedita officia. Praesentium dignissimos nemo necessitatibus velit magni qui aut numquam.'),
(44, '1973-08-18', '1982-11-24', 'Quis minima est corrupti iusto consequatur repellat.', 0, 'Et fuga fuga eum voluptas ea est. Vitae fugit harum ut accusamus voluptas animi quod.'),
(45, '1993-05-15', '1987-06-26', 'Inventore blanditiis suscipit officia dolor.', 1, 'Aut minima quia consequatur tenetur quo ut. Doloribus quia porro amet iusto eligendi quia. Rerum voluptate quidem incidunt est laboriosam alias.'),
(46, '1980-03-04', '1996-03-31', 'Vitae cumque ut expedita aut.', 1, 'Laudantium nobis corporis necessitatibus omnis debitis. Sapiente cum assumenda deserunt accusamus repellat. Debitis quidem laboriosam dolorem perferendis vel alias aut. Commodi molestiae laudantium excepturi porro nesciunt occaecati sunt.'),
(47, '2018-12-17', '2014-02-21', 'Fugit reprehenderit totam possimus deleniti possimus autem.', 1, 'Sed quis autem maiores. Doloribus eligendi dolores nisi ut sed et harum. Ipsum numquam quis expedita officia quia molestiae sit. Saepe fuga debitis deserunt est modi aut.'),
(48, '2008-02-20', '1984-05-05', 'Illo autem omnis impedit vero eos aut.', 0, 'Quo libero inventore ipsa omnis molestiae sit. Architecto est quas tempore repudiandae. Laudantium doloremque et unde ut delectus molestias voluptatibus. Facere voluptas dignissimos tempora corrupti.'),
(49, '2002-03-10', '1989-01-03', 'Officia debitis suscipit odio quod blanditiis veniam.', 1, 'Iure qui soluta dolorem iste dolor perspiciatis ipsum. Voluptatibus aspernatur doloribus perspiciatis vitae reprehenderit velit. Eum qui est reprehenderit illum soluta.'),
(50, '2013-07-20', '2011-10-13', 'Neque deserunt quo non quos eveniet.', 1, 'Illo ratione est modi perspiciatis molestiae est quis veritatis. Dolore ad optio tenetur exercitationem ea atque. Vero quos officia aperiam sapiente non occaecati ipsum ratione. Ipsam ipsum ea autem iusto.'),
(51, '2002-11-18', '2018-10-01', 'Minima architecto quaerat iste sed hic dolore cumque.', 1, 'Molestias exercitationem molestias eveniet. Omnis est consequatur voluptas qui non.'),
(52, '2002-06-30', '1995-06-20', 'Autem ducimus incidunt corporis harum.', 1, 'Non dolorem voluptate illum ut. Quae assumenda porro dicta quasi mollitia id eum. Est commodi minima veniam est quis enim. Iste rerum aut sed non eius fugit ullam non.'),
(53, '1998-12-17', '2014-06-22', 'Ex amet et saepe dignissimos a.', 1, 'Quia doloribus quod quasi provident cumque. Rem exercitationem non sit dolorem et sed.'),
(54, '2004-12-10', '2004-09-04', 'Tempora voluptas qui quia cumque similique.', 0, 'Rem et enim quia omnis. Eum voluptatem voluptates possimus aspernatur accusantium sunt omnis. Quibusdam ea et est.'),
(55, '2019-10-30', '1977-03-25', 'Ut quod occaecati cum reprehenderit distinctio a vitae.', 1, 'Et cum eaque et consequatur inventore. Sapiente non voluptatem voluptas ex. Qui porro aut hic veritatis. Qui odit omnis vel a deserunt sapiente ea. Maiores accusantium error provident autem tempore ut placeat.'),
(56, '1992-02-09', '1987-05-22', 'Eos dolor facere repudiandae ab perferendis aspernatur aut.', 1, 'Enim est est quas sequi voluptatibus dolorem. Ipsam officiis voluptatem quos et. Quo ut eveniet et veniam cumque occaecati in.'),
(57, '2015-12-18', '2015-08-17', 'Et distinctio et qui praesentium facere.', 1, 'Adipisci eius magnam repudiandae quam reiciendis. Consectetur qui omnis totam quia autem. Vero dolores inventore qui deleniti velit repellat eius. Eius mollitia quis ullam fuga repellendus pariatur ut sit.'),
(58, '2005-11-28', '1981-02-07', 'Fugiat aut voluptas itaque voluptas voluptatibus.', 1, 'Totam quo dolore beatae repudiandae iure dignissimos laboriosam. Quidem ab id iste doloremque sit beatae ut. Amet placeat ducimus eveniet rerum et non. Omnis aperiam mollitia cupiditate maxime.'),
(59, '1985-09-13', '2003-06-23', 'Fugiat eligendi vel repudiandae aut dolores ea impedit odit.', 1, 'Impedit in doloribus aut facilis beatae dolorum et necessitatibus. Fuga aperiam dolorem molestias doloremque perspiciatis sit. Sed ut voluptatibus sit ut ut.'),
(60, '1993-11-08', '1979-12-24', 'Dolore ut maxime voluptas voluptatem fugiat qui voluptatibus quia.', 0, 'Quod rerum autem repellat rerum aut. Ratione ut pariatur id blanditiis et doloribus. Quia ratione mollitia dignissimos sed quo. Harum nulla quo animi quo. Eum fuga voluptatem eaque quis qui.'),
(61, '2020-03-10', '1981-04-29', 'Eum aspernatur reiciendis sunt vel in ut.', 0, 'Aliquam nesciunt iure ea saepe. Consequatur et qui cupiditate animi ratione quia consequatur. Voluptas ipsum non voluptatem nulla quam aut. Qui impedit fugit voluptas ipsa.'),
(62, '1979-04-09', '1973-05-12', 'Quasi voluptatem quae numquam reiciendis quia blanditiis non amet.', 1, 'Neque ea eligendi est. Placeat id ipsam at aut rerum quidem. Debitis rerum ab ea quia fugiat placeat nisi. Odio deleniti quis sapiente voluptatem eaque.'),
(63, '1997-03-24', '1989-04-29', 'Sapiente qui omnis consectetur ipsam.', 0, 'Sit mollitia odio impedit veniam aperiam aut. Ut tempora nam et reprehenderit voluptatem et labore.'),
(64, '1997-09-13', '1997-03-09', 'Molestias dolorum voluptas ut modi aspernatur tempore sunt ducimus.', 0, 'Beatae officiis id expedita corrupti fugiat. Aliquam in deserunt blanditiis porro aspernatur soluta neque. Ut qui est quasi facilis. Officiis sed quia et.'),
(65, '1986-03-04', '1980-07-18', 'Ut praesentium animi possimus harum maxime.', 1, 'Enim fugiat quia aliquam voluptate. Est dolorem dolorem molestiae quo est suscipit repellat. Autem sapiente nulla ut deleniti. Qui consectetur nam totam.'),
(66, '2012-02-07', '2020-09-18', 'Rerum itaque dicta ducimus aut molestias.', 0, 'Officiis omnis quod facilis a fuga accusantium. Minima eos hic et a et est. Quia consectetur aut saepe quia autem.'),
(67, '2002-09-16', '1985-06-09', 'Rerum minus vero vel ut et.', 1, 'Culpa illum culpa exercitationem dignissimos et. Vel voluptas adipisci aut id sed laborum quam. Harum labore vel sint est. Dolorum quo et in ad quisquam possimus.'),
(68, '2012-05-19', '1994-11-21', 'Ea earum est dolorem molestiae dolor quam harum.', 0, 'Commodi dolores nobis qui voluptatem in soluta. Sint commodi sed reiciendis recusandae. At quisquam exercitationem sed pariatur sint cumque non omnis.'),
(69, '1974-08-15', '1975-11-11', 'In ipsum et doloribus enim eaque cumque nihil.', 1, 'Ducimus tempore inventore tenetur sapiente et aut molestiae. Et reiciendis qui sed perferendis. Perferendis molestiae incidunt dolorem. Sunt et rem aut consequatur veniam voluptas natus.'),
(70, '2022-02-14', '1984-11-14', 'Fugit id iure earum vero esse.', 0, 'Et est et eos sit nesciunt. Quia culpa molestiae magnam laudantium eaque illo. Tempora qui dignissimos quaerat enim dolorum voluptatibus sit.'),
(71, '2009-02-09', '2006-11-04', 'Distinctio odio sint modi.', 1, 'Est corrupti aut consequatur et expedita rerum. A esse id molestias earum libero molestias voluptatem. Libero nihil ipsa sit ab velit expedita neque.'),
(72, '2000-10-25', '2009-09-23', 'Exercitationem ut amet ut minima.', 1, 'Tempore minus accusantium fugiat quaerat nobis est. Pariatur beatae sint tempore et. Eum reprehenderit iusto et sunt voluptas.'),
(73, '2022-12-10', '1972-08-18', 'Porro itaque culpa aut at quibusdam ducimus.', 0, 'Et autem natus unde reprehenderit. Reprehenderit cumque et omnis magnam. Qui minus cupiditate voluptatem. Quam atque sapiente quis omnis repellat.'),
(74, '1992-10-24', '2019-02-08', 'Sint dignissimos non dolorem voluptatibus beatae.', 1, 'Alias facere vel dolorum atque aut officiis et. Quidem nesciunt blanditiis voluptatibus.'),
(75, '2010-12-16', '2005-04-08', 'Nihil nihil eius sit eaque.', 1, 'Laboriosam eum facere ab enim ullam. Ipsam eos et cumque sint exercitationem. Consequatur est vero eos. Error et qui corporis nihil autem aut.'),
(76, '2004-03-13', '1973-06-28', 'Ipsam omnis mollitia et doloribus.', 0, 'Occaecati iste commodi voluptatem voluptas aut magnam. Beatae praesentium tempore nesciunt similique qui sit repudiandae. Aut amet ipsam pariatur non.'),
(77, '1997-04-11', '2003-07-02', 'Ut pariatur voluptatem debitis molestias magnam sed.', 0, 'Qui at eaque ad corporis. Magnam consequuntur non ex consequatur. Necessitatibus doloremque consequatur voluptas. Fugit sint illo voluptate quidem error consequatur. Error fuga quaerat ipsa exercitationem.'),
(78, '2003-12-04', '1996-03-10', 'Qui est et sint.', 0, 'Ratione explicabo dolorum porro architecto. Ad nam itaque ducimus repellat. Quam consequuntur est fugiat similique vitae nihil doloremque ut.'),
(79, '1993-06-20', '1995-10-14', 'Sed et velit voluptatibus autem occaecati.', 1, 'Magni repudiandae quae sunt autem occaecati rerum neque. Culpa ea quaerat quo magnam facilis. Pariatur consectetur quo nostrum nihil impedit. Impedit accusantium eius ipsa est provident iusto.'),
(80, '2004-03-25', '2008-06-20', 'Adipisci necessitatibus id laudantium enim.', 0, 'Sed quia facere alias nemo. Voluptates quisquam fuga et saepe nihil. Ipsa non odio ea excepturi vero velit fugiat.'),
(81, '1993-12-12', '2013-12-02', 'Veritatis vero consequatur modi vel.', 0, 'Deserunt quia dolores enim reprehenderit quaerat debitis reprehenderit. Quo qui praesentium perspiciatis vel molestiae in vitae. Doloribus et quia sunt autem.'),
(82, '2021-05-24', '1982-08-09', 'Sapiente assumenda ipsa officia impedit.', 0, 'Debitis officia itaque qui dolor et voluptatem magni assumenda. Aspernatur recusandae adipisci reprehenderit enim nihil at eveniet animi. Numquam molestiae voluptatum tempore. Et nam vitae molestiae fuga fuga vel consequatur.'),
(83, '1980-10-24', '1976-05-07', 'Modi quos dolor esse eos et.', 0, 'Corporis ab eius nisi dolor ea pariatur ut. Exercitationem dolorum iure quia facilis ut. Cupiditate quisquam odio aut magnam doloremque natus.'),
(84, '2016-05-13', '2010-10-15', 'Similique amet facilis iure tenetur dolorum.', 1, 'Consequatur sequi eaque illo consequatur omnis modi eaque. Dolore odio minus ipsa ea. Voluptas sit sint ut illum eveniet voluptas voluptate.'),
(85, '2000-05-10', '1985-08-16', 'Voluptas amet veritatis dolorem.', 1, 'Aperiam libero voluptates ad maxime animi dolorem pariatur. Vitae et ut corrupti eius animi vero voluptatem. Quis maxime cupiditate cupiditate quasi voluptas repudiandae velit aut. Quidem est facilis voluptatem.'),
(86, '1975-05-10', '1996-05-31', 'Magnam esse sit qui delectus rerum id dolorem.', 1, 'Eum eos doloribus quas provident commodi et. Velit perspiciatis nemo omnis hic sed. Provident et corporis incidunt eum qui non sunt. Aperiam sed delectus ea ea nisi consectetur architecto.'),
(87, '2021-07-29', '1986-01-25', 'Rem sit molestiae vero et unde molestiae at.', 1, 'Et quisquam est adipisci aperiam in quis. Rerum illum voluptate vel omnis. Quis dolorum occaecati voluptatibus dolores. Accusantium impedit sit ut optio velit quis cum.'),
(88, '2018-11-16', '2005-10-14', 'Voluptas reiciendis pariatur aut corporis architecto quia quis cupiditate.', 0, 'Libero nostrum enim eius dolor. Nisi est rerum ullam dignissimos itaque. Mollitia pariatur autem tenetur sint nobis est. Sunt repudiandae voluptatem omnis delectus et.'),
(89, '1979-11-26', '2010-06-12', 'Consectetur et ipsa dolorum dolor praesentium.', 0, 'Dolores in explicabo consequatur. Praesentium animi nihil dolorem. Libero mollitia qui optio consequuntur sunt dignissimos.'),
(90, '2021-10-03', '2019-03-09', 'Ipsam asperiores necessitatibus rerum cumque voluptas magni voluptatibus.', 1, 'Aperiam aut quia accusantium odit eos ducimus quae. Totam natus molestiae sunt possimus. Rerum non porro iusto et voluptatem ut autem. Eius consectetur harum a aut ut.'),
(91, '1990-12-09', '1997-12-26', 'Molestiae et deserunt dolores.', 1, 'Repellat assumenda nam blanditiis non. Natus quo culpa aspernatur temporibus qui molestiae. Velit temporibus molestiae quas quod quasi eveniet. Suscipit nemo odit dolor a inventore.'),
(92, '1985-06-11', '1983-05-11', 'Magni aut distinctio sunt quae qui minima possimus tempore.', 1, 'Laudantium ea praesentium velit eveniet. Placeat sapiente accusantium voluptates ut aut iste ad voluptatem. Consequatur vitae autem blanditiis et. Qui delectus qui iure voluptate eum.'),
(93, '2009-04-17', '2015-05-12', 'Non labore enim fugit fugiat nesciunt amet sint iste.', 1, 'Repellat sunt aspernatur exercitationem officiis ut numquam. Earum quis fugit rerum aspernatur blanditiis omnis vero. Expedita ex dicta ab ut fugit.'),
(94, '2009-01-10', '2009-01-20', 'Sed veniam officia rerum minus quo.', 0, 'Ut et error molestiae. Est recusandae ratione maiores debitis.'),
(95, '1997-08-31', '2007-02-06', 'Et quod perspiciatis deserunt iste.', 1, 'Ipsum dolorem soluta vel. Voluptatum in adipisci voluptatum molestias. Ea est occaecati qui accusantium magnam eos. At sit dolorem dolorum incidunt natus qui.'),
(96, '1989-06-14', '2012-04-28', 'Ea quasi eligendi consectetur repudiandae molestias ea quas.', 1, 'Aspernatur asperiores rerum quia omnis. Blanditiis accusantium fuga illo sunt perferendis ea voluptatem debitis. Provident praesentium repudiandae numquam. Ab asperiores necessitatibus rem libero similique fugit.'),
(97, '2002-10-17', '1981-08-31', 'Mollitia optio est non iure inventore.', 0, 'Aut et consequuntur aut. Sit rerum illum et earum. Optio ut unde dolore iste consequatur possimus rerum. Tempore sed aut qui excepturi quia veritatis qui.'),
(98, '1983-04-04', '1999-03-19', 'Aperiam suscipit consequatur ut quas.', 1, 'Perferendis vero sunt qui ducimus ipsam. Recusandae nulla in ut neque quasi repudiandae laboriosam error. Occaecati earum laudantium distinctio explicabo quod quibusdam porro.'),
(99, '1985-02-13', '1996-10-07', 'Fugiat repellat nesciunt mollitia tempora et.', 1, 'Labore dolore est sint ut fuga consectetur qui perspiciatis. Aliquid expedita recusandae rem quam. Suscipit exercitationem enim quia odit tempore. Et fugit enim perspiciatis dicta quia aliquid sed.'),
(100, '1900-12-12', '1900-12-13', 'Khoản thu số 2', 1, 'Không có ghi chú'),
(101, '2023-2-11 24:19:18', '2023-12-12', 'Khoản thu số 1', 1, 'Không có ghi chú'),
(102, '2023-2-11 24:20:4', '2023-12-13', 'Khoản thu số 1', 0, NULL);

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
('U2FsdGVkX1/+7pvB2my40Eol6rwe8Zujx7TamqhIFy7FofQ6tJHjChHkm7mkuI1L', NULL, 'admin', '2023-2-10 22:16:3', 1),
('U2FsdGVkX1/0sfyt2oqrSPJUmYoEcYwvnipOyKiP7KLc/Lx9WtxOSE5nQq4eN15f', NULL, 'admin', '2023-2-10 24:34:40', 1),
('U2FsdGVkX1/4BojcrUf4rY0M/2wlwE0KU9+SUgJyN+5ubCj67nqAzjqGMkT6zGzf', NULL, 'admin', '2023-2-11 12:25:8', 1),
('U2FsdGVkX1/4IceNa/XoDZk/c1nB0Ddx/j5dL01bJf+QW8HVcujpmjfPPqZm9P00', NULL, 'admin', '2023-2-10 21:27:30', 1),
('U2FsdGVkX1/6B+Vs4iRxI5UlJ4b6sLqq74JJqePitOlHM6fDggqdNqKPJpwOD5e7', NULL, 'admin', '2023-2-10 21:17:34', 1),
('U2FsdGVkX1/6C61+zK4AURoeNFbaVwGTLNDe4ESRPF7i1MoXp8D4UzQf3fh0eGPn', NULL, 'admin', '2023-2-10 21:17:37', 1),
('U2FsdGVkX1/6hNZLyirxGl8W/5j+E5HV51JoFdI6QzTw2jefH0XLG+ClIY6AJROb', NULL, 'admin', '2023-2-11 13:58:48', 1),
('U2FsdGVkX1/6ShfpxmH2sJPNpiIXWnEOgD+ZCOW43tbSt9VflMZHV4uHD+UX1WWf', NULL, 'admin', '2023-2-10 24:40:6', 1),
('U2FsdGVkX1/6x3FEV09FPKcFgsdQdDoL9oTSKZBbE+AUXFtbgjR/fdk129BW8iya', NULL, 'admin', '2023-2-5 16:58:17', 1),
('U2FsdGVkX1/7bCz9pPhsETcn4fE+vF7WP8AJf9JuMalyN+j+m6C8qiPvm5SZVIRH', NULL, 'admin', '2023-2-10 21:19:57', 1),
('U2FsdGVkX1/977F+xtB12nn6j1uShoqHKh1y4iAceFOdG16oeE6bSsHUmysThjB/', NULL, 'admin', '2023-2-11 10:7:50', 1),
('U2FsdGVkX1/ag9343RAiSfb9pbxmJj5CAljdwBLMxAjOH5dI1dlhDQqhrurtZgcM', NULL, 'admin', '2023-2-11 10:17:21', 1),
('U2FsdGVkX1/ALMpmmOaQzrDT2eGPdak5ZJwYD2ASkBqIg9YVeUfykRzckZVG7A9/', NULL, 'admin', '2023-2-3 16:42:22', 0),
('U2FsdGVkX1/BNl4cxwPhjl100kHC38MNaAdHSvUu18AnCay4aWS6IBJ4wVBdRmKD', NULL, 'admin', '2023-2-10 21:49:55', 1),
('U2FsdGVkX1/Cyi3cQIjfLhEgv1m6mJfNWtgm4MHL+EhAvWloYy3Npzn6GXVavfTf', NULL, 'admin', '2023-2-10 21:17:53', 1),
('U2FsdGVkX1/Dh77utGfCthSh2xg7BXK1GtgAsCI2g3d50f7lZ9vqDy+/nMSR84jo', NULL, 'admin', '2023-2-10 24:46:21', 1),
('U2FsdGVkX1/dycDSzR9h50cH5TxKisn5HBUS2IuEGmh9m/c0dTr6kRGCnEYE1dxM', NULL, 'admin', '2023-2-10 25:26:30', 1),
('U2FsdGVkX1/EEMMUiBwq7nL/inwbJClj/Zlm71Ld49w+f2OHCkK/s0mjDZyN2fmI', NULL, 'admin', '2023-2-10 21:17:21', 1),
('U2FsdGVkX1/eZX5pwByCDGnua3cAVW+/Uti714fwHkg+GxFeseJ5Sz5AcwxP0vyn', NULL, 'admin', '2023-2-10 21:39:22', 1),
('U2FsdGVkX1/fYyuCi2GhbKedIuRP7veQhLv/ZgW0Y/8f29fFrX36EkujupVSq7bB', NULL, 'admin', '2023-2-11 13:50:1', 1),
('U2FsdGVkX1/gepKO6b6C7B6j5RQBKnZ36ofuiz9ymMef8sO1N7OvNeuqotyO8Eb3', NULL, 'admin', '2023-2-10 25:42:6', 1),
('U2FsdGVkX1/gMvVGzqnSB8IcCH/4x2Mu98TbNqDCcnsjQpuefeCa12+d0OEnXvhA', NULL, 'admin', '2023-2-10 25:21:12', 1),
('U2FsdGVkX1/gzAakvGQTQm2i3q2mnjhSyLJf8SOQYgTpLlQkQjoxlyQBY6DQ5rpa', NULL, 'admin', '2023-2-10 21:52:40', 1),
('U2FsdGVkX1/htcnMYTEHrynY76AlUN5sJbPxBaFIt8IHrBcKsNZwz23je6KKNlLZ', NULL, 'admin', '2023-2-11 18:9:40', 1),
('U2FsdGVkX1/I4lKn85pH5mkFPVKZlEaQmsjNBcxF+N80NuGRL1VUaVLgyjuTHiNq', NULL, 'admin', '2023-2-11 13:0:48', 1),
('U2FsdGVkX1/lhfu5b6ITYxYsxYT4Rluo7lk0j5S1GZ44Tl+jbcxLgYCXZtkTAztr', NULL, 'admin', '2023-2-8 22:47:52', 1),
('U2FsdGVkX1/lYZ184t7Umt7jlzzWbXdNs+8/OGXgwRKT1lqdV3mj/mJdNHUOpW99', NULL, 'admin', '2023-2-10 21:47:38', 1),
('U2FsdGVkX1/myOxW8YgTBsfG26UmF1GMv3Pxycm2Rir4IeJuuj9pSfOzeeWGfhIq', NULL, 'admin', '2023-2-10 21:49:52', 1),
('U2FsdGVkX1/n9scPFXAsVqdEe9S4VGPocJUVt4qWB1gd3k+nUjuSnPYiM/3Ofmti', NULL, 'admin', '2023-2-10 21:28:38', 1),
('U2FsdGVkX1/new9iibDFQ1RvuJB76Ji7yiY0B+yM+GW+dRvkfauMTkc/ldHri3dY', NULL, 'admin', '2023-2-10 25:26:19', 1),
('U2FsdGVkX1/NkQ2igDnPogXkNWJZFN7Xw35MXZn7fISKIUuMOpFazi65+TQLxNf0', NULL, 'admin', '2023-2-10 21:49:54', 1),
('U2FsdGVkX1/NNWeZtJS0P+DoXSl6AHK9hDV/nP5MAuhe7Ap6JglJuz08E0mPX0Hh', NULL, 'admin', '2023-2-10 25:55:34', 1),
('U2FsdGVkX1/P/FcLPXhYuZrd5CcDWXyd8Jqgo1Z6KXPuZSgDIVGjis+uo/XMCi/0', NULL, 'admin', '2023-2-11 12:23:43', 1),
('U2FsdGVkX1/pVA48DGLKQRfFx/Jr4jwQlkaT2Nmv8ykdwq+j3cXVnHXr55FwxOkX', NULL, 'admin', '2023-2-10 25:28:30', 1),
('U2FsdGVkX1/pXOlD9zCn1qUdQU58N2zr229yrJxcP2L4SVuKWexihvcpo8eNsqhx', NULL, 'admin', '2023-2-10 22:20:11', 1),
('U2FsdGVkX1/sgPgbAba7eELCyDiiudgIj0Zal29iELBp6pdv/atNwfZngmVulygO', NULL, 'admin', '2023-2-10 22:17:21', 1),
('U2FsdGVkX1/t7IyoZtfaksEGgyPDZL/OU4sQ0Bh8VS0w34wa9Pk2Nsvohj34hsuf', NULL, 'admin', '2023-2-6 23:10:49', 1),
('U2FsdGVkX1/tG1r5tghJ8equICCzJNL/4WbJCJQzSuQAk643XaWgl6RxBvtbUuFP', NULL, 'admin', '2023-2-10 21:27:30', 1),
('U2FsdGVkX1/ufb1KHbxm7RHGVnZggI4gCdzbrHkY6oDm4j0qhk7fytS2N9dzcywF', NULL, 'admin', '2023-2-10 20:29:39', 1),
('U2FsdGVkX1/v4N2lVrYsZFOj54tmHc21Ov7YdVvQkR34z/UtVWOV7JC9Z7MJtMky', NULL, 'admin', '2023-2-11 10:21:36', 1),
('U2FsdGVkX1/wTs3R1wRcofofCkFqGt8IsVRI7FpT8G8cewelrcFZflJcScMRlTzk', NULL, 'admin', '2023-2-10 24:52:40', 1),
('U2FsdGVkX1/XgQo4t/Xdu5iyObHtdd7s/8VhsBxredYRkZnMzw3tXNMQSnMAcFNy', NULL, 'admin', '2023-2-10 21:29:8', 1),
('U2FsdGVkX1/XKNV0xpkt67yso67CcCvaL+eZTKvy+iv8tnxss3J3oAEOkegBemzZ', NULL, 'admin', '2023-2-10 21:37:17', 1),
('U2FsdGVkX1/xNAuroV+akbIEZH1CGYwvkwoVTvTzScTU1EYovV/G7JfEF6Vzib2a', NULL, 'admin', '2023-2-10 21:35:1', 1),
('U2FsdGVkX1/XpgEz4IMq7DATo5qOUpPh81dLG9rsKQNVBngW4d9kmHoC+kVPVtCg', NULL, 'admin', '2023-2-11 11:24:2', 1),
('U2FsdGVkX1/XRa1/livKQYqzspwR3SK0/G1FzN+xoHS7bL/TaQ6G5+ivKqEFmRvu', NULL, 'admin', '2023-2-3 16:42:53', 0),
('U2FsdGVkX1/zuwMic12cvNYpQy40KvT3w8hovVT7YEZqjFJXcACcYfSCJiG9kzWj', NULL, 'admin', '2023-2-10 21:29:9', 1),
('U2FsdGVkX1+/s5Zle2VC+dikk3YUC3ap61nIzGzueW1IToPt+A65NR2UAJxCCfLN', NULL, 'admin', '2023-2-10 20:28:57', 1),
('U2FsdGVkX1++B8qRGwn6Czol4astnbPZJsc2Ff6gW3EekXS36YoQ3qOIvxoImM0U', NULL, 'admin', '2023-2-10 25:23:0', 1),
('U2FsdGVkX1++kN7mz6kg+HtzYPQsWdjI8ULWT5cEOFKXW+t596//HfFL0+vauXXF', NULL, 'admin', '2023-2-10 25:22:30', 1),
('U2FsdGVkX1+00YZiqcTmhK1G48YTWdtsduzkhM8VArL97BXmUfaW8+1iHo7eACLD', NULL, 'admin', '2023-2-10 24:46:28', 1),
('U2FsdGVkX1+06v7MuOVOEGqhQFqkm5HDB2D10xys0+hfndUbuCJEcnKIgcwrA2hk', NULL, 'admin', '2023-2-11 9:48:35', 1),
('U2FsdGVkX1+0sR+hC7eth135aOEHCFFCYWIuJSBnSbQV/Dr67rkC7RqP7WtUorO2', NULL, 'admin', '2023-2-3 16:44:34', 0),
('U2FsdGVkX1+31S1LqR27haK/tz3TnKVU+/kJNHck/QzX21e0EjdncCh8jbxJPsoh', NULL, 'admin', '2023-2-10 24:35:57', 1),
('U2FsdGVkX1+47X1QB+wTdFJcFMqK9YjzeALJUzCtdH87/I1Rnpqlg4pMImBkxziJ', NULL, 'admin', '2023-2-11 11:21:27', 1),
('U2FsdGVkX1+6WXr83jo1XT/UKKPjUs1u8Mx46bpaBhyzC2dCs6sOQ3k1Bfl9Emo3', NULL, 'admin', '2023-2-10 24:46:22', 1),
('U2FsdGVkX1+82JBbaE/oS4zvnPiaPYwbFWACUaAoV+07PNECggan0b5AY9XqCsL1', NULL, 'admin', '2023-2-11 12:32:38', 1),
('U2FsdGVkX1+9OlMHWzlJPS0yCe4+UpgLdzkXuvc+EJWEtCwGGZXON3EyUcwUGTHj', NULL, 'admin', '2023-2-10 21:29:10', 1),
('U2FsdGVkX1+AIvPZT7HwFj+Y6MAtri2MqBXte5a1wP1E5ZQ8/h9sfTzrlHcG6Ka6', NULL, 'admin', '2023-2-10 24:53:32', 1),
('U2FsdGVkX1+avKDnjP+uWNHFcjv71n6TJ4tvrQNNh8U60R7YEE4CHOItCykI6EVZ', NULL, 'admin', '2023-2-3 16:42:40', 0),
('U2FsdGVkX1+bbAtdfDkYKsu4ka2VvL5NyNzHdIXUndaHQP1d01savHOp+43WGO0q', NULL, 'admin', '2023-2-3 17:6:34', 0),
('U2FsdGVkX1+BBsgDqY5whk49OW1oiMEacbd6+Ba+bkitcqGJY3lRC2Zglu4BeG/J', NULL, 'admin', '2023-2-11 13:59:10', 1),
('U2FsdGVkX1+bFnobupiuSJEQT5N2i/OUjwb2ckALxVP2HfbjNSnd8ddySBRhY2es', NULL, 'admin', '2023-2-10 20:27:14', 1),
('U2FsdGVkX1+bhs3lwDBXaG+549bW9l7y7+SV0ObxJBgiKOwz1kx/phg7dEDQSOf7', NULL, 'admin', '2023-2-11 14:12:46', 1),
('U2FsdGVkX1+BIxIlL+b1kCLMEH+f5dvLn2fP1dox4TEyKbkFBytt0+9dCAilk8TV', NULL, 'admin', '2023-2-10 21:48:1', 1),
('U2FsdGVkX1+Djv5hW691dco1e3Bng7Q5e+/Kb3vMo4t7dXajzDHMq4CqN+44NKgH', NULL, 'admin', '2023-2-10 25:22:43', 1),
('U2FsdGVkX1+fsSEEr6Bx85tXFZIpqQCgbz4jFdR32+mlI9STj8IZkBrTfOIpBDX7', NULL, 'admin', '2023-2-7 20:38:10', 1),
('U2FsdGVkX1+GdJvf5Yg/0J0/YHmt2byuQ194cDLA709y7q/BsjB96zEvlPnkbOzb', NULL, 'admin', '2023-2-10 21:20:31', 1),
('U2FsdGVkX1+iH4wd8OJDzytneDH5MRf7ZGMsr19wYAD4uvAzuWGkQs9+uN8IYi9p', NULL, 'admin', '2023-2-10 21:52:38', 1),
('U2FsdGVkX1+iyjIieVfrxHzJ3MRc844tyPAhIM1+IwRjcNUp4Lfhv3w7CaDExQcd', NULL, 'admin', '2023-2-7 23:25:14', 1),
('U2FsdGVkX1+jLRpO8sERgDErsaV59Cn6B7sB1jfIFwzmY3boVMVBoU7ZKKBF4MaX', NULL, 'admin', '2023-2-10 21:19:58', 1),
('U2FsdGVkX1+JX2wXalGzKR6lNbpT3SrU+J4FJA7UIXLtEisHDjmDAEp7SPFqEysh', NULL, 'admin', '2023-2-10 22:19:56', 1),
('U2FsdGVkX1+KAuwVYq6BVXpZPjcJKRcstuSKqQbVu2oHnClwZYjnqGKhFC7sMD+3', NULL, 'admin', '2023-2-10 21:20:30', 1),
('U2FsdGVkX1+kc8khiU1Can6notqNlRJggIVjjhz5ZEKSKEPokf0JtC6ZEp8mbZQh', NULL, 'admin', '2023-2-11 9:43:6', 1),
('U2FsdGVkX1+kdlilaYydRKNa82HepXSxDi6ckFbtbORiEDRHPNip/ShVCihYaTWW', NULL, 'admin', '2023-2-10 21:49:38', 1),
('U2FsdGVkX1+lEyjpIKJWqH50Vew/b0dKKyykBXA4cx7H+YEnZT97FsX8QoXhH39L', NULL, 'admin', '2023-2-10 21:12:35', 1),
('U2FsdGVkX1+lUN/oyOasa1cbK94UNXCJVvXgmeallX4hNwQ2wgDMjPhtL3OEtRb7', NULL, 'admin', '2023-2-11 13:56:29', 1),
('U2FsdGVkX1+LYgJBpXaGyA1lmGgmGRg0Cwo5hZmI92aWQwVIVQe5gJl5JcdbpTZ6', NULL, 'admin', '2023-2-10 25:22:58', 1),
('U2FsdGVkX1+Mg8tHngJ1yisxV671H9qsrtPILsL5L0BhI2IAzaAviO8TKbrpp8oE', NULL, 'admin', '2023-2-11 15:18:12', 1),
('U2FsdGVkX1+NBx8PghajTqc+WTBtZliZKn7Q35qhIvMn/Q8U1wBvEDbUtN0GJNKd', NULL, 'admin', '2023-2-11 10:5:25', 1),
('U2FsdGVkX1+nSZUXOOqpsoN9p41aRM8u0qcOtfpAlUZnfflr+D5sULX0A+FSvrki', NULL, 'admin', '2023-2-10 21:29:36', 1),
('U2FsdGVkX1+NXfE0ghwzSJ0sotK4rWTXLectNZtqt4qeLrldW3quBjcH4iX0e7Q2', NULL, 'admin', '2023-2-3 17:10:52', 1),
('U2FsdGVkX1+ofgfOQTunXx005HFgX/08jgkZestjAiyetpiLsmZtnptrLNaoI0Dn', NULL, 'admin', '2023-2-10 21:52:53', 1),
('U2FsdGVkX1+OkaQvKiv7NP0o/8l/2IY+B2qZbtEQHVOhoKJLr7VLGQ3GqrhOT818', NULL, 'admin', '2023-2-10 19:53:41', 1),
('U2FsdGVkX1+oNg7SUqZOYLceDpOBdyNgYEi2z49KfDA20ZqGh+z2nPXZDiX6xiG7', NULL, 'admin', '2023-2-10 24:53:38', 1),
('U2FsdGVkX1+oWS97jE4sM3q8FoJ7BgDJR5/kJJqUckyaePI96bxNgGh1FlCfUa0/', NULL, 'admin', '2023-2-10 22:17:22', 1),
('U2FsdGVkX1+payFmjaEhQ9uxVKD37AUHjxiYSWejT6Zg6Gk59OHPpNYlGRxKVLbC', NULL, 'admin', '2023-2-7 21:29:11', 1),
('U2FsdGVkX1+rnTxF8Uwvu3ZSmIcyUZ5CFfWcPwZkds0ex16pwcle6bhT7EOhrUdJ', NULL, 'admin', '2023-2-11 9:43:8', 1),
('U2FsdGVkX1+rS6aG5MrHtkSKCIjRIBw8NnTF3A15GYPicXWlCbyEFiSqCnq3Ulcg', NULL, 'admin', '2023-2-11 12:35:2', 1),
('U2FsdGVkX1+S0lAOP6uYyZxk+H1n7f5hxOfW0Vg4YpDldhCI6DU8FalYkMAa8d7D', NULL, 'admin', '2023-2-10 21:47:39', 1),
('U2FsdGVkX1+soJT1WkrCRsrQUB4R04sCjScHCz3ZXqGOBvmDkJo7bL0X4CbqtIEN', NULL, 'admin', '2023-2-10 21:17:30', 1),
('U2FsdGVkX1+Sx01gu1zBUFTHaPdLHt0AVw2X+ZUe5wyiX9RX62+Eqj2tZJDNm43u', NULL, 'admin', '2023-2-10 21:12:48', 1),
('U2FsdGVkX1+uE432C1ylOvgD9zEMOdopqe6bt1Q7tRa2dxZbg/01VmqZYKhMhTxh', NULL, 'admin', '2023-2-10 21:39:20', 1),
('U2FsdGVkX1+Uhl3+4j416+NdxjrajL6N9ZNg3y6o/ShkA8I4YEKnryJeVGB/glIW', NULL, 'admin', '2023-2-11 17:18:19', 1),
('U2FsdGVkX1+uhvNqIdw5IrAo+ZlmNPCf6zGnX8aVWsCDta8FBkrY7ArID92Oh3PG', NULL, 'admin', '2023-2-10 22:16:49', 1),
('U2FsdGVkX1+WAybcoLAngaAmthvQ0301uZEKG4SrjqjaooRLiskCLruaRB/UK0dg', NULL, 'admin', '2023-2-10 25:26:29', 1),
('U2FsdGVkX1+wEpZ6yuH50lR4EaaTrBmLa0jPdjBWc9aFfT7gp0s4jfHQXDF6HRa7', NULL, 'admin', '2023-2-7 20:39:12', 1),
('U2FsdGVkX1+WsVt3w/0+L2lvrfBFgXxxN9FVpoTeX/f/TdC5xEEPnBpTYHtbJeAf', NULL, 'admin', '2023-2-11 18:7:38', 1),
('U2FsdGVkX1+WyxpOWA3Dy22+juD4l4ZMR8jSfi10LR4/uYAVzjOwuPiinxEc/D3u', NULL, 'admin', '2023-2-10 21:29:34', 1),
('U2FsdGVkX1+x8xykNUwmtoNW4G52jEf7JokVurNw9597siYdYcsT1S10xgAAphwx', NULL, 'admin', '2023-2-10 25:33:7', 1),
('U2FsdGVkX1+xaP+XyebkVemmBu3fJqQ5gk0o1MvH28RSQd8IwglIaTzZJtkxXrTy', NULL, 'ketoan', '2023-2-10 19:53:32', 1),
('U2FsdGVkX1+XmUVVNdsOY6gibiwP+sogYcT4tz4tjc9UBlbrq5k6X/8syn6aokpH', NULL, 'admin', '2023-2-10 25:25:46', 1),
('U2FsdGVkX1+xpHhJIibEzd00hFAyRRVa1PQZgvKhwWFb6DUzOCp/0oJBlC+X6xNE', NULL, 'admin', '2023-2-10 19:51:22', 1),
('U2FsdGVkX1+XRwndvE0NhSw0fbsEAcgU/+UqgyhOwCqOq8KQMbpGoO9kN5FHDgCf', NULL, 'admin', '2023-2-10 24:52:41', 1),
('U2FsdGVkX1+xYsb6Fp38M+7SqYjUr2+G+FZ08S1e8d7v+gSYJfm9WCTgPP9DuRxD', NULL, 'admin', '2023-2-11 12:45:47', 1),
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
('U2FsdGVkX189Xh2fF0bI2JbiH9htcpZmCtWHP/BHnrhPBEvaR4vjJ5rX1e8YwJI7', NULL, 'admin', '2023-2-10 25:29:8', 1),
('U2FsdGVkX18ANOaqtBohbKQjK8ksU2zABpaLkx7G8DorMBdfKMO3V4vatETvDOhO', NULL, 'admin', '2023-2-10 22:19:49', 1),
('U2FsdGVkX18BCbpbjDnSUzRflNBl9i5bqzYpkRQQ2mxcCcCGDU8D8ZHGvAx/f/bF', NULL, 'admin', '2023-2-10 25:21:4', 1),
('U2FsdGVkX18Behj1RFHroSJmg48h7WnI1mVWOusRXbmjolh0MF4RhZsTG3qPtDlD', NULL, 'admin', '2023-2-3 17:10:35', 0),
('U2FsdGVkX18BVIeWd08ePVZNhKPPROqtHdxZvlnsnMIJwrSJlci2L6rjCXHYf7QF', NULL, 'admin', '2023-2-10 21:19:54', 1),
('U2FsdGVkX18CdkDtHwXR8wVVpid2d4k3DAy1Y8e4hoNhIchb/9DTWgzGuYu+bFwI', NULL, 'admin', '2023-2-10 24:46:28', 1),
('U2FsdGVkX18EXjHqjpUsfAQEo8HJK3WTzbGoRg16A/EnMODBYon7aeTICbhv79D4', NULL, 'admin', '2023-2-11 11:21:0', 1),
('U2FsdGVkX18FW+GpjM8fBYKLbJZW+9mHAZU416+pmDeTa/f1+gw8BpnTsraD6rEr', NULL, 'admin', '2023-2-10 24:43:49', 1),
('U2FsdGVkX18gF5r18nY4Fsz0G9KOrPErgYfT36ofmpvIyPRTs++8nvsrxjeuGCNy', NULL, 'admin', '2023-2-10 21:20:20', 1),
('U2FsdGVkX18H9vjyQCDvYAxTwM9f9rVW/UkNtSI7vTaMbTrSp28oavhHON2nZJM9', NULL, 'admin', '2023-2-10 21:28:47', 1),
('U2FsdGVkX18HmUn3wB+gEbzos32Y9EPOScOXHTGkH29VLgRWoZYYAN9E2vRi7YBJ', NULL, 'admin', '2023-2-11 14:12:58', 1),
('U2FsdGVkX18HO9gV/Z4w8uV2fadb3U5Dfeb4ZOlpVC6vVtziPq63EijCqmo0TUwO', NULL, 'admin', '2023-2-10 21:52:41', 1),
('U2FsdGVkX18IhkQPD4SVJDFEWXYyG9vhifaQRM+yD+bcOGo1fX1p7Ifcw+2EQacF', NULL, 'admin', '2023-2-10 25:26:14', 1),
('U2FsdGVkX18iUe1WiTlNpIl7vTYZOZzsN1bV8VSSuL7vDy6Z39xSCJOMEDiaV3mV', NULL, 'admin', '2023-2-11 14:2:47', 1),
('U2FsdGVkX18JZA/XjzONJ5JmWZv0ytxQQSEP2q0VjJw6emBKdNksCFcuhRdgGhw6', NULL, 'admin', '2023-2-10 21:39:21', 1),
('U2FsdGVkX18LeI6ilWEILnGVEc2t+VPgSFoItcUqtcfisKu95TswfewvOoWKNSP0', NULL, 'admin', '2023-2-10 24:44:18', 1),
('U2FsdGVkX18lGdw1rdO5pNn7WT9CZvvdkVSI2mlA4WSXHSKwxf8Z43FX9zl0khDE', NULL, 'admin', '2023-2-10 21:54:31', 1),
('U2FsdGVkX18MjwUc1MSUTH4OlU70hdF4FazSCZPgYXYpP6M/gDQbTFAGBcISD3v6', NULL, 'admin', '2023-2-10 21:19:57', 1),
('U2FsdGVkX18mx0HZrchRER66WnVwQTh4QnTNIluJ1CraM+KdO13JZQqyo+yjOVYq', NULL, 'admin', '2023-2-10 21:52:40', 1),
('U2FsdGVkX18nFOnOHnkQKc4tvGePm7E8wvVGMRu+1BNYrIrGlHWvuHvl5VK6BEeL', NULL, 'admin', '2023-2-10 21:34:57', 1),
('U2FsdGVkX18P2ebZB2UiOdUfvJInRBVKolyt9EsFJxK5qqTktgOXnsj4otiUVRfb', NULL, 'admin', '2023-2-10 24:43:48', 1),
('U2FsdGVkX18P3pbd8a/y2RKTPw6hObl3CPn80Q4DW40t/JVC2UW/pHkHbGBj7YLH', NULL, 'admin', '2023-2-7 21:28:51', 1),
('U2FsdGVkX18Q1y/DaqP+8qo5oD6SexJNl0JjI+Nw1iZk5eUaO9zI+AjlpLmkiGi6', NULL, 'admin', '2023-2-10 21:38:23', 1),
('U2FsdGVkX18QEcq+vw31pVjF4WaE8carU5t6Xlj9EWPEpAFXt2DNERi1ips8tBSt', NULL, 'admin', '2023-2-10 25:26:14', 1),
('U2FsdGVkX18qrenIhySp0JAO8Qxy3C2feE7K41o+9j2sXICNz2VvBef39uDb9KJh', NULL, 'admin', '2023-2-10 26:21:15', 1),
('U2FsdGVkX18R1tY6al5ui0By1RmdF1T0hwp2v+uNEeroYLrMzUpjwv1rJEX0+3eQ', NULL, 'admin', '2023-2-10 25:26:24', 1),
('U2FsdGVkX18S28cK22Csj5n+SaLq6hv5VgBCzhRZQj6hDGxHNBWhOQUsZQWn0nC5', NULL, 'admin', '2023-2-10 21:12:38', 1),
('U2FsdGVkX18sz1bSNOF86x9nmLUHpq0MFYFOXgzsrHBDL+Qe+eXhSEMUN7JActsG', NULL, 'admin', '2023-2-11 12:26:44', 1),
('U2FsdGVkX18u5Mm8mppzkTJ4rUzfJjl8SP00vXcyEnMPk3HjrcSGK3i8jxxr+2on', NULL, 'admin', '2023-2-10 24:34:39', 1),
('U2FsdGVkX18u8J8wFzwNpzYo7vGCoY728etPiAof0/6EjbhvePddUklXHXMUfRhj', NULL, 'admin', '2023-2-10 22:23:39', 1),
('U2FsdGVkX18UxB/KWYM2dN+mmh6y6d8zEHLizfKvGnW1NUC0n8ORvfweNEqk53k8', NULL, 'admin', '2023-2-10 21:17:52', 1),
('U2FsdGVkX18WAMfS8gQBD1W8Uvhx536r9bpfDciFkLDUJiv6ViRru8rz2ZCddE9s', NULL, 'admin', '2023-2-11 11:20:55', 1),
('U2FsdGVkX18WUaD2xAhd0ko+SuFZX+E4pzpl5Ye9/2oBKZBNUp1cAaCpWD+8cTxf', NULL, 'admin', '2023-2-10 21:20:19', 1),
('U2FsdGVkX18wZZ/mGFlnmjvbPXHEIrDkgA0iJcW8Bpvw8NccAzbOxEkR4SSBAfUB', NULL, 'admin', '2023-2-10 25:22:31', 1),
('U2FsdGVkX18Xq0NFUZ6KFmEgWYLjhtdahwZ87kAz/W4hdGzPRziay93/LvwrD0kv', NULL, 'admin', '2023-2-10 21:49:55', 1),
('U2FsdGVkX18YcaNVHUxK3aFZL/0P/KXHz5SJaROqlOaTlH9nB1zoGc1y4X/gvuqR', NULL, 'admin', '2023-2-10 21:27:24', 1),
('U2FsdGVkX18Ywlq7klg15QaiSShKpZk/PelV50Thk1/87JYgMSXi6cfR9F25HfaJ', NULL, 'admin', '2023-2-10 22:20:9', 1),
('U2FsdGVkX18zK5/1VM9L0/iNaXJwFVudGDyExIOxGqInukywFmtArTkRicumtYRV', NULL, 'admin', '2023-2-10 22:16:21', 1),
('U2FsdGVkX19//wQ++/oOk0kMWNhnoS5giddfRfMNYv7bbhMRFVuOXPhOub2c6I6P', NULL, 'admin', '2023-2-11 17:16:19', 1),
('U2FsdGVkX19/C/B1MijYu4pD2CTh+xVSwf3lbe1I8wiB/3O9RyRMrdKUcaYAgDgJ', NULL, 'admin', '2023-2-10 24:53:32', 1),
('U2FsdGVkX19+H1CMsGK6M9PwQXIkupOn6NLAxlboqVMjHPfO2+aWrMuBWbs2+Pnd', NULL, 'admin', '2023-2-11 13:47:18', 1),
('U2FsdGVkX190wjWeQZwsZatTsWsSE7jaum6xV21yue0YNvnL+VDdGxcmBn/HJbnn', NULL, 'admin', '2023-2-11 18:7:34', 1),
('U2FsdGVkX1915gi4wd9MaejMt0yrbZmmfHUErvPw9R28qepkCHQ1sMAJ9uqQSgU8', NULL, 'admin', '2023-2-9 16:26:14', 1),
('U2FsdGVkX193C6HVcElWKsZaugXLTDomIkv+D/lfJPI6FH8nFFmgjRGAqKq/dlHf', NULL, 'admin', '2023-2-11 9:48:52', 1),
('U2FsdGVkX194xQgJCZKwSo4dxkxMfqUz+7YxrvX93jxCzhoNITKpegzcL9L6t42j', NULL, 'admin', '2023-2-10 21:17:52', 1),
('U2FsdGVkX194yche4zJSpjd6OmuYZ6wzhXekYShRKNWVzhfiavbGaUzANTR6kDeJ', NULL, 'admin', '2023-2-10 25:48:36', 1),
('U2FsdGVkX196VaG4euY5CAVu67p10UMsV8wOZ8dHVFM6MX91CtT/7OOTZmMta6/Y', NULL, 'admin', '2023-2-3 23:10:11', 1),
('U2FsdGVkX197gbja4m9uLKvbIDZ7PEUNKDW1EJw+6StbqLHxxjm+nJFDVoEZr2uh', NULL, 'admin', '2023-2-11 17:0:57', 1),
('U2FsdGVkX1987ELSslC0PZvqGL53btO7SslQ/AqaqPzpbMUoPHQA1Jc71B0n8mud', NULL, 'admin', '2023-2-10 21:12:55', 1),
('U2FsdGVkX198KH+H23udK/dNnx6OhYFOFqDRP0WbbUokmLOvYAh64QGyyvnZo6sb', NULL, 'admin', '2023-2-7 20:39:21', 1),
('U2FsdGVkX199/ZoVOrYzQAlETrJCe6tL+s2EqOnwA2IWvdOFRbinJIX9ovz5pOox', NULL, 'admin', '2023-2-11 17:15:58', 1),
('U2FsdGVkX19aDgWkMXvLKKAfjUw4ZvdiGIA9XLokBnlTD/nN3KYiIMydqqPZpE3D', NULL, 'admin', '2023-2-11 13:55:47', 1),
('U2FsdGVkX19AguFCJZuydTjHYc1dMYNU6Ucb1eCCES6X282ilnf+bKoHIcu6HQYq', NULL, 'admin', '2023-2-10 26:2:46', 1),
('U2FsdGVkX19APEIVbCenot5JWh6KRWVNbgp53kzdUJ8Ui42S1O8vUGMsExEBpuKU', NULL, 'admin', '2023-2-11 13:58:22', 1),
('U2FsdGVkX19bYRYuf2cb8PzqbkTWy+oR7tBBGVH5O57/RekyWWPev47nUIGu8CDF', NULL, 'admin', '2023-2-11 12:28:36', 1),
('U2FsdGVkX19cLYqwmsK1i/rWbelPp7IPzp3dzCZQxZ+O5k39LUSST3xdNbV1lna/', NULL, 'admin', '2023-2-11 10:1:8', 1),
('U2FsdGVkX19dj9cB1B9to38AkcR7WHF03x4vIqAWroQeSaHk/8ErgbM32P8Ek8sy', NULL, 'admin', '2023-2-10 21:35:1', 1),
('U2FsdGVkX19dY1QB9/veI8/s4aHtTK3jP21t0N+Iy/2aPmMBp2DDMxtZTF1yrkDE', NULL, 'admin', '2023-2-10 26:40:18', 1),
('U2FsdGVkX19FWdRWPNI/mqKqKptU2vxXSHfpt+w7jlAZylAFWywlXBedLvS+aVc6', NULL, 'admin', '2023-2-10 21:24:22', 1),
('U2FsdGVkX19fx0U7gqacTGz2MHVU8VPEi3FTyqTb5nK/93Ju8NXp3wzVH6JCG9BB', NULL, 'admin', '2023-2-10 21:35:0', 1),
('U2FsdGVkX19HFtaF5S/CI2GnPG2I0FCMIg7W05INufWQzr2QbnEPBYoerYzkOYyJ', NULL, 'admin', '2023-2-10 22:17:31', 1),
('U2FsdGVkX19IG+UTa7gfIpCRjGKerCYMFrhWeIyrcTogGac6LDQeor+CVUU8zUfZ', NULL, 'admin', '2023-2-10 24:44:17', 1),
('U2FsdGVkX19IzzNj2PYn/1vNZIVOJSqYLYhc0HWnwQka/03O+E9Nt+uvLTjiaP4y', NULL, 'admin', '2023-2-11 14:2:33', 1),
('U2FsdGVkX19J62iVv5w8VtJ4CpjxJxMdgEQ+9CPwJS2lp7bNSfHucCrc5faojbWT', NULL, 'admin', '2023-2-10 22:16:2', 1),
('U2FsdGVkX19J6HZ10spjlawkTBlPBmzCcPMmkjNNXI81jRc19PsYjrXSpz98kbn8', NULL, 'admin', '2023-2-10 21:28:3', 1),
('U2FsdGVkX19JsEzq6SV1eefrK+vzTmgPBWXm7yDPh6OJ1wZmw61udqknWim2cHS5', NULL, 'admin', '2023-2-10 22:16:59', 1),
('U2FsdGVkX19l6FeGg9IQaFldb/5Jieu9QtX0OIZQIqJAfSkK2CZErZ7TH91lqmbH', NULL, 'admin', '2023-2-11 17:15:50', 1),
('U2FsdGVkX19lk2JFcKU8NI/8xfFJ/WqfbeA8Li52zAsFlvJr2BVZg20cZgBaCyYm', NULL, 'admin', '2023-2-10 21:35:25', 1),
('U2FsdGVkX19MujtjmwZCocGdYhoBBXHDfPiK7QCzPF4rmQCriI76NXzjuuYg+bFn', NULL, 'admin', '2023-2-11 24:2:16', 1),
('U2FsdGVkX19ng5q8EgimNkKWdfXAy8WZhU3L82WzREmYGEQiBmU6RGGLTWLqSYI9', NULL, 'admin', '2023-2-10 21:47:38', 1),
('U2FsdGVkX19nISIGPE8mOHxmvFLv/ZSaGh49EEym5C8ovBp/5O8Hh8BAoR+bYw2P', NULL, 'admin', '2023-2-10 24:40:6', 1),
('U2FsdGVkX19oAtXQ+/yybhzOhp5HaxMX9T5S3Zja8aqogbgtXcuvU3K/aQ5pLYQy', NULL, 'admin', '2023-2-11 9:48:18', 1),
('U2FsdGVkX19PDO7vUxSZxkCULmiTcbiQoH6v2l7Jv2JbPSTdWf6CTr8c63o9ushf', NULL, 'admin', '2023-2-3 21:13:47', 1),
('U2FsdGVkX19rc5qhCWKOQcVaQKN8dzPz4ZcqF+xiKiqPSNf52qWGbv0lVw08RjNs', NULL, 'admin', '2023-2-11 17:0:46', 1),
('U2FsdGVkX19sAJrfVoXd8d4JRyMqPBnbzxKvoUNtZZ3BmabH7bP27TyUfk77WSg3', NULL, 'admin', '2023-2-10 22:19:51', 1),
('U2FsdGVkX19tN1+JYvx4C1GqYwPHx4Rv+oVjP8TkCHakWRwA1ft01Qgus7vTqKB9', NULL, 'admin', '2023-2-10 22:28:14', 1),
('U2FsdGVkX19TVkKOyz6Wx6l3gGoBpj2Fk83PChm7IqGQIuc/hAE0K13gvxxIq2aE', NULL, 'admin', '2023-2-10 21:20:31', 1),
('U2FsdGVkX19xj0xcFwMLrJsSgXAToGuLZDWC0z42ICRC2tH1ihNufNbR30JKHCWC', NULL, 'admin', '2023-2-10 21:20:18', 1),
('U2FsdGVkX19YAwe7tVxEhRsiFrGXj6ake3JHKAcuVoLz0exmtTEmTYmU7GFKO6RU', NULL, 'admin', '2023-2-11 18:7:45', 1),
('U2FsdGVkX19YExktRnhTmE9CuX/jNcPDVGTWGEy+1eqyJhjN8w6lozNlNdJ7whp2', NULL, 'admin', '2023-2-10 24:35:56', 1),
('U2FsdGVkX19YvF3q7dtw3+3YxcuoQ4ei6+zBQJ6WnRHfM9wHieDVstIaKsXrFy06', NULL, 'admin', '2023-2-10 25:26:12', 1),
('U2FsdGVkX19YYMXx4rXGs9S3eyv6ZLEe6WRYUIRV0UJ81yPKSu9PWY8tAWi1Kd/7', NULL, 'admin', '2023-2-7 23:16:42', 1);

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
(1, 'Trần Văn Phúc', '2001-04-22', 1, 'Hưng Yên', 'Kinh', 'Không', 10, 'Là chủ hộ', '12345678910', '2022-12-12', 'Bách Khoa Hà Nội', 'Sinh viên', '2022-12-12', '2022-12-12', 'Okay babeêrere'),
(2, 'Jeremie Harber', '2014-11-08', 0, 'Taiwan', 'Chăm', 'Không', 102, 'Là chủ hộ', '72248832112465', '1976-05-16', NULL, NULL, '', '', ''),
(3, 'Mr. Damion Green I', '2017-05-11', 0, 'Vietnam', 'Mường', 'Tin lành', NULL, NULL, '', '1979-09-12', NULL, NULL, '2008-02-16', '', ''),
(4, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 4, NULL, '12345678912', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(5, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 4, 'Là chủ hộ', '12345678913', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(6, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 11, 'Là chủ hộ', '12345678914', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(7, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 103, 'Là chủ hộ', '12345678915', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(8, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', 12, 'Là chủ hộ', '12345678916', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(9, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, 'Là chủ hộ', '12345678917', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(10, 'Prof. Kristin Leffler Sr.', '1979-03-03', 1, 'Nepal', 'Thái', 'Không', NULL, NULL, '35875453368218', '', NULL, NULL, '1993-04-26', '1975-08-21', ''),
(11, 'Marguerite Vandervort Jr.', '2015-05-28', 1, 'Zambia', 'Kinh', 'Không', NULL, NULL, '6162397467827', '1990-06-29', NULL, NULL, '', '1998-01-10', 'Magnam voluptates minima provident nostrum sed. Minus nostrum molestiae facilis nesciunt voluptatem.'),
(12, 'Prof. Mortimer Stracke', '2017-06-15', 0, 'Cote d\'Ivoire', 'Kinh', 'Không', NULL, NULL, '', '1991-04-09', NULL, NULL, '2018-10-12', '2010-10-17', ''),
(13, 'Johathan Gibson I', '2009-01-03', 0, 'Saint Kitts and Nevis', 'Mường', 'Bà la môn', NULL, NULL, '', '', NULL, NULL, '', '1974-07-01', 'Odio ipsa facere et. Consequatur dolores eveniet optio quia. Dolorem commodi itaque eos magni ut optio.'),
(14, 'Crystel Feest', '1975-09-24', 1, 'Peru', 'Kinh', 'Không', NULL, NULL, '', '1982-05-18', NULL, NULL, '', '', ''),
(15, 'Trịnh Đức Tiệp', '2001-11-11', 1, 'Nam Định', 'Becgie', 'Tin lành', NULL, NULL, '12345678920', '2022-12-20', 'Công an tỉnh Nam Định', NULL, NULL, NULL, NULL),
(16, 'Maia Stokes', '1998-02-20', 0, 'Somalia', 'Kinh', 'Không', 104, 'Là chủ hộ', '30231255104874', '', NULL, NULL, '2020-07-24', '1988-08-04', 'Cum quidem quod qui rerum. Id quia dignissimos nemo dolore. Sequi veritatis molestias itaque quam molestiae commodi laboriosam.'),
(17, 'Devyn Heathcote', '1986-03-06', 1, 'Somalia', 'Kinh', 'Không', 105, 'Là chủ hộ', '79063498384997', '1980-09-15', NULL, NULL, '', '2022-03-10', 'Est possimus est omnis quo. Voluptas aut consequatur rerum amet. Voluptatem nisi cum delectus culpa fugiat sit placeat quisquam.'),
(18, 'Mikayla Pacocha', '2000-07-11', 0, 'Nepal', 'Kinh', 'Không', NULL, NULL, '32438318506895', '', NULL, NULL, '1979-09-27', '', 'Veritatis voluptas ullam et iure voluptatem molestiae. Dolorum cum laboriosam dignissimos dolores quis. Laudantium quae et fuga cumque architecto est corrupti.'),
(19, 'Michelle Mills', '1970-01-20', 1, 'Mexico', 'Kinh', 'Không', NULL, NULL, '', '1974-04-05', NULL, NULL, '', '1976-03-14', 'Deserunt optio corporis sed dolorem ratione qui. Magnam veritatis sint repudiandae aut omnis sit cumque. Perferendis vel ad ut officia sint labore iusto. Voluptatibus consequatur cumque alias dolorum.'),
(20, 'Mrs. Mylene Batz Sr.', '1977-01-05', 0, 'Palestinian Territory', 'Kinh', 'Phật giáo', NULL, NULL, '', '2019-09-21', NULL, NULL, '2018-01-11', '', ''),
(21, 'Kamren Brekke', '1978-04-06', 1, 'Cambodia', 'Tày', 'Không', 106, 'Là chủ hộ', '20149925314684', '', NULL, NULL, '2018-09-14', '', 'Porro quis omnis doloribus qui. Aperiam optio quis consectetur est. Est cupiditate est itaque sunt aliquam laudantium.'),
(22, 'Evangeline Quitzon', '2020-09-15', 0, 'Cook Islands', 'Kinh', 'Không', NULL, NULL, '', '1970-01-14', NULL, NULL, '1981-02-28', '', ''),
(23, 'Mr. Elwin Cassin', '1984-06-02', 0, 'Indonesia', 'Kinh', 'Không', NULL, NULL, '39185576698241', '1998-01-16', NULL, NULL, '2008-06-25', '', ''),
(24, 'Gail Armstrong DDS', '2019-08-12', 0, 'Antigua and Barbuda', 'Kinh', 'Tin lành', NULL, NULL, '5224821383226', '', NULL, NULL, '1996-04-07', '2000-08-05', ''),
(25, 'Dr. Glenda Okuneva DVM', '2005-07-02', 0, 'Netherlands Antilles', 'Kinh', 'Không', NULL, NULL, '82348439973124', '1973-09-08', NULL, NULL, '2008-10-03', '', ''),
(26, 'Billy Bartell', '1987-12-02', 0, 'Albania', 'Kinh', 'Phật giáo', NULL, NULL, '84197064240707', '2002-04-12', NULL, NULL, '2005-10-09', '2013-12-05', ''),
(27, 'Nicolette Grant', '2017-07-20', 0, 'Uruguay', 'Dao', 'Không', NULL, NULL, '', '', NULL, NULL, '1977-03-18', '', ''),
(28, 'Anastacio Willms', '2022-04-25', 0, 'Chile', 'Kinh', 'Không', NULL, NULL, '89475304807083', '', NULL, NULL, '1991-12-30', '1981-09-07', 'Quasi a totam eius id omnis. Est est dolorem est.'),
(29, 'Jeanette Beatty', '1984-05-01', 0, 'Wallis and Futuna', 'Khmer', 'Không', NULL, NULL, '31148986364787', '', NULL, NULL, '2005-05-11', '', 'Eligendi mollitia sed alias. Unde suscipit ex quod officiis rerum eum corrupti. Voluptatem magnam amet id velit in. Labore aut ut qui ipsam cum harum ea.'),
(30, 'Ms. Violette Gusikowski MD', '1989-08-08', 0, 'Samoa', 'Kinh', 'Tin lành', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(31, 'Mrs. Maurine Stracke', '1987-11-11', 1, 'Azerbaijan', 'Khmer', 'Không', NULL, NULL, '62169790011830', '', NULL, NULL, '', '1976-10-03', ''),
(32, 'Tommie Reichel', '1975-12-27', 1, 'Libyan Arab Jamahiriya', 'Nùng', 'Tin lành', NULL, NULL, '71334301848237', '', NULL, NULL, '', '1997-09-16', 'Explicabo ratione vel voluptas eum accusamus illum et. Consequatur at ut autem est tempora ipsum. Facere dolor rerum ipsa nihil illo quia quidem. Eaque autem aliquam quia quis. Et accusantium totam sed dolor.'),
(33, 'Issac Lemke', '1975-10-13', 1, 'China', 'Kinh', 'Bà la môn', NULL, NULL, '', '', NULL, NULL, '', '', 'Sit sequi itaque ut non impedit veniam. Ut consequuntur vel a reprehenderit impedit. Nobis ut consequatur voluptatibus ab officiis. Et sit quia ducimus dolorum quo.'),
(34, 'Ervin Weber', '1998-11-02', 1, 'United Arab Emirates', 'Thái', 'Không', NULL, NULL, '56639861873185', '2013-04-05', NULL, NULL, '1981-07-03', '', ''),
(35, 'Ezra Kulas', '2005-04-27', 1, 'French Polynesia', 'Dao', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', 'Ullam sunt est excepturi. Quam quia atque molestiae doloremque et.'),
(36, 'Shane Brakus DVM', '1987-02-18', 1, 'Tanzania', 'Kinh', 'Công giáo', NULL, NULL, '80671123703064', '1987-05-07', NULL, NULL, '', '1989-10-06', ''),
(37, 'Jamie Murazik', '2008-07-12', 0, 'Norfolk Island', 'Kinh', 'Phật giáo', NULL, NULL, '36801075601095', '1987-10-31', NULL, NULL, '2008-03-17', '', ''),
(38, 'Clovis Hyatt', '2015-10-26', 1, 'Micronesia', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '1992-03-12', '2002-09-28', ''),
(39, 'Fanny Murazik', '1979-12-17', 1, 'Palestinian Territory', 'Mường', 'Không', NULL, NULL, '', '', NULL, NULL, '', '2007-03-09', ''),
(40, 'Garrison Reichel', '1994-03-17', 1, 'Niger', 'Kinh', 'Không', NULL, NULL, '', '2015-12-27', NULL, NULL, '', '2010-05-16', ''),
(41, 'Marjolaine Towne', '2012-09-29', 1, 'Zimbabwe', 'Kinh', 'Không', NULL, NULL, '72820816973124', '', NULL, NULL, '1986-11-15', '', 'Veniam dicta sit temporibus et aut. Dolor laudantium quia qui magni. Sunt delectus in sed ut dignissimos.'),
(42, 'Mrs. Paula Brown', '2008-11-28', 0, 'Togo', 'Kinh', 'Không', NULL, NULL, '2275858738424', '', NULL, NULL, '1999-01-15', '', ''),
(43, 'Dr. Emmitt VonRueden III', '1997-12-11', 0, 'Namibia', 'Kinh', 'Không', NULL, NULL, '83608758331996', '2008-01-29', NULL, NULL, '', '', 'Aut est ducimus optio qui consequatur est pariatur et. Et sapiente aut cumque voluptatem est ab. Ex inventore numquam fuga voluptas.'),
(44, 'Hassie Boehm', '1978-12-17', 0, 'Georgia', 'Dao', 'Công giáo', NULL, NULL, '12823053646204', '2004-03-31', NULL, NULL, '', '1984-10-27', 'Neque ut consectetur iusto maiores. Error autem distinctio quo temporibus.'),
(45, 'Jose Hermann I', '1974-05-15', 0, 'Palestinian Territory', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '2000-11-20', '', 'Ipsum libero a maiores in. Qui officiis vitae adipisci explicabo earum ex fugit. Veritatis aperiam quisquam ut quam.'),
(46, 'Kelvin Greenfelder III', '2011-03-19', 0, 'Algeria', 'Khmer', 'Bà la môn', NULL, NULL, '', '1989-08-16', NULL, NULL, '2022-05-18', '1990-02-25', ''),
(47, 'Prof. Kaia Spencer MD', '1999-03-30', 0, 'Paraguay', 'Kinh', 'Tin lành', NULL, NULL, '95086746664312', '1999-09-09', NULL, NULL, '', '2014-03-21', 'Debitis cum libero velit corrupti et in. Dolores inventore mollitia omnis similique. Ut sunt ullam quod aliquam ut molestias.'),
(48, 'Jaqueline Bednar', '2017-08-23', 0, 'Bangladesh', 'Khmer', 'Không', NULL, NULL, '', '1996-04-23', NULL, NULL, '1988-02-13', '2001-01-05', ''),
(49, 'Dr. Anahi Ratke', '1977-06-10', 1, 'Greece', 'Nùng', 'Tin lành', NULL, NULL, '32077239091383', '1980-01-19', NULL, NULL, '1990-11-07', '', ''),
(50, 'Louisa Wintheiser', '1999-01-07', 1, 'Guernsey', 'Chăm', 'Tin lành', NULL, NULL, '', '2010-04-19', NULL, NULL, '1995-05-26', '1971-04-04', ''),
(51, 'Prof. Jayne Schumm', '1990-02-23', 1, 'British Indian Ocean Territory (Chagos Archipelago)', 'Tày', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1999-08-19', 'Sit laudantium voluptas dolorum incidunt dolorum quo. Sed consequatur distinctio deleniti reprehenderit est sunt quia. Qui et iusto hic quos aliquid quisquam. Eos nihil veniam ducimus similique asperiores.'),
(52, 'Cristina Dooley', '2020-06-15', 1, 'Taiwan', 'Thái', 'Không', NULL, NULL, '14698273220596', '', NULL, NULL, '1997-08-24', '2015-10-16', 'Possimus excepturi rerum accusamus. Dolorum impedit cupiditate facere et aut animi. Omnis deleniti quia impedit molestiae sapiente nemo voluptatem blanditiis. Veritatis accusantium in est ea eius.'),
(53, 'Lee Terry', '1980-05-14', 1, 'Bahamas', 'Kinh', 'Không', NULL, NULL, '', '1987-05-30', NULL, NULL, '2004-09-13', '', ''),
(54, 'Rory Miller', '2023-01-24', 1, 'Ghana', 'Kinh', 'Bà la môn', NULL, NULL, '18261496267238', '2002-05-01', NULL, NULL, '2016-05-29', '', ''),
(55, 'Dr. Walter Beatty PhD', '1994-03-10', 0, 'Uzbekistan', 'Kinh', 'Bà la môn', NULL, NULL, '9448876055086', '', NULL, NULL, '', '', 'Omnis repellendus tenetur minus. Qui commodi quas ipsa et autem at.'),
(56, 'Pasquale Wilderman', '2012-08-19', 0, 'Iceland', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '1991-10-18', '', ''),
(57, 'Edgardo McGlynn', '1970-03-07', 1, 'Mauritius', 'Thái', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1985-01-25', ''),
(58, 'Mrs. Baby DuBuque', '1995-08-07', 0, 'Bangladesh', 'Nùng', 'Công giáo', NULL, NULL, '31469381996041', '', NULL, NULL, '1973-10-05', '2002-02-26', ''),
(59, 'Eli Spencer DDS', '1997-08-30', 1, 'Iraq', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1994-08-24', 'A et sit et in. Autem aut mollitia facilis commodi dolorum aut sapiente. Ipsa voluptas non consequatur nam perspiciatis qui dicta.'),
(60, 'Roslyn Carter', '1976-03-22', 1, 'Greece', 'Kinh', 'Không', NULL, NULL, '13691664617214', '', NULL, NULL, '1991-04-17', '1995-09-17', 'Ut quia commodi est repudiandae ipsa ut possimus. Sunt id eos ipsam sint qui.'),
(61, 'Santina Hand', '2013-06-24', 1, 'Saint Pierre and Miquelon', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '2009-12-28', '2012-12-05', ''),
(62, 'Mr. Troy Hyatt III', '2006-03-03', 0, 'Northern Mariana Islands', 'Kinh', 'Không', NULL, NULL, '65601261733901', '1970-10-07', NULL, NULL, '', '', ''),
(63, 'Mrs. Margot Zboncak V', '1980-03-31', 0, 'Faroe Islands', 'Kinh', 'Không', NULL, NULL, '10182003915385', '1981-04-11', NULL, NULL, '1993-04-29', '1970-11-28', 'Natus odit velit expedita aut fugiat a sunt. Qui eos laudantium necessitatibus qui aperiam. Delectus illo est consectetur soluta repellat iste.'),
(64, 'Mr. Braeden Streich', '1977-10-29', 0, 'Samoa', 'Kinh', 'Không', NULL, NULL, '29088792781408', '', NULL, NULL, '', '1986-08-11', ''),
(65, 'Violette Barrows', '1991-01-27', 1, 'Lithuania', 'Kinh', 'Không', NULL, NULL, '60107024749178', '', NULL, NULL, '', '2000-08-02', 'Optio fugit autem repellendus odit et temporibus. Consequatur dolorem et tenetur voluptate voluptatibus dolore distinctio. Voluptatem pariatur fugit aut aliquam perspiciatis. Eos qui suscipit dignissimos ipsum placeat repellat aut.'),
(66, 'Ferne Johnson DVM', '1972-07-11', 0, 'Norway', 'Kinh', 'Không', NULL, NULL, '41039118007438', '1988-08-20', NULL, NULL, '1979-06-20', '', ''),
(67, 'Jonas Rempel', '2002-07-25', 1, 'Indonesia', 'Tày', 'Công giáo', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(68, 'Dr. Marian Eichmann', '1987-01-10', 0, 'Botswana', 'Mường', 'Không', NULL, NULL, '', '', NULL, NULL, '2015-06-13', '2007-06-29', 'Deserunt et unde molestiae dolores. Dolor ipsum iste aut qui. Saepe eos aut perferendis earum quisquam quo nihil.'),
(69, 'Forest Murphy', '1972-10-18', 1, 'Bhutan', 'Thái', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1985-07-31', 'Expedita consequuntur omnis ut quia. Beatae voluptatem debitis qui. Qui molestias praesentium non quia.'),
(70, 'Consuelo Rodriguez III', '2003-11-09', 1, 'Monaco', 'Kinh', 'Không', NULL, NULL, '', '1997-08-19', NULL, NULL, '1990-03-13', '1995-04-23', ''),
(71, 'Emerson Stiedemann', '2008-03-10', 1, 'Palau', 'Kinh', 'Phật giáo', NULL, NULL, '73328297692098', '', NULL, NULL, '1975-07-20', '1993-08-30', ''),
(72, 'Lukas Boehm', '1976-01-02', 1, 'Turks and Caicos Islands', 'Thái', 'Không', NULL, NULL, '47827976208091', '', NULL, NULL, '', '2003-06-23', 'Autem modi fuga qui quia totam explicabo. Occaecati nulla magnam quam nesciunt omnis tempore. Vitae quas enim est et dicta.'),
(73, 'Ms. Cleora Rolfson', '1979-10-01', 1, 'Iraq', 'Kinh', 'Không', NULL, NULL, '', '2009-03-04', NULL, NULL, '1974-05-18', '', ''),
(74, 'Samir Harber MD', '1983-01-09', 1, 'Saint Vincent and the Grenadines', 'Kinh', 'Không', NULL, NULL, '5945922835578', '', NULL, NULL, '2003-09-25', '2001-10-25', ''),
(75, 'Agustin Grimes PhD', '2000-10-21', 1, 'Tajikistan', 'Tày', 'Bà la môn', NULL, NULL, '', '', NULL, NULL, '', '2007-08-05', ''),
(76, 'Elenora Gibson', '1983-05-11', 1, 'Australia', 'Kinh', 'Không', NULL, NULL, '', '1999-08-03', NULL, NULL, '', '', ''),
(77, 'Prof. Antwon Rempel DVM', '1985-10-20', 1, 'Kenya', 'Tày', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(78, 'Beulah Boehm', '1997-11-04', 0, 'Iran', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(79, 'Nathen Jacobi', '2018-04-22', 1, 'Mauritania', 'Chăm', 'Không', NULL, NULL, '67271165583752', '', NULL, NULL, '1988-06-15', '', ''),
(80, 'Tony Rau', '1983-04-20', 1, 'Bosnia and Herzegovina', 'Nùng', 'Công giáo', NULL, NULL, '', '1987-02-08', NULL, NULL, '', '2022-02-03', ''),
(81, 'Mack Luettgen', '1970-04-25', 0, 'Nepal', 'Khmer', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(82, 'Modesta Mertz', '1997-12-12', 0, 'Paraguay', 'Kinh', 'Không', NULL, NULL, '85331516261901', '', NULL, NULL, '2014-04-17', '2003-11-20', 'Reprehenderit vero aut voluptatibus quae. Ipsa placeat maiores officiis nemo autem. Porro veritatis provident nemo sed. Debitis beatae voluptas tempore.'),
(83, 'Ms. Colleen Wehner V', '2016-06-13', 0, 'Brunei Darussalam', 'Kinh', 'Không', NULL, NULL, '24840465464977', '', NULL, NULL, '2016-08-10', '', ''),
(84, 'Lionel Reinger', '1990-02-06', 0, 'Tunisia', 'Kinh', 'Không', NULL, NULL, '28615134080504', '', NULL, NULL, '', '1989-06-30', ''),
(85, 'Efrain Altenwerth', '1999-01-07', 1, 'Switzerland', 'Kinh', 'Không', NULL, NULL, '4421211397917', '1987-02-24', NULL, NULL, '2005-08-08', '', ''),
(86, 'Prof. Garnett Nienow', '1971-08-01', 0, 'Lithuania', 'Kinh', 'Công giáo', NULL, NULL, '85943829518956', '', NULL, NULL, '', '', ''),
(87, 'Oda Yundt', '1994-08-02', 1, 'Indonesia', 'Thái', 'Công giáo', NULL, NULL, '91698520674576', '1986-06-13', NULL, NULL, '2008-12-17', '2011-09-16', 'Omnis vero ut vel cumque. Voluptatem velit pariatur eaque ea atque recusandae deserunt. Doloribus sint qui eveniet accusantium. Expedita sunt sed ad quam culpa iure nisi.'),
(88, 'Andre Corwin', '1979-08-22', 1, 'Dominican Republic', 'Kinh', 'Không', NULL, NULL, '', '2003-03-29', NULL, NULL, '', '', 'Voluptas veritatis eos quod aut sed recusandae aperiam voluptatem. Officiis assumenda tempore enim ipsa corrupti dolorem. Earum quidem quia voluptas impedit officia unde autem. Quo optio molestiae est.'),
(89, 'Jaylon Oberbrunner', '1983-08-26', 1, 'Oman', 'Dao', 'Công giáo', NULL, NULL, '60245738982111', '', NULL, NULL, '2018-02-27', '2010-02-21', ''),
(90, 'Eulah Schaden V', '1986-09-12', 1, 'Dominica', 'Khmer', 'Phật giáo', NULL, NULL, '95805522194088', '2018-11-07', NULL, NULL, '', '1989-01-21', 'Possimus esse esse corporis et temporibus officia saepe. Et eos impedit quisquam assumenda ex et. Deserunt corrupti quam quia enim est. Possimus id ut aliquid repellat nostrum.'),
(91, 'Letitia Koelpin Sr.', '2007-07-30', 1, 'Hungary', 'Kinh', 'Thiên chúa', NULL, NULL, '26585837408894', '', NULL, NULL, '2017-08-18', '2006-02-04', ''),
(92, 'Mr. Angus Hammes PhD', '2006-12-30', 1, 'Guam', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1986-04-08', 'Vel est fugit quae quis aspernatur sunt animi. Nihil explicabo facere itaque natus iste occaecati voluptatem.'),
(93, 'Dion Wuckert', '1970-04-10', 1, 'Belgium', 'Mường', 'Không', NULL, NULL, '', '', NULL, NULL, '1984-07-04', '2016-10-28', ''),
(94, 'Mr. Kenneth Wiza', '2022-04-18', 0, 'Romania', 'Nùng', 'Không', NULL, NULL, '15465845537397', '2019-04-25', NULL, NULL, '', '1994-08-10', 'Rerum eum ex rerum. Voluptatem praesentium quae est unde corporis consequuntur. Autem aliquam expedita voluptates omnis.'),
(95, 'Triston Okuneva', '1987-12-20', 0, 'Denmark', 'Dao', 'Công giáo', NULL, NULL, '45406754348818', '2002-04-11', NULL, NULL, '', '', ''),
(96, 'Prof. Marty Pacocha PhD', '2013-07-01', 1, 'Hungary', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', 'Quia quis sed culpa nihil voluptas voluptates dolorem. Voluptatem voluptate illum impedit veritatis. Quia et laudantium modi.'),
(97, 'Maxwell Koepp', '1986-09-13', 0, 'Belize', 'Kinh', 'Không', NULL, NULL, '', '1996-04-23', NULL, NULL, '1978-11-30', '2018-05-18', 'Illo qui quo est placeat commodi repudiandae. Iste laboriosam blanditiis sint non.'),
(98, 'Louisa Lang', '2020-08-18', 0, 'Samoa', 'Thái', 'Không', NULL, NULL, '85652068040164', '', NULL, NULL, '1983-05-07', '', ''),
(99, 'Savanah Brown', '2008-07-18', 0, 'Hong Kong', 'Tày', 'Không', NULL, NULL, '39480260539736', '', NULL, NULL, '1971-06-02', '', 'Excepturi maxime fugit sit est quas est. Aspernatur sed beatae ipsam voluptate consequatur laborum.'),
(100, 'Maggie Powlowski', '2005-09-12', 1, 'Brunei Darussalam', 'Kinh', 'Không', NULL, NULL, '39224654738740', '', NULL, NULL, '2007-09-04', '', 'Omnis incidunt totam quam quam. Corrupti quod qui modi dolor fuga voluptas mollitia. Est inventore dolorum quod est. Soluta velit vitae et maxime.'),
(101, 'Matilde Ratke IV', '2018-07-13', 0, 'Costa Rica', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '2004-11-30', '', ''),
(102, 'Prof. Arianna Crooks', '1982-04-21', 0, 'Saint Helena', 'Kinh', 'Không', NULL, NULL, '', '1990-07-04', NULL, NULL, '2004-04-14', '', 'Et quis incidunt autem voluptatem a. Aspernatur totam sunt excepturi quidem rerum. Consequatur vel nemo modi qui qui ad totam unde. Architecto temporibus blanditiis quod cupiditate ut in.'),
(103, 'Emerald Hauck', '1995-03-03', 1, 'Paraguay', 'Kinh', 'Không', NULL, NULL, '4686828619803', '', NULL, NULL, '', '', ''),
(104, 'Andrew Mitchell III', '1980-06-02', 0, 'Isle of Man', 'Chăm', 'Không', NULL, NULL, '', '1970-01-03', NULL, NULL, '', '', ''),
(105, 'Dr. Jaden Strosin', '1980-03-26', 0, 'Equatorial Guinea', 'Kinh', 'Bà la môn', NULL, NULL, '3842738463953', '', NULL, NULL, '', '', ''),
(106, 'Ms. Germaine Hegmann', '1983-11-07', 1, 'Japan', 'Kinh', 'Không', NULL, NULL, '', '1993-04-30', NULL, NULL, '', '', ''),
(107, 'Audra Considine I', '2017-01-06', 1, 'Jamaica', 'Dao', 'Không', NULL, NULL, '11744574415939', '1995-04-18', NULL, NULL, '', '', 'Ex suscipit dolores accusantium aut et quia non. Tempore accusamus quaerat qui blanditiis molestiae.'),
(108, 'Mrs. Libbie Keebler', '1988-01-05', 1, 'Antigua and Barbuda', 'Chăm', 'Không', NULL, NULL, '', '', NULL, NULL, '2022-08-05', '', ''),
(109, 'Sven Baumbach', '2007-01-29', 0, 'Micronesia', 'Kinh', 'Phật giáo', NULL, NULL, '', '1991-08-10', NULL, NULL, '2015-01-08', '', 'Autem animi veniam officia eius earum a illum. Id voluptas et omnis explicabo et dolores. Inventore veritatis ut qui magnam est minima. Ut qui voluptates labore sed quasi unde vero.'),
(110, 'Kali Marvin', '1980-01-06', 1, 'Swaziland', 'Nùng', 'Công giáo', NULL, NULL, '', '', NULL, NULL, '2004-06-12', '2022-06-24', 'Ea rerum quos ipsam id unde voluptates. Sit quas qui soluta enim autem. Ex consequatur quae sint fugit.'),
(111, 'Evans Kuphal', '1983-11-10', 1, 'Cayman Islands', 'Kinh', 'Thiên chúa', NULL, NULL, '', '', NULL, NULL, '1971-12-04', '', 'Adipisci esse in et. Eius laborum cum ratione voluptates perferendis non. Dolorem est ea et nobis qui cumque.'),
(112, 'Hanna Crist', '1970-07-28', 0, 'Brunei Darussalam', 'Dao', 'Công giáo', NULL, NULL, '', '2017-10-13', NULL, NULL, '', '', 'Aperiam nihil voluptas perspiciatis qui amet consequuntur labore. Illum eaque ab quibusdam autem commodi ut hic. Laboriosam quia dolore veritatis laboriosam non saepe.'),
(113, 'Arvel Dickens', '2004-03-25', 1, 'Greece', 'Kinh', 'Không', NULL, NULL, '', '1992-07-24', NULL, NULL, '', '', ''),
(114, 'Vicente Hoeger', '1995-06-11', 0, 'French Guiana', 'Thái', 'Thiên chúa', NULL, NULL, '39846262193455', '1971-11-26', NULL, NULL, '1985-01-31', '1973-02-14', 'Qui et dolores deserunt autem alias asperiores. Optio at praesentium itaque doloribus totam ut. Non et et ad odit officia. Sunt cupiditate est quae et et.'),
(115, 'Hollie Stiedemann', '1985-02-07', 0, 'Tajikistan', 'Tày', 'Không', NULL, NULL, '20121910518116', '1996-08-18', NULL, NULL, '', '1973-07-07', ''),
(116, 'Miss Herminia Thompson III', '2014-09-09', 1, 'Bolivia', 'Kinh', 'Không', NULL, NULL, '', '1998-04-25', NULL, NULL, '1976-04-04', '2000-03-28', 'Consequatur odio incidunt necessitatibus nihil. Ex facilis non et cum vitae tempore. Nihil ut tempora suscipit qui qui minus. Adipisci eligendi sed autem architecto ratione iure.'),
(117, 'Jalen Reynolds', '1993-05-19', 0, 'Switzerland', 'Khmer', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1975-03-17', 'Blanditiis voluptas similique nobis qui. Voluptatum et qui debitis reprehenderit quis. Eum omnis aliquam ut at eaque nemo et voluptas. Enim sequi dolor dolorem nostrum quia.'),
(118, 'Mrs. Stefanie Carroll I', '2012-02-17', 0, 'Guadeloupe', 'Nùng', 'Phật giáo', NULL, NULL, '4194877566638', '', NULL, NULL, '1982-09-01', '1976-09-21', 'Et voluptates quidem eum quod id eum ut. Sapiente commodi dolorem id. Quia similique autem iste aliquam impedit impedit. Nobis deleniti tenetur laborum.'),
(119, 'Marley Wyman I', '2000-07-25', 0, 'Kiribati', 'Kinh', 'Công giáo', NULL, NULL, '', '2021-09-03', NULL, NULL, '', '', ''),
(120, 'Miss Estefania Batz', '2009-10-02', 1, 'Yemen', 'Nùng', 'Không', NULL, NULL, '41362963367555', '', NULL, NULL, '2005-03-01', '', 'Similique architecto est debitis quia praesentium iusto. Neque aut consectetur eligendi quia est nisi quia. Iste corrupti ratione maxime natus quibusdam est nostrum. Expedita accusantium explicabo sint ut exercitationem corrupti ullam.'),
(121, 'Susanna Rohan', '1977-01-08', 1, 'Hong Kong', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '1970-01-13', '1971-01-10', 'Ducimus eius modi quia et consequatur consequuntur. Qui qui saepe voluptatum ut officiis occaecati aut. Cupiditate animi est et aut voluptas. Et voluptates nisi sed dolorum et sit et.'),
(122, 'Mia Ruecker', '1990-07-22', 1, 'Puerto Rico', 'Kinh', 'Không', NULL, NULL, '59462981147121', '2009-07-03', NULL, NULL, '2016-01-29', '2013-09-27', ''),
(123, 'June Nicolas II', '2019-07-08', 0, 'Madagascar', 'Dao', 'Thiên chúa', NULL, NULL, '', '1997-10-31', NULL, NULL, '', '2001-08-26', ''),
(124, 'Scottie Kuphal', '2001-03-15', 1, 'Rwanda', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(125, 'Corrine Schaden DDS', '1991-04-07', 0, 'Guatemala', 'Kinh', 'Thiên chúa', NULL, NULL, '', '1989-06-08', NULL, NULL, '1988-04-27', '2017-06-22', 'Quis ut facilis repudiandae officia itaque facere eius. Iusto voluptatum dignissimos aspernatur eos asperiores dolorem. Non nemo quaerat fuga. Quasi laudantium omnis rem id ea.'),
(126, 'Dashawn Hane', '1999-06-09', 1, 'British Virgin Islands', 'Khmer', 'Phật giáo', NULL, NULL, '', '2014-08-14', NULL, NULL, '', '', 'Reiciendis ut provident beatae commodi et hic mollitia. Mollitia nisi est eaque tenetur et dolores. Accusantium maiores dolorem ut suscipit esse rerum ex. Accusantium quia eveniet adipisci error natus qui magni.'),
(127, 'Wendy Kuvalis', '1974-02-01', 1, 'Bhutan', 'Thái', 'Không', NULL, NULL, '49681795105082', '2010-10-10', NULL, NULL, '', '', 'In eos labore minima excepturi nihil voluptatem fuga. Labore rerum deserunt facilis velit fugiat molestiae odio. Neque labore et ut facilis. Sed quis sint sit quia.'),
(128, 'Ida Cronin', '2013-01-09', 1, 'Saint Helena', 'Chăm', 'Không', NULL, NULL, '51302807794066', '', NULL, NULL, '1981-05-24', '', 'Rerum quibusdam animi voluptas magni consectetur. Vitae voluptas sit et delectus quia pariatur dolores. Officia ipsam est totam et vel vel. Maxime adipisci et et soluta sit.'),
(129, 'Miss Amalia Zboncak', '1974-06-29', 1, 'Portugal', 'Tày', 'Không', NULL, NULL, '61432061127638', '1978-09-22', NULL, NULL, '1981-03-07', '', 'Ut qui laborum consequatur facere rem blanditiis. Libero doloremque adipisci impedit a aspernatur rem quaerat. Ea labore reprehenderit distinctio esse harum nemo. Aperiam odio modi voluptatem est ab.'),
(130, 'Meredith Goldner', '2006-06-30', 0, 'Burkina Faso', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(131, 'Myra Kuvalis', '2006-01-21', 1, 'Qatar', 'Thái', 'Không', NULL, NULL, '935177553939', '1980-09-04', NULL, NULL, '', '', ''),
(132, 'Olen Larson V', '1982-10-17', 1, 'French Southern Territories', 'Kinh', 'Không', NULL, NULL, '', '1987-10-05', NULL, NULL, '1997-03-29', '', ''),
(133, 'Dr. Tate Adams I', '1974-05-03', 1, 'Argentina', 'Chăm', 'Không', NULL, NULL, '53449957799391', '', NULL, NULL, '', '1971-08-13', 'Et iusto doloribus facilis voluptas. Tempora distinctio eos in ducimus qui eaque at. Nulla voluptas fuga architecto sapiente vero est et. Esse sint autem et enim maiores et in.'),
(134, 'Morton Sanford', '1984-12-01', 0, 'Brunei Darussalam', 'Kinh', 'Không', NULL, NULL, '44538710113515', '', NULL, NULL, '1996-09-30', '2020-10-16', ''),
(135, 'Bonnie Vandervort I', '1994-02-09', 0, 'Grenada', 'Nùng', 'Không', NULL, NULL, '21586817824270', '', NULL, NULL, '1997-02-14', '', ''),
(136, 'Mr. Riley Daugherty Sr.', '2016-01-26', 1, 'Bolivia', 'Chăm', 'Không', NULL, NULL, '89219429158546', '2012-05-29', NULL, NULL, '2017-03-23', '1971-11-18', ''),
(137, 'Prof. Joesph Johnson III', '2022-08-30', 1, 'Holy See (Vatican City State)', 'Nùng', 'Không', NULL, NULL, '', '', NULL, NULL, '2008-02-08', '', 'Delectus ut aliquam esse saepe cupiditate voluptatum. Nam in dolorem doloremque nihil quam. Qui minus eos quo enim hic.'),
(138, 'Valentine Upton DVM', '1988-12-07', 1, 'Kuwait', 'Chăm', 'Phật giáo', NULL, NULL, '', '', NULL, NULL, '1993-08-20', '2021-02-11', 'Impedit dolorem id corrupti itaque et. Expedita et sit ut asperiores quisquam quis qui. Maxime qui recusandae in molestiae est sit eligendi sunt. Rerum eligendi magnam repudiandae velit tenetur.'),
(139, 'Xander O\'Hara III', '1990-10-11', 0, 'Germany', 'Chăm', 'Phật giáo', NULL, NULL, '', '1989-02-09', NULL, NULL, '1984-01-13', '', ''),
(140, 'Xander Miller', '2010-01-28', 1, 'Slovakia (Slovak Republic)', 'Dao', 'Bà la môn', NULL, NULL, '691825252108', '1976-04-05', NULL, NULL, '', '1970-08-09', 'Impedit sunt vel esse occaecati eos. Amet iure laborum id autem tenetur et ex. Ut ex illo tempore optio.'),
(141, 'Meghan O\'Reilly', '2020-04-04', 1, 'Central African Republic', 'Kinh', 'Phật giáo', NULL, NULL, '56582897155678', '1997-06-09', NULL, NULL, '2000-05-30', '', ''),
(142, 'Dr. Tremaine Maggio IV', '1972-11-09', 1, 'Belarus', 'Tày', 'Không', NULL, NULL, '', '', NULL, NULL, '', '2000-05-03', 'Repellendus reprehenderit vero maxime ut. Consequuntur quisquam cupiditate quia consectetur sint quia. Aut quae aut consequatur perferendis aut. Dolorem sint officia omnis fugiat.'),
(143, 'Humberto Bergstrom IV', '2002-04-29', 1, 'Cayman Islands', 'Dao', 'Không', NULL, NULL, '', '2021-03-10', NULL, NULL, '1983-04-03', '', 'Quam nihil repudiandae deserunt incidunt quo laborum consequatur. Quo provident esse dolores fuga totam doloremque. Sit aut libero sunt aperiam. Quas earum nesciunt eveniet et earum.'),
(144, 'Dr. Lonie Dibbert', '2006-07-10', 0, 'Cote d\'Ivoire', 'Mường', 'Không', NULL, NULL, '51626353850704', '', NULL, NULL, '1991-06-20', '1998-08-17', 'Voluptatem sunt et amet architecto eligendi fuga ipsa voluptatem. Aut a soluta earum quis eveniet et nihil. Sint magnam officia praesentium asperiores ut atque nihil enim. Sit sed suscipit quo qui qui iusto.'),
(145, 'Dr. Seth Murphy', '1975-06-09', 1, 'Antarctica (the territory South of 60 deg S)', 'Kinh', 'Không', NULL, NULL, '', '1999-01-20', NULL, NULL, '', '1997-05-30', ''),
(146, 'Courtney Stoltenberg', '2019-08-26', 1, 'Kuwait', 'Nùng', 'Công giáo', NULL, NULL, '61581966512366', '1975-02-18', NULL, NULL, '', '2008-02-13', ''),
(147, 'Dr. Wendell Barrows', '1979-01-07', 0, 'Brazil', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', 'Qui iste quisquam voluptate minus consequuntur. In fugit id magnam voluptate et et. Dolor ratione id neque ut tempora eum magnam. Doloremque sit voluptates et minus qui debitis corporis.'),
(148, 'Tyrique Douglas', '2014-04-19', 1, 'Pitcairn Islands', 'Kinh', 'Bà la môn', NULL, NULL, '', '', NULL, NULL, '1992-04-15', '', 'Non est et unde quos nemo omnis. Corrupti voluptas accusantium quo asperiores accusantium est. Aperiam cumque quia sint exercitationem.'),
(149, 'Geovanni Weissnat', '2011-12-12', 0, 'Austria', 'Chăm', 'Không', NULL, NULL, '', '', NULL, NULL, '1972-05-03', '', 'Autem laborum vel sunt doloribus vel eos cumque repellat. Quos facilis eveniet dicta sed voluptatem at. Possimus eum rerum animi.'),
(150, 'Hazel Herzog', '1994-03-27', 1, 'Brazil', 'Kinh', 'Công giáo', NULL, NULL, '49099191074609', '', NULL, NULL, '', '', ''),
(151, 'Dr. Johnathon Koch MD', '2008-07-20', 0, 'Barbados', 'Tày', 'Không', NULL, NULL, '8383036274274', '2007-05-18', NULL, NULL, '', '', ''),
(152, 'Karlee Powlowski', '1980-09-13', 0, 'Barbados', 'Mường', 'Thiên chúa', NULL, NULL, '', '', NULL, NULL, '', '', ''),
(153, 'Prof. Geovanni Rohan', '2007-11-19', 1, 'Svalbard & Jan Mayen Islands', 'Khmer', 'Công giáo', NULL, NULL, '49892787410053', '', NULL, NULL, '', '2017-05-17', 'Dolores provident at necessitatibus enim laborum. Soluta nesciunt explicabo occaecati architecto qui. Enim aut qui aliquid at explicabo nisi. Dolore est doloribus alias architecto ea facere.'),
(154, 'Rosalee Johns', '2008-12-18', 1, 'New Zealand', 'Tày', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1970-09-15', 'Laborum totam fugiat sunt voluptatibus laudantium neque ut. Cum blanditiis omnis dolorem est corporis. Doloribus nesciunt officia eos aliquam aliquid voluptas vitae. Est quia consectetur saepe nesciunt reprehenderit.'),
(155, 'Marquis Nienow', '1991-04-17', 0, 'United Kingdom', 'Dao', 'Không', NULL, NULL, '', '', NULL, NULL, '1970-03-30', '1976-05-15', ''),
(156, 'Josiane Smitham', '2005-01-01', 0, 'Gambia', 'Mường', 'Bà la môn', NULL, NULL, '', '1989-10-05', NULL, NULL, '2006-07-30', '1991-03-29', ''),
(157, 'Prof. Marge Crist', '2001-12-13', 0, 'Netherlands', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1998-03-19', ''),
(158, 'Hope Muller', '2017-11-10', 0, 'South Africa', 'Nùng', 'Không', NULL, NULL, '73533494835827', '1983-04-06', NULL, NULL, '1973-01-22', '', 'Molestias magni provident architecto voluptatem in explicabo asperiores. Numquam maiores ipsa facilis rem blanditiis. Iste a numquam vel nam nemo veniam sit illo. Molestiae impedit nesciunt veritatis iste.'),
(159, 'Lynn Hilpert IV', '2003-08-31', 0, 'Cambodia', 'Kinh', 'Bà la môn', NULL, NULL, '', '2018-10-27', NULL, NULL, '', '1996-08-23', ''),
(160, 'Moises Schimmel I', '2005-01-30', 1, 'Turkey', 'Nùng', 'Không', NULL, NULL, '6677298187770', '', NULL, NULL, '1991-12-02', '', 'Ea aut distinctio minus nisi delectus. Officiis aut quae consequatur quia soluta vitae. Cumque et vitae minima qui voluptatum sed velit consectetur.'),
(161, 'Mr. Juvenal Gorczany', '2010-05-20', 0, 'Brazil', 'Mường', 'Không', NULL, NULL, '87544064337913', '1989-02-24', NULL, NULL, '2016-11-18', '1976-11-12', 'Voluptatum ipsa et unde quasi. Illum hic minima ipsa provident. Atque maxime et autem at sunt similique officiis.'),
(162, 'Miss Fay Conn', '1977-05-18', 1, 'Marshall Islands', 'Kinh', 'Không', NULL, NULL, '32869831770326', '1983-11-19', NULL, NULL, '', '', ''),
(163, 'Eldon Carter', '1972-11-28', 1, 'Slovakia (Slovak Republic)', 'Kinh', 'Không', NULL, NULL, '', '1985-10-14', NULL, NULL, '1985-04-25', '', 'Fuga voluptas doloribus ab exercitationem. Sapiente ipsum ut maiores ipsa sit explicabo.'),
(164, 'Dr. Lilian Hegmann', '2020-02-23', 1, 'Montenegro', 'Kinh', 'Thiên chúa', NULL, NULL, '', '', NULL, NULL, '', '1995-12-12', 'Sit veritatis nesciunt aut porro. Accusamus suscipit dolor quaerat. Sit omnis voluptates vel voluptates assumenda dolorem illum.'),
(165, 'Vicenta Jacobson II', '2006-08-10', 0, 'Ethiopia', 'Kinh', 'Không', NULL, NULL, '', '1992-05-22', NULL, NULL, '', '', ''),
(166, 'Prof. Justine Schroeder', '2001-09-01', 1, 'Puerto Rico', 'Kinh', 'Không', NULL, NULL, '93085377025722', '', NULL, NULL, '1991-09-02', '2018-12-20', ''),
(167, 'Lauriane Jacobson', '2002-07-07', 1, 'Albania', 'Kinh', 'Không', NULL, NULL, '', '1990-06-12', NULL, NULL, '1992-11-21', '', ''),
(168, 'Briana Brekke', '1998-07-18', 1, 'Saint Kitts and Nevis', 'Mường', 'Bà la môn', NULL, NULL, '43249310364997', '2018-02-05', NULL, NULL, '2021-12-06', '2012-04-18', ''),
(169, 'Brooks Stiedemann', '1983-05-29', 0, 'Pitcairn Islands', 'Dao', 'Không', NULL, NULL, '', '', NULL, NULL, '1998-01-28', '2017-08-16', 'Sint ratione veritatis in sit asperiores quasi voluptatum. Accusantium corporis esse dolorum ea culpa. Velit est rem ad ipsum. Quia velit sapiente tempora excepturi eveniet distinctio mollitia. Corporis similique ea porro.'),
(170, 'Bret Reichel', '1972-09-13', 0, 'Spain', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '', 'Quam odio ut provident repellendus enim magni odit. Sed possimus autem est aut quo quia iusto.'),
(171, 'Haven Thompson', '2014-07-21', 0, 'Barbados', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '1984-04-30', '', 'Adipisci tempore id voluptas qui numquam incidunt consequatur. Et explicabo cum et quia quia in dolore quidem. Corporis architecto cumque quo ut consequatur odio quasi optio.'),
(172, 'Mrs. Karlee Spencer DDS', '2009-07-15', 1, 'Cocos (Keeling) Islands', 'Kinh', 'Thiên chúa', NULL, NULL, '', '', NULL, NULL, '', '1978-02-14', ''),
(173, 'Mrs. Liza Stanton IV', '1982-05-28', 1, 'Colombia', 'Kinh', 'Bà la môn', NULL, NULL, '69570474481185', '', NULL, NULL, '', '', ''),
(174, 'Garry Wiza', '1991-12-24', 1, 'Macao', 'Kinh', 'Thiên chúa', NULL, NULL, '80276229776482', '1979-03-22', NULL, NULL, '', '1998-03-14', 'Consequatur iusto aut eos autem fugit aut. Hic ut dicta laborum aperiam. Earum illo suscipit fuga qui facere.'),
(175, 'Annamarie Zieme', '1977-10-08', 0, 'Bulgaria', 'Thái', 'Không', NULL, NULL, '82794661885515', '1977-05-22', NULL, NULL, '', '', 'Molestiae et autem amet voluptatem. Blanditiis qui architecto qui voluptatem reiciendis occaecati. Eaque nemo quasi quia fugiat. Magni assumenda voluptate eaque error fugit.'),
(176, 'Miss Alene Lebsack', '2021-09-09', 1, 'Falkland Islands (Malvinas)', 'Kinh', 'Không', NULL, NULL, '5500483697253', '', NULL, NULL, '', '', 'Illum cum omnis vero sed nisi delectus modi. Magnam provident eveniet ducimus recusandae eaque tempora accusantium. Natus et ducimus consequatur pariatur exercitationem.'),
(177, 'Rollin Howe', '2011-07-19', 1, 'Latvia', 'Kinh', 'Tin lành', NULL, NULL, '67398201348297', '', NULL, NULL, '', '', 'Occaecati est harum ipsa labore numquam repudiandae. Voluptas facere quos tempore ipsum non sit aut. Cupiditate cumque quia aspernatur alias eum quaerat iure. Qui nihil sed voluptatem saepe.'),
(178, 'Miss Willow Bernier', '2010-04-27', 0, 'Oman', 'Tày', 'Không', NULL, NULL, '44859478767410', '2008-12-29', NULL, NULL, '', '1982-03-11', ''),
(179, 'Prof. Geovanny Kris IV', '2018-12-21', 1, 'Singapore', 'Tày', 'Bà la môn', NULL, NULL, '', '2001-05-08', NULL, NULL, '', '', ''),
(180, 'Anabelle Dickinson', '2005-08-21', 0, 'Slovenia', 'Kinh', 'Không', NULL, NULL, '76521911048261', '1988-07-06', NULL, NULL, '', '2015-11-29', 'Et molestias voluptates consequuntur. Repellat numquam in assumenda hic quis ipsa possimus. Adipisci sunt perspiciatis non alias. Voluptas quaerat veritatis perspiciatis et. Eum vel enim magnam quo ut molestiae quaerat occaecati.'),
(181, 'Lenna Ebert', '1998-10-25', 0, 'Suriname', 'Tày', 'Không', NULL, NULL, '2519943593378', '2016-04-14', NULL, NULL, '1999-11-26', '2004-03-29', ''),
(182, 'Aracely Robel', '2009-08-01', 1, 'Kyrgyz Republic', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1982-09-29', ''),
(183, 'Prof. Irma Koss IV', '1997-10-17', 1, 'Monaco', 'Tày', 'Không', NULL, NULL, '', '2014-10-02', NULL, NULL, '', '1971-06-27', ''),
(184, 'Eliseo Feeney Jr.', '1985-07-25', 1, 'Belgium', 'Mường', 'Không', NULL, NULL, '', '', NULL, NULL, '', '2001-09-12', ''),
(185, 'Mr. Milton Huels IV', '2006-12-01', 1, 'Guam', 'Mường', 'Không', NULL, NULL, '', '', NULL, NULL, '', '2012-04-21', 'Incidunt nostrum enim nemo sapiente eum. Maxime quia eum velit sit. Maiores velit consequatur sit maiores magni. Sunt nobis dolor et totam ad omnis.'),
(186, 'Dr. Nelle Mohr I', '1976-11-18', 1, 'Guinea-Bissau', 'Mường', 'Phật giáo', NULL, NULL, '53388170799216', '', NULL, NULL, '1971-10-12', '', ''),
(187, 'Hailie Walker IV', '1972-03-01', 1, 'Lithuania', 'Khmer', 'Không', NULL, NULL, '', '', NULL, NULL, '', '1983-06-17', ''),
(188, 'Erika Stracke', '2014-07-05', 0, 'Jersey', 'Mường', 'Bà la môn', NULL, NULL, '6736207287162', '', NULL, NULL, '', '', 'Eveniet unde vel voluptatum excepturi. Placeat nulla adipisci alias voluptatibus autem vel aut voluptatum.'),
(189, 'Geovanny Tromp', '2010-06-22', 0, 'Bahrain', 'Kinh', 'Không', NULL, NULL, '78457215740744', '', NULL, NULL, '1979-07-01', '2014-03-30', 'In culpa dolore dolore consequatur beatae aut consectetur explicabo. Qui aut saepe ut voluptatibus voluptas cumque aut omnis. Ea quas ab numquam odit sit sit. Suscipit non magni quam ea.'),
(190, 'Karianne Keebler I', '2017-09-09', 0, 'Uganda', 'Kinh', 'Tin lành', NULL, NULL, '', '', NULL, NULL, '1988-02-19', '', 'Voluptatem deleniti quae vitae omnis atque aut. Consequatur distinctio adipisci id vel pariatur et at quia. Rerum sint eos voluptas nam et dolores et.'),
(191, 'Celia Brown', '1994-05-26', 1, 'Sri Lanka', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '1986-04-26', '1970-03-13', ''),
(192, 'Ms. Maria Kuhn', '1989-02-21', 1, 'Tajikistan', 'Mường', 'Không', NULL, NULL, '22219014535836', '', NULL, NULL, '', '2015-04-22', ''),
(193, 'Assunta Casper', '2000-01-14', 1, 'Romania', 'Kinh', 'Không', NULL, NULL, '4943835230019', '2018-12-10', NULL, NULL, '1986-06-08', '', ''),
(194, 'Dr. Joesph Jenkins', '1982-01-12', 0, 'Maldives', 'Dao', 'Bà la môn', NULL, NULL, '', '', NULL, NULL, '2012-10-19', '2007-12-21', 'Quod ipsam nemo laboriosam ut. Est libero dolores autem est qui nesciunt et. Necessitatibus sit modi itaque dolor. Qui id delectus sit et veritatis et mollitia adipisci.'),
(195, 'Prof. John Rolfson', '2000-07-16', 1, 'Maldives', 'Nùng', 'Tin lành', NULL, NULL, '30645305895083', '2003-10-28', NULL, NULL, '1990-09-21', '1992-07-21', ''),
(196, 'Duane Gorczany', '2007-11-19', 1, 'Iran', 'Nùng', 'Không', NULL, NULL, '', '1999-09-16', NULL, NULL, '', '1981-04-11', 'Rem rerum voluptas natus nisi nemo totam nisi. Omnis itaque architecto autem consequatur magnam suscipit voluptas. Accusamus atque deleniti ut doloribus velit qui et.'),
(197, 'Raphaelle Jacobi', '1978-05-25', 1, 'Slovenia', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '1982-10-28', '', 'Dolor rerum temporibus ut delectus repellendus sunt dolores. Praesentium et occaecati incidunt aut quis. Aliquam nostrum fuga accusamus illo non. Sint voluptates voluptatem ut et molestias.'),
(198, 'Michael Cruickshank', '1980-12-06', 0, 'Holy See (Vatican City State)', 'Kinh', 'Không', NULL, NULL, '16710109929768', '1976-08-20', NULL, NULL, '2014-11-23', '2000-06-23', 'Autem et dolor repellendus quis maiores. Laudantium quod expedita quos non id consectetur. Doloribus tempora molestiae deserunt blanditiis at qui vel. Eligendi quo fugit rerum voluptate accusamus sunt.'),
(199, 'Al Willms', '2004-08-29', 1, 'Czech Republic', 'Kinh', 'Không', NULL, NULL, '', '', NULL, NULL, '', '2002-11-20', ''),
(200, 'Ilene Hickle', '1982-03-30', 1, 'France', 'Kinh', 'Tin lành', NULL, NULL, '42574972387051', '1977-10-26', NULL, NULL, '1979-10-09', '1998-07-20', 'Veniam quis voluptatibus animi praesentium laudantium cupiditate ut. Qui qui nihil fuga itaque saepe inventore veniam magni. Libero esse minus est qui.');

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
(1, 7, 0, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', 'tôi không đề nghị gì thêm', ''),
(2, 6, 0, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', 'tôi có đề nghị gì thêm', '1999-12-06'),
(3, 9, 1, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', 'tôi không đề nghị gì thêm', '2001-11-11'),
(101, 60, 1, '44446 Muriel Dale Suite 005\nHahnbury, AL 25831-5247', 'Facilis non corrupti vel labore quia voluptatum deleniti. At aut labore ut distinctio temporibus aut. Officiis ea aliquid adipisci aut.', '1992-06-07'),
(103, 99, 1, '47814 Hermiston Parkway\nSouth Garthstad, CO 25398', 'Vitae et ut voluptatem saepe minus esse. Sed modi nesciunt non esse id distinctio nostrum natus. Ipsa nulla nihil et aperiam eum quia quaerat et.', '2021-12-27'),
(105, 8, 1, '931 Towne Road Apt. 911\nJettiebury, KY 93284', 'Corrupti vel aut magnam ipsam eius perferendis iste. Molestiae dolor natus accusantium accusamus sint nobis hic. Maiores excepturi aut dicta molestiae culpa dignissimos quaerat. Ut et veritatis enim dignissimos aut ut atque.', '2011-12-15'),
(106, 1, 1, '3514 Smith Roads Suite 993\nPort Reyhaven, KS 73423', 'Quia saepe qui omnis quo non nulla quia odit. Molestias sequi molestiae eum quod. Corrupti vitae voluptatem occaecati non.', '2015-02-13'),
(115, 2, 1, '12116 Baumbach Point\nGulgowskiside, ND 61583', 'Id nulla ex error et veniam beatae aliquam. A quos cumque eum aliquid nulla voluptatem cumque.', '2000-12-13'),
(123, 7, 1, '78260 Howell Road Suite 334\nNew Janeville, AK 02500', 'Qui eum magni repudiandae hic iusto et laudantium architecto. A repudiandae id tenetur at laudantium. Illo molestias neque illum aliquid sint.', '1996-08-15'),
(124, 38, 1, '389 Otis Rest Suite 643\nPort Malachiland, AK 40726', 'Cumque adipisci voluptas occaecati eos molestiae amet eos odit. Enim voluptatum velit soluta dolorem quae est sit explicabo. Animi non et quia quas impedit.', '2021-12-20'),
(125, 78, 1, '4585 Lenny Loaf\nWayneside, MT 89917-7642', 'Quasi laudantium quas sit maxime. Et doloremque voluptas sint possimus hic explicabo. Aut sit dolor cum natus. Et ea ratione fugiat ipsa non sunt. Et aut laudantium incidunt vel alias dolores error.', '2016-10-30'),
(126, 90, 1, '610 Mitchell Common Apt. 799\nIdatown, WA 29945', 'Nobis id expedita placeat modi repellendus veniam minima. Consequatur id odit temporibus at omnis. Nesciunt aut id aperiam cumque inventore ex et. Rerum eius aut tempora fuga officiis ratione quia error. Molestiae qui eaque perspiciatis eligendi ut omnis.', '2009-04-02'),
(129, 114, 0, '309 Dean Well Suite 083\nEzequielshire, MO 56062', 'Maiores officia velit molestiae deserunt facilis culpa. Vel distinctio et est aut. Magni autem dignissimos blanditiis. Velit eum veniam reprehenderit fuga aperiam magni ut.', '1993-03-08'),
(147, 39, 0, '7776 Esther Radial Suite 906\nWilhelmineborough, NC 93395', 'Quae reprehenderit et sint maiores. Eum consequatur blanditiis adipisci eaque occaecati est quas.', '2005-11-04'),
(148, 7, 1, '99885 Marilou Route Suite 932\nPfefferberg, NY 01432-1406', 'Facilis sequi tenetur nemo magnam magni id unde. Maiores aspernatur similique possimus perspiciatis tempore sint culpa. Aut dolorem odit similique eius repudiandae sapiente rerum.', '2011-04-09'),
(154, 4, 0, '335 Flatley Shore\nDoraland, VA 28096-5719', 'Sit sit in maxime. Ea doloremque officiis quibusdam saepe voluptas harum distinctio. Repudiandae similique ut ut pariatur ut.', '2017-08-31'),
(155, 20, 0, '1908 Veronica Unions\nEast Alleneton, MS 05763', 'Aut sunt culpa est odit. Corrupti recusandae nostrum laborum nobis aut hic voluptatem. Quo eos dicta accusamus cum corporis qui eveniet. Facilis consequatur vero explicabo sit animi.', '2004-10-03'),
(160, 43, 1, '6284 Vernon Plaza Apt. 688\nWest Monroe, TN 28929-3430', 'Perferendis dolorem beatae aut corrupti reiciendis reprehenderit libero. Perspiciatis quis sed quis dolorem quaerat iusto enim molestiae. Quae consequatur qui eum tenetur qui non et.', '1999-12-12'),
(161, 3, 1, '0731 Koepp Fields Apt. 703\nNew Coltonland, MD 93570', 'Eius quos aperiam sapiente odit qui. Sunt accusamus odit ut quia sed dolor illum.', '2013-11-13'),
(163, 93, 1, '216 Conroy River\nEast Juanita, CT 60597', 'Ut dolorem recusandae reprehenderit debitis non error rerum quis. Eius consequatur ipsam et iste. A iusto voluptatibus dolor et dolore veniam non.', '2013-08-22'),
(166, 54, 1, '14179 Ansel Road Suite 565\nLake Albertobury, NC 49008-0917', 'Iure harum voluptatem quis at dolores. Sint omnis consequatur non vero sint. Maiores sed dolorem minima in voluptas.', '1978-08-06'),
(168, 28, 0, '687 Kyla Isle\nLake Esperanza, MS 04878-3193', 'Quis architecto rem est autem eum. Omnis tempore in dolor dolore.', '2016-02-11'),
(170, 16, 0, '018 Eloisa Skyway Apt. 187\nHettingerport, GA 24839', 'Sapiente sunt sint vel dolorum a. Laborum est delectus ea. Cum mollitia perspiciatis unde quia error quod. Alias sunt quia aut commodi culpa.', '1993-07-19'),
(176, 53, 1, '961 O\'Connell Stravenue Suite 588\nEast Metatown, LA 17047-0041', 'Et aut dolorem aliquam ut architecto maiores veniam quibusdam. Cupiditate ut temporibus voluptatem temporibus. Dicta possimus quibusdam rem autem facilis ipsum. Nisi vitae ducimus non quo quos non. Eius deserunt numquam sunt atque.', '2012-12-04'),
(187, 179, 1, '61388 Langosh Trafficway Apt. 089\nLake Lauren, OK 26448-3515', 'Aliquid qui sapiente accusamus esse eum. Dolores aut delectus odit ea rerum voluptatem. Accusantium mollitia rerum consequatur facere et id dicta.', '2002-04-27'),
(188, 95, 0, '4319 Roy Fields Apt. 011\nLizabury, RI 37390', 'Aut omnis eius ex exercitationem. Aperiam reiciendis architecto aut excepturi esse maiores.', '1970-03-17'),
(194, 2, 0, '45792 Waelchi Forks\nJacobsonfurt, NE 32360', 'Non impedit sint aut neque atque qui. Incidunt dolor laudantium sit est consequatur sed dolore.', '1981-04-15'),
(199, 82, 1, '80336 Weber Points Apt. 241\nEdytheburgh, WV 98221-0487', 'Nesciunt dignissimos quam qui omnis sint eum. Pariatur a expedita voluptas rerum voluptatem rerum ut. Nihil omnis qui dolorem nihil fugiat vel ut eaque. Et labore est aut amet molestiae aut.', '1987-02-05'),
(200, 5, 0, '174 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội ', 'tôi không đề nghị gì thêm', '2001-11-11');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hokhau`
--
ALTER TABLE `hokhau`
  MODIFY `sohokhau` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT cho bảng `khoanthu`
--
ALTER TABLE `khoanthu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `lichsu`
--
ALTER TABLE `lichsu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `nhankhau`
--
ALTER TABLE `nhankhau`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT cho bảng `tamtrutamvang`
--
ALTER TABLE `tamtrutamvang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

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
