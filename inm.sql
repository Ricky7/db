-- DROP DATABASE `inm`;
-- CREATE DATABASE `inm` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS `inm_users`;
CREATE TABLE IF NOT EXISTS `inm_users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(20) NOT NULL,
    `nama_user` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50) DEFAULT NULL,
    `no_telp` VARCHAR(12) NOT NULL,
    `alamat` VARCHAR(100) NOT NULL,
	`group_id` VARCHAR(20) NOT NULL,
	`password` VARCHAR(300) NOT NULL,
	`ca_id` VARCHAR(10) NOT NULL,
	`level` VARCHAR(10) NOT NULL,
	`status_id` TINYINT(4) NOT NULL,
	`mac_address` VARCHAR(20) DEFAULT NULL,
	`ip_address` VARCHAR(20) DEFAULT NULL,
	`cookie` VARCHAR(50) DEFAULT NULL,
    `kabupaten` VARCHAR(20) NOT NULL,
    `provinsi` VARCHAR(20) NOT NULL,
    `token` VARCHAR(100) DEFAULT NULL,
    `tgl_create` DATETIME NOT NULL,
    `tgl_update` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`),
  CONSTRAINT `uc_users` UNIQUE (`username`,`email`),
  INDEX `nama_user` (`nama_user` ASC),
  INDEX `group_id` (`group_id` ASC),
  CONSTRAINT `fk_users_users_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `inm_users_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_users_status`;
CREATE TABLE IF NOT EXISTS `inm_users_status` (
  `id` TINYINT(4) NOT NULL,
  `nama_status` VARCHAR(10) NOT NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

INSERT INTO `inm_users_status` VALUES ('1', 'Aktif');
INSERT INTO `inm_users_status` VALUES ('2', 'Block');

DROP TABLE IF EXISTS `inm_saldo_loket`;
CREATE TABLE IF NOT EXISTS `inm_saldo_loket` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL UNIQUE,
	`jumlah_saldo` DECIMAL(19,0) NOT NULL,
	`tgl_update` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`),
  CONSTRAINT `fk_saldo_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `inm_users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_transaksi`;
CREATE TABLE IF NOT EXISTS `inm_transaksi` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
	`kode_transaksi` VARCHAR(100) NOT NULL,
	`tgl_transaksi` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`),
  INDEX `user_id` (`user_id` ASC),
  INDEX `tgl_transaksi` (`tgl_transaksi` ASC),
  CONSTRAINT `fk_transaksi_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `inm_users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_transaksi_detail`;
CREATE TABLE IF NOT EXISTS `inm_transaksi_detail` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaksi_id` BIGINT UNSIGNED NOT NULL,
	`status_id` TINYINT(4) NOT NULL,
  `id_pelanggan` VARCHAR(30) NOT NULL,
	`nama_pelanggan` VARCHAR(30) NOT NULL,
	`lembar` INT(2) NOT NULL,
	`jumlah_tagihan` DECIMAL(19,0) NOT NULL,
	`biaya_admin` INT(5) NOT NULL,
	`total_tagihan` DECIMAL(19,0) NOT NULL,
  `produk_id` INT UNSIGNED NOT NULL,
	`inm_referensi` VARCHAR(50) NOT NULL,
	`referensi_vendor` VARCHAR(50) NOT NULL,
	`terbilang` VARCHAR(50) NOT NULL,
	`print_out` TEXT NOT NULL,
	`keterangan` VARCHAR(200) NOT NULL,
	`response_message` TEXT NOT NULL,
  PRIMARY KEY `pk_`(`id`),
  INDEX `transaksi_id` (`transaksi_id` ASC),
  INDEX `produk_id` (`produk_id` ASC),
  CONSTRAINT `fk_transaksi_detail_detail_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `inm_transaksi_detail_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_transaksi_detail_status`;
CREATE TABLE IF NOT EXISTS `inm_transaksi_detail_status` (
  `id` TINYINT(4) NOT NULL,
  `nama_status` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

INSERT INTO `inm_transaksi_detail_status` VALUES ('1', 'Proses');
INSERT INTO `inm_transaksi_detail_status` VALUES ('2', 'Gagal');
INSERT INTO `inm_transaksi_detail_status` VALUES ('3', 'Sukses');

DROP TABLE IF EXISTS `inm_admin`;
CREATE TABLE IF NOT EXISTS `inm_admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_admin` VARCHAR(20) NOT NULL,
	`ca_id` VARCHAR(10) NOT NULL,
	`jenis_admin_id` TINYINT(4) NOT NULL,
	`username` VARCHAR(20) NOT NULL UNIQUE,
	`password` VARCHAR(300) NOT NULL,
	`last_ip_address` VARCHAR(20) DEFAULT NULL,
	`last_login` DATETIME DEFAULT '1000-01-01 00:00:00',
	`last_logout` DATETIME DEFAULT '1000-01-01 00:00:00',
	`last_update` DATETIME DEFAULT '1000-01-01 00:00:00',
	`mac_address` VARCHAR(30) DEFAULT NULL,
	`tgl_create` DATETIME DEFAULT NULL,
	`status_id` TINYINT(4) NOT NULL,
  PRIMARY KEY `pk_`(`id`),
  INDEX `jenis_admin_id` (`jenis_admin_id` ASC),
  CONSTRAINT `fk_admin_jenis_admin`
    FOREIGN KEY (`jenis_admin_id`)
    REFERENCES `inm_jenis_admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_status_admin`
    FOREIGN KEY (`status_id`)
    REFERENCES `inm_status_admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO `inm_admin` VALUES ('1', 'TesDev', 'inm101', '1', 'admin', '$2y$10$tAg3ev/0p3PBf24f0sJy8OT2mKJPP/GgY7kCPKueHmdoruwjDI3zK', '', NULL, NULL, NULL, '', CURDATE(), '1');

DROP TABLE IF EXISTS `inm_jenis_admin`;
CREATE TABLE IF NOT EXISTS `inm_jenis_admin` (
  `id` TINYINT(4) NOT NULL,
  `nama_jenis` VARCHAR(20),
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

INSERT INTO `inm_jenis_admin` VALUES ('1', 'Superadmin');
INSERT INTO `inm_jenis_admin` VALUES ('2', 'Administrator');
INSERT INTO `inm_jenis_admin` VALUES ('3', 'Rekon');
INSERT INTO `inm_jenis_admin` VALUES ('4', 'Helpdesk');

DROP TABLE IF EXISTS `inm_status_admin`;
CREATE TABLE IF NOT EXISTS `inm_status_admin` (
  `id` TINYINT(4) NOT NULL,
  `nama_status` VARCHAR(10),
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

INSERT INTO `inm_status_admin` VALUES ('1', 'Aktif');
INSERT INTO `inm_status_admin` VALUES ('2', 'Block');

DROP TABLE IF EXISTS `inm_produk`;
CREATE TABLE IF NOT EXISTS `inm_produk` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `jenis_produk_id` TINYINT(4) NOT NULL,
  `vendor_id` INT UNSIGNED NOT NULL,
	`nama_singkat` VARCHAR(10) NOT NULL,
	`nama_lengkap` VARCHAR(20) NOT NULL,
	`kode_produk` INT(5) NOT NULL,
  `kode_produk_vendor` VARCHAR(10) NOT NULL,
  `keterangan` VARCHAR(30) DEFAULT NULL,
  `status_id` TINYINT(4) NOT NULL,
  PRIMARY KEY `pk_`(`id`),
  INDEX `jenis_produk_id` (`jenis_produk_id` ASC),
  INDEX `vendor_id` (`vendor_id` ASC),
  INDEX `kode_produk` (`kode_produk` ASC),
  CONSTRAINT `fk_produk_jenis_produk`
    FOREIGN KEY (`jenis_produk_id`)
    REFERENCES `inm_jenis_produk` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produk_status_produk`
    FOREIGN KEY (`status_id`)
    REFERENCES `inm_status_produk` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produk_vendor`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `inm_vendor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_jenis_produk`;
CREATE TABLE IF NOT EXISTS `inm_jenis_produk` (
  `id` TINYINT(4) NOT NULL,
  `nama_jenis` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

INSERT INTO inm_jenis_produk
VALUES
('1', 'PLN'),
('2', 'PDAM'),
('3', 'BPJS');

DROP TABLE IF EXISTS `inm_status_produk`;
CREATE TABLE IF NOT EXISTS `inm_status_produk` (
  `id` TINYINT(4) NOT NULL,
  `nama_status` VARCHAR(20) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

INSERT INTO `inm_status_produk` VALUES ('1', 'Aktif');
INSERT INTO `inm_status_produk` VALUES ('2', 'Block');

DROP TABLE IF EXISTS `inm_vendor`;
CREATE TABLE IF NOT EXISTS `inm_vendor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_vendor` VARCHAR(10) NOT NULL,
	`kode_vendor` INT(5) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_akun_bank`;
CREATE TABLE IF NOT EXISTS `inm_akun_bank` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_bank` VARCHAR(30) NOT NULL,
  `no_rekening` VARCHAR(20) NOT NULL,
  `nama_akun` VARCHAR(50) NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `inm_log_types`;
CREATE TABLE IF NOT EXISTS `inm_log_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_log` VARCHAR(30) NOT NULL,
  `tgl_create` DATETIME NOT NULL,
  PRIMARY KEY `pk_`(`id`)
) ENGINE = InnoDB;

INSERT INTO `inm_log_types` VALUES ('1', 'Deposit', CURDATE());
INSERT INTO `inm_log_types` VALUES ('2', 'User Disabled By Admin', CURDATE());
INSERT INTO `inm_log_types` VALUES ('3', 'User Enabled By Admin', CURDATE());
INSERT INTO `inm_log_types` VALUES ('4', 'Mac Address Reset', CURDATE());
INSERT INTO `inm_log_types` VALUES ('5', 'Password Reset', CURDATE());
INSERT INTO `inm_log_types` VALUES ('6', 'Password Changed', CURDATE());
INSERT INTO `inm_log_types` VALUES ('7', 'Account Created', CURDATE());

DROP TABLE IF EXISTS `inm_log_activities`;
CREATE TABLE IF NOT EXISTS `inm_log_activities` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_type_id` INT UNSIGNED DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `json_value` TEXT COLLATE utf8_unicode_ci,
  `tgl_create` DATETIME DEFAULT NULL,
  `ip` VARCHAR(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY `pk_`(`id`),
  INDEX `log_type_id` (`log_type_id` ASC),
  INDEX `tgl_create` (`tgl_create` ASC),
  CONSTRAINT `fk_activities_types`
    FOREIGN KEY (`log_type_id`)
    REFERENCES `inm_log_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- =========================================================================================================================

-- DROP TABLE IF EXISTS `inm_history_saldo`;
-- CREATE TABLE IF NOT EXISTS `inm_history_saldo` (
--   `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
--   `user_id` BIGINT UNSIGNED NOT NULL,
-- 	`status_id` TINYINT(4) NOT NULL,
-- 	`jenis_transaksi` VARCHAR(30) NOT NULL,
-- 	`jumlah_transaksi` DECIMAL(19,0) NOT NULL,
-- 	`tgl_create` DATETIME NOT NULL,
--   PRIMARY KEY `pk_`(`id`)
-- ) ENGINE = InnoDB;
--
-- DROP TABLE IF EXISTS `inm_status_history`;
-- CREATE TABLE IF NOT EXISTS `inm_status_history` (
--   `id` TINYINT(4) NOT NULL,
--   `kode_status` INT(5) NOT NULL,
--   `nama_status` VARCHAR(10) NOT NULL,
--   PRIMARY KEY `pk_`(`id`)
-- ) ENGINE = InnoDB;




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
  `raw` VARCHAR(500) NOT NULL UNIQUE,
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
