USE [master]
GO
/****** Object:  Database [User]    Script Date: 08-01-2021 07:20:21 ******/
CREATE DATABASE [User]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'User', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\User.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'User_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\User_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [User] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [User].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [User] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [User] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [User] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [User] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [User] SET ARITHABORT OFF 
GO
ALTER DATABASE [User] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [User] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [User] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [User] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [User] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [User] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [User] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [User] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [User] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [User] SET  DISABLE_BROKER 
GO
ALTER DATABASE [User] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [User] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [User] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [User] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [User] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [User] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [User] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [User] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [User] SET  MULTI_USER 
GO
ALTER DATABASE [User] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [User] SET DB_CHAINING OFF 
GO
ALTER DATABASE [User] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [User] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [User] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [User] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [User] SET QUERY_STORE = OFF
GO
USE [User]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 08-01-2021 07:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Conform Password] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NLog_Error]    Script Date: 08-01-2021 07:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NLog_Error](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Host] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Logger] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[stacktrace] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08-01-2021 07:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Categoery] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Short_Description] [nvarchar](max) NOT NULL,
	[Small_Image] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ProductDisplay]    Script Date: 08-01-2021 07:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ProductDisplay] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Product
END
GO
/****** Object:  StoredProcedure [dbo].[ProductInsert]    Script Date: 08-01-2021 07:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ProductInsert]
	-- Add the parameters for the stored procedure here
	                    ( @ProductId int,
						@ProductName nvarchar(50),
						@Categoery nvarchar(50),
						@Price Decimal,
						
						@Short_Description nvarchar(max),
						@Quantity int,
						@Small_image nvarchar(max)
						)
						
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Product(ProductId,
						ProductName,
						Categoery,
						Price,
						
						Short_Description,
						Quantity,
						Small_image ) VALUES(@ProductId,
						@ProductName,
						@Categoery,
						@Price,
						
						@Short_Description,
						@Quantity,
						@Small_image 
						)  
END

GO
/****** Object:  StoredProcedure [dbo].[ProductUpdate]    Script Date: 08-01-2021 07:20:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ProductUpdate]
	-- Add the parameters for the stored procedure here
	                    ( @ProductId int,
						@ProductName nvarchar(50),
						@Categoery nvarchar(50),
						@Price Decimal,
						
						@Short_Description nvarchar(max),
						@Quantity int,
						@Small_image nvarchar(max)
						)
						
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update PRoduct set ProductName=@ProductName,Categoery=@Categoery,Price =@Price , Short_Description =@Short_Description ,Quantity=@Quantity,Small_image =@Small_image  Where ProductId=@ProductId
END


GO
USE [master]
GO
ALTER DATABASE [User] SET  READ_WRITE 
GO
