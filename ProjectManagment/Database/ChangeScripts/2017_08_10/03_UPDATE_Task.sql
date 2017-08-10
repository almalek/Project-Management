/*
   Thursday, August 10, 20177:09:50 PM
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
ALTER TABLE dbo.TaskComment
	DROP CONSTRAINT FK_TaskComment_Task
GO
ALTER TABLE dbo.Task SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Task', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Task', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Task', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.TaskComment ADD CONSTRAINT
	FK_TaskComment_Task FOREIGN KEY
	(
	TaskId
	) REFERENCES dbo.Task
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.TaskComment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TaskComment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TaskComment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TaskComment', 'Object', 'CONTROL') as Contr_Per 