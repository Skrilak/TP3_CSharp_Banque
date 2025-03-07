USE [master]
GO
/****** Object:  Database [banque]    Script Date: 10/01/2025 11:45:58 ******/
CREATE DATABASE [banque]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'banque', FILENAME = N'C:\SQL\instances\MSSQL14.NATHAN\MSSQL\DATA\banque.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'banque_log', FILENAME = N'C:\SQL\instances\MSSQL14.NATHAN\MSSQL\DATA\banque_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [banque] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [banque].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [banque] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [banque] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [banque] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [banque] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [banque] SET ARITHABORT OFF 
GO
ALTER DATABASE [banque] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [banque] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [banque] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [banque] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [banque] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [banque] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [banque] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [banque] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [banque] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [banque] SET  DISABLE_BROKER 
GO
ALTER DATABASE [banque] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [banque] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [banque] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [banque] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [banque] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [banque] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [banque] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [banque] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [banque] SET  MULTI_USER 
GO
ALTER DATABASE [banque] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [banque] SET DB_CHAINING OFF 
GO
ALTER DATABASE [banque] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [banque] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [banque] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [banque] SET QUERY_STORE = OFF
GO
USE [banque]
GO
/****** Object:  User [conseiller]    Script Date: 10/01/2025 11:45:58 ******/
CREATE USER [conseiller] FOR LOGIN [conseiller] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fClient_GetSoldeTotal]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        B.Chataing
-- Create date:   07/11/2022
-- Description:   Calcul de la somme totale détenue par un client
-- =============================================
CREATE FUNCTION [dbo].[fClient_GetSoldeTotal](@pIdClient int) RETURNS money
AS
BEGIN
    DECLARE @total money;
    SELECT @total = SUM(CPT_Solde) 
    FROM cb_vcomptes 
    WHERE CLI_Id = @pIdClient 
    GROUP BY CLI_Id;
    RETURN @total;
END
GO
/****** Object:  Table [dbo].[cb_client]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cb_client](
	[CLI_Id] [int] NOT NULL,
	[CLI_Nom] [nchar](100) NOT NULL,
	[CLI_Prenom] [nchar](20) NOT NULL,
	[CLI_Rue] [nchar](200) NOT NULL,
	[CLI_CodePostal] [nchar](5) NOT NULL,
	[CLI_Ville] [nchar](150) NOT NULL,
	[CLI_Mobile] [nchar](14) NOT NULL,
	[CLI_Mail] [nchar](50) NOT NULL,
	[CF_Id] [int] NOT NULL,
	[CLI_Nom_chiffree] [varbinary](max) NULL,
	[CLI_Prenom_chiffree] [varbinary](max) NULL,
	[CLI_Rue_chiffree] [varbinary](max) NULL,
	[CLI_CodePostal_chiffree] [varbinary](max) NULL,
	[CLI_Ville_chiffree] [varbinary](max) NULL,
	[CLI_Mobile_chiffree] [varbinary](max) NULL,
	[CLI_Mail_chiffree] [varbinary](max) NULL,
 CONSTRAINT [PK_cb_client] PRIMARY KEY CLUSTERED 
(
	[CLI_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[cb_vclients]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cb_vclients]
as
select CLI_Id,CLI_Nom,CLI_Prenom,CLI_Mobile,CLI_Mail,CF_Id from cb_client;
GO
/****** Object:  View [dbo].[cb_vclients_chiffree]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cb_vclients_chiffree]
as
select CLI_Id,CLI_Nom_chiffree,CLI_Prenom_chiffree,CLI_Mobile_chiffree,CLI_Mail_chiffree,CF_Id from cb_client;
GO
/****** Object:  Table [dbo].[cb_compte]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cb_compte](
	[CPT_Id] [int] NOT NULL,
	[CPT_Solde] [money] NULL,
	[CLI_Id] [int] NOT NULL,
 CONSTRAINT [PK_cb_compte] PRIMARY KEY CLUSTERED 
(
	[CPT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cb_compte_courant]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cb_compte_courant](
	[CPT_Id] [int] NOT NULL,
	[CPT_Decouvert_autorise] [money] NULL,
 CONSTRAINT [PK_cb_comptecourant] PRIMARY KEY CLUSTERED 
(
	[CPT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cb_compte_epargne]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cb_compte_epargne](
	[CPT_Id] [int] NOT NULL,
	[CPT_Type] [nchar](30) NOT NULL,
	[CPT_Taux_interet] [decimal](4, 2) NULL,
 CONSTRAINT [PK_cb_compte_epargne] PRIMARY KEY CLUSTERED 
(
	[CPT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[cb_vcomptes]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cb_vcomptes]
as
select c.CPT_Id,CPT_Solde,CLI_Id,CPT_Decouvert_autorise,CPT_Type,CPT_Taux_interet
from cb_compte c left join cb_compte_epargne ce on c.CPT_Id = ce.CPT_Id
left join cb_compte_courant cc on c.CPT_Id = cc.CPT_Id;
GO
/****** Object:  Table [dbo].[cb_conseiller]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cb_conseiller](
	[CF_Id] [int] NOT NULL,
	[CF_Nom] [nchar](50) NOT NULL,
	[CF_Prenom] [nchar](50) NOT NULL,
	[CF_Login] [nchar](50) NOT NULL,
	[CF_Password] [varbinary](512) NOT NULL,
	[CF_Nom_chiffree] [varbinary](max) NULL,
	[CF_Prenom_chiffree] [varbinary](max) NULL,
	[CF_Login_chiffree] [varbinary](max) NULL,
 CONSTRAINT [PK_cb_conseiller] PRIMARY KEY CLUSTERED 
(
	[CF_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[cb_vconseillers]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cb_vconseillers]
as
select CF_Id,CF_Nom,CF_Prenom, CF_Login, CF_Password from cb_conseiller;
GO
/****** Object:  View [dbo].[cb_vconseillers_chiffree]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cb_vconseillers_chiffree]
as
select CF_Id,CF_Nom_chiffree,CF_Prenom_chiffree,CF_Login_chiffree,CF_Password from cb_conseiller;
GO
ALTER TABLE [dbo].[cb_compte]  WITH CHECK ADD  CONSTRAINT [FK_cb_compte_cb_client] FOREIGN KEY([CLI_Id])
REFERENCES [dbo].[cb_client] ([CLI_Id])
GO
ALTER TABLE [dbo].[cb_compte] CHECK CONSTRAINT [FK_cb_compte_cb_client]
GO
ALTER TABLE [dbo].[cb_compte_courant]  WITH CHECK ADD  CONSTRAINT [FK_cb_comptecourant_cb_compte] FOREIGN KEY([CPT_Id])
REFERENCES [dbo].[cb_compte] ([CPT_Id])
GO
ALTER TABLE [dbo].[cb_compte_courant] CHECK CONSTRAINT [FK_cb_comptecourant_cb_compte]
GO
ALTER TABLE [dbo].[cb_compte_epargne]  WITH CHECK ADD  CONSTRAINT [FK_cb_compte_epargne_cb_compte] FOREIGN KEY([CPT_Id])
REFERENCES [dbo].[cb_compte] ([CPT_Id])
GO
ALTER TABLE [dbo].[cb_compte_epargne] CHECK CONSTRAINT [FK_cb_compte_epargne_cb_compte]
GO
/****** Object:  StoredProcedure [dbo].[sp_authentification]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        B.Chataing
-- Create date:   07/11/2022
-- Description:   Sélection des clients par conseiller financier
-- =============================================
CREATE PROCEDURE [dbo].[sp_authentification]
    @pLogin varchar(20),
    @pPassword varbinary(512)
AS
BEGIN
    -- Déclaration de variables locales pour construire la requête et valider le type du paramètre.
    DECLARE 
        @SQLString nvarchar(500),
        @ParamDefinition nvarchar(500);

    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Ouverture clé déchiffrement
    OPEN SYMMETRIC KEY Credit_sym_key
        DECRYPTION BY CERTIFICATE Credit;

    -- Construction de la requête
    SET @SQLString = 
        N'SELECT CF_Id as ID, CONVERT(nvarchar,DECRYPTBYKEY(CF_Nom_chiffree)) as ''Nom'', 
          CONVERT(nvarchar,DECRYPTBYKEY(CF_Prenom_chiffree)) as ''Prenom''
          FROM cb_vconseillers_chiffree
          WHERE CONVERT(nvarchar,DECRYPTBYKEY(CF_Login_chiffree)) = @pLogin
          AND CF_Password = @pPassword;';

    SET @ParamDefinition = N'@pLogin varchar(20), @pPassword varbinary(512)';

    -- Exécution de la requête
    EXECUTE sp_executesql @SQLString, @ParamDefinition, @pLogin, @pPassword;

    -- Fermeture clé
    CLOSE SYMMETRIC KEY Credit_sym_key;
END
GO
/****** Object:  StoredProcedure [dbo].[spClient_GetByConseiller]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        B.Chataing
-- Create date:   07/11/2022
-- Description:   Sélection des clients par conseiller financier
-- =============================================
CREATE PROCEDURE [dbo].[spClient_GetByConseiller]
    -- Add the parameters for the stored procedure here
    @IdConseiller int
AS
BEGIN
    -- Déclaration de variables locales pour construire la requête et valider le type du paramètre.
    DECLARE
        @SQLString nvarchar(500),
        @ParamDefinition nvarchar(500);

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Ouverture clé déchiffrement
    OPEN SYMMETRIC KEY Credit_sym_key
    DECRYPTION BY CERTIFICATE Credit;

    -- Construction de la requête
    SET @SQLString = 
    N'SELECT CLI_Id AS ID, CONVERT(nvarchar, DECRYPTBYKEY(CLI_Nom_chiffree)) AS ''Nom'', 
    CONVERT(nvarchar, DECRYPTBYKEY(CLI_Prenom_chiffree)) AS ''Prenom'', 
    CONVERT(nvarchar, DECRYPTBYKEY(CLI_Mobile_chiffree)) AS ''Mobile'', 
    CONVERT(nvarchar(100), DECRYPTBYKEY(CLI_Mail_chiffree)) AS ''Mail''
    FROM cb_vclients_chiffree
    WHERE CF_Id = @IdConseiller';

    SET @ParamDefinition = N'@IdConseiller int';

    -- Exécution de la requête
    EXECUTE sp_executesql @SQLString, @ParamDefinition, @IdConseiller;

    -- Fermeture clé
    CLOSE SYMMETRIC KEY Credit_sym_key;
END
GO
/****** Object:  StoredProcedure [dbo].[spCompte_GetByClient]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        B.Chataing
-- Create date:   07/11/2022
-- Description:   Sélection des clients par conseiller financier
-- =============================================
CREATE PROCEDURE [dbo].[spCompte_GetByClient]
    -- Add the parameters for the stored procedure here
    @IdClient int
AS
BEGIN
    -- Déclaration de variables locales pour construire la requête et valider le type du paramètre.
    DECLARE
        @SQLString nvarchar(500),
        @ParamDefinition nvarchar(500);

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Ouverture clé déchiffrement
    OPEN SYMMETRIC KEY Credit_sym_key
    DECRYPTION BY CERTIFICATE Credit;

    -- Construction de la requête
    SET @SQLString = 
    N'SELECT CLI_Id AS ID, CPT_Solde AS ''Solde'', 
    CPT_Decouvert_autorise AS ''Decouvert_autorise'', 
    CPT_Type AS ''Type_compte'', 
    CPT_Taux_interet AS ''Taux_interet''
    FROM cb_vcomptes
    WHERE CLI_Id = @IdClient';

    SET @ParamDefinition = N'@IdClient int';

    -- Exécution de la requête
    EXECUTE sp_executesql @SQLString, @ParamDefinition, @IdClient;

    -- Fermeture clé
    CLOSE SYMMETRIC KEY Credit_sym_key;
END
GO
/****** Object:  StoredProcedure [dbo].[spCompte_GetById]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        B.Chataing
-- Create date:   07/11/2022
-- Description:   Sélection des clients par conseiller financier
-- =============================================
CREATE PROCEDURE [dbo].[spCompte_GetById]
    -- Add the parameters for the stored procedure here
    @IdCompte int
AS
BEGIN
    -- Déclaration de variables locales pour construire la requête et valider le type du paramètre.
    DECLARE
        @SQLString nvarchar(500),
        @ParamDefinition nvarchar(500);

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Ouverture clé déchiffrement
    OPEN SYMMETRIC KEY Credit_sym_key
    DECRYPTION BY CERTIFICATE Credit;

    -- Construction de la requête
    SET @SQLString = 
    N'SELECT CPT_Id AS ID, CPT_Solde AS ''Solde'', 
    CPT_Decouvert_autorise AS ''Decouvert_autorise'', 
    CPT_Type AS ''Type_compte'', 
    CPT_Taux_interet AS ''Taux_interet''
    FROM cb_vcomptes
    WHERE CPT_Id = @IdCompte';

    SET @ParamDefinition = N'@IdCompte int';

    -- Exécution de la requête
    EXECUTE sp_executesql @SQLString, @ParamDefinition, @IdCompte;

    -- Fermeture clé
    CLOSE SYMMETRIC KEY Credit_sym_key;
END
GO
/****** Object:  StoredProcedure [dbo].[spCompte_Update]    Script Date: 10/01/2025 11:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: B.Chataing
-- Create date: 08/11/2022
-- Description: Modification solde compte
-- =============================================
CREATE PROCEDURE [dbo].[spCompte_Update]
    -- Add the parameters for the stored procedure here
    @pIdCompte int,
    @pSolde money
AS
BEGIN
    -- Déclaration de variables locales
    DECLARE 
        @UpdateString nvarchar(500),
        @ParamDefinition nvarchar(500);

    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Construction de la requête
    SET @UpdateString = 
        N'UPDATE cb_compte
          SET CPT_Solde = @pSolde
          WHERE CPT_Id=@pIdCompte;';
    SET @ParamDefinition = N'@pIdCompte int, @pSolde money';

    -- Exécution de la requête
    EXECUTE sp_executesql @UpdateString, @ParamDefinition, @pIdCompte, @pSolde;
END
GO
USE [master]
GO
ALTER DATABASE [banque] SET  READ_WRITE 
GO
