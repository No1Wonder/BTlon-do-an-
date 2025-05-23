USE [master]
GO
/****** Object:  Database [DoanGame]    Script Date: 4/23/2025 8:35:03 PM ******/
CREATE DATABASE [DoanGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DoanGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.BTLSQL\MSSQL\DATA\DoanGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DoanGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.BTLSQL\MSSQL\DATA\DoanGame_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DoanGame] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoanGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoanGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoanGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoanGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoanGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoanGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoanGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoanGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoanGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoanGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoanGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoanGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoanGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoanGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoanGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoanGame] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DoanGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoanGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoanGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoanGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoanGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoanGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoanGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoanGame] SET RECOVERY FULL 
GO
ALTER DATABASE [DoanGame] SET  MULTI_USER 
GO
ALTER DATABASE [DoanGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoanGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoanGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoanGame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DoanGame] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DoanGame] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DoanGame', N'ON'
GO
ALTER DATABASE [DoanGame] SET QUERY_STORE = ON
GO
ALTER DATABASE [DoanGame] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DoanGame]
GO
/****** Object:  Table [dbo].[CayTrong]    Script Date: 4/23/2025 8:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CayTrong](
	[ID_CayTrong] [int] IDENTITY(1,1) NOT NULL,
	[ID_VatPham] [int] NOT NULL,
	[ThoiGianPhuTrien] [int] NOT NULL,
	[CoTaiSinh] [bit] NULL,
	[Mua] [varchar](10) NOT NULL,
	[LuongNuocCan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CayTrong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiChoi]    Script Date: 4/23/2025 8:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiChoi](
	[ID_NguoiChoi] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](255) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Vang] [int] NULL,
	[NangLuong] [int] NULL,
	[CapDo] [int] NULL,
	[KinhNghiem] [int] NULL,
	[TenNongTrai] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[LanDangNhapCuoi] [datetime] NULL,
	[DangTrucTuyen] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NguoiChoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NongTrai]    Script Date: 4/23/2025 8:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NongTrai](
	[ID_NongTrai] [int] IDENTITY(1,1) NOT NULL,
	[ID_NguoiChoi] [int] NOT NULL,
	[KichThuoc] [varchar](10) NULL,
	[KieuThietKe] [varchar](20) NULL,
	[SoLuongODatDaTrong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NongTrai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ODat]    Script Date: 4/23/2025 8:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ODat](
	[ID_ODat] [int] IDENTITY(1,1) NOT NULL,
	[ID_NongTrai] [int] NOT NULL,
	[ToaDoX] [int] NOT NULL,
	[ToaDoY] [int] NOT NULL,
	[ID_CayTrong] [int] NULL,
	[GiaiDoanPhuTrien] [int] NULL,
	[NgayTrong] [datetime] NULL,
	[LanTuoiCuoi] [datetime] NULL,
	[DaBon] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ODat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VatPham]    Script Date: 4/23/2025 8:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VatPham](
	[ID_VatPham] [int] IDENTITY(1,1) NOT NULL,
	[TenVatPham] [nvarchar](50) NOT NULL,
	[LoaiVatPham] [varchar](20) NOT NULL,
	[GiaMua] [int] NULL,
	[GiaBan] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_VatPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CayTrong] ON 

INSERT [dbo].[CayTrong] ([ID_CayTrong], [ID_VatPham], [ThoiGianPhuTrien], [CoTaiSinh], [Mua], [LuongNuocCan]) VALUES (1, 2, 60, 0, N'xuan', 1)
SET IDENTITY_INSERT [dbo].[CayTrong] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiChoi] ON 

INSERT [dbo].[NguoiChoi] ([ID_NguoiChoi], [TenDangNhap], [MatKhau], [Email], [Vang], [NangLuong], [CapDo], [KinhNghiem], [TenNongTrai], [NgayTao], [LanDangNhapCuoi], [DangTrucTuyen]) VALUES (1, N'nongdan1', N'matkhau123', N'nongdan1@example.com', 1000, 100, 1, 0, N'Nông Trại Mới', CAST(N'2025-04-23T19:20:08.470' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[NguoiChoi] OFF
GO
SET IDENTITY_INSERT [dbo].[NongTrai] ON 

INSERT [dbo].[NongTrai] ([ID_NongTrai], [ID_NguoiChoi], [KichThuoc], [KieuThietKe], [SoLuongODatDaTrong]) VALUES (1, 1, N'nho', N'chuan', 20)
SET IDENTITY_INSERT [dbo].[NongTrai] OFF
GO
SET IDENTITY_INSERT [dbo].[ODat] ON 

INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (1, 1, 1, 1, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (2, 1, 2, 1, 1, 1, CAST(N'2025-04-23T20:14:06.927' AS DateTime), NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (3, 1, 1, 3, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (4, 1, 1, 4, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (5, 1, 1, 5, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (6, 1, 1, 6, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (7, 1, 1, 7, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (8, 1, 1, 8, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (9, 1, 1, 9, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (10, 1, 1, 10, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (11, 1, 1, 11, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (12, 1, 1, 12, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (13, 1, 1, 13, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (14, 1, 1, 14, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (15, 1, 1, 15, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (16, 1, 1, 16, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (17, 1, 1, 17, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (18, 1, 1, 18, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (19, 1, 1, 19, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (20, 1, 1, 20, 1, 0, NULL, NULL, 0)
INSERT [dbo].[ODat] ([ID_ODat], [ID_NongTrai], [ToaDoX], [ToaDoY], [ID_CayTrong], [GiaiDoanPhuTrien], [NgayTrong], [LanTuoiCuoi], [DaBon]) VALUES (21, 1, 1, 21, NULL, 0, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ODat] OFF
GO
SET IDENTITY_INSERT [dbo].[VatPham] ON 

INSERT [dbo].[VatPham] ([ID_VatPham], [TenVatPham], [LoaiVatPham], [GiaMua], [GiaBan], [MoTa]) VALUES (1, N'Hạt lúa', N'hat_giong', 5, 2, N'Hạt mùa xuân')
INSERT [dbo].[VatPham] ([ID_VatPham], [TenVatPham], [LoaiVatPham], [GiaMua], [GiaBan], [MoTa]) VALUES (2, N'Lúa', N'cay_trong', NULL, 25, N'Lúa thu hoạch')
SET IDENTITY_INSERT [dbo].[VatPham] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiCho__55F68FC07C08DCC6]    Script Date: 4/23/2025 8:35:03 PM ******/
ALTER TABLE [dbo].[NguoiChoi] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiCho__A9D10534D9EE5CB8]    Script Date: 4/23/2025 8:35:03 PM ******/
ALTER TABLE [dbo].[NguoiChoi] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CayTrong] ADD  DEFAULT ((0)) FOR [CoTaiSinh]
GO
ALTER TABLE [dbo].[CayTrong] ADD  DEFAULT ((1)) FOR [LuongNuocCan]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT ((1000)) FOR [Vang]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT ((100)) FOR [NangLuong]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT ((1)) FOR [CapDo]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT ((0)) FOR [KinhNghiem]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT (N'Nông Trại Mới') FOR [TenNongTrai]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[NguoiChoi] ADD  DEFAULT ((0)) FOR [DangTrucTuyen]
GO
ALTER TABLE [dbo].[NongTrai] ADD  DEFAULT ('nho') FOR [KichThuoc]
GO
ALTER TABLE [dbo].[NongTrai] ADD  DEFAULT ('chuan') FOR [KieuThietKe]
GO
ALTER TABLE [dbo].[NongTrai] ADD  DEFAULT ((0)) FOR [SoLuongODatDaTrong]
GO
ALTER TABLE [dbo].[ODat] ADD  DEFAULT ((0)) FOR [GiaiDoanPhuTrien]
GO
ALTER TABLE [dbo].[ODat] ADD  DEFAULT ((0)) FOR [DaBon]
GO
ALTER TABLE [dbo].[CayTrong]  WITH CHECK ADD FOREIGN KEY([ID_VatPham])
REFERENCES [dbo].[VatPham] ([ID_VatPham])
GO
ALTER TABLE [dbo].[NongTrai]  WITH CHECK ADD FOREIGN KEY([ID_NguoiChoi])
REFERENCES [dbo].[NguoiChoi] ([ID_NguoiChoi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ODat]  WITH CHECK ADD FOREIGN KEY([ID_CayTrong])
REFERENCES [dbo].[CayTrong] ([ID_CayTrong])
GO
ALTER TABLE [dbo].[ODat]  WITH CHECK ADD FOREIGN KEY([ID_NongTrai])
REFERENCES [dbo].[NongTrai] ([ID_NongTrai])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CayTrong]  WITH CHECK ADD CHECK  (([Mua]='dong' OR [Mua]='thu' OR [Mua]='ha' OR [Mua]='xuan'))
GO
ALTER TABLE [dbo].[NongTrai]  WITH CHECK ADD CHECK  (([KichThuoc]='lon' OR [KichThuoc]='trung_binh' OR [KichThuoc]='nho'))
GO
ALTER TABLE [dbo].[NongTrai]  WITH CHECK ADD CHECK  (([KieuThietKe]='song' OR [KieuThietKe]='rung' OR [KieuThietKe]='chuan'))
GO
ALTER TABLE [dbo].[VatPham]  WITH CHECK ADD CHECK  (([LoaiVatPham]='nha_xuong' OR [LoaiVatPham]='nguyen_lieu' OR [LoaiVatPham]='cong_cu' OR [LoaiVatPham]='san_pham' OR [LoaiVatPham]='vat_nuoi' OR [LoaiVatPham]='cay_trong' OR [LoaiVatPham]='hat_giong'))
GO
/****** Object:  Trigger [dbo].[trg_KiemTraODatKhiTrong]    Script Date: 4/23/2025 8:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_KiemTraODatKhiTrong]
ON [dbo].[ODat]
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Không trồng đè cây cũ
    IF EXISTS (
        SELECT 1
        FROM ODat o
        JOIN inserted i ON o.ID_ODat = i.ID_ODat
        WHERE o.ID_CayTrong IS NOT NULL AND i.ID_CayTrong IS NOT NULL AND o.ID_CayTrong <> i.ID_CayTrong
    )
    BEGIN
        RAISERROR(N'Ô đất đã trồng cây rồi. Không thể trồng cây khác lên.', 16, 1);
        ROLLBACK;
        RETURN;
    END;

    -- 2. Kiểm tra vượt quá giới hạn 20 ô đang trồng cây
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON d.ID_ODat = i.ID_ODat
        WHERE d.ID_CayTrong IS NULL AND i.ID_CayTrong IS NOT NULL
        AND (
            (SELECT COUNT(*) 
             FROM ODat 
             WHERE ID_NongTrai = i.ID_NongTrai AND ID_CayTrong IS NOT NULL) +
            (SELECT COUNT(*) 
             FROM inserted i2 
             JOIN deleted d2 ON d2.ID_ODat = i2.ID_ODat
             WHERE i2.ID_NongTrai = i.ID_NongTrai AND d2.ID_CayTrong IS NULL AND i2.ID_CayTrong IS NOT NULL)
        ) > 20
    )
    BEGIN
        RAISERROR(N'Nông trại đã đạt giới hạn 20 ô trồng cây.', 16, 1);
        ROLLBACK;
        RETURN;
    END;

    -- 3. Cập nhật hợp lệ
    UPDATE o
    SET 
        o.ID_CayTrong = i.ID_CayTrong,
        o.GiaiDoanPhuTrien = i.GiaiDoanPhuTrien,
        o.NgayTrong = i.NgayTrong,
        o.LanTuoiCuoi = i.LanTuoiCuoi,
        o.DaBon = i.DaBon
    FROM ODat o
    JOIN inserted i ON o.ID_ODat = i.ID_ODat;
END;
GO
ALTER TABLE [dbo].[ODat] ENABLE TRIGGER [trg_KiemTraODatKhiTrong]
GO
USE [master]
GO
ALTER DATABASE [DoanGame] SET  READ_WRITE 
GO
