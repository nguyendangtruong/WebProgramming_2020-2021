USE [WebShopHocTap]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/16/2021 16:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Order] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreateDate], [Order], [Status]) VALUES (1, N'Điện máy', N'May LapTop', 0, CAST(0x0000ACF300000000 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreateDate], [Order], [Status]) VALUES (2, N'Điện thoại', N'Dien thoai', 1, CAST(0x0000ACF300000000 AS DateTime), 2, 1)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreateDate], [Order], [Status]) VALUES (3, N'Máy tính', N'hang my pham', 1, CAST(0x0000AB7300000000 AS DateTime), 3, 1)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreateDate], [Order], [Status]) VALUES (4, N'Hàng thực phẩm', N'hang thuc pham', 0, CAST(0x0000AB7300000000 AS DateTime), 4, 1)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreateDate], [Order], [Status]) VALUES (5, N'Hàng Công nghệ', N'hang cong nghe', 0, CAST(0x0000ACF400000000 AS DateTime), 5, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 04/16/2021 16:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [varchar](20) NOT NULL,
	[PassWord] [varchar](20) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([UserName], [PassWord]) VALUES (N'admin', N'admin')
/****** Object:  StoredProcedure [dbo].[SP_Account_Login]    Script Date: 04/16/2021 16:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Account_Login]
    @UserName VARCHAR(20) ,
    @PassWord VARCHAR(20)
AS
    BEGIN
        DECLARE @count INT;
        DECLARE @res BIT;
        SELECT  @count = COUNT(*)
        FROM    dbo.Account
        WHERE   UserName = @UserName
                AND PassWord = @PassWord;
        IF @count > 0
            SET @res = 1;
        ELSE
            SET @res = 0;
        SELECT  @res;	
    END;
GO
/****** Object:  StoredProcedure [dbo].[PSP_Category_Select]    Script Date: 04/16/2021 16:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_Category_Select]
AS
SELECT ID, Name, Alias, ParentID, CreateDate, [Order], [Status]
FROM dbo.Category
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/16/2021 16:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Alias] [varchar](500) NULL,
	[CategoryID] [int] NULL,
	[Images] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Name], [Alias], [CategoryID], [Images], [CreateDate], [Price], [Detail], [Status]) VALUES (1, N'Máy giặt 9kg Aqua', N'May giat 9kg Aqua', 1, N'MaygiatAqua.jpg', CAST(0x0000ACF900000000 AS DateTime), CAST(9000000 AS Decimal(18, 0)), N'Khối lượng giặt 8.5 kg dành cho những gia đình có 3 - 5 thành viên. Máy vận hành êm ái với động cơ truyền động trực tiếp Tiết kiệm diện tích, dễ dàng lấy quần áo, chăn mền lớn với lồng giặt 525 mm. Diệt khuẩn, làm mềm quần áo với công nghệ giặt nước nóng', 1)
INSERT [dbo].[Product] ([ID], [Name], [Alias], [CategoryID], [Images], [CreateDate], [Price], [Detail], [Status]) VALUES (2, N'Laptop Lenovo IdeaPad S145 15IIL i3 1005G1/4GB/256GB/Win10 (81W8001XVN)', N'Laptop Lenovo IdeaPad S145 15IIL i3 1005G1/4GB/256GB/Win10 (81W8001XVN)', 3, N'acer-aspire-a315-56-308n-i3-nxhs5sv00c2.jpg', CAST(0x0000ACF900000000 AS DateTime), CAST(10340000 AS Decimal(18, 0)), N'Laptop Lenovo IdeaPad S145 15IIL i3 (81W8001XVN) là chiếc máy tính xách tay học tập văn phòng có cấu hình đủ dùng, ngoại hình sang trọng, mỏng nhẹ cơ động. Máy được trang bị ổ cứng SSD cùng với màn hình 15.6 inch chuẩn Full HD rõ nét.', 1)
INSERT [dbo].[Product] ([ID], [Name], [Alias], [CategoryID], [Images], [CreateDate], [Price], [Detail], [Status]) VALUES (3, N'Laptop Acer Aspire A315 56 308N i3 1005G1/4GB/256GB/Win10 (NX.HS5SV.00C', N'Laptop Acer Aspire A315 56 308N i3 1005G1/4GB/256GB/Win10 (NX.HS5SV.00C', 3, N'lenovo-ideapad-s145-81w8001xvn-a4-216292-600x600.jpg', CAST(0x0000ACF900000000 AS DateTime), CAST(11300000 AS Decimal(18, 0)), N'Laptop Acer Aspire A315 56 308N i3 (NX.HS5SV.00C) thiết kế gọn nhẹ cùng hiệu năng xử lý tốt có thể đáp ứng nhu cầu sử dụng của các bạn sinh viên cũng như nhân viên văn phòng trong cả một ngày.', 1)
INSERT [dbo].[Product] ([ID], [Name], [Alias], [CategoryID], [Images], [CreateDate], [Price], [Detail], [Status]) VALUES (4, N'Điện thoại iPhone 12 64GB', N'Dien thoai iPhone 12 64GB', 2, N'iphone-12-xanh-duong-new-600x600-600x600.jpg', CAST(0x0000ACEE00000000 AS DateTime), CAST(22900000 AS Decimal(18, 0)), N'Cùng chào đón iPhone 12 64 GB, chiếc điện thoại được ra mắt với nhiều sự nâng cấp. Từ thiết kế sang chảnh cho đến con chip Apple A14 Bionic mang năng lượng hoạt động mạnh mẽ bên trong đầy hứa hẹn.', 1)
INSERT [dbo].[Product] ([ID], [Name], [Alias], [CategoryID], [Images], [CreateDate], [Price], [Detail], [Status]) VALUES (5, N'Điện thoại Samsung Galaxy S21 Ultra 5G 128GB', N'Dien thoai Samsung Galaxy S21 Ultra 5G 128GB', 2, N'samsung-galaxy-note-20-ultra-5g-051920-101934-600x600.jpg', CAST(0x0000ACDD00000000 AS DateTime), CAST(34000000 AS Decimal(18, 0)), N'Ngay từ ngày đầu phát hành, Samsung Galaxy S21 Ultra 5G đã nhanh chóng chiếm lấy cảm tình của người dùng bởi sức mạnh vượt trội từ chipset Exynos 2100, khả năng nhiếp ảnh siêu đỉnh cùng màn hình lớn sống động giúp chiếc smartphone nhà Samsung khẳng định vị thế của mình trên phân khúc thị trường cao cấp', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Default [DF_Category_Status]    Script Date: 04/16/2021 16:13:05 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  ForeignKey [FK_Product_Category]    Script Date: 04/16/2021 16:13:05 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
