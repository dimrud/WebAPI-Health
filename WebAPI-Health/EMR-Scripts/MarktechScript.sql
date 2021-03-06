USE [master]
GO
/****** Object:  Database [MarktechServices]    Script Date: 2018-11-01 9:11:23 AM ******/
CREATE DATABASE [MarktechServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL2008_619283_poll_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MarktechServices.mdf' , SIZE = 303040KB , MAXSIZE = 512000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SQL2008_619283_poll_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MarktechServices_0.ldf' , SIZE = 5696KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MarktechServices] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarktechServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarktechServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarktechServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarktechServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarktechServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarktechServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarktechServices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarktechServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarktechServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarktechServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarktechServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarktechServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarktechServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarktechServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarktechServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarktechServices] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MarktechServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarktechServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarktechServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarktechServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarktechServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarktechServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarktechServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarktechServices] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MarktechServices] SET  MULTI_USER 
GO
ALTER DATABASE [MarktechServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarktechServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarktechServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarktechServices] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MarktechServices] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarktechServices] SET QUERY_STORE = OFF
GO
USE [MarktechServices]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MarktechServices]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 2018-11-01 9:11:23 AM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MediSiteUser]    Script Date: 2018-11-01 9:11:23 AM ******/
CREATE USER [MediSiteUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MediSiteUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MediSiteUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MediSiteUser]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 2018-11-01 9:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_webpages_Membership] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserDetail]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UserDetail]
AS
SELECT        dbo.UserProfile.UserId, dbo.UserProfile.UserName, dbo.webpages_Membership.IsConfirmed, dbo.webpages_Membership.PasswordFailuresSinceLastSuccess, 
                         dbo.webpages_Membership.CreateDate, dbo.webpages_UsersInRoles.RoleId, dbo.webpages_Roles.RoleName
FROM            dbo.UserProfile INNER JOIN
                         dbo.webpages_Membership ON dbo.UserProfile.UserId = dbo.webpages_Membership.UserId INNER JOIN
                         dbo.webpages_UsersInRoles ON dbo.webpages_UsersInRoles.UserId = dbo.webpages_Membership.UserId INNER JOIN
                         dbo.webpages_Roles ON dbo.webpages_Roles.RoleId = dbo.webpages_UsersInRoles.RoleId



GO
/****** Object:  Table [dbo].[MediScriptsPatient]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediScriptsPatient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](35) NULL,
	[MiddleName] [nvarchar](35) NULL,
	[LastName] [nvarchar](35) NULL,
	[DOB] [varchar](10) NULL,
	[Created] [datetime2](7) NOT NULL,
	[IsTemporary] [bit] NOT NULL,
	[Street] [varchar](35) NULL,
	[Street2] [varchar](35) NULL,
	[City] [varchar](35) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](10) NULL,
	[Email] [varchar](80) NULL,
	[Phone] [varchar](25) NULL,
	[PhoneType] [varchar](50) NULL,
	[Phone2] [varchar](25) NULL,
	[Phone3] [varchar](25) NULL,
	[HeightInInches] [float] NOT NULL,
	[WeightInPounds] [float] NOT NULL,
	[Gender] [varchar](10) NULL,
	[InactivatedOn] [datetime2](7) NULL,
	[ClinicId] [int] NOT NULL,
	[MdId] [int] NOT NULL,
	[DoseSpotPatientId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[FavoritePharmacyId] [int] NOT NULL,
	[Notes] [varchar](1000) NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[Prefix] [varchar](10) NULL,
	[Suffix] [varchar](10) NULL,
	[PatientAddedForRefillRequest] [bit] NOT NULL,
	[ImportSource] [varchar](20) NULL,
	[ImportSourceId] [varchar](20) NULL,
	[ConfirmData] [bit] NULL,
	[Confirmation] [bit] NULL,
	[EMR_File_ID] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefillRequest]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefillRequest](
	[RxRequestQueueItemID] [int] NOT NULL,
	[ReferenceNumber] [varchar](50) NULL,
	[RequestedDrugDescription] [varchar](105) NOT NULL,
	[RequestedRefillAmount] [varchar](10) NOT NULL,
	[RequestedDispenseAmount] [varchar](16) NOT NULL,
	[RequestedDoseSpotPrescriptionId] [int] NULL,
	[RequestedMediScriptsRxId] [bigint] NULL,
	[RequestedDoseSpotPatientId] [int] NOT NULL,
	[RequestedMediScriptsPatientId] [int] NOT NULL,
	[PharmacyRxReferenceNumber] [varchar](50) NULL,
	[RequestedMediScriptsRxDrugNumber] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[RequestResponse] [varchar](50) NOT NULL,
	[DrugName] [varchar](256) NULL,
	[Quantity] [float] NOT NULL,
	[DispenseUnit] [varchar](100) NULL,
	[LexiSynonymTypeId] [int] NOT NULL,
	[DurationInDays] [int] NOT NULL,
	[Strength] [varchar](128) NULL,
	[Route] [varchar](100) NULL,
	[NDC] [varchar](20) NULL,
	[Refills] [int] NOT NULL,
	[Instructions] [varchar](140) NULL,
	[NoSubstitutions] [bit] NOT NULL,
	[Status] [varchar](100) NULL,
	[DoseSpotPrescriptionId] [int] NOT NULL,
	[PharmacyNotes] [varchar](500) NULL,
	[LexiGenProductId] [int] NOT NULL,
	[LexiDrugSynId] [int] NOT NULL,
	[DispenseUnitTypeId] [int] NOT NULL,
	[PatientEligibilityId] [int] NULL,
	[PatientId] [int] NOT NULL,
	[CSACode] [varchar](1) NULL,
	[DoseSpotPharmacyId] [int] NOT NULL,
	[MdId] [int] NOT NULL,
 CONSTRAINT [PK_RefillRequest] PRIMARY KEY CLUSTERED 
(
	[RxRequestQueueItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RefillRequestListItem]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RefillRequestListItem]
AS
SELECT dbo.MediScriptsPatient.FirstName, dbo.MediScriptsPatient.PatientId, dbo.RefillRequest.DrugName, dbo.RefillRequest.RequestResponse, dbo.RefillRequest.Created, 
             dbo.RefillRequest.RxRequestQueueItemID, dbo.MediScriptsPatient.MdId, dbo.MediScriptsPatient.LastName, dbo.MediScriptsPatient.DOB, dbo.RefillRequest.Status, dbo.RefillRequest.PharmacyNotes, 
             dbo.RefillRequest.Instructions, dbo.RefillRequest.NoSubstitutions, dbo.RefillRequest.Quantity, dbo.RefillRequest.DispenseUnit, dbo.RefillRequest.Refills
FROM   dbo.RefillRequest INNER JOIN
             dbo.MediScriptsPatient ON dbo.RefillRequest.PatientId = dbo.MediScriptsPatient.PatientId
GO
/****** Object:  Table [dbo].[PatientTime]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTime](
	[PatientId] [int] NOT NULL,
	[Created] [smalldatetime] NOT NULL,
	[MdId] [int] NOT NULL,
	[TimeInSeconds] [int] NULL,
	[RxId] [int] NULL,
	[Comment] [varchar](200) NULL,
	[PatientTimeId] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PatientTime] PRIMARY KEY CLUSTERED 
(
	[PatientTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PatientTimeReport]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientTimeReport]
	AS 
SELECT pt.PatientId AS PatientId, pt.MdId AS MdId, p.FirstName, p.LastName, p.DOB, pt.Created AS Created, pt.TimeInSeconds AS TimeInSeconds
FROM PatientTime pt
INNER JOIN MediScriptsPatient p ON p.PatientId = pt.PatientId


GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[ClinicId] [int] IDENTITY(10000,1) NOT NULL,
	[ClinicName] [varchar](256) NOT NULL,
	[Created] [smalldatetime] NOT NULL,
	[Modified] [smalldatetime] NULL,
	[MdCount] [int] NOT NULL,
	[Street] [varchar](35) NULL,
	[Street2] [varchar](35) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[DoseSpotClinicId] [int] NOT NULL,
	[DoseSpotClinicKey] [varchar](50) NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Md]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Md](
	[MdId] [int] IDENTITY(1111,1) NOT NULL,
	[ClinicId] [int] NOT NULL,
	[TorontoMdNumber] [int] NOT NULL,
	[FirstName] [varchar](35) NULL,
	[LastName] [varchar](35) NULL,
	[Created] [smalldatetime] NULL,
	[Degree] [varchar](20) NULL,
	[AmaSpecialtyCode] [varchar](35) NULL,
	[NpiNumber] [varchar](35) NULL,
	[DeaId] [varchar](35) NULL,
	[MeNumber] [varchar](11) NULL,
	[LicenseNumber] [varchar](40) NULL,
	[LicenseNumberState] [varchar](2) NULL,
	[SequenceInClinic] [varchar](50) NULL,
	[Street] [varchar](35) NULL,
	[Street2] [varchar](35) NULL,
	[City] [varchar](35) NULL,
	[State] [varchar](35) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[Email] [varchar](80) NULL,
	[BirthYear] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[InactivatedOn] [smalldatetime] NULL,
	[Password] [varchar](20) NULL,
	[SignatureFileNameOnly] [varchar](50) NULL,
	[DoseSpotUserId] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProfileImageFileNameOnly] [varchar](50) NULL,
	[Specialty] [varchar](50) NULL,
	[MedicalSchool] [varchar](100) NULL,
	[MedSchoolState] [varchar](10) NULL,
	[YearGraduated] [int] NULL,
	[DateOfBirth] [date] NULL,
	[OfficeContact] [varchar](50) NULL,
	[OfficeContactTitle] [varchar](50) NULL,
	[OfficeNotificationEmail] [varchar](50) NULL,
	[KegId] [varchar](25) NULL,
	[RegistrationStatus] [varchar](50) NULL,
	[AcceptsRefillAgentAgreement] [bit] NOT NULL,
 CONSTRAINT [PK_Md] PRIMARY KEY CLUSTERED 
(
	[MdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx](
	[RxId] [bigint] IDENTITY(100,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[MdId] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[DoseSpotPharmacyId] [int] NOT NULL,
	[PrescriptionStatus] [varchar](20) NULL,
	[TransmissionResultCode] [varchar](20) NULL,
	[TransmissionResultDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[InactivationReason] [varchar](50) NULL,
 CONSTRAINT [PK_RxMd] PRIMARY KEY CLUSTERED 
(
	[RxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RxDrug]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxDrug](
	[RxId] [bigint] NOT NULL,
	[RxDrugNumber] [int] NOT NULL,
	[DrugName] [varchar](256) NULL,
	[Quantity] [float] NOT NULL,
	[DispenseUnit] [varchar](100) NULL,
	[LexiSynonymTypeId] [int] NOT NULL,
	[DurationInDays] [int] NOT NULL,
	[Strength] [varchar](128) NULL,
	[Route] [varchar](100) NULL,
	[NDC] [varchar](20) NULL,
	[Refills] [int] NOT NULL,
	[Instructions] [varchar](140) NULL,
	[NoSubstitutions] [bit] NOT NULL,
	[Status] [varchar](100) NULL,
	[DoseSpotPrescriptionId] [int] NOT NULL,
	[PharmacyNotes] [varchar](500) NULL,
	[LexiGenProductId] [int] NOT NULL,
	[LexiDrugSynId] [int] NOT NULL,
	[DispenseUnitTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[InactivationReason] [varchar](50) NULL,
	[PatientEligibilityId] [int] NULL,
	[PatientId] [int] NOT NULL,
	[CSACode] [varchar](1) NULL,
	[RxReferenceNumber] [varchar](50) NULL,
	[CouponFilePath] [varchar](max) NULL,
	[HasEcopayCoupon] [bit] NULL,
 CONSTRAINT [PK_RxDrug] PRIMARY KEY CLUSTERED 
(
	[RxId] ASC,
	[RxDrugNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[RxListItem]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RxListItem]
AS
SELECT R1.RxId, R1.PatientId, R1.MdId, R1.Created AS RxCreatedDate, R1.DoseSpotPharmacyId, R2.RxDrugNumber, R2.DrugName, R2.Quantity, R2.Refills, R2.Instructions, R2.PharmacyNotes, 
             P.FirstName AS PatientFirstName, P.MiddleName AS PatientMiddleName, P.LastName AS PatientLastName, P.DOB AS PatientDOB, P.Gender AS PatientGender, P.IsTemporary, R2.DoseSpotPrescriptionId, 
             R1.PrescriptionStatus, R2.CouponFilePath, R2.HasEcopayCoupon, R2.DispenseUnit, R2.NoSubstitutions
FROM   dbo.Rx AS R1 INNER JOIN
             dbo.RxDrug AS R2 ON R1.RxId = R2.RxId INNER JOIN
             dbo.MediScriptsPatient AS P ON P.PatientId = R1.PatientId INNER JOIN
             dbo.Md AS M ON M.MdId = R1.MdId INNER JOIN
             dbo.Clinic AS C ON C.ClinicId = M.ClinicId
GO
/****** Object:  View [dbo].[RxDetail]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RxDetail]
AS
SELECT        R1.PatientId, R1.MdId, R1.Created AS RxCreatedDate, R1.DoseSpotPharmacyId, R2.RxId, R2.RxDrugNumber, R2.DrugName, R2.Quantity, R2.DispenseUnit, 
                         R2.LexiSynonymTypeId, R2.DurationInDays, R2.Strength, R2.Route, R2.NDC, R2.Refills, R2.Instructions, R2.NoSubstitutions, R2.Status AS RxDrugStatus, 
                         R2.DoseSpotPrescriptionId, R2.PharmacyNotes, R2.LexiGenProductId, R2.LexiDrugSynId, R2.DispenseUnitTypeId, R2.IsActive, R2.InactivationReason, 
                         R2.PatientEligibilityId, P.FirstName AS PatientFirstName, P.MiddleName AS PatientMiddleName, P.LastName AS PatientLastName, P.DOB AS PatientDOB, 
                         P.Gender AS PatientGender, P.Street AS PatientStreet, P.Street2 AS PatientStreet2, P.State AS PatientState, P.City AS PatientCity, P.Zip AS PatientZip, 
                         P.Phone AS PatientPhone, M.SignatureFileNameOnly, P.Created AS PatientCreateDate, M.FirstName AS MdFirstName, M.LastName AS MdLastName, 
                         M.Degree AS MdDegree, C.ClinicName, C.Street AS ClinicStreet, C.Street2 AS ClinicStreet2, C.State AS ClinicState, C.City AS ClinicCity, C.Zip AS ClinicZip, 
                         C.Phone AS ClinicPhone, R2.CSACode, M.NpiNumber, M.DeaId, M.MeNumber, M.LicenseNumber, RR.ReferenceNumber, R1.PrescriptionStatus, 
                         R2.RxReferenceNumber, RR.PharmacyRxReferenceNumber
FROM            dbo.Rx AS R1 INNER JOIN
                         dbo.RxDrug AS R2 ON R1.RxId = R2.RxId INNER JOIN
                         dbo.MediScriptsPatient AS P ON P.PatientId = R1.PatientId INNER JOIN
                         dbo.Md AS M ON M.MdId = R1.MdId INNER JOIN
                         dbo.Clinic AS C ON C.ClinicId = M.ClinicId LEFT OUTER JOIN
                         dbo.RefillRequest AS RR ON RR.RequestedMediScriptsRxId = R1.RxId
GO
/****** Object:  View [dbo].[MdUserDetail]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MdUserDetail]
AS
SELECT        dbo.UserProfile.UserId, dbo.UserProfile.UserName, dbo.webpages_Membership.CreateDate, dbo.webpages_Membership.IsConfirmed, dbo.webpages_Membership.PasswordFailuresSinceLastSuccess, 
                         dbo.Md.MdId, dbo.Md.FirstName, dbo.Md.LastName, dbo.Md.Created, dbo.Md.NpiNumber, dbo.Md.DeaId, dbo.Md.Email, dbo.Md.YearGraduated,
                             (SELECT        COUNT(1) AS Expr1
                               FROM            dbo.Rx
                               WHERE        (MdId = dbo.Md.MdId)) AS TotalPrescriptions,
                             (SELECT        COUNT(1) AS Expr1
                               FROM            dbo.RefillRequest
                               WHERE        (MdId = dbo.Md.MdId)) AS TotalRefill, dbo.Md.State, dbo.Md.AmaSpecialtyCode AS Specialty, dbo.Md.RegistrationStatus, dbo.Md.Phone, dbo.Md.AcceptsRefillAgentAgreement, dbo.Md.Street, 
                         dbo.Md.Street2, dbo.Md.City, dbo.Md.Zip, dbo.Md.LicenseNumberState
FROM            dbo.UserProfile INNER JOIN
                         dbo.webpages_Membership ON dbo.UserProfile.UserId = dbo.webpages_Membership.UserId INNER JOIN
                         dbo.Md ON dbo.webpages_Membership.UserId = dbo.Md.UserId
GO
/****** Object:  View [dbo].[RxDetailWithManufacturer]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RxDetailWithManufacturer]
AS
SELECT        R1.PatientId, R1.MdId, R1.Created AS RxCreatedDate, R1.DoseSpotPharmacyId, R2.RxId, R2.RxDrugNumber, R2.DrugName, R2.Quantity, R2.DispenseUnit, R2.LexiSynonymTypeId, R2.DurationInDays, 
                         R2.Strength, R2.Route, R2.NDC, R2.Refills, R2.Instructions, R2.NoSubstitutions, R2.Status AS RxDrugStatus, R2.DoseSpotPrescriptionId, R2.PharmacyNotes, R2.LexiGenProductId, R2.LexiDrugSynId, 
                         R2.DispenseUnitTypeId, R2.IsActive, R2.InactivationReason, R2.PatientEligibilityId, P.FirstName AS PatientFirstName, P.MiddleName AS PatientMiddleName, P.LastName AS PatientLastName, 
                         P.DOB AS PatientDOB, P.Gender AS PatientGender, P.Street AS PatientStreet, P.Street2 AS PatientStreet2, P.State AS PatientState, P.City AS PatientCity, P.Zip AS PatientZip, P.Phone AS PatientPhone, 
                         M.SignatureFileNameOnly, P.Created AS PatientCreateDate, M.FirstName AS MdFirstName, M.LastName AS MdLastName, M.Degree AS MdDegree, C.ClinicName, C.Street AS ClinicStreet, 
                         C.Street2 AS ClinicStreet2, C.State AS ClinicState, C.City AS ClinicCity, C.Zip AS ClinicZip, C.Phone AS ClinicPhone, R2.CSACode, M.NpiNumber, M.DeaId, M.MeNumber, M.LicenseNumber, RR.ReferenceNumber, 
                         R1.PrescriptionStatus, R2.RxReferenceNumber, RR.PharmacyRxReferenceNumber, LexiComp.dbo.NDC_LABELER.LABELER_NAME, LexiComp.dbo.NDC_LABELER.LABELER_ID
FROM            dbo.RefillRequest AS RR RIGHT OUTER JOIN
                         dbo.Rx AS R1 INNER JOIN
                         dbo.RxDrug AS R2 ON R1.RxId = R2.RxId INNER JOIN
                         dbo.MediScriptsPatient AS P ON P.PatientId = R1.PatientId INNER JOIN
                         dbo.Md AS M ON M.MdId = R1.MdId INNER JOIN
                         dbo.Clinic AS C ON C.ClinicId = M.ClinicId INNER JOIN
                         LexiComp.dbo.NDC_PKG_PRODUCT INNER JOIN
                         LexiComp.dbo.NDC_TRADE_NAME ON LexiComp.dbo.NDC_PKG_PRODUCT.TRADE_NAME_ID = LexiComp.dbo.NDC_TRADE_NAME.TRADE_NAME_ID INNER JOIN
                         LexiComp.dbo.CORE_GENPRODUCT ON LexiComp.dbo.NDC_PKG_PRODUCT.GENPRODUCT_ID = LexiComp.dbo.CORE_GENPRODUCT.GENPRODUCT_ID INNER JOIN
                         LexiComp.dbo.NDC_LABELER ON LexiComp.dbo.NDC_PKG_PRODUCT.LABELER_ID = LexiComp.dbo.NDC_LABELER.LABELER_ID ON R2.NDC = LexiComp.dbo.NDC_PKG_PRODUCT.PKG_PRODUCT_ID ON 
                         RR.RequestedMediScriptsRxId = R1.RxId
GO
/****** Object:  View [dbo].[RxAndMd]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RxAndMd]
AS
SELECT        TOP (100) PERCENT li.RxId, li.RxDrugNumber, li.PatientId, dbo.Md.MdId, dbo.Md.LastName AS MdLastName, li.RxCreatedDate, li.DoseSpotPharmacyId, li.RxDrugNumber AS Expr1, li.DrugName, li.Quantity, 
                         li.Refills, li.IsTemporary, li.DoseSpotPrescriptionId, CASE (PrescriptionStatus) WHEN 'Print' THEN 'Print' WHEN 'Printable' THEN 'Print' WHEN 'Sending' THEN 'Sent' END AS Status
FROM            dbo.RxListItem AS li INNER JOIN
                         dbo.Md ON li.MdId = dbo.Md.MdId
ORDER BY li.DoseSpotPrescriptionId, li.RxDrugNumber
GO
/****** Object:  View [dbo].[RxTotalsByMd]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RxTotalsByMd]
AS
SELECT        TOP (100) PERCENT dbo.Md.FirstName + ' ' + dbo.Md.LastName AS Md, dbo.Md.MdId, COUNT(*) AS MedCount
FROM            dbo.RxListItem AS li INNER JOIN
                         dbo.Md ON li.MdId = dbo.Md.MdId
GROUP BY dbo.Md.MdId, dbo.Md.FirstName, dbo.Md.LastName
ORDER BY dbo.Md.LastName
GO
/****** Object:  View [dbo].[MdRegistrationDetails]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MdRegistrationDetails]
AS
SELECT        dbo.Md.MdId, dbo.Md.ClinicId, dbo.Md.FirstName, dbo.Md.LastName, dbo.Md.Created, dbo.Md.NpiNumber, dbo.Md.UserId, dbo.Clinic.ClinicName, 
                         dbo.webpages_Membership.Password, dbo.UserProfile.UserName, dbo.webpages_UsersInRoles.RoleId, dbo.Clinic.DoseSpotClinicId, dbo.Clinic.DoseSpotClinicKey, 
                         dbo.Md.DoseSpotUserId
FROM            dbo.Md INNER JOIN
                         dbo.Clinic ON dbo.Md.ClinicId = dbo.Clinic.ClinicId INNER JOIN
                         dbo.webpages_Membership ON dbo.Md.UserId = dbo.webpages_Membership.UserId INNER JOIN
                         dbo.webpages_UsersInRoles ON dbo.webpages_Membership.UserId = dbo.webpages_UsersInRoles.UserId INNER JOIN
                         dbo.UserProfile ON dbo.Md.UserId = dbo.UserProfile.UserId
GO
/****** Object:  Table [dbo].[AppMessage]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppMessage](
	[AppMessageId] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageText] [varchar](500) NOT NULL,
	[Priority] [int] NOT NULL,
	[Category] [varchar](20) NULL,
	[SenderId] [int] NOT NULL,
	[SenderType] [varchar](20) NOT NULL,
	[RecipientId] [int] NOT NULL,
	[RecipientType] [varchar](20) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Status] [varchar](10) NULL,
	[Title] [varchar](50) NULL,
 CONSTRAINT [PK_AppMessage] PRIMARY KEY CLUSTERED 
(
	[AppMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DebugLog]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebugLog](
	[Created] [datetime] NOT NULL,
	[Notes] [text] NULL,
	[Message] [text] NULL,
	[StackTrace] [text] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](200) NULL,
 CONSTRAINT [PK_DebugLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugFavorite]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugFavorite](
	[DrugName] [varchar](256) NULL,
	[Quantity] [float] NOT NULL,
	[DispenseUnit] [varchar](100) NULL,
	[LexiSynonymTypeId] [int] NULL,
	[DurationInDays] [int] NULL,
	[Strength] [varchar](128) NULL,
	[Route] [varchar](100) NULL,
	[NDC] [varchar](20) NULL,
	[Refills] [int] NOT NULL,
	[Instructions] [varchar](140) NULL,
	[NoSubstitutions] [bit] NOT NULL,
	[Status] [varchar](100) NULL,
	[PharmacyNotes] [varchar](500) NULL,
	[LexiGenProductId] [int] NULL,
	[LexiDrugSynId] [int] NULL,
	[DispenseUnitTypeId] [int] NULL,
	[MdId] [int] NOT NULL,
	[DrugFavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[SourceRxId] [bigint] NOT NULL,
	[SourceRxDrugNumber] [int] NOT NULL,
	[CSACode] [varchar](1) NULL,
 CONSTRAINT [PK_DrugFavorite] PRIMARY KEY CLUSTERED 
(
	[DrugFavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMR_Fields]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMR_Fields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EMR_Field_Name] [nvarchar](max) NOT NULL,
	[EMR_Field_Description] [nvarchar](max) NULL,
	[EMR_ID] [int] NOT NULL,
	[EMR_DataType] [nvarchar](max) NULL,
	[lenght] [int] NULL,
 CONSTRAINT [PK_EMR_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMR_File_List]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMR_File_List](
	[EMR_File_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMR_FileName] [nvarchar](max) NULL,
	[EMR_EMRID] [int] NULL,
 CONSTRAINT [PK_EMR_File_List] PRIMARY KEY CLUSTERED 
(
	[EMR_File_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMRList]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMRList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EMR_Names] [nvarchar](max) NULL,
	[EMR_Desc] [nvarchar](max) NULL,
	[EMR_Versions] [nvarchar](max) NULL,
 CONSTRAINT [PK_EMRList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Created] [datetime] NOT NULL,
	[Notes] [text] NULL,
	[Message] [text] NULL,
	[StackTrace] [text] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](200) NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityProofingTestData]    Script Date: 2018-11-01 9:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityProofingTestData](
	[CREDIT CARD NUMBER] [nvarchar](255) NULL,
	[FIRST NAME] [nvarchar](255) NULL,
	[MIDDLE NAME] [nvarchar](255) NULL,
	[LAST NAME] [nvarchar](255) NOT NULL,
	[SSN] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[DOB/YOB] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[OPEN MORTGAGE] [nvarchar](255) NULL,
	[MTG PAY AMT] [float] NULL,
	[CLOSED MORTGAGE] [nvarchar](255) NULL,
	[OPEN AUTO LOAN] [nvarchar](255) NULL,
	[AUTO PAY AMT] [nvarchar](255) NULL,
	[OPEN AUTO LOAN TERMS] [nvarchar](255) NULL,
	[CLOSED AUTO LOAN] [nvarchar](255) NULL,
	[CLOSED AUTO LOAN TERMS] [float] NULL,
	[OPEN STUDENT LOAN] [nvarchar](255) NULL,
	[STUDENT LOAN PAYMENT AMT] [float] NULL,
	[CLOSED STUDENT LOAN] [nvarchar](255) NULL,
	[PREVIOUS ADDRESS STREET NAME] [nvarchar](255) NULL,
	[PREVIOUS CITY OF RESIDENCE] [nvarchar](255) NULL,
	[SSN ISSUE STATE] [nvarchar](255) NULL,
	[LAST 4 DIGITS OF SSN] [nvarchar](255) NULL,
	[COUNTY OF RESIDENCE] [nvarchar](255) NULL,
	[YEAR OF BIRTH] [float] NULL,
	[VEH1 MAKE CD] [nvarchar](255) NULL,
	[VH1 MODEL CD] [nvarchar](255) NULL,
	[VEH1 YEAR] [float] NULL,
	[VEH1 LIC PLATE] [nvarchar](255) NULL,
	[VEH1 COLOR] [nvarchar](255) NULL,
	[VEH2 MAKE CD] [nvarchar](255) NULL,
	[VEH2 MODEL CD] [nvarchar](255) NULL,
	[VEH2 YEAR] [nvarchar](255) NULL,
	[VEH2 LIC PLATE] [nvarchar](255) NULL,
	[VEH2 COLOR] [nvarchar](255) NULL,
	[VEH3 MAKE CD] [nvarchar](255) NULL,
	[VEH3 MODEL CD] [nvarchar](255) NULL,
	[VEH3 YEAR] [nvarchar](255) NULL,
	[VEH3 LIC PLATE] [nvarchar](255) NULL,
	[VEH3 COLOR] [nvarchar](255) NULL,
	[VEH4 MAKE CD] [nvarchar](255) NULL,
	[VEH4 MODEL CD] [nvarchar](255) NULL,
	[VEH4 YEAR] [nvarchar](255) NULL,
	[VEH4 LIC PLATE] [nvarchar](255) NULL,
	[VEH4 COLOR] [nvarchar](255) NULL,
	[VEH5 MAKE CD] [nvarchar](255) NULL,
	[VEH5 MODEL CD] [nvarchar](255) NULL,
	[VEH5 YEAR] [nvarchar](255) NULL,
	[VEH5 LIC PLATE] [nvarchar](255) NULL,
	[VEH5 COLOR] [nvarchar](255) NULL,
	[PROFESSION] [nvarchar](255) NULL,
	[EDUCATION] [nvarchar](255) NULL,
	[BUSINESS NAME] [nvarchar](255) NULL,
	[YEAR HOME BUILT] [float] NULL,
	[HOME VALUE] [float] NULL,
	[HOME BDRM COUNT] [float] NULL,
	[EMPLOYER] [nvarchar](255) NULL,
 CONSTRAINT [PK_IdentityProofingTestData] PRIMARY KEY CLUSTERED 
(
	[LAST NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MdRegistrationLog]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MdRegistrationLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[MdId] [int] NOT NULL,
	[LastName] [varchar](50) NULL,
	[Action] [varchar](50) NULL,
	[ApiMethod] [varchar](50) NULL,
	[Response] [varchar](2000) NULL,
	[Created] [datetime] NOT NULL,
	[StackTrace] [text] NULL,
	[Description] [varchar](2000) NULL,
 CONSTRAINT [PK_MdRegistrationLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediPatients_EMR_Fields_Map]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediPatients_EMR_Fields_Map](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EMR_Fields_ID] [int] NOT NULL,
	[MediPatients_ID] [int] NOT NULL,
	[EMRID] [int] NULL,
 CONSTRAINT [PK_MediPatients_EMR_Fields_Map] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediPatients_Fields]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediPatients_Fields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediPatients_Fields] [nvarchar](max) NULL,
	[MediPatients_Desc] [nvarchar](max) NULL,
	[MediPatients_DataType] [nvarchar](max) NULL,
	[MediPatients_Lenght] [int] NULL,
	[IsNullable] [bit] NOT NULL,
 CONSTRAINT [PK_MediPatients_Fields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediScriptsPatienttest]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediScriptsPatienttest](
	[firstname] [nvarchar](35) NULL,
	[Middlename] [nvarchar](35) NULL,
	[Lastname] [nvarchar](35) NULL,
	[DOB] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_MediScriptsPatienttest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Samples]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Samples](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[MdId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[OrderSourceProductId] [varchar](255) NULL,
	[ShipmentTrackingNumber] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[KnipperParentOrderId] [varchar](20) NULL,
	[Description] [varchar](255) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Samples] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TorontoMD]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TorontoMD](
	[MdNumber] [int] NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Degree] [varchar](20) NULL,
	[AmaSpecialtyCode] [varchar](20) NULL,
	[NpiNumber] [varchar](20) NULL,
	[DeaId] [varchar](20) NULL,
	[LicenseId] [varchar](40) NULL,
	[ClinicNumber] [varchar](50) NULL,
	[SequenceInClinic] [varchar](50) NULL,
	[PracticianersInClinic] [varchar](50) NULL,
	[ClinicName] [varchar](100) NULL,
	[Building] [varchar](50) NULL,
	[Street] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[BirthYear] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_webpages_OAuthMembership] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCodeCenter]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCodeCenter](
	[ZipCode] [nvarchar](20) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MdEmail]    Script Date: 2018-11-01 9:11:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MdEmail] ON [dbo].[Md]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MdNpiNumber]    Script Date: 2018-11-01 9:11:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MdNpiNumber] ON [dbo].[Md]
(
	[NpiNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MdRegistrationLogMdId]    Script Date: 2018-11-01 9:11:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_MdRegistrationLogMdId] ON [dbo].[MdRegistrationLog]
(
	[MdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MediScriptsPatientMdId]    Script Date: 2018-11-01 9:11:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_MediScriptsPatientMdId] ON [dbo].[MediScriptsPatient]
(
	[MdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MediScriptsPatientTempInsertFields]    Script Date: 2018-11-01 9:11:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_MediScriptsPatientTempInsertFields] ON [dbo].[MediScriptsPatient]
(
	[FirstName] ASC,
	[LastName] ASC,
	[DOB] ASC,
	[Phone] ASC,
	[MdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProfile_UserName]    Script Date: 2018-11-01 9:11:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserProfile_UserName] ON [dbo].[UserProfile]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppMessage] ADD  CONSTRAINT [DF_AppMessage_Priority]  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[AppMessage] ADD  CONSTRAINT [DF_AppMessage_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_MdCount]  DEFAULT ((0)) FOR [MdCount]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_DoseSpotClinicId]  DEFAULT ((0)) FOR [DoseSpotClinicId]
GO
ALTER TABLE [dbo].[DebugLog] ADD  CONSTRAINT [DF_DebugLog_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_LexiSynonymTypeId]  DEFAULT ((0)) FOR [LexiSynonymTypeId]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_Refills]  DEFAULT ((0)) FOR [Refills]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_NoSubstitutions]  DEFAULT ((0)) FOR [NoSubstitutions]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_LexiGenProductId]  DEFAULT ((0)) FOR [LexiGenProductId]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_LexiDrugSynId]  DEFAULT ((0)) FOR [LexiDrugSynId]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_DispenseUnitTypeId]  DEFAULT ((0)) FOR [DispenseUnitTypeId]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_MdId]  DEFAULT ((0)) FOR [MdId]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_SourceRxId]  DEFAULT ((0)) FOR [SourceRxId]
GO
ALTER TABLE [dbo].[DrugFavorite] ADD  CONSTRAINT [DF_DrugFavorite_SourceRxDrugNumber]  DEFAULT ((0)) FOR [SourceRxDrugNumber]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_ClinicId]  DEFAULT ((0)) FOR [ClinicId]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_TorontoMdNumber]  DEFAULT ((0)) FOR [TorontoMdNumber]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_DoseSpotUserId]  DEFAULT ((0)) FOR [DoseSpotUserId]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_Gender]  DEFAULT ('Unknown') FOR [Gender]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_UserId]  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Md] ADD  CONSTRAINT [DF_Md_AcceptsRefillAgentAgreement]  DEFAULT ((1)) FOR [AcceptsRefillAgentAgreement]
GO
ALTER TABLE [dbo].[MdRegistrationLog] ADD  CONSTRAINT [DF_MdRegistrationLog_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_Patient_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_Patient_IsTemporary]  DEFAULT ((1)) FOR [IsTemporary]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_Patient_HeightInInches]  DEFAULT ((0)) FOR [HeightInInches]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_Patient_WeightInPounds]  DEFAULT ((0)) FOR [WeightInPounds]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_Patient_Gender]  DEFAULT ('U') FOR [Gender]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_ClinicId]  DEFAULT ((0)) FOR [ClinicId]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_MdId]  DEFAULT ((0)) FOR [MdId]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_DoseSpotPatientId]  DEFAULT ((0)) FOR [DoseSpotPatientId]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_Status]  DEFAULT ('A') FOR [Status]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_FavoritePharmacyId]  DEFAULT ((0)) FOR [FavoritePharmacyId]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[MediScriptsPatient] ADD  CONSTRAINT [DF_MediScriptsPatient_PatientAddedForRefillRequest]  DEFAULT ((0)) FOR [PatientAddedForRefillRequest]
GO
ALTER TABLE [dbo].[PatientTime] ADD  CONSTRAINT [DF_PatientTime_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_LexiSynonymTypeId]  DEFAULT ((0)) FOR [LexiSynonymTypeId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_DurationInDays]  DEFAULT ((0)) FOR [DurationInDays]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_Refills]  DEFAULT ((0)) FOR [Refills]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_NoSubstitutions]  DEFAULT ((0)) FOR [NoSubstitutions]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_DoseSpotPrescriptionId]  DEFAULT ((0)) FOR [DoseSpotPrescriptionId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_LexiGenProductId]  DEFAULT ((0)) FOR [LexiGenProductId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_LexiDrugSynId]  DEFAULT ((0)) FOR [LexiDrugSynId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_DispenseUnitTypeId]  DEFAULT ((0)) FOR [DispenseUnitTypeId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_PatientId]  DEFAULT ((0)) FOR [PatientId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_DoseSpotPharmacyId]  DEFAULT ((0)) FOR [DoseSpotPharmacyId]
GO
ALTER TABLE [dbo].[RefillRequest] ADD  CONSTRAINT [DF_RefillRequest_MdId]  DEFAULT ((0)) FOR [MdId]
GO
ALTER TABLE [dbo].[Rx] ADD  CONSTRAINT [DF_Rx_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Rx] ADD  CONSTRAINT [DF_Rx_DoseSpotPharmacyId]  DEFAULT ((0)) FOR [DoseSpotPharmacyId]
GO
ALTER TABLE [dbo].[Rx] ADD  CONSTRAINT [DF_Rx_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_LexiGenProductId2]  DEFAULT ((0)) FOR [LexiSynonymTypeId]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_Refills]  DEFAULT ((0)) FOR [Refills]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_NoSubstitutions]  DEFAULT ((0)) FOR [NoSubstitutions]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_DoseSpotPrescriptionId]  DEFAULT ((0)) FOR [DoseSpotPrescriptionId]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_LexiGenProductId]  DEFAULT ((0)) FOR [LexiGenProductId]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_LexiGenProductId3]  DEFAULT ((0)) FOR [LexiDrugSynId]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_LexiGenProductId1]  DEFAULT ((0)) FOR [DispenseUnitTypeId]
GO
ALTER TABLE [dbo].[RxDrug] ADD  CONSTRAINT [DF_RxDrug_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Samples] ADD  CONSTRAINT [DF_Samples_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[EMR_Fields]  WITH CHECK ADD  CONSTRAINT [FK_EMR_Fields_EMRList] FOREIGN KEY([EMR_ID])
REFERENCES [dbo].[EMRList] ([ID])
GO
ALTER TABLE [dbo].[EMR_Fields] CHECK CONSTRAINT [FK_EMR_Fields_EMRList]
GO
ALTER TABLE [dbo].[EMR_File_List]  WITH CHECK ADD  CONSTRAINT [FK_EMR_File_List_EMRList] FOREIGN KEY([EMR_EMRID])
REFERENCES [dbo].[EMRList] ([ID])
GO
ALTER TABLE [dbo].[EMR_File_List] CHECK CONSTRAINT [FK_EMR_File_List_EMRList]
GO
ALTER TABLE [dbo].[Md]  WITH CHECK ADD  CONSTRAINT [FK_Md_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([ClinicId])
GO
ALTER TABLE [dbo].[Md] CHECK CONSTRAINT [FK_Md_Clinic]
GO
ALTER TABLE [dbo].[MediPatients_EMR_Fields_Map]  WITH CHECK ADD  CONSTRAINT [FK_MediPatients_EMR_Fields_Map_EMRList] FOREIGN KEY([EMRID])
REFERENCES [dbo].[EMRList] ([ID])
GO
ALTER TABLE [dbo].[MediPatients_EMR_Fields_Map] CHECK CONSTRAINT [FK_MediPatients_EMR_Fields_Map_EMRList]
GO
ALTER TABLE [dbo].[MediPatients_EMR_Fields_Map]  WITH CHECK ADD  CONSTRAINT [FK_MediPatients_EMR_Fields_Map_MediPatients_EMR_Fields_Map] FOREIGN KEY([EMR_Fields_ID])
REFERENCES [dbo].[EMR_Fields] ([ID])
GO
ALTER TABLE [dbo].[MediPatients_EMR_Fields_Map] CHECK CONSTRAINT [FK_MediPatients_EMR_Fields_Map_MediPatients_EMR_Fields_Map]
GO
ALTER TABLE [dbo].[MediPatients_EMR_Fields_Map]  WITH CHECK ADD  CONSTRAINT [FK_MediPatients_EMR_Fields_Map_MediPatients_Fields] FOREIGN KEY([MediPatients_ID])
REFERENCES [dbo].[MediPatients_Fields] ([Id])
GO
ALTER TABLE [dbo].[MediPatients_EMR_Fields_Map] CHECK CONSTRAINT [FK_MediPatients_EMR_Fields_Map_MediPatients_Fields]
GO
ALTER TABLE [dbo].[MediScriptsPatient]  WITH CHECK ADD  CONSTRAINT [FK_MediScriptsPatient_EMR_File_List] FOREIGN KEY([EMR_File_ID])
REFERENCES [dbo].[EMR_File_List] ([EMR_File_ID])
GO
ALTER TABLE [dbo].[MediScriptsPatient] CHECK CONSTRAINT [FK_MediScriptsPatient_EMR_File_List]
GO
ALTER TABLE [dbo].[PatientTime]  WITH CHECK ADD  CONSTRAINT [FK_PatientTime_Md] FOREIGN KEY([MdId])
REFERENCES [dbo].[Md] ([MdId])
GO
ALTER TABLE [dbo].[PatientTime] CHECK CONSTRAINT [FK_PatientTime_Md]
GO
ALTER TABLE [dbo].[PatientTime]  WITH CHECK ADD  CONSTRAINT [FK_PatientTime_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[MediScriptsPatient] ([PatientId])
GO
ALTER TABLE [dbo].[PatientTime] CHECK CONSTRAINT [FK_PatientTime_Patient]
GO
ALTER TABLE [dbo].[Rx]  WITH CHECK ADD  CONSTRAINT [FK_Rx_Md] FOREIGN KEY([MdId])
REFERENCES [dbo].[Md] ([MdId])
GO
ALTER TABLE [dbo].[Rx] CHECK CONSTRAINT [FK_Rx_Md]
GO
ALTER TABLE [dbo].[Rx]  WITH CHECK ADD  CONSTRAINT [FK_Rx_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[MediScriptsPatient] ([PatientId])
GO
ALTER TABLE [dbo].[Rx] CHECK CONSTRAINT [FK_Rx_Patient]
GO
ALTER TABLE [dbo].[RxDrug]  WITH CHECK ADD  CONSTRAINT [FK_RxDrug_Rx] FOREIGN KEY([RxId])
REFERENCES [dbo].[Rx] ([RxId])
GO
ALTER TABLE [dbo].[RxDrug] CHECK CONSTRAINT [FK_RxDrug_Rx]
GO
/****** Object:  StoredProcedure [dbo].[DeletePatientAndActivity]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePatientAndActivity] 
	-- Add the parameters for the stored procedure here
	@PatId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete RxDrug where RxId in (Select RxId from Rx where PatientId = @PatId)
	Delete Rx Where RxId in (Select RxId from Rx where PatientId = @PatId)
	Delete PatientTime where PatientId = @PatId
	Delete MediScriptsPatient where PatientId = @PatId
END
GO
/****** Object:  StoredProcedure [dbo].[G_Get20PhotosNewerThan]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[G_Get20PhotosNewerThan]
 @cr DateTime
-- Returns 20 rows with Created time equal to or newer than the specified value.
-- If 20 newer rows don't exist, return the most recent 20 rows.	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
Declare @cnt int;
Select @cnt = COUNT(*) from GPhoto Where IsActive = 1 and IsShownInRecent = 1 and Created >= @cr 

if (@cnt < 20)
Select Top (20) * from GPhoto where IsActive = 1 and IsShownInRecent = 1 Order by Created desc

else
Select * from GPhoto Where Created in (Select Top (20) Created from GPhoto where IsActive = 1 and 
IsShownInRecent = 1 and Created >= @cr 
order by Created) Order by Created desc




END

 




GO
/****** Object:  StoredProcedure [dbo].[G_GetTwentiethEarlierAndLater]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>

CREATE PROCEDURE [dbo].[G_GetTwentiethEarlierAndLater] 
	@cr DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


-- 20th older
Declare @ago20 datetime 
Select @ago20 = Min(Created) from GPhoto Where Created in 
(Select Top (21) Created from GPhoto where IsActive = 1 and IsShownInRecent = 1 and Created < @cr order by Created desc) 
if @ago20 is null
Select @ago20 = MIN(Created) from GPhoto where IsActive = 1 and IsShownInRecent = 1 

-- 20th newer
Declare @later20 datetime 
Select @later20 = Max(Created) from GPhoto Where Created in 
(Select Top (20) Created from GPhoto where IsActive = 1 and IsShownInRecent = 1 and Created > @cr order by Created) 
if @later20 is null
Select @later20 = Max(Created) from GPhoto where IsActive = 1 and IsShownInRecent = 1 


Select @ago20, @later20, MIN(Created) , Max(Created) from GPhoto Where IsActive = 1 and IsShownInRecent = 1 
END






GO
/****** Object:  StoredProcedure [dbo].[GetPrevThisAndNextForRecent]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrevThisAndNextForRecent] @fn varchar(50)
	 
AS

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- older
Declare @created DateTime; Select @created = Created from GPhoto where FileName = @fn; 

Declare @p DateTime; 
Select @p = MAX(Created) from GPhoto Where IsActive = 1 and IsShownInRecent = 1 and Created < @created;
if @p is null select @p = @created;

Declare @nx DateTime; 
Select @nx = MIN(Created) from GPhoto Where IsActive = 1 and IsShownInRecent = 1 and Created > @created;
if @nx is null select @nx = @created;

Select * from GPhoto Where Created = @p 

union ALL Select * from GPhoto Where FileName = @fn 

union ALL Select * from GPhoto Where Created = @nx


Order By Created


GO
/****** Object:  StoredProcedure [dbo].[GetPrevThisAndNextForSearch]    Script Date: 2018-11-01 9:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>

CREATE PROCEDURE [dbo].[GetPrevThisAndNextForSearch] 

@fn varchar(50), @search varchar(2000) = null 
	 
AS

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 
Declare @created DateTime; Select @created = Created from GPhoto where FileName = @fn; 

Declare @p DateTime; 
Select @p = MAX(Created) from GPhoto Where IsActive = 1 and IsShownInRecent = 1 and Created < @created AND (Keywords like @search or Description like @search or Title like @search);
if @p is null select @p = @created;

Declare @nx DateTime; 
Select @nx = MIN(Created) from GPhoto Where IsActive = 1 and IsShownInRecent = 1 and Created > @created  AND (Keywords like @search or Description like @search or Title like @search);
if @nx is null select @nx = @created;

Select * from GPhoto Where Created = @p 

union ALL Select * from GPhoto Where FileName = @fn 

union ALL Select * from GPhoto Where Created = @nx


Order By Created


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Md"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 280
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "Clinic"
            Begin Extent = 
               Top = 6
               Left = 307
               Bottom = 327
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webpages_Membership"
            Begin Extent = 
               Top = 6
               Left = 533
               Bottom = 260
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webpages_UsersInRoles"
            Begin Extent = 
               Top = 6
               Left = 879
               Bottom = 135
               Right = 1049
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserProfile"
            Begin Extent = 
               Top = 146
               Left = 905
               Bottom = 328
               Right = 1075
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MdRegistrationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MdRegistrationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MdRegistrationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserProfile"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 212
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webpages_Membership"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 281
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Md"
            Begin Extent = 
               Top = 6
               Left = 592
               Bottom = 313
               Right = 845
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MdUserDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MdUserDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[22] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RefillRequest"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 328
               Right = 326
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "MediScriptsPatient"
            Begin Extent = 
               Top = 6
               Left = 364
               Bottom = 308
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RefillRequestListItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RefillRequestListItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "li"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Md"
            Begin Extent = 
               Top = 6
               Left = 288
               Bottom = 136
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxAndMd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxAndMd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "R1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "R2"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 531
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 138
               Left = 288
               Bottom = 267
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RR"
            Begin Extent = 
               Top = 294
               Left = 270
               Bottom = 423
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3690
         Alias = 900
         Table = 1170
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 326
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R1"
            Begin Extent = 
               Top = 6
               Left = 364
               Bottom = 136
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R2"
            Begin Extent = 
               Top = 6
               Left = 653
               Bottom = 136
               Right = 865
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 284
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 138
               Left = 322
               Bottom = 268
               Right = 553
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 903
               Bottom = 136
               Right = 1091
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NDC_PKG_PRODUCT (LexiComp.dbo)"
            Begin Extent = 
               Top = 138
               Left = 591
               Bottom = 268
               Right = 807
            End
            DisplayFlags = 280
           ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxDetailWithManufacturer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' TopColumn = 0
         End
         Begin Table = "NDC_TRADE_NAME (LexiComp.dbo)"
            Begin Extent = 
               Top = 138
               Left = 845
               Bottom = 268
               Right = 1025
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CORE_GENPRODUCT (LexiComp.dbo)"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 342
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NDC_LABELER (LexiComp.dbo)"
            Begin Extent = 
               Top = 270
               Left = 380
               Bottom = 400
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxDetailWithManufacturer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxDetailWithManufacturer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "R1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "R2"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 333
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 531
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 136
               Left = 376
               Bottom = 265
               Right = 564
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxListItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxListItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxListItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "li"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Md"
            Begin Extent = 
               Top = 6
               Left = 304
               Bottom = 136
               Right = 551
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxTotalsByMd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RxTotalsByMd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserProfile"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 195
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webpages_Membership"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 299
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webpages_UsersInRoles"
            Begin Extent = 
               Top = 6
               Left = 592
               Bottom = 101
               Right = 762
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webpages_Roles"
            Begin Extent = 
               Top = 6
               Left = 800
               Bottom = 101
               Right = 970
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserDetail'
GO
USE [master]
GO
ALTER DATABASE [MarktechServices] SET  READ_WRITE 
GO
