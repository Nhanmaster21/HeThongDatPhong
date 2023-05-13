use master
go
-- Delete DB
--IF db_id('HT_QuanLyKhachSan') is not null
	drop database HT_QuanLyKhachSan
go
-- Create DB
create database HT_QuanLyKhachSan
go
use HT_QuanLyKhachSan
go

-- Create Table and Primary Key
create table KhachHang
(
	MaKH char(6),
	HoTen nvarchar(30),
	SDT char(10),
	Fax char(10),
	Email nvarchar(30),
	Sodu int,
	primary key (MaKH)
)

create table KhachDatPhong
(
	MaDatPhong char(6),
	MaKH char(6),
	LoaiPhong int,
	SoDemLuuTru int,
	DatCoc int,
	YeuCauRieng nvarchar(40),
	primary key (MaDatPhong, MaKH)
)

create table KhachSuDungDichVu
(
	MaDichVu char(6),
	MaKH char(6),
	NgaySuDung date,
	primary key (MaDichVu, MaKH)
)

create table KhachSuDungTour
(
	MaTour char(6),
	MaKH char(6),
	ThoiGianKhoiHanh date,
	primary key (MaTour, MaKH)
)

create table DoanKhach
(
	MaDoan char(6),
	TenDoan nvarchar(20),
	TenNguoiDaiDien nvarchar(30),
	SDT char(10),
	SoLuong int,
	primary key (MaDoan)
)

create table DoanDatPhong
(
	MaDatPhong char(6),
	MaDoan char(6),
	SoDemLuuTru int,
	DatCoc int,
	YeuCauRieng nvarchar(40),
	primary key (MaDatPhong, MaDoan)
)

create table DoanSuDungDichVu
(
	MaDichVu char(6),
	MaDoan char(6),
	NgaySuDung date,
	primary key (MaDichVu, MaDoan)
)

create table DoanSuDungTour
(
	MaTour char(6),
	MaDoan char(6),
	ThoiGianKhoiHanh date,
	primary key (MaTour, MaDoan)
)

create table CheckIn
(
	MaDatPhong char(6),
	NgayCheckIn date,
    TinhTrangThanhToan nvarchar(30),
	HinhThucThanhToan nvarchar(15),
	TongTien int,
	primary key (MaDatPhong)
)

create table DichVu
(
	MaDichVu char(6),
	LoaiDichVu int,
	SoLuong int,
	GiaTien int,
	primary key (MaDichVu)
)

create table TourLuHanh 
(
	MaTour char(6),
	MaDoiTac char(6),
	ThongTin nvarchar(30),
	Loai int,
	primary key (MaTour)
)


create table  Room
(
    MaDatPhong nvarchar(10),
	NgayCheckIn nvarchar(30),
	NgayCheckOut  nvarchar(30),
	GiaTien int,
	TinhTrangPhong nvarchar(10),
	primary key (MaDatPhong)

)

-- Foreign Key
alter table KhachDatPhong
add constraint FK_KhachDatPhong_KhachHang
foreign key (MaKH)
references KhachHang

alter table DoanDatPhong
add constraint FK_DoanDatPhong_KhachHang
foreign key (MaDoan)
references DoanKhach

alter table KhachDatPhong
add constraint FK_KhachDatPhong_CheckIn
foreign key (MaDatPhong)
references CheckIn

alter table DoanDatPhong
add constraint FK_DoanDatPhong_CheckIn
foreign key (MaDatPhong)
references CheckIn

alter table KhachSuDungDichVu
add constraint FK_KhachSuDungDichVu_KhachHang
foreign key (MaKH)
references KhachHang

alter table KhachSuDungDichVu
add constraint FK_KhachSuDungDichVu_DichVu
foreign key (MaDichVu)
references DichVu

alter table KhachSuDungTour
add constraint FK_KhachSuDungTour_KhachHang
foreign key (MaKH)
references KhachHang

alter table KhachSuDungTour
add constraint FK_KhachSuDungTour_TourLuHanh
foreign key (MaTour)
references TourLuHanh

alter table DoanSuDungDichVu
add constraint FK_DoanSuDungDichVu_DoanKhach
foreign key (MaDoan)
references DoanKhach

alter table DoanSuDungDichVu
add constraint FK_DoanSuDungDichVu_DichVu
foreign key (MaDichVu)
references DichVu

alter table DoanSuDungTour
add constraint FK_DoanSuDungTour_DoanKhach
foreign key (MaDoan)
references DoanKhach

alter table DoanSuDungTour
add constraint FK_DoanSuDungTour_TourLuHanh
foreign key (MaTour)
references TourLuHanh

INSERT INTO KhachHang (MaKH, HoTen, SDT, Fax, Email, SoDu) VALUES
	('KH001', N'Nguyễn Văn An', '0987654321', '0937458612', 'nguyenvanan12@gmail.com',10000000),
	('KH002', N'Phan Ngọc Thanh Bình', '0912345678', '0987654321', 'phamngthb@gmail.com',10000000),
	('KH003', N'Trần Văn Cường', '0978123456', '0912659545', 'trvc@gmail.com',10000000),
	('KH004', N'Nguyễn Thị Diễm', '0912345678', '0987213426', 'ngthdiem@gmail.com',10000000),
	('KH005', N'Nguyễn Trọng Hiếu', '0987654321', '0918765432', 'hieuvguyen@gmail.com',10000000),
	('KH006', N'Nguyễn Thị Yến Nhi', '0938147562', '0982345167', 'nhi236@gmail.com',10000000),
	('KH007', N'Nguyễn Đỗ Tố Trinh', '0942768351', '0975316428', 'trinhgw@gmail.com',10000000),
	('KH008', N'Huỳnh Thị Hoàng Thanh', '0987256341', '0965428137', 'hoangthanh@gmail.com',10000000),
	('KH009', N'Đinh Thị Kim Ngân', '0975314628', '0942187365', 'kimngan9999@gmail.com',10000000),
	('KH010', N'Phạm Tử Thiên Tôn', '0963472581', '0956873412', 'phamtuton@gmail.com',10000000),
	('KH011', N'Nguyễn Duy Tân', '0987631452', '0987653121', 'tan8999@gmail.com',10000000),
	('KH012', N'Trần Gia Hân', '0928315746', '0912345578', 'hangiatran@gmail.com',10000000),
	('KH013', N'Trần Hoàng Sang', '0956182437', '0128966651', 'sangTH@gmail.com',10000000),
	('KH014', N'La Trọng Nghĩa', '0915647328', '0920961271', 'nghiaLT1@gmail.com',10000000),
	('KH015', N'Lê Huỳnh Nhật Anh', '0984163527', '0955790338', 'anhLE99@gmail.com',10000000),
	('KH016', N'Lê Nhật Tiến', '0935276814', '0838864073', 'tienNhatle@gmail.com',10000000),
	('KH017', N'Lê Văn Danh', '0978162345', '0987884201', 'Levandanh@gmail.com',10000000),
	('KH018', N'Nguyễn Thành Luân', '0942687531', '0347811686', 'luanNguyenedu@gmail.com',10000000),
	('KH019', N'Nguyễn Thị Thùy Dương', '0957134826', '0696512880', 'Thuyduong12@gmail.com',10000000),
	('KH020', N'Đặng Minh Hoàng', '0967594699', '0198972585', 'hoangDang@gmail.com',10000000)

INSERT INTO CheckIn (MaDatPhong, NgayCheckIn,TinhTrangThanhToan, HinhThucThanhToan, TongTien) VALUES 
	('STD001', '2023-05-01',N'Đã thanh toán', N'tiền mặt', 223000),
	('SUP002', '2023-01-15',N'Chưa thanh toán', N'tiền mặt', 315000),
	('DLX003', '2023-03-16',N'Đã thanh toán', N'tiền mặt', 463000),
	('SUT004', '2022-11-04',N'Chưa thanh toán', N'thẻ tín dụng', 550000),
	('SGL005', '2023-04-20',N'Đã thanh toán', N'tiền mặt', 202000),
	('TWN006', '2023-04-22',N'Chưa thanh toán', N'thẻ tín dụng', 710000),
	('DBL007', '2023-09-07',N'Đã thanh toán', N'tiền mặt', 820200),
	('SUP008', '2023-02-08',N'Chưa thanh toán', N'thẻ tín dụng', 906000),
	('SUT009', '2023-04-09',N'Đã thanh toán', N'tiền mặt', 1001100),
	('STD010', '2023-06-10',N'Chưa thanh toán', N'thẻ tín dụng', 1102000),
	('DLX011', '2023-07-11',N'Đã thanh toán', N'tiền mặt', 1201000),
	('SGL012', '2023-06-12',N'Chưa thanh toán', N'tiền mặt', 1365000),
	('DBL013', '2023-04-13',N'Đã thanh toán', N'tiền mặt', 1998000),
	('SUT014', '2023-02-14',N'Chưa thanh toán', N'thẻ tín dụng', 1234000),
	('SUP015', '2023-03-15',N'Đã thanh toán', N'tiền mặt', 1675000),
	('TWN016', '2023-09-16',N'Chưa thanh toán', N'thẻ tín dụng', 1785000),
	('STD017', '2023-02-17',N'Đã thanh toán', N'tiền mặt', 1820000),
	('SGL018', '2023-03-18',N'Chưa thanh toán', N'thẻ tín dụng', 1903000),
	('DBL019', '2023-06-19',N'Đã thanh toán', N'tiền mặt', 2010000),
	('TWN020', '2023-05-15',N'Chưa thanh toán', N'thẻ tín dụng', 1110000);

INSERT INTO DoanKhach (MaDoan, TenDoan, TenNguoiDaiDien, SDT, SoLuong) VALUES 
	('DDN', N'Đoàn Đà Nẵng', N'Nguyễn Cao Thăng', '0812384058', 20),
	('DSG', N'Đoàn Sài Gòn', N'Trần Thị Vân', '0348390176', 15),
	('DHN', N'Đoàn Hà Nội', N'Ngô Mạnh Hà', '0363001164', 30),
	('DHP', N'Đoàn Hải Phòng', N'Nguyễn Đăng Hoàng', '0856403575', 10),
	('DNT', N'Đoàn Nha Trang', N'Huỳnh Thanh Phương', '0947625569', 25),
	('DBL', N'Đoàn Bảo Lộc', N'Đinh Thị Thảo Quyên', '0957346928', 12),
	('DQN', N'Đoàn Quy Nhơn', N'Đặng Phú Quý', '0358927604', 18),
	('DTN', N'Đoàn Tây Nguyên', N'Dương Thị Mỹ Hạnh', '0914762038', 22),
	('DTG', N'Đoàn Tiền Giang', N'Phan Huỳnh Thành Trung', '0836917520', 14),
	('DBM', N'Đoàn Buôn Ma Thuột', N'Huỳnh Ngọc Kim Ngân', '0978150346', 16),
	('DHA', N'Đoàn Hà Tĩnh', N'Mạc Văn Hoàng Ân', '0568213490', 9),
	('DLH', N'Đoàn Long Hải', N'Huỳnh Trung Lãm', '0702498351', 20),
	('DDL', N'Đoàn Đà Lạt', N'Huỳnh Phúc Điền', '0623784109', 15),
	('DTT', N'Đoàn Tây Tiến', N'Đồng Thanh Tuấn', '0392764180', 28),
	('DPD', N'Đoàn Phú Đông', N'Dương Phát Đạt', '0813467925', 17),
	('DVT', N'Đoàn Vũng Tàu', N'Lê Vân Anh', '0987603541', 11),
	('DKG', N'Đoàn Kiên Giang', N'Lê Quang Khải', '0902387614', 13),
	('DHG', N'Đoàn Hà Giang', N'Trần Hoàng Minh', '0936548720', 23),
	('DPT', N'Đoàn Phan Thiết', N'Hồ Thị Mỹ Uyên', '0647925083', 19),
	('DBN', N'Đoàn Bảo Nam',N'Huỳnh Tấn Đạt', '0973121999', 10)


INSERT INTO KhachDatPhong (MaDatPhong, MaKH, LoaiPhong, SoDemLuuTru,DatCoc,YeuCauRieng) VALUES 
	('STD001', 'KH001', 1, 2, 66900,N'Ở tầng cao, có phòng hút thuốc'),
	('SUP002', 'KH002', 0, 1, 94500, N'Vận chuyển hành lý'),
	('DLX003', 'KH003', 1, 3, 138900,N'Vận chuyển hành lý'),
	('SUT004', 'KH004', 1, 2, 165000,N'Có giường đôi, có cửa sổ'),
	('SGL005', 'KH005', 0, 1, 60600, N'Vận chuyển hành lý'),
	('TWN006', 'KH006', 1, 4, 213000, N'Ở tầng cao,có giường đôi'),
	('DBL007', 'KH007', 1, 6, 246060, N'Có , Vận chuyển hành lý'),
	('SUP008', 'KH008', 1, 3, 271800, N'Ở tầng cao,Vận chuyển hành lý'),
	('SUT009', 'KH009', 0, 7, 300330, NULL),
	('STD010', 'KH010', 0, 3, 330600, N'Có cửa sổ,ở tầng cao'),
	('DLX011', 'KH011', 1, 2, 360300, N'Có cửa sổ , Vận chuyển hành lý'),
	('SGL012', 'KH012', 1, 5, 409500, NULL),
	('DBL013', 'KH013', 0, 2, 599400, N'Vận chuyển hành lý'),
	('SUT014', 'KH014', 0, 7, 700000, N'Có cửa sổ'),
	('SUP015', 'KH015', 0, 6, 502500, N' có view đẹp'),
	('TWN016', 'KH016', 1, 2, 535500, N'có giường đôi, ở tầng cao'),
	('STD017', 'KH017', 0, 3, 546000, N'Có phòng hút thuốc'),
	('SGL018', 'KH018', 1, 5, 600000, NULL),
	('DBL019', 'KH019', 0, 3, 900000, N'Vận chuyển hành lý'),
	('TWN020', 'KH020', 1, 4, 350000, N'Có giường đôi, Vận chuyển hành lý')

INSERT INTO DoanDatPhong (MaDatPhong, MaDoan, SoDemLuuTru,DatCoc,YeuCauRieng) VALUES 
	('STD001', 'DSG',3, 76900,N'Ở tầng cao, có phòng hút thuốc'),
	('SUP002', 'DHP',4, 93200, N'Phòng có ban công'),
	('DLX003', 'DHN',3, 158900,N'Vận chuyển hành lý'),
	('SUT004', 'DNT',2, 165000,N'Có đầy đủ các thiết bị , Có cửa sổ'),
	('SGL005', 'DTT',7, 59699, N'Vận chuyển hành lý'),
	('TWN006', 'DDN',4, 263150, N'Ở tầng cao,Vận chuyển hành lý'),
	('DBL007', 'DDL',5, 266666,N'Vận chuyển hành lý'),
	('SUP008', 'DLH',6, 271800, N'Ở tầng cao,Vận chuyển hành lý'),
	('SUT009', 'DVT',4, 369330, N'Có đầy đủ các thiết bị'),
	('STD010', 'DHG',3, 321600, N'Có cửa sổ, Vận chuyển hành lý'),
	('DLX011', 'DBN',2, 331360, N'Có cửa sổ , Vận chuyển hành lý'),
	('SGL012', 'DHA',2, 499550, N'Có đầy đủ các thiết bị'),
	('DBL013', 'DPT',3, 555500, N'Có đầy đủ các thiết bị'),
	('SUT014', 'DQN',6, 703960, N'Có cửa sổ , Vận chuyển hành lý'),
	('SUP015', 'DBL',3, 513500, N'Vận chuyển hành lý, Có view đẹp'),
	('TWN016', 'DPD',2, 555500, N'Ở tầng cao , Vận chuyển hành lý'),
	('STD017', 'DTG',1, 523900, N'Có đầy đủ các thiết bị'),
	('SGL018', 'DTN',5, 613500, N'Phòng có ban công'),
	('DBL019', 'DBM',3, 999990, N'Phòng có bồn tắm'),
	('TWN020', 'DKG', 4,353530, N'Phòng có view đẹp')

INSERT INTO TourLuHanh (MaTour, MaDoiTac, ThongTin, Loai) VALUES 
	('BQ001', 'JST', N'Tour Bình Quới', 1),
	('ST002', 'VJA', N'Tour Suối Tiên', 2),
	('ĐS003', 'DAH', N'Tour Đầm Sen', 1),
	('VS004', 'DSN', N'Tour Vàm Sát', 2),
	('BD005', 'HOT ',N'Tour Núi Bà Đen', 1),
	('DN006', 'HVN', N'Tour Đồng Nai', 2),
	('CG007', 'RIC', N'Tour Cần Giờ', 1),
	('CC008', 'TCT', N'Tour Củ Chi', 2),
	('SL009', 'SCS', N'Tour Đồng Bằng Sông Cửu Long', 1),
	('CB010', 'SKG ',N'Tour Cái Bè', 2),
	('BL011', 'VJC', N'Tour Bửu Long ', 2),
	('TD012', 'VNG', N'Tour Thanh Đa ', 1),
	('BC013', 'VNS', N'Tour Bình Châu', 1),
	('HT014', 'ATS', N'Tour Hồ Tràm', 2),
	('PD015', 'CTC', N'Tour Phú Điền', 2),
	('ND016', 'HHG', N'Tour Núi Dinh', 2),
	('CB017', 'KLF', N'Tour Cát Bà', 1),
	('MN018', 'MAS', N'Tour Mũi Né', 2),
	('BN019', 'PDC', N'Tour Bà Nà', 1),
	('BH020', 'PGT', N'Tour Bình Hưng', 2)

Insert into KhachSuDungTour (MaTour , MaKH , ThoiGianKhoiHanh) VALUES
	('ND016', 'KH001', '2023-04-10'),
	('ST002', 'KH002', '2023-04-03'),
	('ĐS003', 'KH003', '2023-05-02'),
	('BC013', 'KH004', '2023-04-13'),
	('TD012', 'KH005', '2023-04-05'),
	('BD005', 'KH006', '2023-02-03'),
	('TD012', 'KH007', '2023-01-05'),
	('HT014', 'KH008', '2023-07-11'),
	('SL009', 'KH009', '2023-06-04'),
	('CB010', 'KH010', '2023-01-01'),
	('PD015', 'KH011', '2023-03-22'),
	('ND016', 'KH012', '2023-04-10'),
	('ST002', 'KH013', '2023-04-03'),
	('DN006', 'KH014', '2023-05-06'),
	('CG007', 'KH015', '2023-04-16'),
	('ST002', 'KH016', '2023-04-29'),
	('CB017', 'KH017', '2023-05-16'),
	('BL011', 'KH018', '2023-04-22'),
	('VS004', 'KH019', '2023-04-15'),
	('BH020', 'KH020', '2023-04-10')

Insert into DoanSuDungTour(MaTour , MaDoan , ThoiGianKhoiHanh) VALUES
	('ND016', 'DDN', '2023-04-10'),
	('ST002', 'DSG', '2023-04-03'),
	('ĐS003', 'DHN', '2023-05-02'),
	('BC013', 'DHP', '2023-04-13'),
	('TD012', 'DNT', '2023-04-05'),
	('BD005', 'DBL', '2023-02-03'),
	('TD012', 'DQN', '2023-01-05'),
	('HT014', 'DTN', '2023-07-11'),
	('SL009', 'DTG', '2023-06-04'),
	('CB010', 'DBM', '2023-01-01'),
	('PD015', 'DHA', '2023-03-22'),
	('ND016', 'DLH', '2023-04-10'),
	('ST002', 'DDL', '2023-04-03'),
	('DN006', 'DTT', '2023-05-06'),
	('CG007', 'DPD', '2023-04-16'),
	('ST002', 'DVT', '2023-04-29'),
	('CB017', 'DKG', '2023-05-16'),
	('BL011', 'DHG', '2023-04-22'),
	('VS004', 'DPT', '2023-04-15'),
	('BH020', 'DBN', '2023-04-10')

INSERT INTO DichVu (MaDichVu, LoaiDichVu, SoLuong, GiaTien) VALUES
	('SPA', 1, 10, 2200000),
	('GYM', 2, 5, 512300),
	('BI-A', 3, 2, 886000),
	('GU', 4, 1, 1000000),
	('XEDD', 5, 3, 300000),
	('BOI', 6, 8, 120000),
	('KARA', 7, 4, 605000),
	('BAR', 8, 1, 1100000),
	('FIT', 9, 2, 1205000),
	('CSNO', 10, 5, 403000),
	('F&B', 11, 6, 85000),
	('DDP', 12, 3, 266000),
	('GTRE', 13, 1, 199999),
	('CAFE', 14, 1, 136900),
	('DT', 15, 2, 426000),
	('DVVP', 16, 5, 169800),
	('NH', 2,17, 210110),
	('BUF', 3,18, 489310),
	('DVHH', 4,19, 612350),
	('THXE', 5,20, 159630);

INSERT INTO KhachSuDungDichVu (MaDichVu ,MaKH,NgaySuDung ) VALUES
	('CAFE', 'KH001', '2023-04-10'),
	('FIT', 'KH002', '2023-04-01'),
	('THXE', 'KH003', '2023-03-04'),
	('DT', 'KH004', '2023-04-04'),
	('SPA', 'KH005', '2023-04-05'),
	('FIT', 'KH006', '2023-04-06'),
	('FIT', 'KH007', '2023-04-07'),
	('F&B', 'KH008', '2023-04-08'),
	('SPA', 'KH009', '2023-04-09'),
	('DT', 'KH010', '2023-04-10'),
	('CAFE', 'KH011', '2023-04-11'),
	('CSNO', 'KH012', '2023-04-12'),
	('CSNO', 'KH013', '2023-04-13'),
	('CSNO', 'KH014', '2023-04-14'),
	('SPA', 'KH015', '2023-04-15'),
	('DVVP', 'KH016', '2023-04-16'),
	('BAR', 'KH017', '2023-04-17'),
	('SPA', 'KH018', '2023-04-18'),
	('THXE', 'KH019', '2023-04-19'),
	('BAR', 'KH020', '2023-04-20')

 INSERT INTO DoanSuDungDichVu (MaDichVu ,MaDoan,NgaySuDung ) VALUES
	('BOI', 'DDN', '2023-04-10'),
	('KARA', 'DSG', '2023-04-01'),
	('FIT', 'DHN', '2023-03-04'),
	('BUF', 'DHP', '2023-04-04'),
	('BUF', 'DNT', '2023-04-05'),
	('SPA', 'DBL', '2023-04-06'),
	('GU', 'DTN', '2023-04-07'),
	('KARA', 'DBM', '2023-04-08'),
	('BAR', 'DTG', '2023-04-09'),
	('BOI', 'DHA', '2023-04-10'),
	('BOI', 'DTT', '2023-04-11'),
	('BAR', 'DQN', '2023-04-12'),
	('BUF', 'DVT', '2023-04-13'),
	('BUF', 'DDL', '2023-04-14'),
	('BUF', 'DKG', '2023-04-15'),
	('DVVP', 'DHG', '2023-04-16'),
	('SPA', 'DPT', '2023-04-17'),
	('DDP', 'DTT', '2023-04-18'),
	('THXE', 'DPD', '2023-04-19'),
	('CSNO', 'DBN', '2023-04-20')


	INSERT INTO Room(MaDatPhong, NgayCheckIn,NgayCheckOut,TinhTrangPhong,GiaTien) VALUES 
	('STD001','2023-04-12','2023-04-11', N'Trống', 223000),
	('SUP002','2023-04-12','2023-04-11', N'Trống', 315000),
	('DLX003','2023-04-12','2023-04-11', N'Trống', 463000),
	('SUT004','2023-04-12','2023-04-11', N'Trống', 550000),
	('SGL005','2023-04-12','2023-04-11', N'Trống', 1510000),
	('TWN006','2023-04-12','2023-04-11', N'Trống', 1810000),
	('DBL007','2023-04-12','2023-04-11', N'Trống', 8810000),
	('SUP008', '2023-04-12','2023-04-11', N'Đă đặt', 9610000),
	('SUT009', '2023-04-10','2023-05-10', N'Đã đặt', 1110000),
	('STD010', '2023-04-12','2023-04-11', N'Trống', 2110000),
	('DLX011', '2023-04-12','2023-04-11', N'Trống', 1110000),
	('SGL012', '2023-04-12','2023-04-11', N'Trống', 3510000),
	('DBL013','2023-04-12','2023-04-11', N'Trống', 223000),
	('SUT014','2023-04-12','2023-04-11', N'Trống', 315000),
	('SUP015','2023-04-12','2023-04-11', N'Trống', 463000),
	('TWN016','2023-04-12','2023-04-11', N'Trống', 550000),
	('STD017','2023-04-12','2023-04-11', N'Trống', 1510000),
	('SGL018','2023-04-12','2023-04-11', N'Trống', 1810000),
	('DBL019','2023-04-12','2023-04-11', N'Trống', 8810000),
	('TWN020', '2023-05-16','2023-04-11', N'Đă đặt', 9610000);
	