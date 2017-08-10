/*
   Thursday, August 10, 20177:07:51 PM
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
ALTER TABLE dbo.ProjectRole SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProjectRole', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProjectRole', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProjectRole', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.[User] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.[User]', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.[User]', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.[User]', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Project SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Project', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Project', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Project', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_ProjectUser
	(
	Id uniqueidentifier NOT NULL,
	ProjectId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	ProjectRoleId uniqueidentifier NOT NULL,
	DateCreated datetime NOT NULL,
	DateUpdated datetime NOT NULL,
	TimeStamp timestamp NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ProjectUser SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.ProjectUser)
	 EXEC('INSERT INTO dbo.Tmp_ProjectUser (Id, ProjectId, UserId, DateCreated, DateUpdated)
		SELECT Id, ProjectId, UserId, DateCreated, DateUpdated FROM dbo.ProjectUser WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.ProjectUser
GO
EXECUTE sp_rename N'dbo.Tmp_ProjectUser', N'ProjectUser', 'OBJECT' 
GO
ALTER TABLE dbo.ProjectUser ADD CONSTRAINT
	PK_ProjectUser PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX IX_ProjectUser ON dbo.ProjectUser
	(
	ProjectId,
	ProjectRoleId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.ProjectUser ADD CONSTRAINT
	FK_ProjectUser_Project FOREIGN KEY
	(
	ProjectId
	) REFERENCES dbo.Project
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProjectUser ADD CONSTRAINT
	FK_ProjectUser_User FOREIGN KEY
	(
	UserId
	) REFERENCES dbo.[User]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProjectUser ADD CONSTRAINT
	FK_ProjectUser_ProjectRole FOREIGN KEY
	(
	ProjectRoleId
	) REFERENCES dbo.ProjectRole
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProjectUser', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProjectUser', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProjectUser', 'Object', 'CONTROL') as Contr_Per 