-- DROP DATABASE `inm`;
-- CREATE DATABASE `inm` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS `inm_user`;
CREATE TABLE `inm_user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`payment_point_id` VARCHAR(20) NOT NULL UNIQUE,
	`group_id` VARCHAR(20) NOT NULL,
	`password` VARCHAR(20) NOT NULL,
	`ca_id` VARCHAR(10) NOT NULL,
	`level` VARCHAR(10) NOT NULL,
	`status_id` INT(2) NOT NULL,
	`mac_address` VARCHAR(30) DEFAULT NULL,
	`nama_user` VARCHAR(20) NOT NULL,
	`ip_address` VARCHAR(20) DEFAULT NULL,
	`cookie` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_user_status`;
CREATE TABLE IF NOT EXISTS `inm_user_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(10) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_admin`;
CREATE TABLE IF NOT EXISTS `inm_admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_admin` VARCHAR(20) NOT NULL,
	`payment_point_id` VARCHAR(20) NOT NULL UNIQUE,
	`ca_id` VARCHAR(10) NOT NULL,
	`jenis_admin_id` INT UNSIGNED NOT NULL,
	`username` VARCHAR(20) NOT NULL UNIQUE,
	`password` VARCHAR(150) NOT NULL,
	`last_ip_address` VARCHAR(20) DEFAULT NULL,
	`last_login` DATETIME DEFAULT '1000-01-01 00:00:00',
	`last_logout` DATETIME DEFAULT '1000-01-01 00:00:00',
	`last_update` DATETIME DEFAULT '1000-01-01 00:00:00',
	`mac_address` VARCHAR(30) DEFAULT NULL,
	`tgl_create` DATETIME DEFAULT NULL,
	`status_id` INT(2),
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_jenis_admin`;
CREATE TABLE IF NOT EXISTS `inm_jenis_admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_jenis` INT(5) NOT NULL,
  `nama_jenis` VARCHAR(20),
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_jenis_admin_detail`;
CREATE TABLE IF NOT EXISTS `inm_jenis_admin_detail` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `jenis_id` INT UNSIGNED NOT NULL,
  `fungsi_admin_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_status_admin`;
CREATE TABLE IF NOT EXISTS `inm_status_admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(10),
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_produk`;
CREATE TABLE IF NOT EXISTS `inm_produk` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `jenis_produk_id` INT UNSIGNED NOT NULL,
	`nama_singkat` VARCHAR(10) NOT NULL,
	`nama_lengkap` VARCHAR(20) NOT NULL,
	`kode_produk` INT(5) NOT NULL,
	`vendor` VARCHAR(10) NOT NULL,
	`kode_vendor` INT(5) NOT NULL,
	`kode_produk_vendor` VARCHAR(10) NOT NULL,
    `keterangan` VARCHAR(30) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_jenis_produk`;
CREATE TABLE IF NOT EXISTS `inm_jenis_produk` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_jenis` INT(5) NOT NULL,
  `nama_jenis` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_saldo_loket`;
CREATE TABLE IF NOT EXISTS `inm_saldo_loket` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
	`jumlah_saldo` DECIMAL(19,0) NOT NULL,
	`tgl_update` DATETIME,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_history_saldo`;
CREATE TABLE IF NOT EXISTS `inm_history_saldo` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
	`status_id` INT(2) NOT NULL,
	`jenis_transaksi` VARCHAR(30) NOT NULL,
	`jumlah_transaksi` DECIMAL(19,0) NOT NULL,
	`tgl_create` DATETIME NOT NULL,
	`tgl_update` DATETIME,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_status_history`;
CREATE TABLE IF NOT EXISTS `inm_status_history` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(10) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_transaksi`;
CREATE TABLE IF NOT EXISTS `inm_transaksi` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
	`kode_transaksi` VARCHAR(100) NOT NULL,
	`tgl_transaksi` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_transaksi_detail`;
CREATE TABLE IF NOT EXISTS `inm_transaksi_detail` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaksi_id` BIGINT UNSIGNED NOT NULL,
	`status_id` INT(2) NOT NULL,
	`nama_pelanggan` VARCHAR(30) NOT NULL,
	`lembar` INT(2) NOT NULL,
	`jumlah_tagihan` DECIMAL(19,0) NOT NULL,
	`biaya_admin` INT(5) NOT NULL,
	`total_tagihan` DECIMAL(19,0) NOT NULL,
	`jenis_transkasi` VARCHAR(20) NOT NULL,
	`inf_referensi` VARCHAR(50) NOT NULL,
	`referensi_number` VARCHAR(50) NOT NULL,
	`terbilang` VARCHAR(30) NOT NULL,
	`kode_cetak` VARCHAR(20),
	`kode_supplier` VARCHAR(20) NOT NULL,
	`print_out` TEXT NOT NULL,
	`keterangan` VARCHAR(200) NOT NULL,
	`response` TEXT NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_transaksi_detail_status`;
CREATE TABLE IF NOT EXISTS `inm_transaksi_detail_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_akun_bank`;
CREATE TABLE IF NOT EXISTS `inm_akun_bank` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_bank` VARCHAR(30) NOT NULL,
  `no_rekening` VARCHAR(20) NOT NULL,
  `nama_akun` VARCHAR(50) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_deposit_langsung`;
CREATE TABLE IF NOT EXISTS `inm_deposit_langsung` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `tgl_setor` DATE NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  `nominal` DECIMAL(19,0) NOT NULL,
  `keterangan` VARCHAR(50),
  `admin_id` INT NOT NULL,
  `bukti_bayar` VARCHAR(30) NOT NULL,
  `status_id` INT(2) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_deposit_tiket`;
CREATE TABLE IF NOT EXISTS `inm_deposit_tiket` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `ca_id` VARCHAR(10) NOT NULL,
  `tgl_setor` DATETIME NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  `metode_bayar` VARCHAR(10) NOT NULL,
  `akun_bank_id` INT(2) NOT NULL,
  `keterangan` VARCHAR(100),
  `nominal` DECIMAL(19,0) NOT NULL,
  `status_id` INT(2) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_deposit_tiket_status`;
CREATE TABLE IF NOT EXISTS `inm_deposit_tiket_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(10) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_deposit_langsung_status`;
CREATE TABLE IF NOT EXISTS `inm_deposit_langsung_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(10) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_mutasi_bank`;
CREATE TABLE IF NOT EXISTS `inm_mutasi_bank` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `raw` VARCHAR(50) NOT NULL,
  `nama_bank` VARCHAR(10) NOT NULL,
  `no_rekening` VARCHAR(20) NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  `tgl_transfer` DATE NOT NULL,
  `waktu_transfer` TIME NOT NULL,
  `keterangan` VARCHAR(100),
  `debit` DECIMAL(19,0),
  `kredit` DECIMAL(19,0),
  `status_id` INT(5) NOT NULL,
  `ca_id` VARCHAR(10) NOT NULL,
  `admin_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_mutasi_bank_status`;
CREATE TABLE IF NOT EXISTS `inm_mutasi_bank_status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_status` INT(5) NOT NULL,
  `nama_status` VARCHAR(10),
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_pinjaman`;
CREATE TABLE IF NOT EXISTS `inm_pinjaman` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `limit_pinjaman` DECIMAL(19,0) NOT NULL,
  `admin_id` INT UNSIGNED NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_kolektif`;
CREATE TABLE IF NOT EXISTS `inm_kolektif` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` BIGINT UNSIGNED NOT NULL,
  `nama_kolektif` VARCHAR(30) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_kolektif_detail`;
CREATE TABLE IF NOT EXISTS `inm_kolektif_detail` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_kolektif` INT UNSIGNED NOT NULL,
  `no_pelanggan` VARCHAR(30) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_global_kolektif`;
CREATE TABLE IF NOT EXISTS `inm_global_kolektif` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `no_hp` VARCHAR(15) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_global_kolektif_detail`;
CREATE TABLE IF NOT EXISTS `inm_global_kolektif_detail` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_global_kolektif` BIGINT UNSIGNED NOT NULL,
  `no_pelanggan` VARCHAR(30) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_log_transaksi`;
CREATE TABLE IF NOT EXISTS `inm_log_transaksi` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `jenis_log` INT(2) NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `response_message` TEXT NOT NULL,
  `response_json` TEXT NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

-- DROP TABLE IF EXISTS `inm_log_transaksi_status`;
-- CREATE TABLE `inm_log_transaksi_status` (
--   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
--   `id_log_transaksi` BIGINT UNSIGNED NOT NULL,
--   `pesan` VARCHAR(100) NOT NULL,
--   `tipe` VARCHAR(20) NOT NULL,
--   `tgl_create` DATETIME NOT NULL,
--   `no_pelanggan` VARCHAR(30) NOT NULL,
--   PRIMARY KEY `pk_`(`id`)
-- ) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_jenis_log`;
CREATE TABLE `inm_jenis_log` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_log` INT(5) NOT NULL,
  `nama_log` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_admin_fee`;
CREATE TABLE `inm_admin_fee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_produk` INT(5) NOT NULL,
  `nominal` DECIMAL(19,0) NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_fee`;
CREATE TABLE `inm_fee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `min_range` CHAR(5) DEFAULT NULL,
  `max_range` CHAR(5) DEFAULT NULL,
  `nominal` DECIMAL(19,0) NOT NULL,
  `jenis_fee` INT(2) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_jenis_fee`;
CREATE TABLE `inm_jenis_fee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_jenis` INT(5) NOT NULL,
  `nama_jenis` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;
