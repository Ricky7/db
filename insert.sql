-- isi tabel statis

-- tabel inm_akun_bank
-- id
-- nama_bank (varchar 30)
-- no_rekening (varchar 20)
-- nama_akun (varchar 50)
INSERT INTO `inm_akun_bank` VALUES ('1', 'MANDIRI', '1050010084907', 'PT. Interprima Nusantara Mandiri');
INSERT INTO `inm_akun_bank` VALUES ('2', 'BNI', '0249745768', 'PT. Interprima Nusantara Mandiri');
INSERT INTO `inm_akun_bank` VALUES ('3', 'BRI', '005301001652308', 'PT. Interprima Nusantara Mandiri');
INSERT INTO `inm_akun_bank` VALUES ('4', 'Bukopin', '1003637022', 'PT. Interprima Nusantara Mandiri');


-- tabel inm_jenis_admin
-- id
-- kode_jenis (int 5)
-- nama_jenis (varchar 20)
INSERT INTO `inm_jenis_admin` VALUES ('1', '1', 'Superadmin');
INSERT INTO `inm_jenis_admin` VALUES ('2', '2', 'Administrator');
INSERT INTO `inm_jenis_admin` VALUES ('3', '3', 'Rekon');
INSERT INTO `inm_jenis_admin` VALUES ('4', '4', 'Helpdesk');


-- tabel inm_jenis_log
-- id
-- kode_log (int 5)
-- nama_log (varchar 20)
INSERT INTO `inm_jenis_log` VALUES ('1', '1', 'PLN postpaid');
INSERT INTO `inm_jenis_log` VALUES ('2', '2', 'PLN prepaid');
INSERT INTO `inm_jenis_log` VALUES ('3', '3', 'PLN nontaglis');
INSERT INTO `inm_jenis_log` VALUES ('4', '4', 'PDAM');
INSERT INTO `inm_jenis_log` VALUES ('5', '5', 'BPJS');


-- tabel inm_jenis_produk
-- id
-- kode_jenis (int 5)
-- nama_jenis (varchar 20)
INSERT INTO inm_jenis_produk
VALUES
('1', '1', 'PLN'),
('2', '2', 'PDAM'),
('3', '3', 'BPJS');


-- tabel inm_deposit_tiket_status
-- id
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_deposit_tiket_status` VALUES ('1', '1', 'proses');
INSERT INTO `inm_deposit_tiket_status` VALUES ('2', '2', 'sukses');


-- tabel inm_deposit_langsung_status
-- id
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_deposit_langsung_status` VALUES ('1', '1', 'proses');
INSERT INTO `inm_deposit_langsung_status` VALUES ('2', '2', 'sukses');


-- tabel inm_mutasi_bank_status
-- id
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_mutasi_bank_status` VALUES ('1', '1', 'proses');
INSERT INTO `inm_mutasi_bank_status` VALUES ('2', '2', 'sukses');


-- tabel inm_status_admin
-- id
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_status_admin` VALUES ('1', 'Aktif');
INSERT INTO `inm_status_admin` VALUES ('2', 'Block');


-- tabel inm_status_history
-- id
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_status_history` VALUES ('1', '1', 'waiting');
INSERT INTO `inm_status_history` VALUES ('2', '2', 'proses');
INSERT INTO `inm_status_history` VALUES ('3', '3', 'sukses');
INSERT INTO `inm_status_history` VALUES ('4', '4', 'gagal');
INSERT INTO `inm_status_history` VALUES ('5', '5', 'refund');
INSERT INTO `inm_status_history` VALUES ('6', '6', 'expired');


-- tabel inm_transaksi_detail_status
-- id
-- kode_status (int 5)
-- nama_status (varchar 20)
INSERT INTO `inm_transaksi_detail_status` VALUES ('1', 'proses');
INSERT INTO `inm_transaksi_detail_status` VALUES ('2', 'gagal');
INSERT INTO `inm_transaksi_detail_status` VALUES ('3', 'sukses');


-- tabel inm_user_status
-- id
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_users_status` VALUES ('1', 'Aktif');
INSERT INTO `inm_users_status` VALUES ('2', 'Block');


-- tabel inm_admin
INSERT INTO `inm_admin` VALUES ('1', 'TesDev', '100tesdev001', 'inm101', '1', 'tesdev', '$2y$10$tAg3ev/0p3PBf24f0sJy8OT2mKJPP/GgY7kCPKueHmdoruwjDI3zK', '', NULL, NULL, NULL, '', CURDATE(), '0');

-- tabel inm_jenis_fee
INSERT INTO `inm_jenis_fee` VALUES ('1', '1', 'PLN');
INSERT INTO `inm_jenis_fee` VALUES ('2', '2', 'PLN Nontaglis');
INSERT INTO `inm_jenis_fee` VALUES ('3', '3', 'PDAM');
INSERT INTO `inm_jenis_fee` VALUES ('4', '4', 'TELKOM');
INSERT INTO `inm_jenis_fee` VALUES ('5', '5', 'TELKOMSEL');
INSERT INTO `inm_jenis_fee` VALUES ('6', '6', 'FINANCE');
INSERT INTO `inm_jenis_fee` VALUES ('7', '7', 'KERETA API');
INSERT INTO `inm_jenis_fee` VALUES ('8', '8', 'TIKET PESAWAT');
INSERT INTO `inm_jenis_fee` VALUES ('9', '9', 'AORA TV');
INSERT INTO `inm_jenis_fee` VALUES ('10', '10', 'ORANGE TV');
INSERT INTO `inm_jenis_fee` VALUES ('11', '11', 'GENFLIX');
INSERT INTO `inm_jenis_fee` VALUES ('12', '12', 'INDOVISION');
INSERT INTO `inm_jenis_fee` VALUES ('13', '13', 'BPJS Kesehatan');

-- tabel admin-fee
INSERT INTO 'inm_admin_fee' VALUES  ('1', '', '2500', CURDATE());


ALTER TABLE `inm_users`
  MODIFY `nama_user` VARCHAR(30) DEFAULT NULL,
  MODIFY `no_telp` VARCHAR(12) DEFAULT NULL,
  MODIFY `alamat` VARCHAR(100) DEFAULT NULL,
  MODIFY `password` VARCHAR(300) DEFAULT NULL,
  MODIFY `kabupaten` VARCHAR(20) DEFAULT NULL,
  MODIFY `provinsi` VARCHAR(20) DEFAULT NULL;
