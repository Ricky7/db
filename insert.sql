-- isi tabel statis

-- tabel inm_akun_bank
-- nama_bank (varchar 30)
-- no_rekening (varchar 20)
-- nama_akun (varchar 50)
INSERT INTO `inm_akun_bank` VALUES ('', '', '');


-- tabel inm_jenis_admin
-- kode_jenis (int 5)
-- nama_jenis (varchar 20)
INSERT INTO `inm_jenis_admin` VALUES ('1', 'Superadmin');
INSERT INTO `inm_jenis_admin` VALUES ('2', 'Administrator');
INSERT INTO `inm_jenis_admin` VALUES ('3', 'Rekon');
INSERT INTO `inm_jenis_admin` VALUES ('4', 'Helpdesk');


-- tabel inm_jenis_log
-- kode_log (int 5)
-- nama_log (varchar 20)
INSERT INTO `inm_jenis_log` VALUES ('1', '');


-- tabel inm_jenis_produk
-- kode_jenis (int 5)
-- nama_jenis (varchar 20)
INSERT INTO `inm_jenis_produk` VALUES ('1', 'PLN');
INSERT INTO `inm_jenis_produk` VALUES ('2', 'PDAM');
INSERT INTO `inm_jenis_produk` VALUES ('3', 'BPJS');


-- tabel inm_deposit_tiket_status
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_deposit_tiket_status` VALUES ('1', 'proses');
INSERT INTO `inm_deposit_tiket_status` VALUES ('2', 'sukses');


-- tabel inm_mutasi_bank_status
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_mutasi_bank_status` VALUES ('1', 'proses');
INSERT INTO `inm_mutasi_bank_status` VALUES ('2', 'sukses');


-- tabel inm_status_admin
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_status_admin` VALUES ('0', 'unblock');
INSERT INTO `inm_status_admin` VALUES ('1', 'block');


-- tabel inm_status_history
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_status_history` VALUES ('1', 'waiting');
INSERT INTO `inm_status_history` VALUES ('2', 'proses');
INSERT INTO `inm_status_history` VALUES ('3', 'sukses');
INSERT INTO `inm_status_history` VALUES ('4', 'gagal');
INSERT INTO `inm_status_history` VALUES ('5', 'refund');
INSERT INTO `inm_status_history` VALUES ('6', 'expired');


-- tabel inm_transaksi_detail_status
-- kode_status (int 5)
-- nama_status (varchar 20)
INSERT INTO `inm_transaksi_detail_status` VALUES ('0', 'proses');
INSERT INTO `inm_transaksi_detail_status` VALUES ('1', 'gagal');
INSERT INTO `inm_transaksi_detail_status` VALUES ('2', 'sukses');


-- tabel inm_user_status
-- kode_status (int 5)
-- nama_status (varchar 10)
INSERT INTO `inm_user_status` VALUES ('0', 'unblock');
INSERT INTO `inm_user_status` VALUES ('1', 'block');
