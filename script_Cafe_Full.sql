USE [master]
GO
/****** Object:  Database [DAMN_QuanLyCaPhe]    Script Date: 8/13/2020 4:05:25 PM ******/
CREATE DATABASE [DAMN_QuanLyCaPhe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DAMN_QuanLyCaPhe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DAMN_QuanLyCaPhe.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DAMN_QuanLyCaPhe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DAMN_QuanLyCaPhe_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DAMN_QuanLyCaPhe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET ARITHABORT OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET  MULTI_USER 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DAMN_QuanLyCaPhe]
GO
/****** Object:  Table [dbo].[QL_ChiTietHoaDon]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_ChiTietHoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](100) NOT NULL,
	[Soluong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_QL_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_ChiTietNhapHang]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_ChiTietNhapHang](
	[MAHDNH] [nvarchar](50) NOT NULL,
	[MANL] [nvarchar](50) NOT NULL,
	[DVT] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_QL_ChiTietNhapHang] PRIMARY KEY CLUSTERED 
(
	[MAHDNH] ASC,
	[MANL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_ChiTietPhieuNhan]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_ChiTietPhieuNhan](
	[MaPhieuNhan] [nvarchar](50) NOT NULL,
	[MaNL] [nvarchar](50) NOT NULL,
	[DonGia] [int] NULL,
	[Soluong] [int] NULL,
	[DonViTinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_ChiTietPhieuNhan] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhan] ASC,
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_HoaDon_BanHang]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_HoaDon_BanHang](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaND] [nvarchar](50) NULL,
	[NgayLap] [date] NULL,
	[PhuongThuc] [nvarchar](50) NULL,
	[TienDua] [int] NULL,
	[TienThua] [int] NULL,
	[TongCong] [int] NULL,
	[MAKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_HoaDon_NhapHang]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_HoaDon_NhapHang](
	[MaHDNH] [nvarchar](50) NOT NULL,
	[MANCC] [nvarchar](50) NULL,
	[NgayNhap] [date] NULL,
	[TongTien] [money] NULL,
	[MAND] [nvarchar](50) NULL,
	[PhuongThuc] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_HoaDon_NhapHang] PRIMARY KEY CLUSTERED 
(
	[MaHDNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_KHACHHANG]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_KHACHHANG](
	[MaKH] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[CMND] [nchar](10) NULL,
	[DiemSo] [int] NULL,
 CONSTRAINT [PK_QL_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_LoaiNguyenLieu]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_LoaiNguyenLieu](
	[MaLoaiNL] [nvarchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[Hinh] [nvarchar](50) NULL,
	[GhiChu] [nchar](10) NULL,
 CONSTRAINT [PK_QL_LoaiNguyenLieu] PRIMARY KEY CLUSTERED 
(
	[MaLoaiNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_LoaiSanPham]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_LoaiSanPham](
	[MaLoaiSP] [nvarchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[Hinh] [nvarchar](max) NULL,
	[GhiChu] [nchar](10) NULL,
 CONSTRAINT [PK_QL_NhomSanPham_1] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_ManHinh]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_ManHinh](
	[MaMH] [nvarchar](10) NOT NULL,
	[TenMH] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_ManHinh] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_NguoiDung]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NguoiDung](
	[MaND] [nvarchar](50) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
	[SoDienThoai] [nchar](10) NULL,
	[CMND] [nchar](10) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NgaySinh] [date] NULL,
	[NgayVL] [date] NULL,
	[MaNhom] [nvarchar](50) NULL,
	[HoatDong] [nchar](10) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_NguyenLieu]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NguyenLieu](
	[MaNL] [nvarchar](50) NOT NULL,
	[TenNL] [nvarchar](50) NULL,
	[DVT] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[MaLoaiNL] [nvarchar](10) NULL,
	[ThoiHan] [date] NULL,
 CONSTRAINT [PK_NguyenLieu] PRIMARY KEY CLUSTERED 
(
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_NguyenLieu_SanPham]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NguyenLieu_SanPham](
	[MaSP] [nvarchar](100) NOT NULL,
	[MaNL] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_QL_NguyenLieu_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_NhaCungCap]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_NhomNguoiDung]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_NhomNguoiDung](
	[MaNhom] [nvarchar](50) NOT NULL,
	[TenNhom] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_NhomNguoIDung] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_PhanQuyen]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_PhanQuyen](
	[MaNhom] [nvarchar](50) NOT NULL,
	[MaMH] [nvarchar](10) NOT NULL,
	[CoQuyen] [bit] NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_PhieuNhan]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_PhieuNhan](
	[MaPhieuNhan] [nvarchar](50) NOT NULL,
	[MaHDNH] [nvarchar](50) NULL,
	[NgayNhan] [date] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_QL_PhieuNhan] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QL_SanPham]    Script Date: 8/13/2020 4:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_SanPham](
	[MaSP] [nvarchar](100) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[Gia] [money] NULL,
	[Hinh] [nvarchar](50) NULL,
	[MaLoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_QL_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020833768', N'SP011     ', 1, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020836474', N'SP004     ', 1, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020839651', N'SP001     ', 1, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020839651', N'SP002     ', 1, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020839651', N'SP003     ', 1, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020843698', N'SP010     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020843731', N'SP003     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020843731', N'SP005     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020843731', N'SP006     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'20208446', N'SP001     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'20208446', N'SP002     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'20208446', N'SP003     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020847237', N'SP001     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020847237', N'SP002     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020847237', N'SP003     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020847237', N'SP004     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020873569', N'SP003     ', 2, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020873569', N'SP005     ', 2, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020873569', N'SP006     ', 1, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020875744', N'SP006     ', 12, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020878238', N'SP002     ', 9, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020878238', N'SP006     ', 4, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020879393', N'SP003     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020879393', N'SP005     ', 0, 20000)
INSERT [dbo].[QL_ChiTietHoaDon] ([MaHD], [MaSP], [Soluong], [DonGia]) VALUES (N'2020879393', N'SP006     ', 0, 20000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH01', N'NL001', N'cái', 10, 100000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH01', N'NL002', N'cái', 10, 100000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH01', N'NL003', N'cái', 10, 100000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH01', N'NL004', N'cái', 10, 100000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH01', N'NL009', N'cái', 10, 100000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH02', N'NL001', N'cái', 100, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH02', N'NL002', N'cái', 100, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH02', N'NL005', N'cái', 100, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH02', N'NL009', N'cái', 100, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH02', N'NL10', N'cái', 100, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH02', N'NL11', N'cái', 24, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH03', N'NL003', N'cái', 100, 3000)
INSERT [dbo].[QL_ChiTietNhapHang] ([MAHDNH], [MANL], [DVT], [SoLuong], [DonGia]) VALUES (N'PDH03', N'NL004', N'cái', 50, 3000)
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH01', N'NL001', 2, 100, N'cái')
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH01', N'NL002', 3, 2, N'cái')
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH02', N'NL001', 2, 1, N'cái')
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH02', N'NL002', 2, 1, N'cái')
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH02', N'NL006', 2, 100, N'cái')
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH03', N'NL006', 10000, 100, N'cái')
INSERT [dbo].[QL_ChiTietPhieuNhan] ([MaPhieuNhan], [MaNL], [DonGia], [Soluong], [DonViTinh]) VALUES (N'PNH04', N'NL008', 25000, 6, N'cái')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020833768', N'ND01', CAST(N'2020-08-03' AS Date), N'Tiền Mặt', 150000, 0, 140000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020836474', N'ND01', CAST(N'2020-08-03' AS Date), N'Tiền Mặt', 100000, 60000, 40000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020839651', N'ND01', CAST(N'2020-08-03' AS Date), N'Tiền Mặt', 100000, 0, 80000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020843698', N'ND01', CAST(N'2020-08-04' AS Date), N'Tiền Mặt', 100000, 20000, 80000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020843731', N'ND01', CAST(N'2020-08-04' AS Date), N'Tiền Mặt', 80000, 0, 80000, N'KH002')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'20208446', N'ND01', CAST(N'2020-08-04' AS Date), N'Tiền Mặt', 60000, 0, 60000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020847237', N'ND01', CAST(N'2020-08-04' AS Date), N'Tiền Mặt', 100000, 0, 100000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020873569', N'ND01                                              ', CAST(N'2020-08-07' AS Date), N'Tiền Mặt', 100000, 0, 100000, N'KH0001')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020875744', N'ND01                                              ', CAST(N'2020-08-07' AS Date), N'Tiền Mặt', 1000000, 760000, 240000, N'KH0001')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020878238', N'ND01', CAST(N'2020-08-07' AS Date), N'Tiền Mặt', 300000, 50000, 260000, N'KH01')
INSERT [dbo].[QL_HoaDon_BanHang] ([MaHD], [MaND], [NgayLap], [PhuongThuc], [TienDua], [TienThua], [TongCong], [MAKH]) VALUES (N'2020879393', N'ND01                                              ', CAST(N'2020-08-07' AS Date), N'Tiền Mặt', 100000, 10000, 100000, N'KH01')
INSERT [dbo].[QL_HoaDon_NhapHang] ([MaHDNH], [MANCC], [NgayNhap], [TongTien], [MAND], [PhuongThuc], [TinhTrang], [GhiChu]) VALUES (N'PDH01', N'NCC001', CAST(N'2020-08-04' AS Date), 5000000.0000, N'ND02', N'Online', N'Đã thanh toán', NULL)
INSERT [dbo].[QL_HoaDon_NhapHang] ([MaHDNH], [MANCC], [NgayNhap], [TongTien], [MAND], [PhuongThuc], [TinhTrang], [GhiChu]) VALUES (N'PDH02', N'NCC001', CAST(N'2020-08-04' AS Date), 1572000.0000, N'ND01', N'Online', N'Chưa thanh toán', NULL)
INSERT [dbo].[QL_HoaDon_NhapHang] ([MaHDNH], [MANCC], [NgayNhap], [TongTien], [MAND], [PhuongThuc], [TinhTrang], [GhiChu]) VALUES (N'PDH03', N'NCC001', CAST(N'2020-08-07' AS Date), 450000.0000, N'ND01', N'Online', N'Chưa thanh toán', NULL)
INSERT [dbo].[QL_HoaDon_NhapHang] ([MaHDNH], [MANCC], [NgayNhap], [TongTien], [MAND], [PhuongThuc], [TinhTrang], [GhiChu]) VALUES (N'PDH04', N'NCC001', CAST(N'2020-08-08' AS Date), 0.0000, N'ND01', N'Online', N'Chưa thanh toán', NULL)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH0001', N'Chưa đăng ký', NULL, NULL, NULL)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH002', N'Hoàng Thái Thanh Nhàn', N'0933055917', N'0257890677', 0)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH003', N'Phạm Quang Huy', N'0834567891', N'0234764894', 0)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH004', N'Khưu Minh Triết', N'0987654678', N'0258650229', 0)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH006', N'SDRBGG', N'0901456789', N'7777777777', 0)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH007', N'Nguyễn Quang Sáng', N'0901456156', N'0258681639', 0)
INSERT [dbo].[QL_KHACHHANG] ([MaKH], [HoTen], [SDT], [CMND], [DiemSo]) VALUES (N'KH01', N'Võ Trung Nam', N'0938055917', N'0238055922', 10)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL01  ', N'Gà', N'ic_chicken.png                                    ', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL02  ', N'Heo', N'ic_pork.png                                       ', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL03  ', N'Cá', N'ic_fish.png                                       ', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL04  ', N'Đồ Hộp', N'ic_canned_food.png                                ', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL05  ', N'Bánh Mì', N'ic_bread.png                                      ', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL06  ', N'Xúc Xích', N'ic_sausage.png                                    ', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL07', N'Cà phê', N'ic_cafe.png', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL08', N'Trà sữa', N'ic_traSua.png', NULL)
INSERT [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAINL09', N'Sinh tố', N'ic_sinhto.png', NULL)
INSERT [dbo].[QL_LoaiSanPham] ([MaLoaiSP], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAISP01', N'Đồ Ăn', NULL, NULL)
INSERT [dbo].[QL_LoaiSanPham] ([MaLoaiSP], [TenLoai], [Hinh], [GhiChu]) VALUES (N'LOAISP02', N'Đồ uống', NULL, NULL)
INSERT [dbo].[QL_ManHinh] ([MaMH], [TenMH]) VALUES (N'MH01', N'Quanly')
INSERT [dbo].[QL_ManHinh] ([MaMH], [TenMH]) VALUES (N'MH02', N'Kho')
INSERT [dbo].[QL_ManHinh] ([MaMH], [TenMH]) VALUES (N'MH03', N'KhachHang')
INSERT [dbo].[QL_ManHinh] ([MaMH], [TenMH]) VALUES (N'MH04', N'TienBac')
INSERT [dbo].[QL_ManHinh] ([MaMH], [TenMH]) VALUES (N'MH05', N'POS')
INSERT [dbo].[QL_ManHinh] ([MaMH], [TenMH]) VALUES (N'MH06', N'BaoCao')
INSERT [dbo].[QL_NguoiDung] ([MaND], [TenNguoiDung], [SoDienThoai], [CMND], [DiaChi], [Email], [NgaySinh], [NgayVL], [MaNhom], [HoatDong], [Password]) VALUES (N'ND00', N'Hoàng Thái Thanh Nhàn', N'0975741463', N'00        ', N'TP.HCM', N'nhan@gmail.com', CAST(N'1999-02-02' AS Date), CAST(N'2020-02-07' AS Date), N'Nhom1', N'True      ', N'123456')
INSERT [dbo].[QL_NguoiDung] ([MaND], [TenNguoiDung], [SoDienThoai], [CMND], [DiaChi], [Email], [NgaySinh], [NgayVL], [MaNhom], [HoatDong], [Password]) VALUES (N'ND01', N'Võ Trung nam', N'0938055917', N'11        ', N'TP.HCM', N'nam@gmail.com', CAST(N'1999-10-31' AS Date), CAST(N'2020-01-07' AS Date), N'Nhom0', N'True      ', N'111222                                            ')
INSERT [dbo].[QL_NguoiDung] ([MaND], [TenNguoiDung], [SoDienThoai], [CMND], [DiaChi], [Email], [NgaySinh], [NgayVL], [MaNhom], [HoatDong], [Password]) VALUES (N'ND02', N'Nhàn', N'0995245234', N'22        ', N'TP.HCM', N'nhan@gmail.com', CAST(N'1999-07-08' AS Date), CAST(N'2020-02-09' AS Date), N'Nhom2', N'True      ', N'111222')
INSERT [dbo].[QL_NguoiDung] ([MaND], [TenNguoiDung], [SoDienThoai], [CMND], [DiaChi], [Email], [NgaySinh], [NgayVL], [MaNhom], [HoatDong], [Password]) VALUES (N'ND04', N'Minh Triết', N'0901468145', N'0258234786', N'TP.HCM', N'triet@gmail.com', CAST(N'1999-02-02' AS Date), CAST(N'2020-02-07' AS Date), N'Nhom1', NULL, N'111222')
INSERT [dbo].[QL_NguoiDung] ([MaND], [TenNguoiDung], [SoDienThoai], [CMND], [DiaChi], [Email], [NgaySinh], [NgayVL], [MaNhom], [HoatDong], [Password]) VALUES (N'ND05', N'Quang Minh', N'0908782648', N'0258747105', N'Đà Nẵng', N'quang@gmail.com', CAST(N'1999-02-02' AS Date), CAST(N'2020-02-07' AS Date), N'Nhom1', NULL, N'111222')
INSERT [dbo].[QL_NguoiDung] ([MaND], [TenNguoiDung], [SoDienThoai], [CMND], [DiaChi], [Email], [NgaySinh], [NgayVL], [MaNhom], [HoatDong], [Password]) VALUES (N'ND06', N'aaa', N'0000000000', N'1111111111', N'hcm', N'a@gmail.com', CAST(N'1999-02-02' AS Date), CAST(N'2020-02-07' AS Date), N'Nhom1', NULL, N'111111')
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL001                                             ', N'Đùi gà', N'cái', 100, N'LOAINL01  ', CAST(N'2020-10-10' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL002                                             ', N'Ức Gà', N'cái', 0, N'LOAINL01  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL003                                             ', N'Cánh Gà', N'cái', 10, N'LOAINL01  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL004                                             ', N'Ba rọi', N'cái', 100, N'LOAINL02  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL005                                             ', N'Thịt Heo Nạt', N'cái', 100, N'LOAINL02  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL006                                             ', N'Thịt Đùi', N'cái', 100, N'LOAINL02  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL007                                             ', N'Tai Heo', N'cái', 1000, N'LOAINL02  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL008', N'Xúc xích', N'cái', 10, N'LOAINL02  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL009', N'Xúc xích 2', N'cái', 100, N'LOAINL02 ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL10', N'Đùi gà', N'cái', 100, N'LOAINL01  ', CAST(N'2020-10-10' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL11', N'Đùi gà', N'cái', 100, N'LOAINL01  ', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL12', N'Cafe', N'ly', 300, N'LOAINL07', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL13', N'Trà sữa', N'ly', 300, N'LOAINL08', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL14', N'Lườn cá', N'miếng', 150, N'LOAINL03', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL15', N'Đầu cá', N'cái', 150, N'LOAINL03', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu] ([MaNL], [TenNL], [DVT], [SoLuong], [MaLoaiNL], [ThoiHan]) VALUES (N'NL16', N'Nước ép ', N'ly', NULL, N'LOAINL09', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP001', N'NL001', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP002     ', N'NL001                                             ', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP003     ', N'NL001                                             ', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP004     ', N'NL001             ', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP005     ', N'NL001', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP006     ', N'NL005', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP007     ', N'NL005', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP008     ', N'NL005', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP009     ', N'NL005', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP010', N'NL004', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP011', N'NL14', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP012', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP013', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP014', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP015', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP016', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP017', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP018', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP019', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP020', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP021', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP022', N'NL12', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP023', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP024', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP025', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP026', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP027', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP028', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP029', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP030', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP031', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP032', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP033', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP034', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP035', N'NL13', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP036', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP037', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP038', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP039', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP040', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP041', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP042', N'NL16', NULL)
INSERT [dbo].[QL_NguyenLieu_SanPham] ([MaSP], [MaNL], [SoLuong]) VALUES (N'SP043', N'NL16', NULL)
INSERT [dbo].[QL_NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (N'NCC001', N'Công Ty TNHH SX & TM MẠ 24H', N'656/96 Quang Trung, Phường 11, Q.Gò Vấp, TP. Hồ Chí Minh', N'0901303468', N'lienhe.ma24h@gmail.com')
INSERT [dbo].[QL_NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (N'NCC002', N'NGUYÊN HÀ FOOD ', N'14/7 Bis Kỳ Đồng , Phường 9 , Quận 3 , TP.Hồ Chí Minh', N'0902819653', N'kingmeat.info@gmail.com')
INSERT [dbo].[QL_NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (N'NCC003', N'CÔNG TY TNHH XUẤT NHẬP KHẨU THỰC PHẨM HỮU NGHỊ', N'9C10 KDC Nam Long, Hà Huy Giáp, KP3, p. Thạch Lộc, Q.12, TP. Hồ Chí Minh', N'0901892899', N'nghivan86@gmail.com')
INSERT [dbo].[QL_NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (N'NCC004', N'CÔNG TY TNHH SX - TM - DV IQFOODVN', N'Số 9 , Đường 44, Phường Hiệp Bình Chánh , Quận Thủ Đức , TP.Hồ Chí Minh', N'0937771877', N'iqfoodvietnam@gmail.com')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom]) VALUES (N'Nhom0', N'Quản Lý')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom]) VALUES (N'Nhom1', N'QL_Kho')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom]) VALUES (N'Nhom2', N'Thanh Toán')
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom0', N'MH01', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom0', N'MH02', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom0', N'MH03', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom0', N'MH04', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom0', N'MH05', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom0', N'MH06', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom1', N'MH01', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom1', N'MH02', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom1', N'MH03', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom1', N'MH04', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom1', N'MH05', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom1', N'MH06', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom2', N'MH01', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom2', N'MH02', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom2', N'MH03', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom2', N'MH04', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom2', N'MH05', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhom], [MaMH], [CoQuyen]) VALUES (N'Nhom2', N'MH06', 0)
INSERT [dbo].[QL_PhieuNhan] ([MaPhieuNhan], [MaHDNH], [NgayNhan], [TongTien]) VALUES (N'PNH01', N'PDH02', CAST(N'2020-08-04' AS Date), 206.0000)
INSERT [dbo].[QL_PhieuNhan] ([MaPhieuNhan], [MaHDNH], [NgayNhan], [TongTien]) VALUES (N'PNH02', N'PDH02', CAST(N'2020-08-04' AS Date), 204.0000)
INSERT [dbo].[QL_PhieuNhan] ([MaPhieuNhan], [MaHDNH], [NgayNhan], [TongTien]) VALUES (N'PNH03', N'PDH03', CAST(N'2020-08-07' AS Date), 1000000.0000)
INSERT [dbo].[QL_PhieuNhan] ([MaPhieuNhan], [MaHDNH], [NgayNhan], [TongTien]) VALUES (N'PNH04', N'PDH04', CAST(N'2020-08-08' AS Date), 150000.0000)
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP001     ', N'Đùi Gà Chiên Xù', N'Bán', 20000.0000, N'duigachien.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP002     ', N'Đùi Gà Chiên Nước Mắm', N'Bán', 20000.0000, N'duigachienncmam.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP003     ', N'Đùi Gà Chiên Sốt Cay', N'Bán', 20000.0000, N'gacay.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP004     ', N'Đùi Gà Chiên Phô Mai', N'Bán', 20000.0000, N'phomai.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP005     ', N'Đùi Gà Chiên Sốt Chua Ngọt', N'Bán', 20000.0000, N'sotchuangot.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP006     ', N'Thịt Heo Chiên Xù', N'Bán', 20000.0000, N'heochienxu.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP007     ', N'Cơm Thịt Heo Xào Hành', N'Bán', 20000.0000, N'heoxaohanh.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP008     ', N'Cơm Sườn Thịt Heo', N'Bán', 20000.0000, N'heoxaohanh.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP009     ', N'Sườn Ram Chua Ngọt', N'Bán', 20000.0000, N'suonram.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP010     ', N'Thịt Kho Trứng', N'Bán', 20000.0000, N'thitkhotrung.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP011     ', N'Cá Kho Thơm', N'Bán', 20000.0000, N'cakhothom.jpg', N'LOAISP01')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP012', N'Cà phê trứng', N'Bán', 20000.0000, N'cafetrung.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP013', N'Cà phê americano', N'Bán', 20000.0000, N'americano.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP014', N'Cà phê arabica', N'Bán', 20000.0000, N'arabica.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP015', N'Trà sữa Cheese milk foam', N'Bán', 20000.0000, N'cheesemilkfoam.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP016', N'Cà phê cappuchino', N'Bán', 20000.0000, N'cappuchino.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP017', N'Trà sữa Earl Grey', N'Bán', 20000.0000, N'earlgrey.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP018', N'Cà phê Espresso', N'Bán', 20000.0000, N'espresso.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP019', N'Cà phê Culi', N'Bán', 20000.0000, N'culi.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP020', N'Cà phê Macchiato', N'Bán', 20000.0000, N'macchiato.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP021', N'Cà phê Mocha', N'Bán', 20000.0000, N'mocha.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP022', N'Cà phê Moka', N'Bán', 20000.0000, N'moka.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP023', N'Lục trà sữa', N'Bán', 20000.0000, N'luctrasua.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP024', N'Trà sữa oreo cake cream', N'Bán', 20000.0000, N'oreo.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP025', N'Trà sữa oreo chocolate cream', N'Bán', 20000.0000, N'oreochocolatecream.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP026', N'Cà phê Robusta', N'Bán', 20000.0000, N'robusta.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP027', N'Trà sữa pudding đậu đỏ', N'Bán', 20000.0000, N'puddingdaudo.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP028', N'Trà sữa pudding chocolate', N'Bán', 20000.0000, N'puddingchocolate.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP029', N'Trà sữa pudding trứng', N'Bán', 20000.0000, N'puddingtrung.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP030', N'Trà sữa trân châu trắng', N'Bán', 20000.0000, N'tranchautrang.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP031', N'Trà sữa khoai môn', N'Bán', 20000.0000, N'trasuakhoaimon.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP032', N'Trà sữa trân châu đường đen', N'Bán', 20000.0000, N'tranchauduongden.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP033', N'Trà sữa xoài kem cheese', N'Bán', 20000.0000, N'xoaikemcheese.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP034', N'Trà sữa sương sáo', N'Bán', 20000.0000, N'trasuasuongsao.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP035', N'Trà sữa matcha', N'Bán', 20000.0000, N'trasuamatcha.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP036', N'Sinh tố kiwi', N'Bán', 20000.0000, N'sinhtokiwi.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP037', N'Sinh tố bơ', N'Bán', 20000.0000, N'sinhtobo.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP038', N'Sinh tố cam chuối', N'Bán', 20000.0000, N'sinhtocamchuoi.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP039', N'Sinh tố đu đủ', N'Bán', 20000.0000, N'sinhtodudu.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP040', N'Sinh tố dâu tây', N'Bán', 20000.0000, N'sinhtodautay.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP041', N'Sinh tố chuối xoài', N'Bán', 20000.0000, N'sinhtochuoixoai.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP042', N'Sinh tố bí đỏ cà rốt', N'Bán', 20000.0000, N'sinhtobidocarot.jpg', N'LOAISP02')
INSERT [dbo].[QL_SanPham] ([MaSP], [TenSanPham], [TinhTrang], [Gia], [Hinh], [MaLoaiSP]) VALUES (N'SP043', N'Sinh tố rau má', N'Bán', 20000.0000, N'sinhtorauma.jpg', N'LOAISP02')
ALTER TABLE [dbo].[QL_ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_QL_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[QL_HoaDon_BanHang] ([MaHD])
GO
ALTER TABLE [dbo].[QL_ChiTietHoaDon] CHECK CONSTRAINT [FK_QL_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[QL_ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_QL_ChiTietHoaDon_QL_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[QL_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[QL_ChiTietHoaDon] CHECK CONSTRAINT [FK_QL_ChiTietHoaDon_QL_SanPham]
GO
ALTER TABLE [dbo].[QL_ChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_QL_ChiTietNhapHang_NguyenLieu] FOREIGN KEY([MANL])
REFERENCES [dbo].[QL_NguyenLieu] ([MaNL])
GO
ALTER TABLE [dbo].[QL_ChiTietNhapHang] CHECK CONSTRAINT [FK_QL_ChiTietNhapHang_NguyenLieu]
GO
ALTER TABLE [dbo].[QL_ChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_QL_ChiTietNhapHang_QL_HoaDon_NhapHang] FOREIGN KEY([MAHDNH])
REFERENCES [dbo].[QL_HoaDon_NhapHang] ([MaHDNH])
GO
ALTER TABLE [dbo].[QL_ChiTietNhapHang] CHECK CONSTRAINT [FK_QL_ChiTietNhapHang_QL_HoaDon_NhapHang]
GO
ALTER TABLE [dbo].[QL_ChiTietPhieuNhan]  WITH CHECK ADD  CONSTRAINT [FK_QL_ChiTietPhieuNhan_QL_PhieuNhan] FOREIGN KEY([MaPhieuNhan])
REFERENCES [dbo].[QL_PhieuNhan] ([MaPhieuNhan])
GO
ALTER TABLE [dbo].[QL_ChiTietPhieuNhan] CHECK CONSTRAINT [FK_QL_ChiTietPhieuNhan_QL_PhieuNhan]
GO
ALTER TABLE [dbo].[QL_HoaDon_BanHang]  WITH CHECK ADD  CONSTRAINT [FK_QL_HoaDon_BanHang_QL_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[QL_KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[QL_HoaDon_BanHang] CHECK CONSTRAINT [FK_QL_HoaDon_BanHang_QL_KHACHHANG]
GO
ALTER TABLE [dbo].[QL_HoaDon_BanHang]  WITH CHECK ADD  CONSTRAINT [FK_QL_HoaDon_BanHang_QL_NguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[QL_NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[QL_HoaDon_BanHang] CHECK CONSTRAINT [FK_QL_HoaDon_BanHang_QL_NguoiDung]
GO
ALTER TABLE [dbo].[QL_HoaDon_NhapHang]  WITH CHECK ADD  CONSTRAINT [FK_QL_HoaDon_NhapHang_QL_NguoiDung] FOREIGN KEY([MAND])
REFERENCES [dbo].[QL_NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[QL_HoaDon_NhapHang] CHECK CONSTRAINT [FK_QL_HoaDon_NhapHang_QL_NguoiDung]
GO
ALTER TABLE [dbo].[QL_HoaDon_NhapHang]  WITH CHECK ADD  CONSTRAINT [FK_QL_HoaDon_NhapHang_QL_NhaCungCap] FOREIGN KEY([MANCC])
REFERENCES [dbo].[QL_NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[QL_HoaDon_NhapHang] CHECK CONSTRAINT [FK_QL_HoaDon_NhapHang_QL_NhaCungCap]
GO
ALTER TABLE [dbo].[QL_NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_QL_NguoiDung_QL_NhomNguoiDung] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[QL_NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[QL_NguoiDung] CHECK CONSTRAINT [FK_QL_NguoiDung_QL_NhomNguoiDung]
GO
ALTER TABLE [dbo].[QL_NguyenLieu]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_QL_LoaiNguyenLieu] FOREIGN KEY([MaLoaiNL])
REFERENCES [dbo].[QL_LoaiNguyenLieu] ([MaLoaiNL])
GO
ALTER TABLE [dbo].[QL_NguyenLieu] CHECK CONSTRAINT [FK_NguyenLieu_QL_LoaiNguyenLieu]
GO
ALTER TABLE [dbo].[QL_NguyenLieu_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_QL_NguyenLieu_SanPham_NguyenLieu] FOREIGN KEY([MaNL])
REFERENCES [dbo].[QL_NguyenLieu] ([MaNL])
GO
ALTER TABLE [dbo].[QL_NguyenLieu_SanPham] CHECK CONSTRAINT [FK_QL_NguyenLieu_SanPham_NguyenLieu]
GO
ALTER TABLE [dbo].[QL_NguyenLieu_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_QL_NguyenLieu_SanPham_QL_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[QL_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[QL_NguyenLieu_SanPham] CHECK CONSTRAINT [FK_QL_NguyenLieu_SanPham_QL_SanPham]
GO
ALTER TABLE [dbo].[QL_PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyen_QL_ManHinh] FOREIGN KEY([MaMH])
REFERENCES [dbo].[QL_ManHinh] ([MaMH])
GO
ALTER TABLE [dbo].[QL_PhanQuyen] CHECK CONSTRAINT [FK_QL_PhanQuyen_QL_ManHinh]
GO
ALTER TABLE [dbo].[QL_PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyen_QL_NhomNguoIDung] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[QL_NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[QL_PhanQuyen] CHECK CONSTRAINT [FK_QL_PhanQuyen_QL_NhomNguoIDung]
GO
ALTER TABLE [dbo].[QL_PhieuNhan]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhieuNhan_QL_HoaDon_NhapHang] FOREIGN KEY([MaHDNH])
REFERENCES [dbo].[QL_HoaDon_NhapHang] ([MaHDNH])
GO
ALTER TABLE [dbo].[QL_PhieuNhan] CHECK CONSTRAINT [FK_QL_PhieuNhan_QL_HoaDon_NhapHang]
GO
ALTER TABLE [dbo].[QL_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_QL_SanPham_QL_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[QL_LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[QL_SanPham] CHECK CONSTRAINT [FK_QL_SanPham_QL_LoaiSanPham]
GO
USE [master]
GO
ALTER DATABASE [DAMN_QuanLyCaPhe] SET  READ_WRITE 
GO
