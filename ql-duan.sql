USE [TASK_THUCTAP]
GO
/****** Object:  Table [dbo].[BOPHAN]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOPHAN](
	[idBoPhan] [int] IDENTITY(1,1) NOT NULL,
	[TenBP] [nvarchar](50) NULL,
 CONSTRAINT [PK_BOPHAN] PRIMARY KEY CLUSTERED 
(
	[idBoPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONGVIECTUAN]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIECTUAN](
	[idCongViecTuan] [int] IDENTITY(1,1) NOT NULL,
	[idTuan] [int] NULL,
	[idNguoiDung] [int] NULL,
	[idModule] [int] NULL,
	[TenIssue] [nvarchar](max) NULL,
	[Urllssue] [nvarchar](max) NULL,
	[TenCongViec] [nvarchar](max) NULL,
	[ThoiGianLam] [int] NULL,
	[Nguon] [nvarchar](max) NULL,
	[TrangThai] [nvarchar](max) NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_CONGVIECTUAN] PRIMARY KEY CLUSTERED 
(
	[idCongViecTuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DGNHANSUTHEOTHANG]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DGNHANSUTHEOTHANG](
	[idDanhGiaNSThang] [int] IDENTITY(1,1) NOT NULL,
	[idThang] [int] NULL,
	[idNguoiDung] [int] NULL,
	[KhoiLuong] [nvarchar](max) NULL,
	[ChatLuong] [nvarchar](max) NULL,
	[TienDo] [nvarchar](max) NULL,
	[XepLoai] [nvarchar](max) NULL,
	[NhanXetCaThang] [nvarchar](max) NULL,
	[TBThang] [int] NULL,
	[TongGio] [int] NULL,
 CONSTRAINT [PK_DGNHANSUTHEOTHANG] PRIMARY KEY CLUSTERED 
(
	[idDanhGiaNSThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DGNHANSUTHEOTUAN]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DGNHANSUTHEOTUAN](
	[idDanhGiaNSTuan] [int] IDENTITY(1,1) NOT NULL,
	[idTuan] [int] NULL,
	[idNguoiDung] [int] NULL,
	[HoanThanh] [int] NULL,
	[KhoiLuong] [nvarchar](max) NULL,
	[TienDo] [nvarchar](max) NULL,
	[ChatLuong] [nvarchar](max) NULL,
	[LoiTrongTuan] [nvarchar](max) NULL,
	[NhanXetTuan] [nvarchar](max) NULL,
 CONSTRAINT [PK_DGNHANSUTHEOTUAN] PRIMARY KEY CLUSTERED 
(
	[idDanhGiaNSTuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DUAN]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DUAN](
	[idDuAn] [int] IDENTITY(1,1) NOT NULL,
	[TenDuAn] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_DUAN] PRIMARY KEY CLUSTERED 
(
	[idDuAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DUANTHAMGIA]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DUANTHAMGIA](
	[idDuAnThamGia] [int] IDENTITY(1,1) NOT NULL,
	[idDuAn] [int] NULL,
	[idNguoiDung] [int] NULL,
	[idBoPhan] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_DUANTHAMGIA] PRIMARY KEY CLUSTERED 
(
	[idDuAnThamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODULE]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODULE](
	[idModule] [int] IDENTITY(1,1) NOT NULL,
	[TenModule] [nvarchar](max) NULL,
 CONSTRAINT [PK_MODULE] PRIMARY KEY CLUSTERED 
(
	[idModule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[idNguoiDung] [int] NOT NULL,
	[HoDemND] [nvarchar](max) NULL,
	[TenND] [nvarchar](max) NULL,
	[TenDangNhap] [varchar](max) NULL,
	[MatKhau] [varchar](100) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[idNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANGLAMVIEC]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANGLAMVIEC](
	[idThang] [int] IDENTITY(1,1) NOT NULL,
	[idDuAn] [int] NULL,
	[GiaTri] [int] NULL,
	[Nam] [int] NULL,
	[TenThang] [nvarchar](max) NULL,
	[NgayBDLam] [date] NULL,
	[NgayKTLam] [date] NULL,
 CONSTRAINT [PK_THANGLAMVIEC] PRIMARY KEY CLUSTERED 
(
	[idThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TODOLIST]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TODOLIST](
	[idToDoList] [int] IDENTITY(1,1) NOT NULL,
	[idDuAn] [int] NULL,
	[idNguoiDung] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayGiao] [date] NULL,
	[HanDen] [date] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_TODOLIST] PRIMARY KEY CLUSTERED 
(
	[idToDoList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUANLAMVIEC]    Script Date: 12/10/2021 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUANLAMVIEC](
	[idTuan] [int] IDENTITY(1,1) NOT NULL,
	[idThang] [int] NULL,
	[STTTuan] [int] NULL,
	[TenTuan] [nvarchar](max) NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[SoGioLamViec] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_TUANLAMVIEC] PRIMARY KEY CLUSTERED 
(
	[idTuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BOPHAN] ON 

INSERT [dbo].[BOPHAN] ([idBoPhan], [TenBP]) VALUES (1, N'Member')
INSERT [dbo].[BOPHAN] ([idBoPhan], [TenBP]) VALUES (2, N'Leader')
INSERT [dbo].[BOPHAN] ([idBoPhan], [TenBP]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[BOPHAN] OFF
GO
SET IDENTITY_INSERT [dbo].[CONGVIECTUAN] ON 

INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (1, 1, 1, 7, N'', N'', N'Xin nghĩ 1 Buổi', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-05' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (2, 3, 2, 7, N'SGD-288', N'', N'Test lại Phân quyền', 3, N'', N'Đã xong', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-19' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (4, 1, 1, 8, N'', N'', N'Họp công việc tuần của team', 5, N'Tạo mới', N'Đã xong', CAST(N'2021-01-06' AS Date), CAST(N'2021-01-07' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (5, 1, 1, 8, N'', N'', N'Đi gặp mặt khách hàng', 2, N'Tạo mới', N'Đã xong', CAST(N'2021-01-07' AS Date), CAST(N'2021-01-08' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (6, 2, 1, 8, N'', N'', N'Họp công việc với sếp', 10, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-12' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (7, 2, 1, 8, N'', N'', N'Họp với đối tác', 5, N'Tạo mới', N'Đã xong', CAST(N'2021-01-13' AS Date), CAST(N'2021-01-14' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (8, 2, 1, 7, N'', N'', N'Điểm danh nhân sự', 2, N'Tạo mới', N'Đã xong', CAST(N'2021-01-15' AS Date), CAST(N'2021-04-16' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (9, 3, 1, 7, N'', N'', N'Xin nghỉ', 4, N'Tạo mới', N'Vắng', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-19' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (10, 3, 1, 1, N'', N'', N'Viết thư viện', 2, N'Tạo mới', N'Chưa xong', CAST(N'2021-01-19' AS Date), CAST(N'2021-01-19' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (11, 3, 1, 1, N'', N'', N'Fix lỗi', 4, N'Tạo mới', N'Đã xong', CAST(N'2021-01-19' AS Date), CAST(N'2021-01-20' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (12, 3, 1, 8, N'', N'', N'Họp công việc tuần của team', 2, N'Tạo mới', N'Đã xong', CAST(N'2021-01-20' AS Date), CAST(N'2021-01-20' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (13, 1, 1, 8, N'', N'', N'Họp công việc tuần của team', 5, N'Tạo mới', N'Đã xong', CAST(N'2021-01-06' AS Date), CAST(N'2021-01-07' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (15, 3, 1, 1, N'', N'', N'Kiểm tra lại mọi thứ', 2, N'', N'Chưa Làm', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-18' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (16, 1, 2, 1, N'', N'', N'Kiểm tra đăng nhập', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (17, 1, 2, 1, N'', N'', N'Check phần đăng nhập', 10, N'Tạo mới', N'Đã xong (Task đột xuất)', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (18, 1, 1, 1, N'', N'', N'Kiểm tra lại toàn bộ Mầm non', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-04-02' AS Date), CAST(N'2021-04-03' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (19, 1, 2, 8, N'', N'', N'Họp ', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (20, 1, 1, 2, N'', N'', N'Check lại Tuần làm việc', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-04-02' AS Date), CAST(N'2021-04-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (21, 2, 1, 2, N'', N'', N'Check Đăng nhập', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (22, 2, 2, 1, N'', N'', N'Ok oke', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (23, 5, 1, 1, N'', N'', N'Check lại', 2, N'Tạo mới', N'Đã xong', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (24, 5, 1, 1, N'', N'', N'Check', 3, N'Tạo mới', N'Chưa Làm', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (35, 1, 3, 1, N'', N'', N'', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-01' AS Date), CAST(N'2021-01-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (42, 5, 2, 1, N'', N'', N'Check', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (43, 5, 3, 1, N'', N'', N'Check', 3, N'Tạo mới', N'Đã xong (Task đột xuất)', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (44, 5, 3, 1, N'', N'', N'Check', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (45, 5, 2, 1, N'', N'', N'Check lại lần 2', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (46, 8, 2, 1, N'', N'', N'Check lại lần 2', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (47, 8, 1, 1, N'', N'', N'Check lại ', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (48, 8, 3, 1, N'', N'', N'Check lại', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (50, 4, 1, 1, N'', N'', N'Check lại', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-25' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (51, 4, 1, 8, N'', N'', N'Họp ', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-25' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (52, 4, 2, 8, N'', N'', N'Họp ', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-25' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (53, 4, 3, 1, N'', N'', N'Check lại đăng nhập', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-25' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (54, 2, 3, 1, N'', N'', N'Chech lại', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (55, 2, 3, 8, N'', N'', N'họp', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (56, 3, 3, 1, N'', N'', N'Kiem tra đăng nhập', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-18' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (57, 4, 3, 1, N'', N'', N'Làm tăng ca', 10, N'Tạo mới', N'Chưa làm', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-26' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (58, 2, 2, 1, N'', N'', N'Làm tăng ca', 10, N'Tạo mới', N'Đã xong', CAST(N'2021-01-12' AS Date), CAST(N'2021-01-12' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (59, 2, 2, 1, N'', N'', N'tăng ca', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-13' AS Date), CAST(N'2021-01-13' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (60, 1, 2, 1, N'', N'', N'Tăng ca', 5, N'Tạo mới', N'Đã xong', CAST(N'2021-01-05' AS Date), CAST(N'2021-01-05' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (61, 3, 2, 1, N'', N'', N'Tăng ca lần 3', 6, N'Tạo mới', N'Đã xong', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-18' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (62, 9, 1, 1, N'', N'', N'Tăng ca', 8, N'Tạo mới', N'Đã xong', CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (63, 9, 2, 1, N'', N'', N'Check', 3, N'Tạo mới', N'Chưa làm', CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (64, 3, 1, 1, N'', N'', N'Tăng ca', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-19' AS Date), CAST(N'2021-01-19' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (65, 9, 2, 1, N'', N'', N'Tăng ca', 10, N'Tạo mới', N'Đã xong', CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (66, 1, 2, 1, N'', N'', N'Check đăng nhập Mầm non', 8, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (67, 1, 1, 1, N'', N'', N'Làm tuần 1 Tháng 1', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (68, 1, 3, 1, N'', N'', N'', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (69, 14, 2, 1, N'', N'', N'Tuần 1 Tháng 1 dự án 2', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (70, 14, 1, 1, N'', N'', N'Tuần 1 Tháng 1 Dự án 2', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (71, 14, 3, 1, N'', N'', N'Tuần 1 Dự án 2 Tháng 1', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (72, 14, 2, 1, N'', N'', N'Tuần 1 Tháng 1 Dự án 2 Ân', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-04' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (73, 19, 1, 1, N'', N'', N'Tuần 2 Tháng 1 dự án 2 Vi', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (74, 19, 2, 1, N'', N'', N'Tuần 2 Tháng 2 Dự án 2 Ân', 5, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (75, 19, 2, 1, N'', N'', N'Tuần 2 Tháng 1 Dự án 2 Ân2', 3, N'Tạo mới', N'Chưa Làm', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (76, 19, 3, 1, N'', N'', N'Tuần 2 Tháng 1 Dư án 2 Hà', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-11' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (77, 4, 2, 1, N'', N'', N'Tuần 4 Tháng 1 dự án 1', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-25' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (78, 9, 3, 1, N'', N'', N'Tuần 3 tháng 2 Dự án 1 Hà', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (79, 10, 1, 1, N'', N'', N'Tuần 4 tháng 2 Dự án 1 Vi', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22' AS Date), N'')
INSERT [dbo].[CONGVIECTUAN] ([idCongViecTuan], [idTuan], [idNguoiDung], [idModule], [TenIssue], [Urllssue], [TenCongViec], [ThoiGianLam], [Nguon], [TrangThai], [NgayBD], [NgayKT], [GhiChu]) VALUES (80, 10, 2, 1, N'', N'', N'Tuần 4 Tháng 2 Dự án 1', 3, N'Tạo mới', N'Đã xong', CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22' AS Date), N'')
SET IDENTITY_INSERT [dbo].[CONGVIECTUAN] OFF
GO
SET IDENTITY_INSERT [dbo].[DGNHANSUTHEOTHANG] ON 

INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (1, 1, 1, N'Bình thường  ', N'Tốt, hầu như k lỗi', N'kịp tiến độ ', N'A', N'Nắm rõ thông tin', 88, 67)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (2, 1, 2, N'Bình thường      ', N'Tốt, hầu như k lỗi', N'kịp tiến độ ', N'A', N'Nắm rõ thông tin', 100, 60)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (3, 2, 1, N'Bình thường   ', N'Tốt, hầu như k lỗi', N'kịp tiến độ ', N'C', N'Nắm rõ thông tin', 85, 19)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (5, 2, 2, N'   ', NULL, NULL, N'D', NULL, 94, 25)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (6, 2, 3, N' ', NULL, NULL, N'D', NULL, 100, 12)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (10, 1, 3, N' ', NULL, NULL, N'C', NULL, 80, 28)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (11, 4, 2, N'    ', NULL, NULL, N'A', NULL, 81, 14)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (12, 4, 1, N'  ', NULL, NULL, N'A', NULL, 100, 6)
INSERT [dbo].[DGNHANSUTHEOTHANG] ([idDanhGiaNSThang], [idThang], [idNguoiDung], [KhoiLuong], [ChatLuong], [TienDo], [XepLoai], [NhanXetCaThang], [TBThang], [TongGio]) VALUES (13, 4, 3, N'  ', NULL, NULL, N'A', NULL, 100, 6)
SET IDENTITY_INSERT [dbo].[DGNHANSUTHEOTHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[DGNHANSUTHEOTUAN] ON 

INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (1, 1, 1, 100, N'Bình thường', N'Kịp tiến độ', N'Lỗi nội bộ triển khai test', N'Lỗi ít', N'Đúng tiến độ')
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (2, 2, 1, 100, N'Bình thường', N'Kịp tiến độ', N'Lỗi nội bộ triển khai test', N'Lỗi ít', N'Đúng tiến độ')
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (3, 3, 1, 52, N'Bình thường', N'Kịp tiến độ', N'Lỗi nội bộ ', N'Lỗi ít', N'Đúng tiến độ')
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (4, 3, 2, 100, N'Bình thường', N'Kịp tiến độ', N'Lỗi nội bộ triển khai test', N'Lỗi ít', N'Đúng tiến độ')
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (8, 1, 2, 100, N'Bình thường', N'Kịp tiến độ', N'Lỗi nội bộ triển khai test', N'Lỗi ít', N'Đúng tiến độ')
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (10, 2, 2, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (11, 5, 1, 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (12, 1, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (13, 5, 2, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (14, 5, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (15, 8, 2, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (16, 8, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (17, 8, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (19, 4, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (20, 4, 2, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (21, 4, 3, 23, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (22, 2, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (23, 3, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (24, 9, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (25, 9, 2, 76, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (26, 14, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (27, 14, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (28, 14, 2, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (29, 19, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (30, 19, 2, 62, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (31, 19, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (32, 9, 3, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (33, 10, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DGNHANSUTHEOTUAN] ([idDanhGiaNSTuan], [idTuan], [idNguoiDung], [HoanThanh], [KhoiLuong], [TienDo], [ChatLuong], [LoiTrongTuan], [NhanXetTuan]) VALUES (34, 10, 2, 100, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DGNHANSUTHEOTUAN] OFF
GO
SET IDENTITY_INSERT [dbo].[DUAN] ON 

INSERT [dbo].[DUAN] ([idDuAn], [TenDuAn], [HinhAnh]) VALUES (1, N'Developers', N'https://ivyachievement.vn/wp-content/uploads/2019/04/icon2-02.png')
INSERT [dbo].[DUAN] ([idDuAn], [TenDuAn], [HinhAnh]) VALUES (2, N'Triển khai', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6fLrHWhJx0lUGycqenWK2FY2XpESpCIxqjjnePPmw1lJxz9EkFNm4oq-oEe_0wpKEqGY&usqp=CAU')
INSERT [dbo].[DUAN] ([idDuAn], [TenDuAn], [HinhAnh]) VALUES (3, N'Hổ trợ khách hàng', N'https://images.careerbuilder.vn/content/talent_community/684.jpg')
INSERT [dbo].[DUAN] ([idDuAn], [TenDuAn], [HinhAnh]) VALUES (4, N'Marketing', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQngjMkaygL3SPFTguBVYx0w0g407AcnlgYP3Bqt62dAorNwGZVoviHuT5UilapotpJyEw&usqp=CAU')
SET IDENTITY_INSERT [dbo].[DUAN] OFF
GO
SET IDENTITY_INSERT [dbo].[DUANTHAMGIA] ON 

INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (2, 2, 2, 2, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (3, 3, 1, 1, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (4, 1, 2, 2, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (5, 4, 1, 1, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (6, 1, 3, 1, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (7, 2, 1, 1, 1)
INSERT [dbo].[DUANTHAMGIA] ([idDuAnThamGia], [idDuAn], [idNguoiDung], [idBoPhan], [TrangThai]) VALUES (8, 2, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[DUANTHAMGIA] OFF
GO
SET IDENTITY_INSERT [dbo].[MODULE] ON 

INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (1, N'Mầm Non')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (2, N'Tiểu Học')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (3, N'Trung Học Cơ Sở ')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (4, N'Trung Học Phổ Thông')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (5, N'Nhân Sự')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (6, N'Học Sinh')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (7, N'')
INSERT [dbo].[MODULE] ([idModule], [TenModule]) VALUES (8, N'Meeting')
SET IDENTITY_INSERT [dbo].[MODULE] OFF
GO
INSERT [dbo].[NGUOIDUNG] ([idNguoiDung], [HoDemND], [TenND], [TenDangNhap], [MatKhau], [TrangThai]) VALUES (1, N'Phạm Thị ', N'Vi', N'Vi@Cute45', N'123', 1)
INSERT [dbo].[NGUOIDUNG] ([idNguoiDung], [HoDemND], [TenND], [TenDangNhap], [MatKhau], [TrangThai]) VALUES (2, N'Nguyễn Thành ', N'Ân', N'AnGa', N'123', 1)
INSERT [dbo].[NGUOIDUNG] ([idNguoiDung], [HoDemND], [TenND], [TenDangNhap], [MatKhau], [TrangThai]) VALUES (3, N'Tô Thị Ngọc', N'Hà', N'HaPhoMai', N'123', 1)
INSERT [dbo].[NGUOIDUNG] ([idNguoiDung], [HoDemND], [TenND], [TenDangNhap], [MatKhau], [TrangThai]) VALUES (4, N'Nguyễn Văn', N'A', N'A@NVan', N'123', 1)
INSERT [dbo].[NGUOIDUNG] ([idNguoiDung], [HoDemND], [TenND], [TenDangNhap], [MatKhau], [TrangThai]) VALUES (5, N'Nguyễn Văn', N'B', N'VanB', N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[THANGLAMVIEC] ON 

INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (1, 1, 1, 2021, N'Tháng 1', CAST(N'2021-01-01' AS Date), CAST(N'2021-01-31' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (2, 1, 2, 2021, N'Tháng 2', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-28' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (3, 1, 3, 2021, N'Tháng 3', CAST(N'2021-03-01' AS Date), CAST(N'2021-03-31' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (4, 2, 1, 2021, N'Tháng 1', CAST(N'2021-01-01' AS Date), CAST(N'2021-01-31' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (5, 2, 2, 2021, N'Tháng 2', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-28' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (6, 1, 4, 2021, N'Tháng 4', CAST(N'2021-04-01' AS Date), CAST(N'2021-04-30' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (7, 3, 1, 2021, N'Tháng 1', CAST(N'2021-01-01' AS Date), CAST(N'2021-01-31' AS Date))
INSERT [dbo].[THANGLAMVIEC] ([idThang], [idDuAn], [GiaTri], [Nam], [TenThang], [NgayBDLam], [NgayKTLam]) VALUES (8, 1, 5, 2021, N'Tháng 5', CAST(N'2021-05-03' AS Date), CAST(N'2021-05-28' AS Date))
SET IDENTITY_INSERT [dbo].[THANGLAMVIEC] OFF
GO
SET IDENTITY_INSERT [dbo].[TODOLIST] ON 

INSERT [dbo].[TODOLIST] ([idToDoList], [idDuAn], [idNguoiDung], [NoiDung], [NgayGiao], [HanDen], [GhiChu], [TrangThai]) VALUES (1, 1, 1, N'Check lại hóa đơn ', CAST(N'2021-11-17' AS Date), CAST(N'2021-11-20' AS Date), N'oke  ', 1)
INSERT [dbo].[TODOLIST] ([idToDoList], [idDuAn], [idNguoiDung], [NoiDung], [NgayGiao], [HanDen], [GhiChu], [TrangThai]) VALUES (2, 1, 1, N'Kiểm tra đăng nhập', CAST(N'2021-11-17' AS Date), CAST(N'2021-11-20' AS Date), N'3', 1)
INSERT [dbo].[TODOLIST] ([idToDoList], [idDuAn], [idNguoiDung], [NoiDung], [NgayGiao], [HanDen], [GhiChu], [TrangThai]) VALUES (3, 1, 1, N'Check lại hóa đơn ', CAST(N'2021-11-17' AS Date), CAST(N'2021-11-19' AS Date), N'2', 1)
INSERT [dbo].[TODOLIST] ([idToDoList], [idDuAn], [idNguoiDung], [NoiDung], [NgayGiao], [HanDen], [GhiChu], [TrangThai]) VALUES (4, 1, 2, N'Kiểm tra phân quyền', CAST(N'2021-11-17' AS Date), CAST(N'2021-11-26' AS Date), N'9', 1)
INSERT [dbo].[TODOLIST] ([idToDoList], [idDuAn], [idNguoiDung], [NoiDung], [NgayGiao], [HanDen], [GhiChu], [TrangThai]) VALUES (11, 2, 1, N'Kiểm tra phân quyền', CAST(N'2021-11-23' AS Date), CAST(N'2021-11-24' AS Date), N'Vào tuần sau', 0)
SET IDENTITY_INSERT [dbo].[TODOLIST] OFF
GO
SET IDENTITY_INSERT [dbo].[TUANLAMVIEC] ON 

INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (1, 1, 1, N'Tuần 1', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-08' AS Date), 30, 0)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (2, 1, 2, N'Tuần 2', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-16' AS Date), 30, 0)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (3, 1, 3, N'Tuần 3', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-23' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (4, 1, 4, N'Tuần 4', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-29' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (5, 2, 1, N'Tuần 1', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-05' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (6, 3, 1, N'Tuần 1', CAST(N'2021-03-04' AS Date), CAST(N'2021-03-08' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (7, 6, 1, N'Tuần 1', CAST(N'2021-04-04' AS Date), CAST(N'2021-04-09' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (8, 2, 2, N'Tuần 2', CAST(N'2021-02-08' AS Date), CAST(N'2021-02-12' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (9, 2, 3, N'Tuần 3', CAST(N'2021-02-15' AS Date), CAST(N'2021-02-19' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (10, 2, 4, N'Tuần 4', CAST(N'2021-02-22' AS Date), CAST(N'2021-02-26' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (11, 3, 2, N'Tuần 2', CAST(N'2021-03-12' AS Date), CAST(N'2021-03-16' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (12, 7, 1, N'Tuần 1', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-08' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (13, 3, 3, N'Tuần 3', CAST(N'2021-03-22' AS Date), CAST(N'2021-03-26' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (14, 4, 1, N'Tuần 1', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-08' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (15, 6, 2, N'Tuần 2', CAST(N'2021-04-12' AS Date), CAST(N'2021-04-09' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (16, 3, 4, N'Tuần 4', CAST(N'2021-03-29' AS Date), CAST(N'2021-04-02' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (17, 8, 1, N'Tuần 1', CAST(N'2021-05-03' AS Date), CAST(N'2021-05-07' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (18, 8, 2, N'Tuần 2', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-14' AS Date), 30, 1)
INSERT [dbo].[TUANLAMVIEC] ([idTuan], [idThang], [STTTuan], [TenTuan], [NgayBD], [NgayKT], [SoGioLamViec], [TrangThai]) VALUES (19, 4, 2, N'Tuần 2', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-15' AS Date), 30, 1)
SET IDENTITY_INSERT [dbo].[TUANLAMVIEC] OFF
GO
ALTER TABLE [dbo].[CONGVIECTUAN]  WITH CHECK ADD  CONSTRAINT [FK_CONGVIECTUAN_MODULE] FOREIGN KEY([idModule])
REFERENCES [dbo].[MODULE] ([idModule])
GO
ALTER TABLE [dbo].[CONGVIECTUAN] CHECK CONSTRAINT [FK_CONGVIECTUAN_MODULE]
GO
ALTER TABLE [dbo].[CONGVIECTUAN]  WITH CHECK ADD  CONSTRAINT [FK_CONGVIECTUAN_NGUOIDUNG] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([idNguoiDung])
GO
ALTER TABLE [dbo].[CONGVIECTUAN] CHECK CONSTRAINT [FK_CONGVIECTUAN_NGUOIDUNG]
GO
ALTER TABLE [dbo].[CONGVIECTUAN]  WITH CHECK ADD  CONSTRAINT [FK_CONGVIECTUAN_TUANLAMVIEC] FOREIGN KEY([idTuan])
REFERENCES [dbo].[TUANLAMVIEC] ([idTuan])
GO
ALTER TABLE [dbo].[CONGVIECTUAN] CHECK CONSTRAINT [FK_CONGVIECTUAN_TUANLAMVIEC]
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTHANG]  WITH CHECK ADD  CONSTRAINT [FK_DGNHANSUTHEOTHANG_NGUOIDUNG] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([idNguoiDung])
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTHANG] CHECK CONSTRAINT [FK_DGNHANSUTHEOTHANG_NGUOIDUNG]
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTHANG]  WITH CHECK ADD  CONSTRAINT [FK_DGNHANSUTHEOTHANG_THANGLAMVIEC] FOREIGN KEY([idThang])
REFERENCES [dbo].[THANGLAMVIEC] ([idThang])
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTHANG] CHECK CONSTRAINT [FK_DGNHANSUTHEOTHANG_THANGLAMVIEC]
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTUAN]  WITH CHECK ADD  CONSTRAINT [FK_DGNHANSUTHEOTUAN_NGUOIDUNG] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([idNguoiDung])
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTUAN] CHECK CONSTRAINT [FK_DGNHANSUTHEOTUAN_NGUOIDUNG]
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTUAN]  WITH CHECK ADD  CONSTRAINT [FK_DGNHANSUTHEOTUAN_TUANLAMVIEC] FOREIGN KEY([idTuan])
REFERENCES [dbo].[TUANLAMVIEC] ([idTuan])
GO
ALTER TABLE [dbo].[DGNHANSUTHEOTUAN] CHECK CONSTRAINT [FK_DGNHANSUTHEOTUAN_TUANLAMVIEC]
GO
ALTER TABLE [dbo].[DUANTHAMGIA]  WITH CHECK ADD  CONSTRAINT [FK_DUANTHAMGIA_BOPHAN] FOREIGN KEY([idBoPhan])
REFERENCES [dbo].[BOPHAN] ([idBoPhan])
GO
ALTER TABLE [dbo].[DUANTHAMGIA] CHECK CONSTRAINT [FK_DUANTHAMGIA_BOPHAN]
GO
ALTER TABLE [dbo].[DUANTHAMGIA]  WITH CHECK ADD  CONSTRAINT [FK_DUANTHAMGIA_DUAN] FOREIGN KEY([idDuAn])
REFERENCES [dbo].[DUAN] ([idDuAn])
GO
ALTER TABLE [dbo].[DUANTHAMGIA] CHECK CONSTRAINT [FK_DUANTHAMGIA_DUAN]
GO
ALTER TABLE [dbo].[DUANTHAMGIA]  WITH CHECK ADD  CONSTRAINT [FK_DUANTHAMGIA_NGUOIDUNG] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([idNguoiDung])
GO
ALTER TABLE [dbo].[DUANTHAMGIA] CHECK CONSTRAINT [FK_DUANTHAMGIA_NGUOIDUNG]
GO
ALTER TABLE [dbo].[THANGLAMVIEC]  WITH CHECK ADD  CONSTRAINT [FK_THANGLAMVIEC_DUAN] FOREIGN KEY([idDuAn])
REFERENCES [dbo].[DUAN] ([idDuAn])
GO
ALTER TABLE [dbo].[THANGLAMVIEC] CHECK CONSTRAINT [FK_THANGLAMVIEC_DUAN]
GO
ALTER TABLE [dbo].[TODOLIST]  WITH CHECK ADD  CONSTRAINT [FK_TODOLIST_DUAN] FOREIGN KEY([idDuAn])
REFERENCES [dbo].[DUAN] ([idDuAn])
GO
ALTER TABLE [dbo].[TODOLIST] CHECK CONSTRAINT [FK_TODOLIST_DUAN]
GO
ALTER TABLE [dbo].[TODOLIST]  WITH CHECK ADD  CONSTRAINT [FK_TODOLIST_NGUOIDUNG] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([idNguoiDung])
GO
ALTER TABLE [dbo].[TODOLIST] CHECK CONSTRAINT [FK_TODOLIST_NGUOIDUNG]
GO
ALTER TABLE [dbo].[TUANLAMVIEC]  WITH CHECK ADD  CONSTRAINT [FK_TUANLAMVIEC_THANGLAMVIEC] FOREIGN KEY([idThang])
REFERENCES [dbo].[THANGLAMVIEC] ([idThang])
GO
ALTER TABLE [dbo].[TUANLAMVIEC] CHECK CONSTRAINT [FK_TUANLAMVIEC_THANGLAMVIEC]
GO
