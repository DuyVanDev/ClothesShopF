USE [master]
GO
/****** Object:  Database [ClothesShop]    Script Date: 12/26/2023 8:01:54 PM ******/
CREATE DATABASE [ClothesShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClothesShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClothesShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClothesShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClothesShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClothesShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClothesShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClothesShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClothesShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClothesShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClothesShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClothesShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClothesShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClothesShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClothesShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClothesShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClothesShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClothesShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClothesShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClothesShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClothesShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClothesShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClothesShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClothesShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClothesShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClothesShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClothesShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClothesShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClothesShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClothesShop] SET  MULTI_USER 
GO
ALTER DATABASE [ClothesShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClothesShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClothesShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClothesShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClothesShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClothesShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClothesShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClothesShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClothesShop]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] NOT NULL,
	[AdminName] [nvarchar](20) NULL,
	[AdminAddress] [nvarchar](30) NULL,
	[AdminPhone] [nchar](10) NULL,
	[UserName] [nchar](20) NULL,
	[Password] [nchar](30) NULL,
	[Type] [nvarchar](20) NULL,
	[EmailAdmin] [nchar](30) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](20) NULL,
	[CategoryLink] [varchar](20) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[ProductId] [int] NULL,
	[UserName] [nchar](20) NULL,
	[ParentID] [int] NULL,
	[Rate] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](20) NULL,
	[Address] [nvarchar](30) NULL,
	[BirthDay] [smalldatetime] NULL,
	[UserName] [nchar](20) NOT NULL,
	[Password] [varchar](50) NULL,
	[Email] [nchar](30) NULL,
	[Phone] [varchar](10) NULL,
	[ResetPasswordCode] [char](30) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[OrderDate] [smalldatetime] NULL,
	[DeliveryDate] [smalldatetime] NULL,
	[Address] [nvarchar](50) NULL,
	[Recipient] [nvarchar](20) NULL,
	[RecipientPhone] [nchar](10) NULL,
	[OrderState] [bit] NULL,
	[OrderPrice] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](9, 2) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[Description] [ntext] NULL,
	[Price] [money] NULL,
	[Image] [nchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 12/26/2023 8:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Voucherid] [nchar](10) NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[Voucherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([AdminId], [AdminName], [AdminAddress], [AdminPhone], [UserName], [Password], [Type], [EmailAdmin]) VALUES (1, N'duy', N'dongnai', N'0123654879', N'vanduy              ', N'vanduy                        ', N'1', N'chuhaist123@gmail.com         ')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryLink]) VALUES (1, N'Áo thun', N'aothun')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryLink]) VALUES (2, N'Áo sơ mi', N'aosomi')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryLink]) VALUES (3, N'Đầm', N'dam')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryLink]) VALUES (4, N'Quần', N'quan')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryLink]) VALUES (5, N'Đồ bơi', N'doboi')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryLink]) VALUES (6, N'Áo khoác', N'aokhoac')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [CommentMsg], [CommentDate], [ProductId], [UserName], [ParentID], [Rate], [CustomerId]) VALUES (15, N'a', CAST(N'2023-12-20T15:34:30.897' AS DateTime), 4, N'duy                 ', 0, 5, 1)
INSERT [dbo].[Comments] ([ID], [CommentMsg], [CommentDate], [ProductId], [UserName], [ParentID], [Rate], [CustomerId]) VALUES (16, N'va', CAST(N'2023-12-20T15:37:33.917' AS DateTime), 4, N'duy                 ', 0, 5, 1)
INSERT [dbo].[Comments] ([ID], [CommentMsg], [CommentDate], [ProductId], [UserName], [ParentID], [Rate], [CustomerId]) VALUES (17, N'Đẹp', CAST(N'2023-12-20T15:57:09.140' AS DateTime), 4, N'duy                 ', 0, 5, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [Address], [BirthDay], [UserName], [Password], [Email], [Phone], [ResetPasswordCode]) VALUES (1, N'duy', N'Binh Duong', CAST(N'2002-02-01T00:00:00' AS SmallDateTime), N'duy                 ', N'93198218582232322042414012215219216824768150', N'duy@gmail.com                 ', N'0123654879', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (1, 1, CAST(N'2023-12-18T09:22:00' AS SmallDateTime), CAST(N'2023-12-19T00:00:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (2, 1, CAST(N'2023-12-18T09:25:00' AS SmallDateTime), CAST(N'2023-12-19T00:00:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (3, 1, CAST(N'2023-12-18T10:40:00' AS SmallDateTime), CAST(N'2023-12-19T00:00:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (4, 1, CAST(N'2023-12-18T10:41:00' AS SmallDateTime), CAST(N'2023-12-27T00:00:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (5, 1, CAST(N'2023-12-18T10:46:00' AS SmallDateTime), CAST(N'2023-12-19T00:00:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, 1000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (6, 1, CAST(N'2023-12-19T19:27:00' AS SmallDateTime), CAST(N'2023-12-20T00:00:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, 31000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (7, 1, CAST(N'2023-12-19T19:54:00' AS SmallDateTime), NULL, N'ád', NULL, N'0123654879', NULL, 31000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (8, 1, CAST(N'2023-12-19T21:55:00' AS SmallDateTime), NULL, N'ád', NULL, N'0123654879', NULL, 31000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (9, 1, CAST(N'2023-12-20T11:08:00' AS SmallDateTime), NULL, N'ád', NULL, N'0123654879', NULL, 31000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (10, 1, CAST(N'2023-12-20T11:16:00' AS SmallDateTime), CAST(N'2023-12-23T11:16:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, 33000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (11, 1, CAST(N'2023-12-20T11:19:00' AS SmallDateTime), CAST(N'2023-12-23T11:19:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, 32000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (12, 1, CAST(N'2023-12-20T15:10:00' AS SmallDateTime), CAST(N'2023-12-23T15:10:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, 348000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (13, 1, CAST(N'2023-12-20T15:12:00' AS SmallDateTime), CAST(N'2023-12-23T15:12:00' AS SmallDateTime), N'ád', NULL, N'0123654879', NULL, 348000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (14, 1, CAST(N'2023-12-20T15:58:00' AS SmallDateTime), CAST(N'2023-12-23T15:58:00' AS SmallDateTime), N'Binh Duong', NULL, N'0123654879', NULL, 190000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (15, 1, CAST(N'2023-12-20T16:40:00' AS SmallDateTime), CAST(N'2023-12-23T16:40:00' AS SmallDateTime), N'Binh Duong', NULL, N'0123654879', NULL, 110000.0000)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [OrderDate], [DeliveryDate], [Address], [Recipient], [RecipientPhone], [OrderState], [OrderPrice]) VALUES (16, 1, CAST(N'2023-12-20T16:41:00' AS SmallDateTime), CAST(N'2023-12-23T16:41:00' AS SmallDateTime), N'Binh Duong', NULL, N'0123654879', NULL, 270000.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (14, 4, CAST(160000.00 AS Decimal(9, 2)), 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (15, 4, CAST(80000.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (16, 4, CAST(240000.00 AS Decimal(9, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Price], [Image], [CategoryId]) VALUES (4, N'Áo sơ mi trắng', N'Áo sơ mi dài tay với cổ buộc dây nơ làm điểm nhấn, form áo vừa vặn thoải mái và tôn dáng. ', 80000.0000, N'somi.jpg                                          ', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Price], [Image], [CategoryId]) VALUES (5, N'Quần jogger xám', N'Quần jogger&nbsp;là một mẫu&nbsp;quần&nbsp;thể thao với form dáng thoải mái cùng các chất liệu dễ thấm hút mồ hôi như thun, kaki hay nỉ.

', 80000.0000, N'quan.jpg                                          ', 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Price], [Image], [CategoryId]) VALUES (6, N'Váy đen', N'Váy đầm&nbsp;dạ hội ôm body xứng đáng là một trong những item tuyệt vời nhất của phái đẹp.

', 200000.0000, N'váy.jpg                                           ', 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Price], [Image], [CategoryId]) VALUES (7, N'Áo thun trắng', N'Áo thun&nbsp;là loại áo được làm từ vải bông, khác với áo sơ mi được làm từ vải dệt kim hoặc vải thoi. Chất liệu vải bông khiến áo thun có cảm giác mềm mại và linh hoạt hơn.

', 80000.0000, N'aothun.jpg                                        ', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Description], [Price], [Image], [CategoryId]) VALUES (9, N'Áo khoác bomber', N'Áo khoác là loại áo được làm từ vải bông, khác với áo sơ mi được làm từ vải dệt kim hoặc vải thoi. Chất liệu vải bông khiến áo thun có cảm giác mềm mại và linh hoạt hơn.</p>
</p></p></p> </p> ', 150000.0000, N'aokhoac.jpg                                       ', 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Customer]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [ClothesShop] SET  READ_WRITE 
GO
