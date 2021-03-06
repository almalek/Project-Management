
CREATE TABLE [dbo].[Claim](
	[ClaimId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](4000) NULL,
	[ClaimValue] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo.Claim] PRIMARY KEY CLUSTERED 
(
	[ClaimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalLogin]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalLogin](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ExternalLogin] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[ProjectLeaderId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectUser]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectUser](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	ProjectRoleId uniqueidentifier NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProjectUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX IX_ProjectUser ON dbo.ProjectUser
	(
	ProjectId,
	ProjectRoleId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Role]    Script Date: 7/25/2017 7:21:48 PM ******/
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[AssignedToUserId] [uniqueidentifier] NOT NULL,
	[StatusId] [uniqueidentifier] NOT NULL,
	[PriorityId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DueDate] [datetime] NULL,
	[Progress] [tinyint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskComment]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskComment](
	[Id] [uniqueidentifier] NOT NULL,
	[TaskId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_TaskComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskPriority]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskPriority](
	[Id] [uniqueidentifier] NOT NULL,
	[Abrv] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[SortOrder] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[Id] [uniqueidentifier] NOT NULL,
	[Abrv] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[SortOrder] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](4000) NULL,
	[SecurityStamp] [nvarchar](4000) NULL,
	[PasswordResetToken] [nvarchar](4000) NULL,
	[Email] [nvarchar](4000) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 7/25/2017 7:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Task] ADD  CONSTRAINT [DF_Task_Progress]  DEFAULT ((0)) FOR [Progress]
GO
ALTER TABLE [dbo].[TaskPriority] ADD  CONSTRAINT [DF_TaskPriority_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[TaskStatus] ADD  CONSTRAINT [DF_TaskStatus_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserRole_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Claim_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_dbo.Claim_dbo.User_UserId]
GO
ALTER TABLE [dbo].[ExternalLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExternalLogin_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExternalLogin] CHECK CONSTRAINT [FK_dbo.ExternalLogin_dbo.User_UserId]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Company]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_User] FOREIGN KEY([ProjectLeaderId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_User]
GO
ALTER TABLE [dbo].[ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_ProjectUser_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectUser] CHECK CONSTRAINT [FK_ProjectUser_Project]
GO
ALTER TABLE [dbo].[ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_ProjectUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ProjectUser] CHECK CONSTRAINT [FK_ProjectUser_User]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_AssignedToUser] FOREIGN KEY([AssignedToUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_AssignedToUser]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_CreatedByUser] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_CreatedByUser]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_TaskPriority] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[TaskPriority] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_TaskPriority]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_TaskStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_TaskStatus]
GO


ALTER TABLE [dbo].[TaskComment]  WITH CHECK ADD  CONSTRAINT [FK_TaskComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskComment] CHECK CONSTRAINT [FK_TaskComment_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Company]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId]
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

ALTER TABLE [dbo].[TaskComment] CHECK CONSTRAINT [FK_TaskComment_Task]
GO

-- INSERT SCRIPTS
INSERT INTO [dbo].[ProjectRole]
           ([Id]
           ,[Abrv]
           ,[Name]
           ,[Description]
           ,[SortOrder]
           ,[DateCreated]
           ,[DateUpdated])
     VALUES
           (NEWID()
           ,'PM'
           ,'Project Manager'
           ,NULL
           ,0
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'DEV'
           ,'Developer'
           ,NULL
           ,1
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'DESG'
           ,'Designer'
           ,NULL
           ,2
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'TEST'
           ,'Tester'
           ,NULL
           ,3
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'CLNT'
           ,'Client'
           ,NULL
           ,4
           ,GETDATE()
           ,GETDATE())
GO


INSERT INTO [dbo].[TaskPriority]
           ([Id]
           ,[Abrv]
           ,[Name]
           ,[Description]
					 ,[SortOrder]
           ,[DateCreated]
           ,[DateUpdated])
     VALUES
           (NEWID()
           ,'NONE'
           ,'None'
           ,'No priority',
					 0
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'LOW'
           ,'Low'
           ,'Low priority',
					 1
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'HIGH'
           ,'High'
           ,'High priority',
					 2
           ,GETDATE()
           ,GETDATE())
GO

INSERT INTO [dbo].[TaskStatus]
           ([Id]
           ,[Abrv]
           ,[Name]
           ,[Description]
					 ,[SortOrder]
           ,[DateCreated]
           ,[DateUpdated])
     VALUES
           (NEWID()
           ,'NEW'
           ,'New'
           ,'New task',
					 0
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'InProgress'
           ,'In Progress'
           ,'Task in progress',
					 1
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'RESOLVED'
           ,'Resolved'
           ,'Resolved task',
					 2
           ,GETDATE()
           ,GETDATE()),

		   (NEWID()
           ,'CLOSED'
           ,'Closed'
           ,'Closed task',
					 3
           ,GETDATE()
           ,GETDATE())
GO

INSERT INTO Role (
	RoleId,
	Name,
	DateCreated,
	DateUpdated
)
VALUES 
	(NEWID(),
	'Administrator',
	GETDATE(),
	GETDATE())
GO


