-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2025 pada 13.48
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
-- Database: `projekuas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(2) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `email`, `password`) VALUES
('1', 'nafla', 'nafla@gmail.com', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lab`
--

CREATE TABLE `lab` (
  `id_lab` int(2) NOT NULL,
  `nama_lab` varchar(10) NOT NULL,
  `kapasitas` varchar(2) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `username` varchar(20) NOT NULL,
  `nim` varchar(9) NOT NULL,
  `lab` varchar(20) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `bukti_pengembalian` varchar(255) NOT NULL,
  `alasan_peminjaman` varchar(100) NOT NULL,
  `alasan_lain` varchar(50) NOT NULL,
  `dosen` varchar(50) NOT NULL,
  `mk` varchar(30) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `id` int(11) NOT NULL,
  `status` enum('pending','approved','rejected','returned','verifikasi pengembalian') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`username`, `nim`, `lab`, `tanggal_pinjam`, `start_time`, `end_time`, `bukti_pengembalian`, `alasan_peminjaman`, `alasan_lain`, `dosen`, `mk`, `kelas`, `id`, `status`) VALUES
('yuuuu.li_', '531423061', 'LABORATORIUM 1', '2024-12-12', '19:40:00.000000', '19:41:00.000000', 'uploads/webcam-toy-photo10.jpg', 'Mata Kuliah', '', 'pak azhar', 'pweb', 'D', 53, 'returned'),
('diva', '531423074', 'LABORATORIUM 5', '2024-12-12', '20:04:00.000000', '20:07:00.000000', '', 'Alasan Lain', 'krja tgs', '', '', '', 57, 'rejected'),
('diva', '531423074', 'LABORATORIUM 1', '2025-02-19', '16:04:00.000000', '18:04:00.000000', 'uploads/Gambar WhatsApp 2024-12-14 pukul 11.19.47_b854906b.jpg', 'Alasan Lain', 'erfef', '', '', '', 58, 'returned');

-- --------------------------------------------------------

--
-- Struktur dari tabel `regis`
--

CREATE TABLE `regis` (
  `nim` varchar(9) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `program_studi` varchar(30) NOT NULL,
  `kontak` varchar(13) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `regis`
--

INSERT INTO `regis` (`nim`, `nama_lengkap`, `email`, `program_studi`, `kontak`, `username`, `password`) VALUES
('531412303', 'amanda', 'divafiscalia015@gmail.com', 'Pendidikan Teknologi Informasi', '082293709974', 'amanda', '567'),
('531423050', 'Afrilya Saleh', 'alya@email.com', 'Sistem Informasi', '234567', 'alyy', '123'),
('531423058', 'diaz nento', 'diaz@gmail.com', 'Sistem Informasi', '09', 'diazz', '123'),
('531423059', 'yulia rahmawaty abdul gani', 'nafla@gmail.com', 'Sistem Informasi', '0987654', 'nafla', '123'),
('531423060', 'faturrahman pohontu', 'fatur@gmail.com', 'Sistem Informasi', '0895', 'fatur', '321'),
('531423061', 'yulia rahmawaty abdul ganii', '123@gmail.com', 'sistem informasi', '1219201', 'yuuuu.li_', '123'),
('531423074', 'diva', 'divafiscali@gmail.com', 'Sistem Informasi', '090289732736', 'diva', '12345');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id_lab`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim` (`nim`) USING BTREE,
  ADD KEY `username` (`username`) USING BTREE,
  ADD KEY `lab` (`lab`) USING BTREE;

--
-- Indeks untuk tabel `regis`
--
ALTER TABLE `regis`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `regis` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`username`) REFERENCES `regis` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
