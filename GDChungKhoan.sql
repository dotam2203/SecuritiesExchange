USE [master]
GO
/****** Object:  Database [GDCHUNGKHOAN]    Script Date: 05/05/2022 02:37:59 PM ******/
CREATE DATABASE [GDCHUNGKHOAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDCHUNGKHOAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GDCHUNGKHOAN.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GDCHUNGKHOAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GDCHUNGKHOAN_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GDCHUNGKHOAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDCHUNGKHOAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDCHUNGKHOAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET RECOVERY FULL 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET  MULTI_USER 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDCHUNGKHOAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GDCHUNGKHOAN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GDCHUNGKHOAN', N'ON'
GO
USE [GDCHUNGKHOAN]
GO
/****** Object:  Table [dbo].[BANGGIATRUCTUYEN]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGGIATRUCTUYEN](
	[MACP] [nchar](7) NOT NULL,
	[GIAMUA3] [float] NULL,
	[KLMUA3] [int] NULL,
	[GIAMUA2] [float] NULL,
	[KLMUA2] [int] NULL,
	[GIAMUA1] [float] NULL,
	[KLMUA1] [int] NULL,
	[GIAKHOP] [float] NULL,
	[KHOILUONGKHOP] [int] NULL,
	[GIABAN1] [float] NULL,
	[KLBAN1] [int] NULL,
	[GIABAN2] [float] NULL,
	[KLBAN2] [int] NULL,
	[GIABAN3] [float] NULL,
	[KLBAN3] [int] NULL,
	[NGAYGIAODICH] [datetime] NOT NULL CONSTRAINT [DF_BANGGIATRUCTUYEN_NGAYGIAODICH]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [nchar](7) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL CONSTRAINT [DF_LENHDAT_NGAYDAT]  DEFAULT (getdate()),
	[LOAIGD] [nchar](1) NOT NULL,
	[LOAILENH] [nchar](10) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[GIADAT] [float] NOT NULL,
	[TRANGTHAILENH] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NULL,
	[SOLUONGKHOP] [int] NULL,
	[GIAKHOP] [float] NULL,
	[IDLENHDAT] [int] NOT NULL,
 CONSTRAINT [PK_LENHKHOP] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[BANGGIATRUCTUYEN] ([MACP], [GIAMUA3], [KLMUA3], [GIAMUA2], [KLMUA2], [GIAMUA1], [KLMUA1], [GIAKHOP], [KHOILUONGKHOP], [GIABAN1], [KLBAN1], [GIABAN2], [KLBAN2], [GIABAN3], [KLBAN3], [NGAYGIAODICH]) VALUES (N'ACB    ', NULL, NULL, NULL, NULL, 1000, 500, 1000, 500, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-04-28 15:35:26.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[LENHDAT] ON 

INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (1107, N'ACB    ', CAST(N'2022-04-28 15:33:43.467' AS DateTime), N'M', N'LO        ', 500, 1000, N'Khớp 1 phần')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (1108, N'ACB    ', CAST(N'2022-04-28 15:34:05.497' AS DateTime), N'M', N'LO        ', 0, 2000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (1109, N'ACB    ', CAST(N'2022-04-28 15:35:26.373' AS DateTime), N'B', N'LO        ', 0, 500, N'Khớp hết')
SET IDENTITY_INSERT [dbo].[LENHDAT] OFF
SET IDENTITY_INSERT [dbo].[LENHKHOP] ON 

INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (65, NULL, 1500, 2000, 1108)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (66, NULL, 500, 1000, 1107)
SET IDENTITY_INSERT [dbo].[LENHKHOP] OFF
ALTER TABLE [dbo].[LENHKHOP]  WITH CHECK ADD  CONSTRAINT [FK_LENHKHOP_LENHDAT] FOREIGN KEY([IDLENHDAT])
REFERENCES [dbo].[LENHDAT] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LENHKHOP] CHECK CONSTRAINT [FK_LENHKHOP_LENHDAT]
GO
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CursorLoaiGD]
	@OutCrsr CURSOR VARYING OUTPUT,
	@macp NVARCHAR(10), @ngay NVARCHAR(30), @loaiGD CHAR
	
	AS
	SET DATEFORMAT DMY
	IF (@LoaiGD = 'M')
		SET @OutCrsr = CURSOR KEYSET FOR 
		SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT
		WHERE MACP = @macp
			  AND DAY(NGAYDAT) = DAY(@ngay) AND MONTH(NGAYDAT) = MONTH(@ngay)
		      AND YEAR(NGAYDAT) = YEAR(@ngay)
		      AND LOAIGD = @loaiGD AND SOLUONG > 0 AND GIADAT > 0
		ORDER BY GIADAT DESC, NGAYDAT 
	ELSE
		SET @OutCrsr = CURSOR KEYSET FOR 
		SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT
		WHERE MACP = @macp
		     AND DAY(NGAYDAT) = DAY(@ngay) AND MONTH(NGAYDAT) = MONTH(@ngay)
		     AND YEAR(NGAYDAT) = YEAR(@ngay)
		     AND LOAIGD = @loaiGD AND SOLUONG > 0 AND GIADAT > 0
		 ORDER BY GIADAT ASC, NGAYDAT --giá bán tăng dần 
	OPEN @OutCrsr

GO
/****** Object:  StoredProcedure [dbo].[SP_BANGGIATRUCTUYEN]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BANGGIATRUCTUYEN]
	@MACP CHAR(7) 
AS
BEGIN

-----------------------------------------------------------MUA 1---------------------------------------------------------------
	DECLARE @GIAMUA1 FLOAT, @KLMUA1 INT
	SET @GIAMUA1 = 0
	SET @KLMUA1 = 0

	SET @GIAMUA1 = (SELECT MAX(GIADAT) FROM LENHDAT
					WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))
	SELECT @KLMUA1 = SUM(BG.SOLUONG)
					FROM(SELECT *FROM LENHDAT 
					WHERE LOAIGD = 'M' AND GIADAT = @GIAMUA1 AND SOLUONG > 0 AND MACP = @MACP AND CAST(LENHDAT.NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) BG 
	GROUP BY BG.GIADAT

	UPDATE BANGGIATRUCTUYEN
	SET GIAMUA1 = @GIAMUA1, KLMUA1 = @KLMUA1
	WHERE MACP = @MACP AND @GIAMUA1 > 0 AND @KLMUA1 >0
---------------------------------------------------------MUA 2-----------------------------------------------------------------
	DECLARE @GIAMUA2 FLOAT, @KLMUA2 INT
	SET @GIAMUA2 = 0
	SET @KLMUA2 = 0

	SET @GIAMUA2 = (SELECT MAX(GIADAT) FROM LENHDAT
					WHERE GIADAT < @GIAMUA1 AND LOAIGD = 'M' AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	SELECT @KLMUA2 = SUM(BG.SOLUONG)
					FROM (SELECT *FROM LENHDAT
					WHERE LOAIGD = 'M' AND GIADAT = @GIAMUA2 AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) BG
	GROUP BY BG.GIADAT

	UPDATE BANGGIATRUCTUYEN
	SET GIAMUA2 = @GIAMUA2, KLMUA2 = @KLMUA2
	WHERE MACP = @MACP AND @GIAMUA2 > 0 AND @KLMUA2 >0 
--------------------------------------------------------MUA 3------------------------------------------------------------------
	DECLARE @GIAMUA3 FLOAT, @KLMUA3 INT
	SET @GIAMUA3 = 0
	SET @KLMUA3 = 0

	SET @GIAMUA3 = (SELECT MAX(GIADAT) FROM LENHDAT
					WHERE GIADAT < @GIAMUA2 AND LOAIGD = 'M' AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	SELECT @KLMUA3 = SUM(BG.SOLUONG)
					FROM (SELECT *FROM LENHDAT
					WHERE LOAIGD = 'M' AND  GIADAT = @GIAMUA3 AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) BG
	GROUP BY BG.GIADAT

	UPDATE BANGGIATRUCTUYEN
	SET GIAMUA3 = @GIAMUA3, KLMUA3 = @KLMUA3
	WHERE MACP = @MACP AND @GIAMUA3 > 0 AND @KLMUA3 >0 

------------------------------------------------------BAN 1--------------------------------------------------------------------
	DECLARE @GIABAN1 FLOAT, @KLBAN1 INT
	SET @GIABAN1 = 0
	SET @KLBAN1 = 0

	SET @GIABAN1 = (SELECT MIN(GIADAT) FROM LENHDAT
							WHERE LOAIGD = 'B' AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))
	
	SELECT @KLBAN1 = SUM(BG.SOLUONG)
			FROM (SELECT *FROM LENHDAT 
			WHERE LOAIGD = 'B' AND GIADAT = @GIABAN1 AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) BG
	GROUP BY BG.GIADAT

	UPDATE BANGGIATRUCTUYEN
	SET GIABAN1 = @GIABAN1, KLBAN1 = @KLBAN1
	WHERE MACP = @MACP AND @GIABAN1 > 0 AND @KLBAN1 > 0
-----------------------------------------------------BAN 2---------------------------------------------------------------------
	DECLARE @GIABAN2 FLOAT, @KLBAN2 INT
	SET @GIABAN2 = 0
	SET @KLBAN2 = 0

	SET @GIABAN2 = (SELECT MIN(GIADAT) FROM LENHDAT
							WHERE GIADAT > @GIABAN1 AND LOAIGD = 'B' AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	SELECT @KLBAN2 = SUM(BG.SOLUONG)
			FROM (SELECT * FROM LENHDAT 
			WHERE LOAIGD = 'B'AND GIADAT = @GIABAN2 AND MACP =@MACP AND SOLUONG > 0 AND GIADAT > 0 AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) BG
	GROUP BY BG.GIADAT

	UPDATE BANGGIATRUCTUYEN
	SET GIABAN2 = @GIABAN2, KLBAN2 = @KLBAN2
	WHERE MACP = @MACP AND @GIABAN2 > 0 AND @KLBAN2 > 0
----------------------------------------------------BAN 3----------------------------------------------------------------------
	DECLARE @GIABAN3 FLOAT, @KLBAN3 INT
	SET @GIABAN3 = 0
	SET @KLBAN3 = 0

	SET @GIABAN3 = (SELECT MIN(GIADAT) FROM LENHDAT
							WHERE GIADAT > @GIABAN2 AND LOAIGD = 'B' AND SOLUONG > 0 AND GIADAT > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	SELECT @KLBAN3 = SUM(BG.SOLUONG)
			FROM (SELECT * FROM LENHDAT 
			WHERE LOAIGD = 'B' AND GIADAT = @GIABAN3 AND MACP = @MACP AND SOLUONG > 0 AND GIADAT > 0 AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) BG
	GROUP BY BG.GIADAT

	UPDATE BANGGIATRUCTUYEN
	SET GIABAN3 = @GIABAN3, KLBAN3 = @KLBAN3
	WHERE MACP = @MACP AND @GIABAN3 > 0 AND @KLBAN3 > 0
--------------------------------------------------------------------------------------------------------------------------
END


GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_KHOPLENH_LO]
	@macp NVARCHAR(10), @ngay NVARCHAR(10), @LoaiGD CHAR,
	@soluongMB INT, @giadatMB FLOAT
AS
SET DATEFORMAT DMY
DECLARE @CrsrVar CURSOR , @mald INT, @ngaydat NVARCHAR(30), @soluong INT,
		@giadat FLOAT, @soluongkhop INT, @giakhop FLOAT, @tongSLK INT, @status BIT

		SET @tongSLK = 0  
		SET @status = 0
------------------Xét lệnh gửi vào là mua/bán---------------
	IF (@LoaiGD='B')
		EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @ngay, 'M'
	ELSE
		EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @ngay, 'B'
------------------------------------------------------------
	FETCH NEXT FROM @CrsrVar INTO @mald, @ngaydat , @soluong , @giadat 

	WHILE (@@FETCH_STATUS <> -1 AND @soluongMB > 0 AND @giadatMB > 0)
	BEGIN
	IF (@LoaiGD = 'B' ) -- giá bán truyền vào <= giá mua hiện tại			
		BEGIN		
			IF (@giadatMB <= @giadat)
				BEGIN
					IF (@soluongMB >= @soluong)
						BEGIN
							SET @soluongkhop = @soluong
							SET @giakhop = @giadat 
							SET @soluongMB = @soluongMB - @soluong 
							UPDATE dbo.LENHDAT
							SET SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
							WHERE CURRENT OF @CrsrVar
							------------------------------------------------------------------------------------------------------------------
							SET @status = 1
							------------------------------------------------------------------------------------------------------------------
						END
					ELSE
						BEGIN
							SET @soluongkhop = @soluongMB 
							SET @giakhop = @giadat
							UPDATE dbo.LENHDAT SET SOLUONG = SOLUONG - @soluongMB, TRANGTHAILENH = N'Khớp 1 phần' 
							WHERE CURRENT OF @CrsrVar
							------------------------------------------------------------------------------------------------------------------
							SET @soluongMB = 0
							------------------------------------------------------------------------------------------------------------------
						END
					INSERT INTO LENHKHOP (SOLUONGKHOP,GIAKHOP,IDLENHDAT) VALUES (@soluongkhop,@giakhop,@mald)
					SELECT @soluongkhop, @giakhop 
					SET @tongSLK = @tongSLK + @soluongkhop 
				END
		END
	-- Còn Trường hợp lệnh gởi vào là lệnh mua
	IF (@LoaiGD = 'M' )		
		BEGIN
			IF (@giadatMB >= @giadat)
				BEGIN
					IF (@soluongMB >= @soluong)
						BEGIN
							SET @soluongkhop = @soluong 
							SET @giakhop = @giadat 
							SET @soluongMB = @soluongMB - @soluong --sl bán là số dư còn lại = 0 || > 0
							UPDATE dbo.LENHDAT SET SOLUONG = 0, TRANGTHAILENH = N'Khớp hết' 
							WHERE CURRENT OF @CrsrVar
							------------------------------------------------------------------------------------------------------------------
							SET @status = 1
							------------------------------------------------------------------------------------------------------------------
						END
					ELSE
						BEGIN
							SET @soluongkhop = @soluongMB
							SET @giakhop = @giadat 
							UPDATE dbo.LENHDAT SET SOLUONG = SOLUONG - @soluongMB, TRANGTHAILENH = N'Khớp 1 phần' 
							WHERE CURRENT OF @CrsrVar
							------------------------------------------------------------------------------------------------------------------
							SET @soluongMB = 0
							------------------------------------------------------------------------------------------------------------------
						END
					INSERT INTO LENHKHOP (SOLUONGKHOP,GIAKHOP,IDLENHDAT) VALUES (@soluongkhop,@giakhop,@mald) 
					SELECT @soluongkhop, @giakhop 
					------------------------------------------------------------------------------------------------------------------
					SET @tongSLK = @tongSLK + @soluongkhop 
					------------------------------------------------------------------------------------------------------------------
				END
		END
		FETCH NEXT FROM @CrsrVar INTO @mald, @ngaydat, @soluong, @giadat
	END
	------------------------------------------------------------------------------------------------------------------
	IF (@soluongMB > 0)
		BEGIN
			IF(@status = 1)
				BEGIN
					INSERT INTO dbo.LENHDAT(MACP,NGAYDAT,LOAIGD,LOAILENH,SOLUONG,GIADAT,TRANGTHAILENH) VALUES (@macp,getdate(),@LoaiGD,N'LO',@soluongMB,@giadatMB,N'Khớp 1 phần')
				END

			ELSE
				BEGIN
					INSERT INTO dbo.LENHDAT(MACP,NGAYDAT,LOAIGD,LOAILENH,SOLUONG,GIADAT,TRANGTHAILENH) VALUES (@macp,getdate(),@LoaiGD,N'LO',@soluongMB,@giadatMB,N'Chờ khớp')
				END
		END
	IF (@soluongMB = 0)
		BEGIN
			INSERT INTO dbo.LENHDAT(MACP,NGAYDAT,LOAIGD,LOAILENH,SOLUONG,GIADAT,TRANGTHAILENH) VALUES (@macp,getdate(),@LoaiGD,N'LO',@soluongMB,@giadatMB,N'Khớp hết')
		END
	------------------------------------------------------------------------------------------------------------------
THOAT:
	SELECT @tongSLK
	RETURN @tongSLK
	CLOSE @CrsrVar 
	DEALLOCATE @CrsrVar 

GO
/****** Object:  StoredProcedure [dbo].[SP_RESET_BANGGIA]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RESET_BANGGIA]
AS
BEGIN
	DELETE FROM BANGGIATRUCTUYEN
	WHERE CAST(NGAYGIAODICH AS DATE) != CAST(GETDATE() AS DATE)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RESET_TRANGTHAILENH]    Script Date: 05/05/2022 02:37:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_RESET_TRANGTHAILENH]
AS
BEGIN
	UPDATE LENHDAT SET TRANGTHAILENH = N'Chưa khớp' WHERE TRANGTHAILENH = N'Chờ khớp' AND (CAST(NGAYDAT AS DATE)) < CAST(GETDATE() AS DATE)
END
GO
USE [master]
GO
ALTER DATABASE [GDCHUNGKHOAN] SET  READ_WRITE 
GO
