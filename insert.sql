-- isi tabel statis

-- tabel inm_akun_bank
-- id
-- nama_bank (varchar 30)
-- no_rekening (varchar 20)
-- nama_akun (varchar 50)
INSERT INTO `inm_akun_bank` VALUES ('1', 'MANDIRI', '1050012552489', 'PT. Interprima Nusantara Mandiri');
INSERT INTO `inm_akun_bank` VALUES ('2', 'BNI', '249745768', 'PT. Interprima Nusantara Mandiri');
INSERT INTO `inm_akun_bank` VALUES ('3', 'BRI', '005301001652308', 'PT. Interprima Nusantara Mandiri');
INSERT INTO `inm_akun_bank` VALUES ('4', 'Bukopin', '1003637022', 'PT. Interprima Nusantara Mandiri');


-- tabel inm_jenis_admin
-- kode_jenis (int 5)
-- nama_jenis (varchar 20)
INSERT INTO `inm_jenis_admin` VALUES ('1', '1', 'Superadmin');
INSERT INTO `inm_jenis_admin` VALUES ('2', '2', 'Administrator');
INSERT INTO `inm_jenis_admin` VALUES ('3', '3', 'Rekon');
INSERT INTO `inm_jenis_admin` VALUES ('4', '4', 'Helpdesk');


-- tabel inm_jenis_log
-- kode_log (int 5)
-- nama_log (varchar 20)
INSERT INTO `inm_jenis_log` VALUES ('1', '1', 'PLN postpaid');
INSERT INTO `inm_jenis_log` VALUES ('2', '2', 'PLN prepaid');
INSERT INTO `inm_jenis_log` VALUES ('3', '3', 'PLN nontaglis');
INSERT INTO `inm_jenis_log` VALUES ('4', '4', 'PDAM');
INSERT INTO `inm_jenis_log` VALUES ('5', '5', 'BPJS');


-- tabel inm_jenis_produk
-- kode_jenis (int 5)
-- nama_jenis (varchar 20)
INSERT INTO inm_jenis_produk
VALUES
('1', '1', 'PLN'),
('2', '2', 'PDAM'),
('3', '3', 'BPJS');



-- tabel inm_deposit_tiket_status
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_deposit_tiket_status` VALUES ('1', '1', 'proses');
INSERT INTO `inm_deposit_tiket_status` VALUES ('2', '2', 'sukses');


-- tabel inm_mutasi_bank_status
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_mutasi_bank_status` VALUES ('1', '1', 'proses');
INSERT INTO `inm_mutasi_bank_status` VALUES ('2', '2', 'sukses');


-- tabel inm_status_admin
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_status_admin` VALUES ('1', '0', 'unblock');
INSERT INTO `inm_status_admin` VALUES ('2', '1', 'block');


-- tabel inm_status_history
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_status_history` VALUES ('1', '1', 'waiting');
INSERT INTO `inm_status_history` VALUES ('2', '2', 'proses');
INSERT INTO `inm_status_history` VALUES ('3', '3', 'sukses');
INSERT INTO `inm_status_history` VALUES ('4', '4', 'gagal');
INSERT INTO `inm_status_history` VALUES ('5', '5', 'refund');
INSERT INTO `inm_status_history` VALUES ('6', '6', 'expired');


-- tabel inm_transaksi_detail_status
-- kode_status (int 5)
-- nama_status (varchar 20)
INSERT INTO `inm_transaksi_detail_status` VALUES ('1', '0', 'proses');
INSERT INTO `inm_transaksi_detail_status` VALUES ('2', '1', 'gagal');
INSERT INTO `inm_transaksi_detail_status` VALUES ('3', '2', 'sukses');


-- tabel inm_user_status
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_user_status` VALUES ('1', '0', 'unblock');
INSERT INTO `inm_user_status` VALUES ('2', '1', 'block');
