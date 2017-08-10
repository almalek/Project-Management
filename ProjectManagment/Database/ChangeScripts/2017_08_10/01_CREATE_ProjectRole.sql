/*
   Thursday, August 10, 20177:01:23 PM
   User: 
   Server: KRUNO-PC\SQLEXPRESS
   Database: PMDatabase
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProjectRole
	(
	Id uniqueidentifier NOT NULL,
	Abrv nvarchar(100) NOT NULL,
	Name nvarchar(150) NOT NULL,
	Description nvarchar(500) NULL,
	SortOrder int NOT NULL,
	DateCreated datetime NOT NULL,
	DateUpdated datetime NOT NULL,
	TimeStamp timestamp NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProjectRole ADD CONSTRAINT
	PK_ProjectRole PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProjectRole SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProjectRole', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProjectRole', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProjectRole', 'Object', 'CONTROL') as Contr_Per 