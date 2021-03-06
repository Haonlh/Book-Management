USE [BookStore]
GO
ALTER TABLE [dbo].[tblUsers] DROP CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT [FK_tblProducts_tlbCategories]
GO
ALTER TABLE [dbo].[tblOrders] DROP CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblOrders] DROP CONSTRAINT [FK_tblOrders_tblDiscount]
GO
ALTER TABLE [dbo].[tblOrderDetails] DROP CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrderDetails] DROP CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
/****** Object:  Table [dbo].[tlbCategories]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tlbCategories]') AND type in (N'U'))
DROP TABLE [dbo].[tlbCategories]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsers]') AND type in (N'U'))
DROP TABLE [dbo].[tblUsers]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRoles]') AND type in (N'U'))
DROP TABLE [dbo].[tblRoles]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducts]') AND type in (N'U'))
DROP TABLE [dbo].[tblProducts]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblOrders]') AND type in (N'U'))
DROP TABLE [dbo].[tblOrders]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblOrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tblOrderDetails]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 06/11/2021 11:12:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDiscount]') AND type in (N'U'))
DROP TABLE [dbo].[tblDiscount]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountID] [varchar](10) NOT NULL,
	[discountDescription] [varchar](50) NULL,
	[percentDiscount] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nchar](10) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](30) NOT NULL,
	[discountID] [varchar](10) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productImg] [varchar](max) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [nchar](10) NOT NULL,
	[description] [nvarchar](200) NULL,
	[author] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlbCategories]    Script Date: 06/11/2021 11:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlbCategories](
	[categoryID] [nchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tlbCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'123', N'Summer', 0.15000000596046448, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'Hao', N'discount 40', 0.6, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'Hao321', N'Fall', 0.11999999731779099, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'HaoHao', N'Morning', 0.11999999731779099, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'Hien', N'VIP Customer', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'HoaHoa', N'aaa', 0.11999999731779099, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'OUT', N'giam gia 50 phan tram', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SPRING', N'giam gia 15 phan tram', 0.15, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUM', N'giam gia 20 phan tram', 0.2, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUMM', N'giam gia 50', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'VND', N'giam gia 50', 0.5, 1)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 1, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 2, N'P01       ', 180, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 2, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 2, N'P02       ', 222, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 2, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 2, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 3, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 3, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 4, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 4, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 5, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 5, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 6, N'P03       ', 300, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 6, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (15, 6, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (16, 7, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (17, 7, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (18, 7, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (19, 8, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (20, 9, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (21, 9, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (22, 9, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (23, 10, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (24, 13, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (25, 14, N'P01       ', 200, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (26, 14, N'P44       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (27, 14, N'P05       ', 500, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (28, 14, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (29, 14, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (30, 15, N'P01       ', 200, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (31, 15, N'P05       ', 500, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (32, 15, N'P04       ', 400, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (33, 15, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (34, 16, N'P01       ', 200, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (35, 16, N'P44       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (36, 17, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (37, 17, N'P04       ', 400, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (38, 17, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (39, 17, N'P09       ', 900, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (40, 17, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (41, 18, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (42, 18, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (43, 19, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (44, 19, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (45, 19, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (46, 19, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (47, 20, N'P14       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (48, 20, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (49, 20, N'P04       ', 400, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (50, 20, N'P17       ', 234, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (51, 21, N'P03       ', 300, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (52, 21, N'P02       ', 222, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (53, 21, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (54, 22, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (55, 22, N'P14       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (56, 22, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (57, 23, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (58, 23, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (59, 23, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (60, 23, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (61, 24, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (62, 24, N'P02       ', 222, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (63, 24, N'P04       ', 400, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (64, 24, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (65, 25, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (66, 25, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (67, 25, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (68, 25, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (69, 26, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (70, 26, N'P14       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (71, 26, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (72, 26, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (73, 26, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (74, 27, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (75, 27, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (76, 27, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (77, 27, N'P10       ', 1000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (78, 28, N'P44       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (79, 28, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (80, 28, N'P06       ', 600, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (81, 29, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (82, 29, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (83, 30, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (84, 30, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (85, 31, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (86, 31, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (87, 32, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (88, 32, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (89, 33, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (90, 33, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (91, 34, N'P05       ', 500, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (92, 34, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (93, 34, N'P08       ', 800, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (94, 35, N'P12       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (95, 35, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (96, 35, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (97, 35, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (98, 36, N'P05       ', 500, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (99, 36, N'P06       ', 600, 1)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (100, 36, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (101, 37, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (102, 37, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (103, 37, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (104, 37, N'P10       ', 1000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (105, 38, N'P01       ', 200, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (106, 38, N'P05       ', 500, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (107, 38, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (108, 39, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (109, 39, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (110, 39, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (111, 40, N'P10       ', 1000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (112, 40, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (113, 40, N'P12       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (114, 40, N'P11       ', 100, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (115, 40, N'P14       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (116, 40, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (117, 40, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (118, 40, N'P13       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (119, 40, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (120, 40, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (121, 40, N'P17       ', 234, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (122, 40, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (123, 40, N'P08       ', 800, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (124, 41, N'P03       ', 300, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (125, 41, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (126, 41, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (127, 42, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (128, 42, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (129, 42, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (130, 42, N'P04       ', 400, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (131, 43, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (132, 43, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (133, 43, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (134, 43, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (135, 44, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (136, 44, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (137, 44, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (138, 45, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (139, 45, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (140, 45, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (141, 45, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (142, 46, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (143, 46, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (144, 47, N'P01       ', 200, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (145, 47, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (146, 47, N'P06       ', 600, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (147, 48, N'P01       ', 200, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (148, 48, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (149, 48, N'P02       ', 222, 11)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (1, N'khoa1                         ', NULL, CAST(N'2021-05-16' AS Date), 222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (2, N'khoa1                         ', NULL, CAST(N'2021-05-16' AS Date), 1824)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (3, N'khoa1                         ', NULL, CAST(N'2021-05-21' AS Date), 104.40000152587892)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (4, N'khoa1                         ', NULL, CAST(N'2021-05-21' AS Date), 522)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (5, N'khoa2                         ', N'SUM', CAST(N'2021-05-21' AS Date), 124.40000152587892)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (6, N'khoa1                         ', NULL, CAST(N'2021-05-23' AS Date), 1222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (7, N'khoa3                         ', NULL, CAST(N'2021-05-23' AS Date), 922)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (8, N'khoa3                         ', NULL, CAST(N'2021-05-23' AS Date), 300)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (9, N'khoa4                         ', N'SUM', CAST(N'2021-05-24' AS Date), 737.5999755859375)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (10, N'khoa1                         ', NULL, CAST(N'2021-05-24' AS Date), 222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (13, N'khoa4                         ', N'OUT', CAST(N'2021-05-24' AS Date), 200)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (14, N'khoa1                         ', N'Hao', CAST(N'2021-06-08' AS Date), 1199.9998779296875)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (15, N'Hao2                          ', N'VND', CAST(N'2021-06-08' AS Date), 1700)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (16, N'Hao2                          ', NULL, CAST(N'2021-06-08' AS Date), 600)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (17, N'Hao2                          ', NULL, CAST(N'2021-06-08' AS Date), 3600)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (18, N'Hao2                          ', NULL, CAST(N'2021-06-08' AS Date), 722)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (19, N'Hao2                          ', N'SPRING', CAST(N'2021-06-09' AS Date), 1378.699951171875)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (20, N'Hao2                          ', N'Hao321', CAST(N'2021-06-09' AS Date), 1877.9200439453125)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (21, N'Hao2                          ', NULL, CAST(N'2021-06-09' AS Date), 1666)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (22, N'Hao2                          ', NULL, CAST(N'2021-06-09' AS Date), 922)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (23, N'Hao2                          ', NULL, CAST(N'2021-06-09' AS Date), 1422)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (24, N'Hao1                          ', N'Hao', CAST(N'2021-06-09' AS Date), 946.39996337890625)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (25, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 1722)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (26, N'Hao1                          ', N'SUMM', CAST(N'2021-06-09' AS Date), 911)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (27, N'Hao2                          ', N'HaoHao', CAST(N'2021-06-09' AS Date), 2552)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (28, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 3100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (29, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 1100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (30, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 1100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (31, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 1300)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (32, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 1100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (33, N'Hao2                          ', NULL, CAST(N'2021-06-09' AS Date), 1100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (34, N'Hao2                          ', N'Hien', CAST(N'2021-06-09' AS Date), 2100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (35, N'Hao1                          ', NULL, CAST(N'2021-06-09' AS Date), 2100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (36, N'Hao2                          ', N'Hao', CAST(N'2021-06-09' AS Date), 1159.9998779296875)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (37, N'Hao2                          ', N'Hien', CAST(N'2021-06-09' AS Date), 1450)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (38, N'Hao2                          ', NULL, CAST(N'2021-06-09' AS Date), 2000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (39, N'Hao1                          ', NULL, CAST(N'2021-06-10' AS Date), 922)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (40, N'Hao2                          ', N'Hao', CAST(N'2021-06-10' AS Date), 2502.39990234375)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (41, N'Hao1                          ', NULL, CAST(N'2021-06-10' AS Date), 1822)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (42, N'Hao2                          ', N'Hien', CAST(N'2021-06-10' AS Date), 761)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (43, N'Hao2                          ', NULL, CAST(N'2021-06-10' AS Date), 1122)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (44, N'Hao2                          ', N'Hao321', CAST(N'2021-06-10' AS Date), 635.3599853515625)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (45, N'Hao123                        ', NULL, CAST(N'2021-06-10' AS Date), 1322)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (46, N'Hao2                          ', NULL, CAST(N'2021-06-10' AS Date), 422)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (47, N'Hao2                          ', NULL, CAST(N'2021-06-10' AS Date), 1100)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (48, N'Hao2                          ', NULL, CAST(N'2021-06-10' AS Date), 3342)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P01       ', N'Đắc nhân tâm', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpKINWvkuVpSjssADsfqq7z1u5PSEQq-Zrlk4eWBqMv3YRbgBVkBgZ2hc_HQmpMLAECW_1XQvm&usqp=CAc', 200, 1, N'C01       ', N'uốn sách Đắc Nhân Tâm của tác giả Dale Carnegie. Đây là cuốn sách duy nhất về thể loại self-help và liên tục đứng', N'Dale Carnegie')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P02       ', N'Nhà giã kim', N'https://upload.wikimedia.org/wikipedia/vi/archive/9/9c/20210321112709%21Nh%C3%A0_gi%E1%BA%A3_kim_%28s%C3%A1ch%29.jpg', 222, 3, N'C01       ', N'Cơ Thể Tuổi Dậy Thì Một phút trước bạn vẫn còn là chú vịt con “xấu xí”, đến phút thứ hai thì đã biến thành nàng thiên nga xinh đẹp', N'Tom Holland')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P03       ', N'Hành trình', N'https://cf.shopee.vn/file/099fa37e7f9124e1ff10d117dc63b954', 300, 5, N'C01       ', N'Thì thầm chuyện nhỏ chuyện to là cuốn sách tập hợp những bài viết và những lời “tâm sự mỏng” từ những năm tháng tác giả ', N'Tom Cruise')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P04       ', N'Tam Quốc', N'https://www.dtv-ebook.com/images/truyen-online/ebook-giai-ma-truyen-tay-du-ky-full-prc-pdf-epub-azw3.jpg', 400, 351, N'C02       ', N'Quan tâm đến một chế độ ăn uống lành mạnh, đầy đủ dưỡng chất cho cơ thể', N'Vin Diiesal ')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P05       ', N'Cha tốt', N'https://tusachnguoimetot.files.wordpress.com/2011/10/1.jpg?w=584', 500, 10, N'C02       ', N'Từ Vựng Tiếng Nhật Qua Hội Thoại Giao Tiếp Bạn yêu thích văn hóa Nhật Bản', N'Hoài Hảo')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P06       ', N'Đánh thức con người', N'https://toplist.vn/images/800px/danh-thuc-con-nguoi-phi-thuong-trong-ban-173080.jpg', 600, 29, N'C02       ', N' Tiếng Anh là ngôn ngữ toàn cầu và đã gần như phổ biến với mọi người', N'Trọng Thắng')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P07       ', N'English for Dev', N'data:image/jpeg;base64,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', 700, 16, N'C03       ', N'Step by step guidance to achieving the IELTS score you need Build up to IELTS is a compact IELTS course designed for students who want to achieve a score of 5.5-6.0 in the Academic IELTS test.', N'Hữu Nghĩa')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P08       ', N'Chữ Hán', N'https://newshop.vn/public/uploads/products/40572/sach-tu-hoc-chu-han_L.jpg', 800, 69, N'C03       ', N'Giáo sư, Tiến sĩ Mai Ngọc Chừ là nhà ngôn ngữ học. Ông dạy tiếng Việt và Ngôn ngữ học tại Đại học Tổng hợp Hà Nội từ năm 1974', N'Hoàng Thế')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P09       ', N'Thành Ngữ Anh Việt', N'data:image/jpeg;base64,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', 900, 99, N'C03       ', N'Đừng Sợ Lỡ Cuộc Chơi Cứ năm phút, bạn lại kiểm tra Facebook để chắc chắn rằng mình không bỏ lỡ một sự kiện nào đó hay một thái độ, comment của ai đó trên dòng trạng thái của bạn', N'Hòa Hà')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P10       ', N'Sự thật', N'http://static.ybox.vn/2017/8/7/1e580450-7b26-11e7-bfd9-2e995a9a3302.jpg', 1000, 96, N'C03       ', N'Sống Ảo Đi Thật Mở đầu cuốn sách tác giả nêu ra một vấn đề, đó là con người trong xã hội hiện đại trở nên phụ thuộc vào chiếc smartphone', N'Hà Lê')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P11       ', N'Cố mạn', N'https://img1.baza.vn/upload/products-var-g91buowO/fYQDvwpxlarge.jpg?v=635500237942255413', 100, 9, N'C03       ', N'Ngã Ở Đâu Đứng Lên Ở Đó “Một ngày thường bắt đầu bằng ánh bình minh, một năm thường bắt đầu bằng mùa xuân ấm áp và một đời người thường bắt đầu bằng những lần tự đứng lên sau vấp ngã.”', N'Hải Hà')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P12       ', N'Một đứa trẻ', N'https://i.pinimg.com/originals/19/f5/f7/19f5f71b440cdbab667206d951043ef9.jpg', 200, 18, N'C03       ', N'Một Vòng Thời Gian “Một vòng thời gian” là cuốn sách được tác giả Thiện Nhân ấp ủ từ từ khi còn ở độ tuổi đôi mươi', N'Thiện Như')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P13       ', N'Hội quán nhí nhố', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/d/o/doi-quan-nhi-nho---tap-23.jpg', 300, 29, N'C04       ', N'Phần này trình bày những suy nghĩ và kĩ năng mềm cần thiết để bạn có thể hòa nhập và tiến xa được trong lĩnh vực công nghệ phần mềm', N'Công Tiến')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P14       ', N'C#', N'https://images-na.ssl-images-amazon.com/images/I/51+jdVSmf7L._SX398_BO1,204,203,200_.jpg', 400, 36, N'C04       ', N'Tự Động Hóa PLC S7-1200 Với Tia Portal Trong lần tái bản mới này, tác giả dành nhiều thời gian chỉnh sửa lỗi chính tả, một số sai sót khác và bổ sung thêm nội dung', N'Thủy Lan')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P15       ', N'C++', N'https://namsaigon.edu.vn/thuvien/wp-content/uploads/2020/11/CLinux.jpg', 500, 50, N'C04       ', N'Grammar Gateway Intermediate là sách ngữ pháp Tiếng Anh trung cấp giúp người học có thể nâng cao trình độ của mình thông qua các bài tập ngữ pháp chuyên sâu', N'Công Toàn')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P16       ', N'Naruto', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/i/m/image_79217.jpg', 600, 60, N'C04       ', N'Lập Trình Viên - Phù Thủy Thế Giới Mạng "...Khi viết mã, thích nhất là ta có thể nắm thế kiểm soát', N'Jame Bone')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P17       ', N'Nagato', N'https://i1.sndcdn.com/avatars-000373861388-75vtt3-t500x500.jpg', 234, 0, N'C03       ', N'Truyá»n Nagato', N'HaoHao')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P44       ', N'Tinatic', N'https://upload.wikimedia.org/wikipedia/vi/a/ab/Titanic_3D_poster_Vietnam.jpg', 200, 12, N'C01       ', N'reactjs', N'Jame Camaron ')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'GU', N'guest')
GO
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'Hao                           ', N'Hao', N'abc/123', N'0987654321', N'AD', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'Hao1                          ', N'haohao', N'123456', N'0123456789', N'GU', N'asdf')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'Hao123                        ', N'NguyenHao', N'123/acb', N'0912345678', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'Hao2                          ', N'HoaiHao', N'cde/123', N'0971346714', N'GU', N'456')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'Hao456                        ', N'NguyenHoa', N'456/dfg', N'0912345678', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'Hien                          ', N'HienHoai', N'567/dfg', N'0912345677', N'AD', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa1                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa2                         ', N'khoa', N'123/456', N'1231232312', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa3                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa4                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
GO
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C01       ', N'Tiểu thuyết')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C02       ', N'Ngôn tình')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C03       ', N'Truyện Tranh')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C04       ', N'Sử học')
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblDiscount] FOREIGN KEY([discountID])
REFERENCES [dbo].[tblDiscount] ([discountID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblDiscount]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tlbCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tlbCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tlbCategories]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
