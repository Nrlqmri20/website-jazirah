-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Agu 2025 pada 03.10
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
  `link` text NOT NULL,
  `keterangan` text NOT NULL,
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
(7, 4, 1101, 1, 'https://contoh.com/bukti1.pdf', '', 'Subbagian Umum', '2025-10', 100, '2025-08-07 03:30:45', '2025-08-13 14:36:34', 'pending'),
(8, 5, 1100, 1, 'https://contoh.com/bukti2', '', 'Budi', '2026-02', 70, '2025-08-09 17:45:52', '2025-08-09 17:45:52', 'pending'),
(9, 6, 1101, 1, 'https://contoh.com/bukti3', '', 'Sinta', '2026-03', 40, '2025-08-09 17:47:37', '2025-08-09 17:47:37', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `deskripsi`
--

CREATE TABLE `deskripsi` (
  `id_desk` int(11) NOT NULL,
  `id_deskripsi` varchar(100) NOT NULL,
  `sub_deskripsi` varchar(100) NOT NULL,
  `deskripsi_rencana_kinerja` text NOT NULL,
  `deskripsi_rencana_aksi` text NOT NULL,
  `deskripsi_rencana_output` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `deskripsi`
--

INSERT INTO `deskripsi` (`id_desk`, `id_deskripsi`, `sub_deskripsi`, `deskripsi_rencana_kinerja`, `deskripsi_rencana_aksi`, `deskripsi_rencana_output`, `created_at`, `updated_at`) VALUES
(4, 'A.1.I.i', 'a', 'tes 123', 'apakah berhasil ?', 'yes', '2025-08-07 03:30:45', '2025-08-08 15:38:59'),
(5, 'A.1.I.i', 'b', 'Penguatan Manajemen Perubahan', 'Sosialisasi program kerja', 'Laporan sosialisasi', '2025-08-09 17:45:52', '2025-08-09 17:45:52'),
(6, 'B.2.II.ii', 'a', 'Peningkatan Kualitas Layanan', 'Pelatihan pelayanan prima', 'Sertifikat peserta', '2025-08-09 17:47:37', '2025-08-09 17:47:37');

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
  MODIFY `id_pendukung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `deskripsi`
--
ALTER TABLE `deskripsi`
  MODIFY `id_desk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
