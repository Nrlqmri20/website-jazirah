-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Agu 2025 pada 17.58
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_jazirah_test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bukti_dukung`
--

CREATE TABLE `bukti_dukung` (
  `id_pendukung` int(11) NOT NULL,
  `id_desk` int(11) NOT NULL,
  `kode_satker` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `link` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `pjk` varchar(100) DEFAULT NULL,
  `target_bulan` varchar(7) DEFAULT NULL,
  `progress` int(3) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('pending','in_progress','completed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bukti_dukung`
--

INSERT INTO `bukti_dukung` (`id_pendukung`, `id_desk`, `kode_satker`, `id_pengguna`, `link`, `keterangan`, `pjk`, `target_bulan`, `progress`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1100, 1, 'https://drive.google.com/drive/folders/18hq59W4j75IXp6VOG3lw1R5yCLUlGNrq?usp=sharing', '1.SK Tim CAN belum ada \n2. Daftar hadir atau sertifikat bukti keikutsertaan Pembinaan Tim kerja\n3. BUkti keikutsertaan TIM CAN', 'Bigram', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(2, 2, 1100, 1, 'https://drive.google.com/drive/folders/1QjUfUztovxIrzqz7iZmBW769_57q4GzJ?usp=sharing', 'bukti dukung belum di upload', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(3, 3, 1100, 1, 'https://drive.google.com/drive/folders/1jXRKjCoYeULwxVotapR_MVA9L4Edm_4l?usp=sharing', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(4, 4, 1100, 1, 'https://drive.google.com/drive/folders/1nvw4R9keLPMrCI9FR6y-K-lbRz9lbrYS?usp=sharing', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(5, 5, 1100, 1, 'https://drive.google.com/drive/folders/1no20xcrH73oeLrd9J0leaCh20U7WGHHJ?usp=sharing', '', 'CAN dan Humas', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(6, 6, 1100, 1, 'https://drive.google.com/drive/folders/1fWlgU-BSVfBY4cMFMXZosH_qcJV0gqaF?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(7, 7, 1100, 1, 'https://drive.google.com/drive/folders/1rgxOpb2FY7AKN7VOtdqVb0KPYGtGB6v4?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(8, 8, 1100, 1, 'https://drive.google.com/drive/folders/1wQzsiHC9BPMnj-m2iUayfNGH05ulwAeS?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(9, 9, 1100, 1, 'https://drive.google.com/drive/folders/1iviGyw1nohCb9So9LjHtDU-bS1Agqxpw?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(10, 10, 1100, 1, 'https://drive.google.com/drive/folders/1E4R-djWt--w3XKYHxHMXuVuLyi4LB15c?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(11, 11, 1100, 1, 'https://drive.google.com/drive/folders/1TAboE5lX85HZGOTY5THy34OuY-p-fOD5?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(12, 12, 1100, 1, 'https://drive.google.com/drive/folders/1UTTnpeThshg_D4xaQ_MdHMkkz_7ngyfz?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(13, 13, 1100, 1, 'https://drive.google.com/drive/folders/1_QhcGTPd24iCFIub356FMcUN_T3CBgvy?usp=drive_link', '', 'masing-masing tim', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(14, 14, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(15, 15, 1100, 1, 'https://drive.google.com/drive/folders/1QiXQvdTiJVnEqxY9Zc2W8f_j3ymLF0SK?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(16, 16, 1100, 1, 'https://drive.google.com/drive/folders/1zZvsHUnUgzGrh1nV86Yy3yhiWsRpVx-C?usp=drive_link', '', 'masing-masing tim', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(17, 17, 1100, 1, 'https://drive.google.com/drive/folders/11M5Ha2TzGGMCIgqOs51hRN8ZXQzNCi-g?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(18, 18, 1100, 1, 'https://drive.google.com/drive/folders/1aL3XoDqa1x-hEH-UKpVST_ZkI7noJgq3?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(19, 19, 1100, 1, 'https://drive.google.com/drive/folders/1P1OpBrXkr_4Mlcg4OMU3_RBbV9iMmI1y?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(20, 20, 1100, 1, 'https://drive.google.com/drive/folders/1992s_tg_WVObyH_WvXPEpko5_oFe55Ag?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(21, 21, 1100, 1, 'https://drive.google.com/drive/folders/1me1dy8CERX0PvYcKNIK6cp4bhh11dEfk?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(22, 22, 1100, 1, 'https://drive.google.com/drive/folders/1DNt-UVJuJJkrnNNoUMblBoQdyT6ecM_N?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(23, 23, 1100, 1, 'https://drive.google.com/drive/folders/1-4msXPEItyFi-XYNmD7HbSccutSUpbR8?usp=drive_link', '', 'SDM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(24, 24, 1100, 1, 'https://drive.google.com/drive/folders/1Gx4iuBr9_61d6ArpYevT4GhErP3aOp0i?usp=drive_link', '', 'SDM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(25, 25, 1100, 1, 'https://drive.google.com/drive/folders/1q5qz4o5vYK7CTwtkpXlMfieU9kCTw08u?usp=drive_link', '', 'SDM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(26, 26, 1100, 1, 'https://drive.google.com/drive/folders/1O18vJbY9iX7uXBZWhPs9ikDSrighv3U0?usp=drive_link', '', 'sdm', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(27, 27, 1100, 1, 'https://drive.google.com/drive/folders/1qE00Y_7XyoRQreY4B_sRcQaAI3TVCSYY?usp=drive_link', '', 'sdm', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(28, 28, 1100, 1, 'https://drive.google.com/drive/folders/133yjnnghWI2Z6c3Eh1g7rJHGt5nqOL0H?usp=drive_link', '', 'sdm', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(29, 29, 1100, 1, 'https://drive.google.com/drive/folders/1lzw9c1w30I9rD1-qTNIEp54EMCp2D6_v?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(30, 30, 1100, 1, 'https://drive.google.com/drive/folders/18nJLirxK6Z5KOgzAPVCkyIKDiV1MXSU_?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(31, 31, 1100, 1, 'https://drive.google.com/drive/folders/12ny_lO5gen4lmPZLz8v28BDeOG5KnU-F?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(32, 32, 1100, 1, 'https://drive.google.com/drive/folders/1lY9V9Sjk7puhtR9c9Mkcw8DquStYoiBy?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(33, 33, 1100, 1, 'https://drive.google.com/drive/folders/13h-RxQGwPUak_4HdtU1v33P6yLRGba8n?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(34, 34, 1100, 1, 'https://drive.google.com/drive/folders/1SUTDV3z8PaYdeQjElTDZFUa7IwyJHFuI?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(35, 35, 1100, 1, 'https://drive.google.com/drive/folders/17blRWt-vSvuDTivOOdz7o2ZbZn-R021x?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(36, 36, 1100, 1, 'https://drive.google.com/drive/folders/148vyUl_QXqff6sNouumzFwDaK0wcqgsq?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(37, 37, 1100, 1, 'https://drive.google.com/drive/folders/10mhJfnipNHNp8HxaE3Z6YXPKXu2rX_7J?usp=drive_link', '', 'SDM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(38, 38, 1100, 1, 'https://drive.google.com/drive/folders/1diz0fHV_N4Pl23W3fBx8RZDUKKPx-CWU?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(39, 39, 1100, 1, 'https://drive.google.com/drive/folders/1Nzzmt7GSEyunUyra0BggnNm-nwQUz39g?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(40, 40, 1100, 1, 'https://drive.google.com/drive/folders/1CvGHurnBUFDV059TmrkoeTxdsj7zCTWq?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(41, 41, 1100, 1, 'https://drive.google.com/drive/folders/1FFcBByOBL5TIoqinoUh3qqOTFOHlRSlz?usp=drive_link', 'Tambahkan foto rapat penetapan PK 2025', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(42, 42, 1100, 1, 'https://drive.google.com/drive/folders/1wTffGS3mYNDetXUrTSuc8LZy-ExODh3Y?usp=drive_link', 'Tambahkan foto rapat penetapan PK 2025', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(43, 43, 1100, 1, 'https://drive.google.com/drive/folders/1DH3egrn7MJK8OU26ZkYClIil62RXcbxz?usp=drive_link', 'Tidak ada target', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(44, 44, 1100, 1, 'https://drive.google.com/drive/folders/1XRk-Qnv454crmpEWM7ahVh1aKTVF2uXD?usp=drive_link', 'Tidak ada target', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(45, 45, 1100, 1, 'https://drive.google.com/drive/folders/1iY0fxw3W0qw1wDia_ZpAilS2lxpoPdlw?usp=drive_link', 'Sesuai', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(46, 46, 1100, 1, 'https://drive.google.com/drive/folders/1k_iuecJBoZDr0tJnnnDLA-bwizAguf4N?usp=drive_link', 'Tidak ada target', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(47, 47, 1100, 1, 'https://drive.google.com/drive/folders/1HBL8C5vFmxUX2y8mz5BQ6lk0hDWMgWfo?usp=drive_link', 'Tidak ada target', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(48, 48, 1100, 1, 'https://drive.google.com/drive/folders/12HJJJTFBHhKNnGXIFppm7mfrvCocqtLU?usp=drive_link', 'Tidak ada target', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(49, 49, 1100, 1, 'https://drive.google.com/drive/folders/1d_Bjn9HVUSZnVTm_OCBu3l9RYbYxc3gZ?usp=drive_link', 'Tidak ada target', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(50, 50, 1100, 1, 'https://drive.google.com/drive/folders/1BET2BKO5RuokqRW3NnFlzV0eHhPy-qpj?usp=drive_link', 'Tidak ada target', 'Perencanaan &\nPilar II (SOP)', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(51, 51, 1100, 1, 'https://drive.google.com/drive/folders/1qt2-KoO6wzFyAGHUT9qOeThY2j0nCk55?usp=drive_link', '- Belum ada Laporan Pelaksanaan Pembinaan SAKIP 2025 beserta sertifikat;\n- Belum ada update daftar kompetensi individu seluruh anggota tim SAKIP hingga 2025.', 'Perencanaan', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(52, 52, 1100, 1, 'https://drive.google.com/drive/folders/1qJxk9istdcwRbOn3VtDg6Xbpzaxy2ApN?usp=drive_link', 'Belum terdapat realisasi dan bukti dukung realisasi', 'Humas, Admin Medsos & PST', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(53, 53, 1100, 1, '', 'Belum terdapat realisasi dan bukti dukung realisasi', 'Humas, Admin Medsos & PST', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(54, 54, 1100, 1, '', '', 'Sub Pilar Gratifikasi', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(55, 55, 1100, 1, 'https://drive.google.com/drive/folders/1WGhFU1s7fpeH5ix3GHXZc4wsfX2uJ4JD?usp=drive_link', '', 'Sub Pilar Gratifikasi', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(56, 56, 1100, 1, '', '', 'Sub Pilar Gratifikasi', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(57, 57, 1100, 1, '', '', 'Sub Pilar Gratifikasi', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(58, 58, 1100, 1, 'https://drive.google.com/drive/folders/1VpiHeatOuKNa6FJMhK4qz8iKpKfsgShV?usp=drive_link', '', 'Sub Pilar SPIP', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(59, 59, 1100, 1, '', '', 'Sub Pilar SPIP', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(60, 60, 1100, 1, '', '', 'Sub Pilar SPIP', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(61, 61, 1100, 1, '', '', 'Sub Pilar SPIP', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(62, 62, 1100, 1, 'https://drive.google.com/drive/folders/1VpsMztrZ-Km2SQ_dSTZGjewqgV1lf8na?usp=drive_link', '', 'Sub Pilar MR', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(63, 63, 1100, 1, '', '', 'Sub Pilar MR', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(64, 64, 1100, 1, 'https://drive.google.com/drive/folders/1cIUpMNwf-5a7PonqqBzI-2Xul3w2O1Dv?usp=drive_link', '', 'Sub Pilar MR', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(65, 65, 1100, 1, 'https://drive.google.com/drive/folders/1fPwIU94YzDjWXkTAOpBpSPty3YJ07e5F?usp=drive_link', '', 'Sub Pilar MR', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(66, 66, 1100, 1, 'https://drive.google.com/drive/folders/1livDhLMefIWa75cCO3Hvh8BQTVY6n1Vq?usp=drive_link', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(67, 67, 1100, 1, '', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(68, 68, 1100, 1, '', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(69, 69, 1100, 1, '', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(70, 70, 1100, 1, 'https://drive.google.com/drive/folders/1fCiCjYuNLsQZrYPSsKM6Fq9OOTqmaNoY?usp=drive_link', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(71, 71, 1100, 1, 'https://drive.google.com/drive/folders/12MhN6h5qSyH4_qKPPJ8qL1UPx55CEqTl?usp=drive_link', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(72, 72, 1100, 1, 'https://drive.google.com/drive/folders/1fiR6SXCaFpcaAOe5t_BUcETXTBlVcOUm?usp=drive_link', '', 'Sub Pilar PM', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(73, 73, 1100, 1, 'https://drive.google.com/drive/folders/1j9xdod4eT8UWa6EOflXclld_uykfjBad?usp=drive_link', '', 'Sub Pilar WBS', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(74, 74, 1100, 1, '', '', 'Sub Pilar WBS', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(75, 75, 1100, 1, '', '', 'Sub Pilar WBS', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(76, 76, 1100, 1, 'https://drive.google.com/drive/folders/12VcS9IatI-8LsS01jtIAf0whMLxuQi_z?usp=drive_link', '', 'Sub Pilar WBS', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(77, 77, 1100, 1, 'https://drive.google.com/drive/folders/1WDV847r7OUA2iLyMMqJt7r5eaE7KVIrM?usp=drive_link', '', 'Sub Pilar WBS', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(78, 78, 1100, 1, 'https://drive.google.com/drive/folders/1pCjwBtLfYDjJIjxYduzUlHuN9opJy610?usp=drive_link', '', 'Sub Pilar PBK', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(79, 79, 1100, 1, 'https://drive.google.com/drive/folders/1QiJ1yiuQCARKk3o0XEvGfEISqQUWC1M8?usp=drive_link', '', 'Sub Pilar PBK', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(80, 80, 1100, 1, 'https://drive.google.com/drive/folders/1reLAbK9XCHp8OK_9ynF2BmJyzVSWiCio?usp=drive_link', '', 'Sub Pilar PBK', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(81, 81, 1100, 1, 'https://drive.google.com/drive/folders/1tgKWy4Nv6FzuZI6-BOR2QD6Ja2D4MWyT?usp=drive_link', '', 'Sub Pilar PBK', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(82, 82, 1100, 1, 'https://drive.google.com/drive/folders/15LqW8OpsKrZseWHckeGjdVYL9aAxeAb1?usp=drive_link', '', 'Sub Pilar PBK', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(83, 83, 1100, 1, 'https://drive.google.com/drive/folders/1Y0M6vhh6Teuf1TfOnFctMqoSdG4N30Qc?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(84, 84, 1100, 1, 'https://drive.google.com/drive/folders/1YAT9bH3xA30lcR2IuQoUwE32NAZIGGx5?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(85, 85, 1100, 1, 'https://drive.google.com/drive/folders/1BRVkBN6HRdDZp6JdGlpCIP6tPMULpcxB?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(86, 86, 1100, 1, 'https://drive.google.com/drive/folders/1Y0M6vhh6Teuf1TfOnFctMqoSdG4N30Qc?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(87, 87, 1100, 1, 'https://drive.google.com/drive/folders/1xI4Shw_p-lFRvc5O4yPpjjf0Ctgu9MU2?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(88, 88, 1100, 1, 'https://drive.google.com/drive/folders/1qqnIhMG1DzlBHIeaK0h9sajDTAQRbFY2?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(89, 89, 1100, 1, 'https://drive.google.com/drive/folders/1Gh5xUvg8z26VgoV1zdVJVOr7fpb9lRxY?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(90, 90, 1100, 1, 'https://drive.google.com/drive/folders/1NnakQmIfbh_X9SXOMJL55uc20f8J9WbL?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(91, 91, 1100, 1, 'https://drive.google.com/drive/folders/1mLH9SpZlnwrMME_GosRO4Y-Y2nL8EBQ_?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(92, 92, 1100, 1, 'https://drive.google.com/drive/folders/1bGOY7NckXLOSeRiom6bCAUj63nBOfjSs?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(93, 93, 1100, 1, 'https://drive.google.com/drive/folders/10OjiknpvM60yNIb3QYZqZ5piM5vz1i0K?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(94, 94, 1100, 1, 'https://drive.google.com/drive/folders/1VKwdFo59iJ3dwzR_El-IlOQlcx4lRCyQ?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(95, 95, 1100, 1, 'https://drive.google.com/drive/folders/18ojie6Qu--sMtY31G0mH_ii4f4RCr-un?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(96, 96, 1100, 1, 'https://drive.google.com/drive/folders/15A710Ocmr1XpNlBVTuw8Brq3przLZK-I?usp=drive_link', 'Belum ada bukti rekomendasi dan rencana perbaikan', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(97, 97, 1100, 1, 'https://drive.google.com/drive/folders/14JZ1i6i9gsp5-vS_kQRPZkLn_Vt9DNuj?usp=drive_link', 'Belum terdapat bukti unggahan', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(98, 98, 1100, 1, 'https://drive.google.com/drive/folders/1YHGCEhgT5W2yDBsCSHPVeSCVBpmqnSsu?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(99, 99, 1100, 1, 'https://drive.google.com/drive/folders/1fZhge-cVudfFb8kD9FvlTq1LDdCOImGv?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(100, 100, 1100, 1, 'https://drive.google.com/drive/folders/1JUqatZCLeqvs4dJOpmv_oFXHupqT_h3p?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(101, 101, 1100, 1, 'https://drive.google.com/drive/folders/1_PVl4mZJxTabz8Mn5U3QCtRkCFuOWtMu?usp=drive_link', 'Bukti dukung belum diupload', 'TIm Diseminasi dan Pelayanan Statistik', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(102, 102, 1100, 1, 'https://drive.google.com/drive/folders/17lIy3e0E-XWreClKK2Wd62C-BVPb1mlJ?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(103, 103, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(104, 104, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(105, 105, 1100, 1, 'https://drive.google.com/drive/folders/1DCFcaPSb2DFzjdfeAQYpX4yzzyCfSubU?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(106, 106, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(107, 107, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(108, 108, 1100, 1, 'https://drive.google.com/drive/folders/1aRUBGolxfQE9Gcpip_UXj8W30wH3QlmL?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(109, 109, 1100, 1, 'https://drive.google.com/drive/folders/1Uq6_0CsPUrsOMeMLKWxvP05yIwb05Oni?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(110, 110, 1100, 1, 'https://drive.google.com/drive/folders/15Gh4FE8EF11FYlpuE_2icCA84B2GawG8?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(111, 111, 1100, 1, 'https://drive.google.com/drive/folders/1bKXV1t4DQ41rT840c-cD5N422_UvQ2pW?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(112, 112, 1100, 1, 'https://drive.google.com/drive/folders/1qr0KeDlbw8iicKqOcfjo6PFgm43zTNsw?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(113, 113, 1100, 1, 'https://drive.google.com/drive/folders/1JYsGdzPAfwsc6zNM1TJKOihWUvaaU46j?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(114, 114, 1100, 1, 'https://drive.google.com/drive/folders/1jUOdZTEkjRVD20TDHR_gRc350dnBF_09?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(115, 115, 1100, 1, 'https://drive.google.com/drive/folders/1CUlDSZ2NKFBtNi88XetejupV_x1xV2Ux?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(116, 116, 1100, 1, 'https://drive.google.com/drive/folders/1TYnHdtQrf4mCqfuJcYyfjPhZqll08KBf?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(117, 117, 1100, 1, 'https://drive.google.com/drive/folders/1Ihwu3gJ3HiZSLrwx7WdmckmYOw3UG4uK?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(118, 118, 1100, 1, 'https://drive.google.com/drive/folders/1pcvz2wjH8oF_p9mFxvRhUnUdtaNNWdiU?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(119, 119, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(120, 120, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(121, 121, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(122, 122, 1100, 1, 'https://drive.google.com/drive/folders/1YYQVJj0W7A6J1h6APbOb4rM2WdnYIARC?usp=drive_link', 'Tidak ada target', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(123, 123, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(124, 124, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(125, 125, 1100, 1, 'https://drive.google.com/drive/folders/1NDhYa620tnq1g5Wtxr_nRy3P-nzt_UN8?usp=drive_link', 'Tidak ada target', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(126, 126, 1100, 1, 'https://drive.google.com/drive/folders/1eiGH99bKXE8SwDg-uKhRYeq4tsClN19A?usp=drive_link', 'Sesuai', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(127, 127, 1100, 1, 'https://drive.google.com/drive/folders/1baT_wa0E8upOxAk8jnoF4ZUgRXk60JjB?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(128, 128, 1100, 1, 'https://drive.google.com/drive/folders/1SGAHtadFr_TRegN6Aqq7IVq9zyMl_DpA?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(129, 129, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(130, 130, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(131, 131, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(132, 132, 1100, 1, 'https://drive.google.com/drive/folders/1t4XFLHT_r-dmRQJP-hP7AGaZsE-fN2uG?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(133, 133, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(134, 134, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(135, 135, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(136, 136, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(137, 137, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(138, 138, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(139, 139, 1100, 1, 'https://drive.google.com/drive/folders/1BPnWMRhZ4rYVWLkARMeff_93jkDKQ3_P?usp=drive_link', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(140, 140, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(141, 141, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(142, 142, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(143, 143, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(144, 144, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(145, 145, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(146, 146, 1100, 1, 'https://drive.google.com/drive/folders/1fnfQZoO2wk5V6phtPo_1c9IB4IhyJD4z?usp=drive_link', 'Bukti dukung belum diupload', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(147, 147, 1100, 1, 'https://drive.google.com/drive/folders/1dld4wv4kGoSVpbekrB544OkQj7bB5Uy2?usp=drive_link', 'Bukti dukung belum diupload', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(148, 148, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(149, 149, 1100, 1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(150, 150, 1100, 1, 'https://drive.google.com/drive/folders/1ZlRZ_-oE4UrIvI70qebf9QvRRUtI5zyz?usp=drive_link', 'Bukti dukung belum diupload', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `deskripsi`
--

CREATE TABLE `deskripsi` (
  `id_desk` int(11) NOT NULL,
  `id_deskripsi` varchar(100) NOT NULL,
  `sub_deskripsi` varchar(100) NOT NULL,
  `deskripsi_rencana_kinerja` text DEFAULT NULL,
  `deskripsi_rencana_aksi` text DEFAULT NULL,
  `deskripsi_rencana_output` text DEFAULT NULL,
  `tahun` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `deskripsi`
--

INSERT INTO `deskripsi` (`id_desk`, `id_deskripsi`, `sub_deskripsi`, `deskripsi_rencana_kinerja`, `deskripsi_rencana_aksi`, `deskripsi_rencana_output`, `tahun`, `created_at`, `updated_at`) VALUES
(1, 'A.1.I.i', 'a', 'Unit kerja telah membentuk tim untuk melakukan pembangunan Zona Integritas', '1. Rapat Pembentukan Tim Kerja Pembangunan ZI BPS Provinsi Aceh Tahun 2025\nTopik: Struktur serta Uraian Tugas dan Fungsi Tim Kerja Pembangunan ZI BPS Provinsi Aceh Tahun 2025\n2. Pembinaan Tim Kerja Pembangunan ZI Tahun 2025\nTopik: Pedoman Pembangunan ZI Tahun 2025\n3. Seleksi dan Pembentukan Tim CAN BPS Provinsi Aceh Tahun 2025\n4. Pembinaan Tim CAN Tahun 2025', '- SK Tim Kerja Pembangunan ZI BPS Provinsi Aceh Tahun 2025\n- SK Tim CAN BPS Provinsi Aceh Tahun 2025\n- Keikutsertaan Tim Kerja Pembangunan ZI BPS Provinsi Aceh Tahun 2025 dalam Pembinaan ZI Tahun 2025 Lebih dari 50%\n- Keikutsertaan Tim CAN BPS Provinsi Aceh Tahun 2025 dalam Pembinaan Tim CAN Tahun 2025 Lebih dari 50%', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(2, 'A.1.I.i', 'b', 'Penentuan anggota Tim dipilih melalui prosedur/mekanisme yang jelas', '1. Rapat Pembentukan Tim Kerja ZI BPS Provinsi Aceh Tahun 2025\nTopik: Struktur serta Uraian Tugas dan Fungsi Tim Kerja\n2. Seleksi dan Pembentukan Tim CAN BPS Provinsi Aceh Tahun 2025', '- Notula/laporan pelaksanaan rapat pembentukan Tim Kerja Pembangunan ZI Tahun 2025\n- SOP Pembentukan Tim Kerja Pembangunan ZI Tahun 2025\n- Kertas Kerja Penentuan Anggota Tim Kerja Pembangunan ZI Tahun 2025\n- Kertas Kerja Penentuan Tim CAN Tahun 2025', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(3, 'A.1.I.ii', 'a', 'Terdapat dokumen rencana kerja pembangunan Zona Integritas menuju WBK/WBBM', 'Rapat Penyusunan Pedoman Pembangunan ZI BPS Provinsi Aceh Tahun 2025', 'Dokumen Pedoman Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (mencakup Susunan Tim Pembangunan ZI; Target prioritas; Rencana kerja dan rencana aksi; Timeline rencana dan realisasi; Tempat/format monev dan laporan)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(4, 'A.1.I.ii', 'b', 'Dalam dokumen pembangunan terdapat target-target prioritas yang relevan dengan tujuan pembangunan WBK/WBBM', 'Rapat Penyusunan Pedoman Pembangunan ZI BPS Provinsi Aceh Tahun 2025', 'Dokumen Pedoman Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (mencakup Susunan Tim Pembangunan ZI; Target prioritas; Rencana kerja dan rencana aksi; Timeline rencana; Tempat/format monev dan laporan)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(5, 'A.1.I.ii', 'c', 'Terdapat mekanisme atau media untuk mensosialisasikan pembangunan WBK/WBBM', '1. Sosialisasi Tim Kerja Pembangunan ZI BPS Provinsi Aceh Tahun 2025\n2. Sosialisasi Pembangunan Pembangunan ZI BPS Provinsi Aceh Tahun 2025', 'Laporan Sosialisasi Pembangunan ZI BPS Provinsi Aceh Tahun 2025\n(mencakup rencana dan realisasi konten sosialisasi kepada internal dan stakeholder secara offline dan online dilengkapi dokumentasi kegiatan (undangan, daftar hadir, notula, materi, foto/video), screen capture website, media sosial, ataupun foto kegiatan terkait serta link terkait)\n', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(6, 'A.1.I.iii', 'a', 'Seluruh kegiatan pembangunan sudah dilaksanakan sesuai dengan rencana', '1. Rapat Monitoring dan Evaluasi Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (triwulanan)\n2. Rapat Penyusunan Laporan Pembangunan ZI BPS Provinsi Aceh Tahun 2025', '- Laporan Monitoring dan Evaluasi Triwulanan Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (mencakup rencana dan realisasi; kendala dan solusi; rekomendasi tindak lanjut)\n- Laporan Pelaksanaan Pembangunan ZI BPS Provinsi Aceh Tahun 2025 ', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(7, 'A.1.I.iii', 'b', 'Terdapat monitoring dan evaluasi terhadap pembangunan Zona Integritas', 'Rapat Monitoring dan Evaluasi Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (triwulanan)', 'Laporan Monitoring dan Evaluasi Triwulanan Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (mencakup rencana dan realisasi; kendala dan solusi; rekomendasi tindak lanjut)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(8, 'A.1.I.iii', 'c', 'Hasil Monitoring dan Evaluasi telah ditindaklanjuti', 'Rapat Monitoring dan Evaluasi Pembangunan ZI BPS Provinsi Aceh Tahun 2025 (triwulanan)', 'laporan monitoring dan evaluasi yang memuat rekomendasi;\nLaporan hasil tindak lanjut rekomendasi;\nDokumentasi pelaksanaan tindak lanjut. pimpinan.\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(9, 'A.1.I.iv', 'a', 'Pimpinan berperan sebagai role model dalam pelaksanaan Pembangunan WBK/WBBM', '', 'Laporan tahunan penerapan nilai-nilai organisasi (BerAKHLAK) \n', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(10, 'A.1.I.iv', 'b', 'Sudah ditetapkan agen perubahan', '- Rapat seleksi/penentuan Change Champrion dan Change Ambassador', 'SK Agen Perubahan satuan kerja (Change Champion dan/ Change Ambassador)\n\nLaporan agen perubahan satuan kerja', 2025, '2025-08-31 14:40:20', '2025-08-31 15:58:03'),
(11, 'A.1.I.iv', 'c', 'Telah dibangun budaya kerja dan pola pikir di lingkungan organisasi', '', 'Laporan penerapan budaya kerja;\n\nMatriks dampak penerapan perubahan budaya kerja dan pola pikir.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(12, 'A.1.I.iv', 'd', 'Anggota organisasi terlibat dalam pembangunan Zona Integritas menuju WBK/WBBM', '', 'Dokumen pakta integritas seluruh pegawai;\n\nDokumen pelaksanaan rapat Monitoring dan evaluasi ZI triwulanan;\n\nDokumen yang memuat usulan-usulan anggota dan tindak lanjutnya.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(13, 'A.1.II.i', 'a', 'SOP mengacu pada peta proses bisnis instansi', 'Seluruh SOP mengacu pada peta proses bisnis', 'SOP Teknis dan Non Teknis/Administrasi BPS Provinsi/Kabupaten/Kota', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(14, 'A.1.II.i', 'a', '', '', 'Dokumen SOP Inovasi BPS Provinsi/Kabupaten/Kota yang ditandatangani kepala satuan kerja (Satker)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(15, 'A.1.II.i', 'b', 'Prosedur operasional tetap (SOP) telah diterapkan', 'Rapat Monitoring Pelaksanaan penerapan SOP', 'Dokumen monitoring pelaksanaan penerapan SOP', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(16, 'A.1.II.i', 'c', 'Prosedur operasional tetap (SOP) telah dievaluasi', 'Rapat Evaluasi SOP', 'Undangan, Daftar Hadir, notula untuk rapat evaluasi\n\nKertas kerja evaluasi SOP;\n\nDokumen SOP awal dan SOP perbaikan.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:04:48'),
(17, 'A.1.II.ii', 'a', 'Sistem pengukuran kinerja unit sudah menggunakan teknologi informasi', 'Memanfaatkan Sistem pengukuran kinerja unit sudah menggunakan teknologi informasi dan menambah tools baru jika dibutuhkan', 'Daftar seluruh penerapan teknologi informasi yang digunakan satker terkait pengukuran kinerja unit (seperti Simonev, FRA, dan atau inovasi lainnya jika ada);\n\nDokumen Screenshot aplikasi terkait pengukuran kinerja unit dan sudah berjalan (Simonev, FRA, dll) yang dilengkapi dengan narasi penjelasan penggunaan/pemanfaatan aplikasi TI dalam pengukuran kinerja unit;\n\nInovasi dilengkapi dengan Laporan Pemanfaatan Aplikasi yang berisi latar belakang/alasan pengembangan aplikasi, pemanfaatan aplikasi tersebut (dilengkapi dengan screenshot aplikasi) serta buku pedoman/SOP penggunaan aplikasi.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:06:43'),
(18, 'A.1.II.ii', 'b', 'Operasionalisasi manajemen SDM sudah menggunakan teknologi informasi', 'Membuat daftar seluruh penerapan teknologi informasi yang digunakan terkait operasionalisasi managemen SDM', 'Daftar seluruh penerapan teknologi informasi yang digunakan satker terkait operasionalisasi manajemen SDM (Misal SIMPEG dan Sijafung, dan atau inovasi lain jika ada);\n\nDokumen Screenshot aplikasi terkait operasionalisasi manajemen SDM dan sudah berjalan\n\nInovasi dilengkapi dengan Laporan Pemanfaatan Aplikasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:06:43'),
(19, 'A.1.II.ii', '', 'Pemberian pelayanan kepada publik sudah menggunakan teknologi informasi', 'Membuat daftar seluruh penerapan teknologi informasi terkait pelayanan publik', 'Daftar seluruh penerapan teknologi informasi yang digunakan satker terkait pelayanan publik (Misal Website, Romantik, Media Sosial, Layanan Pengaduan, dan atau Inovasi lain jika ada);\n\nDokumen Screenshot aplikasi terkait pelayanan publik dan sudah berjalan\n\nInovasi dilengkapi dengan Laporan Pemanfaatan Aplikasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:06:43'),
(20, 'A.1.II.ii', 'd', 'Telah dilakukan monitoring dan dan evaluasi terhadap pemanfaatan teknologi informasi dalam pengukuran kinerja unit, operasionalisasi SDM, dan pemberian layanan kepada publik', 'Membuat rapat monitoring dan evaluasi terhadap pemanfaatan teknologi informasi dalam pengikuran kinerja', 'Laporan monitoring dan evaluasi pemanfaatan TI (triwulanan/semesteran);\n\nDokumentasi rapat monitoring dan evaluasi pemanfaatan TI.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:07:32'),
(21, 'A.1.II.iii', 'a', 'Kebijakan tentang keterbukaan informasi publik telah diterapkan', 'Membuat Rapat pembentukan unit pendukung PPID 2025', 'SK Unit Pendukung PPID 2025 tiap satker;\n\nDaftar informasi publik satker yang dapat diakses (website satker, Sirup, PPID, dan lain-lain) sesuai Perka Nomor 1 Tahun 2021;\n\nScreenshot media pengelolaan informasi publik satker.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:07:32'),
(22, 'A.1.II.iii', 'b', 'Telah dilakukan monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik', 'Membuat Rapat monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik', 'Laporan berkala monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik dan bukti tindak lanjutnya (triwulanan/semesteran).', 2025, '2025-08-31 14:40:20', '2025-08-31 15:07:32'),
(23, 'A.1.III.i', 'a', 'Kebutuhan pegawai yang disusun oleh unit kerja mengacu kepada peta jabatan dan hasil analisis beban kerja untuk masing-masing jabatan', 'Rapat Evaluasi ABK', 'Dokumen Komposisi SDM ABK;\n\nnotula Hasil Rapat Evaluasi ABK', 2025, '2025-08-31 14:40:20', '2025-08-31 15:07:32'),
(24, 'A.1.III.i', 'b', 'Penempatan pegawai hasil rekrutmen murni mengacu kepada kebutuhan pegawai yang telah disusun per jabatan', 'Melakukan analisis Kebutuhan Pegawai', 'Analisis Kebutuhan Pegawai;\n\nSurat Perintah melaksanakan tugas dari kepala unit kerja;\n\nSK Penempatan dan Jabatan.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:07:32'),
(25, 'A.1.III.i', 'c', 'Telah dilakukan monitoring dan dan evaluasi terhadap penempatan pegawai rekrutmen untuk memenuhi kebutuhan jabatan dalam organisasi telah memberikan perbaikan terhadap kinerja unit kerja', 'Melakukan monitoring dan evaluasi terhadap penempatan pegawai', 'Laporan Monitoring dan Evaluasi Kinerja Penempatan Pegawai Baru', 2025, '2025-08-31 14:40:20', '2025-08-31 15:07:32'),
(26, 'A.1.III.ii', 'a', 'Dalam melakukan pengembangan karier pegawai, telah dilakukan mutasi pegawai antar jabatan', 'Rapat BaperJakat terkait pertimbangan Rotasi', 'notula Rapat                                                           SK Mutasi/Rotasi Internal', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(27, 'A.1.III.ii', 'b', 'Dalam melakukan mutasi pegawai antar jabatan telah memperhatikan kompetensi jabatan dan mengikuti pola mutasi yang telah ditetapkan', 'Melakukan analisis kesenjangan kompetensi Jabatan Pegawai', 'Laporan Analisis ', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(28, 'A.1.III.ii', 'c', 'Telah dilakukan monitoring dan evaluasi terhadap kegiatan mutasi yang telah dilakukan dalam kaitannya dengan perbaikan kinerja', 'Melakukan Monitoring dan evaluasi pegawai yang mutasi/rotasi', 'Laporan monitoring dan evaluasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(29, 'A.1.III.iii', 'a', 'Unit Kerja melakukan Training Need Analysis Untuk pengembangan kompetensi', 'Identifikasi Kebutuhan Pendidikan dan Pelatihan Pegawai', 'Laporan Kebutuhan Pendidikan dan Pelatihan Pegawai', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(30, 'A.1.III.iii', 'b', 'Dalam menyusun rencana pengembangan kompetensi pegawai, telah mempertimbangkan hasil pengelolaan kinerja pegawai', 'Merencanakan pengembangan kompetisi pegawai berdasarkan kinerja', 'Analisis kesenjangan kompetensi seluruh pegawai                                                               Rencana pengembangan kompetensi                 Analisa kebutuhan diklat', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(31, 'A.1.III.iii', 'c', 'Tingkat kesenjangan kompetensi pegawai yang ada dengan standar kompetensi yang ditetapkan untuk masing-masing jabatan', 'Identifikasi kesenjangan jabatan', 'Laporan Analisis Kesenjangan Kompetensi Jabatan Pegawai.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(32, 'A.1.III.iii', 'd', 'Pegawai di Unit Kerja telah memperoleh kesempatan/hak untuk mengikuti diklat maupun pengembangan kompetensi lainnya', 'Rekap data pegawai yang telah melakukan pelatihan', 'Rekapitulasi data pegawai berdasarkan pelatihan yang diikuti                                                  Bukti serfitikat', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(33, 'A.1.III.iii', 'e', 'Dalam pelaksanaan pengembangan kompetensi, unit kerja melakukan upaya pengembangan kompetensi kepada pegawai (seperti pengikutsertaan pada lembaga pelatihan, in-house training, coaching, atau mentoring)', 'Melakukan pelatihan', 'Laporan pelaksanaan pelatihan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(34, 'A.1.III.iii', 'f', 'Telah dilakukan monitoring dan evaluasi terhadap hasil pengembangan kompetensi dalam kaitannya dengan perbaikan kinerja', 'Monitoring dan evaluasi hasil pengembangan kompetensi', 'Laporan hasil monitoring dan evaluasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(35, 'A.1.III.iv', 'a', 'Terdapat penetapan kinerja individu yang terkait dengan perjanjian kinerja organisasi', 'Melakukan Cascading Indikator Kinerja              Memastikan seluruh pegawai telah mengisi KIPAPP', 'Dokumen SKP bulanan seluruh pegawai dari KipApp;\n\nSeluruh dokumen Matriks Peran Hasil (MPH) dari aplikasi Kipapp yang ditandatangani pimpinan;\n\nDokumen penjelasan cascading indikator kinerja mulai dari Visi, misi, PK sampai IKI.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:08:52'),
(36, 'A.1.III.iv', 'b', 'Ukuran kinerja individu telah memiliki kesesuaian dengan indikator kinerja individu level diatasnya', 'Pastikan seluruh pegawai mengisi KIPAPP', 'Seluruh dokumen Matriks Peran Hasil (MPH) dari aplikasi Kipapp yang ditandatangani pimpinan.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(37, 'A.1.III.iv', 'c', 'Pengukuran kinerja individu dilakukan secara periodik', 'Pastikan seluruh pegawai mengisi KIPAPP', 'Dokumen SKP bulanan seluruh pegawai dari KipApp.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(38, 'A.1.III.iv', 'd', 'Hasil penilaian kinerja individu telah dijadikan dasar untuk pemberian reward', 'Menyusun kertas kerja penilaian pegawai sebagai dasar pemberian reward', 'Dokumen mekanisme pemberian reward pegawai (misalnya, Employee of the month);\n\nKertas kerja pemberian reward;\n\nBukti reward (misalkan: sertifikat, dll).', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(39, 'A.1.III.v', 'a', 'Aturan disiplin/kode etik/kode perilaku telah dilaksanakan/diimplementasikan', 'Monitoring Disiplin pegawai                                          Membuat inovasi kode etik/perilaku', 'Laporan penegakan hukuman atas pelanggaran aturan disiplin/kode etik/kode perilaku;\n\nDokumen inovasi terkait aturan disiplin/kode etik/kode perilaku.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(40, 'A.1.III.vi', 'a', 'Data informasi kepegawaian unit kerja telah dimutakhirkan secara berkala', 'Update data SIMPEG', 'Laporan pemutakhiran data informasi kepegawaian yang ditandatangani oleh pimpinan;\n\nDokumen Entri Data Rekap Aktivitas dari SIMPEG', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(41, 'A.1.IV.i', 'a', 'Unit kerja telah melibatkan pimpinan secara langsung pada saat penyusunan perencanaan', 'Rapat penyusunan perencanaan Kinerja dan anggaran yang dipimpin oleh Kepala BPS Provinsi Aceh', 'Dokumentasi rapat  perencanaan Kinerja dan anggaran yang dipimpin oleh Kepala BPS Provinsi Aceh\n\nPK 2025\n\nRKA 2025\n\nLink PK 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(42, 'A.1.IV.i', 'b', 'Unit kerja telah melibatkan secara langsung pimpinan saat penyusunan penetapan kinerja', 'Rapat penetapan kinerja tahun 2025 yang dipimpin  oleh Kepala BPS Provinsi Aceh', 'Dokumentasi rapat penetapan kinerja tahun 2025 yang dipimpin oleh Kepala BPS Provinsi Aceh\n\nPK 2025\n\nMPH 2025\n\nLink PK 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(43, 'A.1.IV.i', 'c', 'Pimpinan memantau pencapaian kinerja secara berkala', 'Rapat evaluasi kinerja triwulanan', 'Dokumentasi rapat evaluasi kinerja triwulanan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(44, 'A.1.IV.ii', 'a', 'Dokumen perencanaan kinerja sudah ada', 'Menyusun dokumen Rencana Strategis BPS Provinsi Aceh 2025-2029', 'Dokumen Rencana Strategis BPS Provinsi Aceh 2025-2029\n\nPK 2025\n\nLink Renstra 2025-2019 dan PK 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(45, 'A.1.IV.ii', 'b', 'Perencanaan kinerja telah berorientasi hasil', 'Menyusun dokumen Penetapan Kinerja Tahun 2025', 'Dokumen Penetapan Kinerja Tahun 2025\n\nMPH 2025\n\nLink PK 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(46, 'A.1.IV.ii', 'c', 'Terdapat penetapan Indikator Kinerja Utama (IKU)', 'Menyusun dokumen Indikator Kinerja Utama (IKU) BPS Provinsi Aceh 2025-2029', 'Dokumen Peraturan Kepala BPS terkait IKU di Lingkungan BPS Tahun 2025-2029\n\nSurat terkait Penyusunan PK 2025', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(47, 'A.1.IV.ii', 'd', 'Indikator kinerja telah telah memenuhi kriteria SMART', 'Menyusun dokumen Laporan Kinerja BPS Provinsi Aceh Tahun 2025', 'Dokumen Laporan Kinerja BPS Provinsi Aceh Tahun 2025\n\nLink LAKIN 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(48, 'A.1.IV.ii', 'e', 'Laporan kinerja telah disusun tepat waktu', 'Menyusun dokumen Laporan Kinerja BPS Provinsi Aceh Tahun 2025 secara tepat waktu', 'Dokumen Laporan Kinerja BPS Provinsi Aceh Tahun 2025\n\nLink LAKIN 2025 pada PPID\n\nScreenshot bukti unggah LAKIN 2025 tepat waktu', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(49, 'A.1.IV.ii', 'f', 'Laporan kinerja telah memberikan informasi tentang kinerja', 'Menyusun dokumen Laporan Kinerja BPS Provinsi Aceh Tahun 2025 secara tepat waktu', 'Dokumen Laporan Kinerja BPS Provinsi Aceh Tahun 2025\n\nLink LAKIN 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(50, 'A.1.IV.ii', 'g', 'Terdapat sistem informasi/mekanisme informasi kinerja', 'Menyusun SK Tim SAKIP BPS Provinsi Aceh Tahun 2025', 'Peraturan Kepala Badan Pusat Statistik Nomor 9 Tahun 2015 tentang Pedoman Penyusunan Sistem Akuntabilitas Kinerja Instansi Pemerintah di Lingkungan Badan Pusat Statistik\n\nSK Tim SAKIP BPS Provinsi Aceh Tahun 2025\n\nSOP Pengumpulan Data Kinerja', 2025, '2025-08-31 14:40:20', '2025-08-31 15:19:39'),
(51, 'A.1.IV.ii', 'h', 'Unit kerja telah berupaya meningkatkan kapasitas SDM yang menangani akuntabilitas kinerja', 'Pembinaan Tim SAKIP BPS Provinsi Aceh', 'Laporan Pelaksanaan Pembinaan SAKIP 2025 beserta Sertifikat\n\nSK Tim SAKIP 2025\n\nDokumen daftar data individu seluruh anggota Tim SAKIP yang memuat data kompetensi dan sertifikat pembinaan terkait akuntabilitas kinerja (akumulasi kompetensi hingga tahun 2025)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(52, 'A.1.V.i', 'a', 'Telah dilakukan public campaign tentang pengendalian gratifikasi', 'Pembuatan dan/atau pengambilan foto/dokumentasi banner/spanduk yang menunjukkan pengendalian gratifikasi telah dipublikasikan pada media cetak', 'Kompilasi foto banner/spanduk yang menunjukkan pengendalian gratifikasi telah dipublikasikan pada media cetak (berikut narasi peletakan media tersebut)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(53, 'A.1.V.i', 'a', '', 'Pembuatan dan pengunggahan foto/video pengendalian gratifikasi di media sosial secara berkala', 'Screenshot media sosial yang menunjukkan pengendalian gratifikasi telah dipublikasikan secara berkala (per bulan/triwulan/semester)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(54, 'A.1.V.i', 'a', '', 'Sosialisasi larangan gratifikasi (minimal kepada seluruh pegawai)', '- Undangan \n- Daftar hadir\n- notula\n- Dokumentasi (foto yang menunjukkan materi larangan gratifikasi sedang/telah disampaikan)\n- Materi paparan gratifikasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(55, 'A.1.V.i', 'b', 'Pengendalian gratifikasi telah diimplementasikan', 'Rapat pembentukan unit pengendalian gratifikasi', 'SK terkait unit pengendalian gratifikasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(56, 'A.1.V.i', 'b', '', 'Rapat rencana kerja dan/atau implementasi pengendalian gratifikasi', 'Mekanisme atau SOP terkait pengendalian gratifikasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(57, 'A.1.V.i', 'b', '', 'Rapat evaluasi implementasi pengendalian gratifikasi', 'Laporan implementasi pengendalian gratifikasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(58, 'A.1.V.ii', 'a', 'Telah dibangun lingkungan pengendalian', 'Rapat pembentukan Tim SPIP', 'SK Tim SPIP', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(59, 'A.1.V.ii', 'a', '', 'Rapat rencana kerja dan/atau implementasi penyelenggaraan SPIP', 'Rencana kerja dan/atau inovasi terkait penyelenggaraan SPIP', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(60, 'A.1.V.ii', 'a', '', 'Sosialisasi SPIP minimal kepada seluruh pegawai', '- Undangan \n- Daftar hadir\n- notula\n- Dokumentasi (foto yang menunjukkan materi SPIP sedang/telah disampaikan)\n- Materi paparan SPIP', 2025, '2025-08-31 14:40:20', '2025-08-31 15:25:58'),
(61, 'A.1.V.ii', 'a', '', 'Rapat Evaluasi Penyelenggaraan SPIP', 'laporan penyelenggaraan SPIP (tambahkan subbab terkait inovasi, jika ada)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(62, 'A.1.V.ii', 'b', 'Telah dilakukan penilaian risiko atas pelaksanaan kebijakan', 'Rapat penetapan konteks risiko, penilaian risiko, dan rencana kerja pengendalia/penanganan risiko', 'Laporan Manajemen Risiko yang memuat penilaian risiko', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(63, 'A.1.V.ii', 'b', '', 'Pembuatan dan/atau penerapan inovasi terkait lingkungan pengendalian ', 'Laporan terkait inovasi terkait lingkungan pengendalian yang sesuai dengan karakteristik unit kerja (dapat dimasukkan sebagai bab dalam Laporan Manajemen Risiko)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(64, 'A.1.V.ii', 'c', 'Telah dilakukan kegiatan pengendalian untuk meminimalisir risiko yang telah diidentifikasi', 'Pelaksanaan penanganan risiko yang telah diidentifikasi', 'Laporan Manajemen Risiko yang memuat kegiatan pengendalian risiko ', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(65, 'A.1.V.ii', 'd', 'SPI telah diinformasikan dan dikomunikasikan kepada seluruh pihak terkait', 'Internalisasi/Sosialisasi Manajemen Resiko kepada seluruh pegawai', '- Undangan \n- Daftar hadir\n- notula\n- Dokumentasi (foto yang menunjukkan materi Manajemen Resiko sedang/telah disampaikan)\n- Materi paparan Manajemen Resiko\n\n*dokumentasi yang diperoleh dari kegiatan V.i.a \"sosialisasi larangan gratifikasi\" dan V.i.b \"sosialisasi SPIP\" agar juga dilampirkan sebagai bukti dukung pada poin ini', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(66, 'A.1.V.iii', 'a', 'Kebijakan Pengaduan masyarakat telah diimplementasikan', 'Rapat penunjukan/pembentukan tim Pengelola Pengaduan Masyarakat dan Penyusunan kebijakan pengaduan', '\"- SK petugas Pengelola Pengaduan Masyarakat\r\n- Dokumen kebijakan pengaduan\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(67, 'A.1.V.iii', 'a', '', 'Pembuatan dan pengunggahan media (foto/video) pengaduan masyarakat', 'Dokumentasi media/sarana pengaduan masyarakat yang dilengkapi dengan narasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(68, 'A.1.V.iii', 'a', '', 'Pembuatan dan/atau penempatan spanduk/banner/flyer informasi sarana penyampaian pengaduan', 'Dokumentasi spanduk/banner/flyer informasi sarana penyampaian pengaduan yang dilengkapi dengan narasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(69, 'A.1.V.iii', 'a', '', 'Rapat evaluasi dan monitoring pengelolaan pengaduan', 'Laporan pengelolaan pengaduan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(70, 'A.1.V.iii', 'b', 'Pengaduan masyarakat ditindaklanjuti', 'Rapat evaluasi dan monitoring pengelolaan pengaduan', 'Laporan pengelolaan pengaduan dengan outline:\n - Rekapitulasi jumlah aduan per bulan (jenis aduan)\n - Tindak lanjut aduan\n - Kendala dan solusi dalam penanganan aduan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(71, 'A.1.V.iii', 'c', 'Telah dilakukan monitoring dan evaluasi atas penanganan pengaduan masyarakat', 'Rapat evaluasi dan monitoring pengelolaan pengaduan', 'Laporan pengelolaan pengaduan dengan outline:\n - Rekapitulasi jumlah aduan per bulan (jenis aduan)\n - Tindak lanjut aduan\n - Kendala dan solusi dalam penanganan aduan\n - Hasil evaluasi atas tindak lanjut penanganan pengaduan masyarakat.\n\nDokumentasi pelaksanaan rapat evaluasi dan monitoring (undangan, daftar hadir, notula).', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(72, 'A.1.V.iii', 'd', 'Hasil evaluasi atas penanganan pengaduan masyarakat telah ditindaklanjuti', 'Rapat evaluasi dan monitoring pengelolaan pengaduan disertai tindak lanjut penanganan pengaduan (jika ada)', 'Laporan pengelolaan pengaduan dengan outline:\n - Rekapitulasi jumlah aduan per bulan (jenis aduan)\n - Tindak lanjut aduan\n - Kendala dan solusi dalam penanganan aduan\n - Hasil evaluasi atas tindak lanjut penanganan pengaduan masyarakat.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(73, 'A.1.V.iv', 'a', 'Whistle-Blowing System telah diterapkan', 'Rapat pembentukan Tim WBS', 'SK Tim Whistle-Blowing System sesuai dengan Keputusan Inspektur Utama No.B146/BPS/8000/10/2019 Tahun 2019 tentang Sistem Pengelolaan Pengaduan di Lingkungan Badan Pusat Statistik', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(74, 'A.1.V.iv', 'a', '', 'Pengelolaan WBS', '\"- Screenshot Aplikasi WBS\r\n- Laporan pengelolaan WBS\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(75, 'A.1.V.iv', 'a', '', '\"- Pembuatan dan pengunggahan media (foto atau video) yang memuat tentang WBS\r\n- Pembuatan dan/atau penempatan media cetak yang memuat tentang WBS\"', 'Dokumentasi spanduk/banner/flyer/media/sarana WBS yang dilengkapi dengan narasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:29:44'),
(76, 'A.1.V.iv', 'b', 'Telah dilakukan evaluasi atas penerapan Whistle Blowing System', 'Pengelolaan WBS', 'Laporan pengelolaan WBS dengan outline:\n - Rekapitulasi jumlah aduan per bulan (jenis aduan);\n - Rekapitulasi jumlah aduan per bulan (jenis aduan);\n - Tindak lanjut WBS;\n - Kendala dan solusi dalam penanganan WBS.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(77, 'A.1.V.iv', 'c', 'Hasil evaluasi atas penerapan Whistle Blowing System telah ditindaklanjuti', 'Rapat evaluasi penerapan WBS dan pembahasan tindak lanjut', 'Laporan pengelolaan WBS dengan outline:\n - Rekapitulasi jumlah aduan per bulan (jenis aduan);\n - Tindak lanjut WBS;\n - Kendala dan solusi dalam penanganan WBS;\n - Hasil evaluasi atas tindak lanjut penanganan WBS.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(78, 'A.1.V.v', 'a', 'Telah terdapat identifikasi/pemetaan benturan kepentingan dalam tugas fungsi utama', 'Identifikasi potensi benturan kepentingan dalam tugas fungsi utama', '- Dokumen hasil identifikasi potensi benturan kepentingan dalam tugas fungsi utama untuk seluruh pegawai berdasarkan lampiran Perka BPS Nomor 36 Tahun 2023 tentang Pedoman Penanganan Benturan Kepentingan di Lingkungan Badan Pusat Statistik halaman 23\n- Perka BPS Nomor 36 Tahun 2023 tentang Pedoman Penanganan Benturan Kepentingan di Lingkungan Badan Pusat Statistik.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(79, 'A.1.V.v', 'b', 'Penanganan Benturan Kepentingan telah disosialisasikan/internalisasi', 'Sosialisasi/internalisasi penanganan benturan kepentingan', '(1) rapat (undangan, daftar hadir, notula, foto)\n(2) bimtek (laporan, foto)\n(3) apel pagi/sore (foto, teks arahan pimpinan).', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(80, 'A.1.V.v', 'c', 'Penanganan Benturan Kepentingan telah diimplementasikan', 'Implementasi penanganan benturan kepentingan ', '- Dokumen surat pernyataan bebas dari benturan kepentingan untuk seluruh pegawai berdasarkan lampiran Perka BPS Nomor 36 Tahun 2023 tentang Pedoman Penanganan Benturan Kepentingan di Lingkungan Badan Pusat Statistik halaman 22;\n\n- Laporan Benturan Kepentingan berdasarkan lampiran Perka BPS Nomor 36 Tahun 2023 tentang Pedoman Penanganan Benturan Kepentingan di Lingkungan Badan Pusat Statistik halaman 24.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(81, 'A.1.V.v', 'd', 'Telah dilakukan evaluasi atas Penanganan Benturan Kepentingan', 'Rapat evaluasi penanganan benturan kepentingan', 'Laporan monitoring dan evaluasi penanganan benturan kepentingan berdasarkan lampiran Perka BPS Nomor 36 Tahun 2023 tentang Pedoman Penanganan Benturan Kepentingan di Lingkungan Badan Pusat Statistik halaman 25. ', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(82, 'A.1.V.v', 'e', 'Hasil evaluasi atas Penanganan Benturan Kepentingan telah ditindaklanjuti', 'Rapat evaluasi penanganan benturan kepentingan dan tindak lanjut penanganan benturan kepentingan', 'Laporan Bukti Tindak Lanjut Penanganan Benturan Kepentingan (mengacu pada rencana tindak lanjut di pertanyaan A.I.5.v.d)\n', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(83, 'A.1.VI.i', 'a', 'Terdapat kebijakan standar pelayanan', 'Melakukan Pengumpulan / membuat SK Standar Pelayanan Publik', 'SK Standar Pelayanan Publik', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(84, 'A.1.VI.i', 'b', 'Standar pelayanan telah dimaklumatkan', 'Menyampaikan isi maklumat melalui media sosial dan media lainnya', '\"- Dokumentasi Maklumat Pelayanan terpampang dengan jelas\r\n- SK Maklumat Pelayanan\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(85, 'A.1.VI.i', 'c', 'Dilakukan reviu dan perbaikan atas standar pelayanan', '\"- Melakukan FGD dengan stakeholder internal dan eksternal \r\n- Evaluasi berkala standar pelayanan yang telah diperbaiki\"', '\"- SK Tim Reviu Standar Pelayanan \r\n- Laporan Evaluasi pelaksanaan standar pelayanan\r\n- Laporan Evaluasi penerapan standar pelayanan\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:33:23'),
(86, 'A.1.VI.i', 'd', 'Telah melakukan publikasi atas standar pelayanan dan maklumat pelayanan', '\"- Menyusun materi publikasi standar pelayanan dan maklumat pelayanan\r\n- Menempatkan standar pelayanan dan maklumat di area strategis unit pelayanan\"', '\"- Dokumen / Desain Publikasi Standar Pelayanan / Maklumat Pelayanan \r\n- Dokumentasi Penempatan fisik\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(87, 'A.1.VI.ii', 'a', 'Telah dilakukan berbagai upaya peningkatan kemampuan dan/atau kompetensi tentang penerapan budaya pelayanan prima', '- Menyusun rencana pelatihan dan pengembangan kapasitas ekternal maupun internal \n- Menyelenggarakan pelatihan budaya pelayanan prima \n- Melakukan coaching dan mentoring internal secara berkala terkait pelayanan prima                                                                                                  - Melakukan training awarness terkait ISO:9001', '\"- Rencana Program Peningkatan Kompetensi\r\n- Daftar hadir, Materi, Sertifikat Pelatihan, notula dan Dokumentasi\r\n- Jadwal dan laporan kegiatan coaching / mentoring                                                                          - Sertifikat pelatihan ISO\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(88, 'A.1.VI.ii', 'b', 'Informasi tentang pelayanan mudah diakses melalui berbagai media', '\"- Mengidentifikasi jenis informasi pelayanan yang perlu dipublikasikan\r\n- Menyediakan informasi dalam bentuk cetak di lokasi layanan\r\n- Menyediakan layanan informasi interaktif (layanan chatbot, helpdesk, hotline)\"', '- Daftar Informasi Layanan (jenis layanan, prosedur, biaya, waktu, pengaduan\n- Poster, Brosur, Banner, Standing Banner, Papan Informasi\n- Data Penggunaan Layanan Interaktif, SOP Pengelolaan Layanan Informasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(89, 'A.1.VI.ii', 'c', 'Telah terdapat sistem pemberian penghargaan dan sanksi bagi petugas pemberi pelayanan', '\"- Menyusun kebijakan sistem penghargaan dan sanksi bagi petugas pelayanan\r\n- Menentukan indikator kinerja petugas pelayanan (KPI) yang menjadi dasar penilaian\r\n- Menyusun mekanisme penilaian kinerja secara periodik\r\n-Memberikan penghargaan kepada petugas berprestasi (sertifikat)\"', '- Dokumen Kebijakan/Peraturan Internal (SK, SOP, Pedoman Sistem Reward and Punishment)\n- Daftar Indikator Penilaian Kinerja Pelayanan (kuantitatif & kualitatif)\n- Jadwal & Metodologi Penilaian (format penilaian, pihak penilai, periode evaluasi)\n- Dokumentasi Pemberian Penghargaan (foto, daftar penerima, bentuk penghargaan)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(90, 'A.1.VI.ii', 'd', 'Telah terdapat sistem pemberian kompensasi kepada penerima layanan bila layanan tidak sesuai standar', '- Identifikasi Standar Layanan\n- ', '\"- Dokumen Standar Layanan dan Pelanggaran Layanan\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(91, 'A.1.VI.ii', 'e', 'Terdapat sarana layanan terpadu/terintegrasi', '- Mengintegrasikan sistem dan data dari beberapa unit ke dalam satu platform atau titik layanan', '- Sistem layanan terintegrasi aktif (baik berbasis fisik maupun digital).', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(92, 'A.1.VI.ii', 'f', 'Terdapat inovasi pelayanan', '\"- Menginventarisasi inovasi yang telah dilakukan dan mendokumentasikannya dalam format standar (profil inovasi)\"', '\"- Daftar Inovasi Pelayanan yang Sudah Berjalan\r\n- Laporan Inovasi \"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(93, 'A.1.VI.iii', 'a', 'Terdapat media pengaduan dan konsultasi pelayanan yang terintegrasi dengan SP4N-Lapor!', '- Menilai sejauh mana sistem pengaduan SP4N-Lapor! telah digunakan secara optimal (jumlah laporan, jenis aduan, respon waktu)', '- Laporan Evaluasi Penggunaan SP4N-Lapor!', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(94, 'A.1.VI.iii', 'b', 'Terdapat unit yang mengelola pengaduan dan konsultasi pelayanan', '- Menyediakan kanal pengaduan (online & offline): email, hotline, kotak saran, aplikasi.\n- Memasang banner, media sosial, brosur, dan informasi di tempat pelayanan\n- Menerima, mencatat, dan merespons pengaduan secara tepat waktu.', '\"- Tersedianya kanal-kanal pengaduan yang aktif.\r\n- Laporan kegiatan sosialisasi dan bukti dokumentasi.\r\n- Laporan harian/mingguan pengaduan masuk dan statusnya.\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(95, 'A.1.VI.iii', 'c', 'Telah dilakukan evaluasi atas penanganan keluhan/masukan dan konsultasi', '\"- Mengumpulkan data pengaduan/masukan/konsultasi dari berbagai kanal (online dan offline)\r\n- Mengevaluasi kinerja penanganan pengaduan: waktu respon, tindak lanjut, dan penyelesaian.\"', '\"- Laporan data pengaduan dan konsultasi, Hasil survei kepuasan dan persepsi pengguna \r\n- Dokumen analisis evaluasi\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(96, 'A.1.VI.iv', 'a', 'Telah dilakukan survei kepuasan masyarakat terhadap pelayanan', '\"- Menyusun laporan resmi hasil SKM\r\n- Menyusun rekomendasi perbaikan berdasarkan hasil survei\"', '\"- Dokumen laporan SKM \r\n- Dokumen rekomendasi dan rencana perbaikan\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(97, 'A.1.VI.iv', 'b', 'Hasil survei kepuasan masyarakat dapat diakses secara terbuka', '- Mengunggah hasil survei di website instansi.', '- Bukti unggahan (tautan URL, dokumentasi foto papan pengumuman)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(98, 'A.1.VI.iv', 'c', 'Dilakukan tindak lanjut atas hasil survei kepuasan masyarakat', '\"- Mengkaji aspek pelayanan dengan nilai terendah dalam hasil survei\r\n- Merumuskan rekomendasi perbaikan yang spesifik, terukur, dan realistis\"', '\"- Dokumen analisis mendalam per indikator SKM\r\n- Dokumen rekomendasi dan rencana aksi tindak lanjut hasil SKM\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(99, 'A.1.VI.v', 'a', 'Telah menerapkan teknologi informasi dalam memberikan pelayanan', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(100, 'A.1.VI.v', 'b', 'Telah membangun database pelayanan yang terintegrasi', 'Menyediakan dashboard, portal, sistem internal yang memungkinkan akses data secara real-time antar-unit pelayanan.', 'Portal atau dashboard pelayanan berbasis database terintegrasi', 2025, '2025-08-31 14:40:20', '2025-08-31 15:43:20'),
(101, 'A.1.VI.v', 'c', 'Telah dilakukan perbaikan secara terus-menerus', '- Mengevaluasi efektivitas setiap perbaikan yang telah dilakukan (before-after\n- Mendokumentasikan proses dan hasil setiap perbaikan sebagai pembelajaran.', '\"- Laporan evaluasi perbaikan\r\n- Dokumen hasil dan dampak perubahan.\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(102, 'A.2.I.i', 'a', 'Agen perubahan telah membuat perubahan yang konkret di Instansi (dalam 1 tahun)', 'Rapat Pemilihan Agen Perubahan\nRapat Penyusunan Laporan Agen Perubahan ', 'SK Agen Perubahan\nLaporan Agen Perubahan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(103, 'A.2.I.i', 'a', '- Jumlah Agen Perubahan', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(104, 'A.2.I.i', 'a', '- Jumlah Perubahan yang dibuat', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(105, 'A.2.I.i', 'b', 'Perubahan yang dibuat Agen Perubahan telah terintegrasi dalam sistem manajemen', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(106, 'A.2.I.i', 'b', '- Jumlah Perubahan yang dibuat', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(107, 'A.2.I.i', 'b', '- Jumlah Perubahan yang telah diintegrasikan dalam sistem manajemen', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(108, 'A.2.I.ii', 'a', 'Pimpinan memiliki komitmen terhadap pelaksanaan reformasi birokrasi, dengan adanya target capaian reformasi yang jelas di dokumen perencanaan', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(109, 'A.2.I.iii', 'a', 'Instansi membangun budaya kerja positif dan menerapkan nilai-nilai organisasi dalam pelaksanaan tugas sehari-hari', 'Internalisasi Budaya Kerja', 'Undangan, daftar hadir, notula dan dokumentasi internalisasi\nSOP kegiatan yang menghasilkan budaya kerja', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(110, 'A.2.II.i', 'a', 'Telah disusun peta proses bisnis dengan adanya penyederhanaan jabatan \n', 'Pemahaman :\n1. Peraturan BPS Nomor 7 Tahun 2020  \n2. Peraturan BPS nomor 5 tahun 2023\n3. SE Menpanrb nomor 393 tahun 2019\n4. SE Menpanrb no 15 tahun 2023', 'Peraturan BPS Nomor 7 Tahun 2020 Tentang Organisasi dan Tata Kerja BPS (BPS Pusat) serta Peraturan BPS Nomor 5 Tahun 2023 Tentang Organisasi dan Tata Kerja BPS Provinsi dan BPS Kabupaten/Kota (BPS Daerah);\n\nSurat perintah penyederhanaan organisasi di Surat Edaran (SE) Menteri PANRB Nomor 393 Tahun 2019 tentang langkah Strategis dan Konkret Penyederhanaan Birokrasi dan diperkuat oleh SE Menteri PANRB Nomor 15 tahun 2023 tentang Tata Cara Penilaian Penyederhanaan Birokrasi.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(111, 'A.2.II.ii', 'a', 'Implementasi SPBE telah terintegrasi dan mampu mendorong pelaksanaan pelayanan publik yang lebih cepat dan efisien', 'Menyusun laporan layanan pada pelayanan publik', 'Daftar Layanan pada pelayanan publik yang mengimplementasikan SPBE \n\nDokumen narasi penjelasan SPBE;\n\nDokumen yang menyatakan bahwa SPBE telah terintegrasi.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(112, 'A.2.II.ii', 'b', 'Implementasi SPBE telah terintegrasi dan mampu mendorong pelaksanaan pelayanan internal organisasi yang lebih cepat dan efisien', 'Menyusun laporan layanan pada pelayanan internal organisasi', 'Daftar Layanan pada pelayanan internal organisasi yang mengimplementasikan SPBE dan disertai narasi dampak implementasi SPBE (hanya yang bersifat internal), seperti Back Office Selindo/BOS, Kipapp, Sipecut, dan lain-lain;\n\nDokumen narasi penjelasan SPBE;\n\nDokumen yang menyatakan bahwa SPBE telah terintegrasi.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(113, 'A.2.II.iii', 'a', 'Transformasi digital pada bidang proses bisnis utama telah mampu memberikan nilai manfaat bagi unit kerja secara optimal', 'Menyusun laporan transformasi digital pada bidang proses bisnis utama', 'Narasi alasan perubahan metode pencacahan dari PAPI menjadi CAPI;\n\nBuku Pedoman penggunaan PAPI dan CAPI pada kegiatan Survei Angkatan Kerja Nasional Sakernas);\n\nSurat edaran BPS Pusat terkait pencacahan menggunakan CAPI;\n\nScreen shot pemanfaatan CAPI pada berbagai survei di masing-masing satker;\n\nDokumen evaluasi atas transformasi digital PAPI ke CAPI.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(114, 'A.2.II.iii', 'b', 'Transformasi digital pada bidang administrasi pemerintahan telah mampu memberikan nilai manfaat bagi unit kerja secara optimal', 'Menyusun laporan transformasi digital pada bidang administrasi', 'Narasi pemanfaatan BOS dan Kipapp dari buku pedoman BOS dan Kipapp;\n\nBuku pedoman penggunaan BOS dan Kipapp;\n\nSurat edaran BPS Pusat terkait pemanfaatan BOS dan Kipapp;\n\nScreenshot pemanfaatan BOS dan Kipapp;\n\nDokumen evaluasi atas pemanfaatan BOS, dan Kipapp.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(115, 'A.2.II.iii', 'c', 'Transformasi digital pada bidang pelayanan publik telah mampu memberikan nilai manfaat bagi unit kerja secara optimal', 'Menyusun laporan transformasi digital pada bidang pelayanan publik', 'Narasi/buku pedoman pemanfaatan website, Silastik, Romantik, PPID, SIRUP, dll;\n\nScreen shot pemanfaatan website, Silastik, Romantik, PPID, SIRUP, dll;\n\nDokumen evaluasi atas pemanfaatan website, Silastik, Romantik, PPID, SIRUP, dll', 2025, '2025-08-31 14:40:20', '2025-08-31 15:47:27'),
(116, 'A.2.III.i', 'a', 'Ukuran kinerja individu telah berorientasi hasil (outcome) sesuai pada levelnya', '', 'SKP Bulanan Pegawai', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(117, 'A.2.III.ii', 'a', 'Hasil assessment telah dijadikan pertimbangan untuk mutasi dan pengembangan karir pegawai', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(118, 'A.2.III.iii', 'a', 'Penurunan pelanggaran disiplin pegawai', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(119, 'A.2.III.iii', 'a', '- Jumlah pelanggaran tahun sebelumnya', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(120, 'A.2.III.iii', 'a', '- Jumlah pelanggaran tahun ini', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(121, 'A.2.III.iii', 'a', '- Jumlah pelanggaran yang telah diberikan sanksi/hukuman', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(122, 'A.2.IV.i', 'a', 'Persentase Sasaran dengan capaian 100% atau lebih', '', 'LAKIN 2025 (disusun 2026)\n\nLink LAKIN 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(123, 'A.2.IV.i', 'a', '- Jumlah Sasaran Kinerja', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(124, 'A.2.IV.i', 'a', '- Jumlah Sasaran Kinerja yang tercapai 100% atau lebih', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(125, 'A.2.IV.ii', 'a', 'Hasil Capaian/Monitoring Perjanjian Kinerja telah dijadikan dasar sebagai pemberian reward and punishment bagi organisasi', '', 'LAKIN 2025 (disusun 2026)\n\nLink LAKIN 2025 pada PPID\n\nNarasi tentang reward untuk organisasi/satker yang menerima kinerja di atas target, baik dari pihak internal maupun eksternal BPS (disertakan piagam/sertifikatnya)', 2025, '2025-08-31 14:40:20', '2025-08-31 15:49:43'),
(126, 'A.2.IV.iii', 'a', 'Apakah terdapat penjenjangan kinerja (Kerangka Logis Kinerja) yang mengacu pada kinerja utama organisasi dan dijadikan dalam penentuan kinerja seluruh pegawai?', '', 'PK 2025\n\nMPH 2025\n\nLink PK 2025 pada PPID', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(127, 'A.2.V.i', 'a', 'Telah dilakukan mekanisme pengendalian aktivitas secara berjenjang', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(128, 'A.2.V.ii', 'a', 'Persentase penanganan pengaduan masyarakat', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(129, 'A.2.V.ii', 'a', '- Jumlah pengaduan masyarakat yang harus ditindaklanjuti', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(130, 'A.2.V.ii', 'a', '- Jumlah pengaduan masyarakat yang sedang diproses', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(131, 'A.2.V.ii', 'a', '- Jumlah pengaduan masyarakat yang selesai ditindaklanjuti', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(132, 'A.2.V.iii', 'a', 'Penyampaian Laporan Harta Kekayaan Pejabat Negara (LHKPN)', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(133, 'A.2.V.iii', 'a', 'Persentase penyampaian LHKPN', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(134, 'A.2.V.iii', 'a', 'Jumlah yang harus melaporkan', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(135, 'A.2.V.iii', 'a', '- Kepala satuan kerja', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(136, 'A.2.V.iii', 'a', '- Pejabat yang diwajibkan menyampaikan LHKPN', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(137, 'A.2.V.iii', 'a', '- Lainnya', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(138, 'A.2.V.iii', 'a', 'Jumlah yang sudah melaporkan', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(139, 'A.2.V.iii', 'b', 'Penyampaian Laporan Harta Kekayaan Non LHKPN (Tidak Wajib LHKPN)', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(140, 'A.2.V.iii', 'b', 'Persentase penyampaian Non LHKPN', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:53:14'),
(141, 'A.2.V.iii', 'b', 'Jumlah yang harus melaporkan (tidak wajib LHKPN)', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(142, 'A.2.V.iii', 'b', '- Pejabat administrator (eselon III)', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(143, 'A.2.V.iii', 'b', '- Pejabat Pengawas (eselon IV)', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(144, 'A.2.V.iii', 'b', '- Jumlah Fungsional dan Pelaksana', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(145, 'A.2.V.iii', 'b', 'Jumlah yang sudah melaporkan', '', '', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(146, 'A.2.VI.i', 'a', 'Upaya dan/atau inovasi telah mendorong perbaikan pelayanan publik pada:\n1. Kesesuaian Persyaratan\n2. Kemudahan Sistem, Mekanisme, dan Prosedur\n3. Kecepatan Waktu Penyelesaian\n4. Kejelasan Biaya/Tarif, Gratis\n5. Kualitas Produk Spesifikasi Jenis Pelayanan\n6. Kompetensi Pelaksana/Web\n7. Perilaku Pelaksana/Web\n8. Kualitas Sarana dan prasarana\n9. Penanganan Pengaduan, Saran dan Masukan', '\"- Menyederhanakan dokumen persyaratan\r\n- Standarisasi hasil layanan\r\n- Penyediaan kotak saran, kanal pengaduan online, dan layanan konsultasi langsung.\r\n- Tindak lanjut pengaduan secara sistematis dan transparan.\"', '- Daftar persyaratan yang dipublikasikan (website, brosur)\n- Dokumen standar mutu produk layanan\n- Sistem pengaduan aktif (website, hotline, email).\n- Laporan bulanan pengaduan dan tindak lanjutnya.', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(147, 'A.2.VI.i', 'b', 'Upaya dan/atau inovasi pada perijinan/pelayanan telah dipermudah:\n1. Waktu lebih cepat\n2. Pelayanan Publik yang terpadu\n3. Alur lebih pendek/singkat\n4 Terintegrasi dengan aplikasi', 'Mencatat inovasi, kebijakan internal, atau instruksi yang menyebabkan kemudahan layanan.', 'SK, surat edaran, atau notula perubahan layanan dan profil inovasi layanan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(148, 'A.2.VI.i', 'b', '- Jumlah perizinan/pelayanan yang terdata/terdaftar', 'Membuat rekap jumlah konsumen yang berkunjung ke PST', 'Membuat laporan jumlah kunjungan PST setiap bulan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(149, 'A.2.VI.i', 'b', '- Jumlah perizinan/pelayanan yang telah dipermudah', 'Membuat rekap jumlah permintaan data dan konsultasi', 'Membuat laporan jumlah permintaan data dan konsultasi setiap bulan', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49'),
(150, 'A.2.VI.ii', 'a', 'Penanganan pengaduan pelayanan dilakukan melalui berbagai kanal/media secara responsif dan bertanggung jawab', 'Menyiapkan berbagai media pengaduan, seperti: kotak saran, layanan hotline, email resmi, website, media sosial, dan aplikasi pengaduan.', '\"- Daftar kanal pengaduan yang tersedia\r\n- Bukti eksistensi kanal (foto, link dan nomor kontak)\"', 2025, '2025-08-31 14:40:20', '2025-08-31 15:56:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_satker`
--

CREATE TABLE `kode_satker` (
  `kode_satker` int(11) NOT NULL,
  `satker` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kode_satker`
--

INSERT INTO `kode_satker` (`kode_satker`, `satker`) VALUES
(1100, 'BPS Provinsi Aceh'),
(1101, 'BPS Kabupaten Simeulue'),
(1102, 'BPS Kabupaten Aceh Singkil'),
(1103, 'BPS Kabupaten Aceh Selatan'),
(1104, 'BPS Kabupaten Aceh Tenggara'),
(1105, 'BPS Kabupaten Aceh Timur'),
(1106, 'BPS Kabupaten Aceh Tengah'),
(1107, 'BPS Kabupaten Aceh Barat'),
(1108, 'BPS Kabupaten Aceh Besar'),
(1109, 'BPS Kabupaten Pidie'),
(1110, 'BPS Kabupaten Bireuen'),
(1111, 'BPS Kabupaten Aceh Utara'),
(1112, 'BPS Kabupaten Aceh Barat Daya'),
(1113, 'BPS Kabupaten Gayo Lues'),
(1114, 'BPS Kabupaten Aceh Tamiang'),
(1115, 'BPS Kabupaten Nagan Raya'),
(1116, 'BPS Kabupaten Aceh Jaya'),
(1117, 'BPS Kabupaten Bener Meriah'),
(1118, 'BPS Kabupaten Pidie Jaya'),
(1171, 'BPS Kota Banda Aceh'),
(1172, 'BPS Kota Sabang'),
(1173, 'BPS Kota Langsa'),
(1174, 'BPS Kota Lhokseumawe'),
(1175, 'BPS Kota Subulussalam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `id_role` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `email`, `password`, `id_role`, `created_at`, `updated_at`) VALUES
(1, 'adminprov', 'adminprov@gmail.com', 'admin123', 1, '2025-08-04 17:24:11', '2025-08-13 00:53:43'),
(2, 'adminkabkot', 'adminkabkot@gmail.com', 'kabkot123', 2, '2025-08-04 17:24:11', '2025-08-13 00:53:43'),
(3, 'operator1', 'operator1@gmail.com', 'operator123', 3, '2025-08-04 17:24:11', '2025-08-13 00:53:43'),
(4, 'pegawai1', 'pegawai1@gmail.com', 'pegawai123', 4, '2025-08-04 17:24:11', '2025-08-13 00:53:43'),
(5, 'pemeriksa1', 'pemeriksa1@gmail.com', 'pemeriksa123', 5, '2025-08-04 17:24:11', '2025-08-13 00:53:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_pengguna`
--

CREATE TABLE `profil_pengguna` (
  `id_profil` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `nama_lengkap` varchar(250) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `bidang` varchar(100) DEFAULT NULL,
  `satker` varchar(100) DEFAULT NULL,
  `tanggal_gabung` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `profil_pengguna`
--

INSERT INTO `profil_pengguna` (`id_profil`, `id_pengguna`, `nama_lengkap`, `foto_profil`, `nomor_telepon`, `jabatan`, `bidang`, `satker`, `tanggal_gabung`, `created_at`, `updated_at`) VALUES
(2, 1, 'Rian Indra Pratama', NULL, '087817956703', 'it', 'dev', '1100', '2009-01-20', '2025-08-25 15:51:40', '2025-08-27 01:04:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role_name` enum('Admin_prov','Admin_kabkot','Operator','Pegawai','Pemeriksa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `role_name`) VALUES
(1, 'Admin_prov'),
(2, 'Admin_kabkot'),
(3, 'Operator'),
(4, 'Pegawai'),
(5, 'Pemeriksa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bukti_dukung`
--
ALTER TABLE `bukti_dukung`
  ADD PRIMARY KEY (`id_pendukung`),
  ADD KEY `id_desk` (`id_desk`),
  ADD KEY `kode_satker` (`kode_satker`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `deskripsi`
--
ALTER TABLE `deskripsi`
  ADD PRIMARY KEY (`id_desk`);

--
-- Indeks untuk tabel `kode_satker`
--
ALTER TABLE `kode_satker`
  ADD PRIMARY KEY (`kode_satker`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `id_role` (`id_role`);

--
-- Indeks untuk tabel `profil_pengguna`
--
ALTER TABLE `profil_pengguna`
  ADD PRIMARY KEY (`id_profil`),
  ADD UNIQUE KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bukti_dukung`
--
ALTER TABLE `bukti_dukung`
  MODIFY `id_pendukung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT untuk tabel `deskripsi`
--
ALTER TABLE `deskripsi`
  MODIFY `id_desk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `profil_pengguna`
--
ALTER TABLE `profil_pengguna`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bukti_dukung`
--
ALTER TABLE `bukti_dukung`
  ADD CONSTRAINT `bukti_dukung_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bukti_dukung_ibfk_2` FOREIGN KEY (`kode_satker`) REFERENCES `kode_satker` (`kode_satker`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bukti_dukung_ibfk_3` FOREIGN KEY (`id_desk`) REFERENCES `deskripsi` (`id_desk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
