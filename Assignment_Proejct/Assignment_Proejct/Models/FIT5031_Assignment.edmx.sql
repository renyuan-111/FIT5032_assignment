
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/02/2020 17:31:21
-- Generated from EDMX file: D:\monash\2020 fit5032\Assignment_Proejct\Assignment_Proejct\Models\FIT5031_Assignment.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AssignmentDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Userid] nvarchar(max)  NOT NULL,
    [DOB] datetime  NOT NULL
);
GO

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [Bookingid] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [courseid] nvarchar(max)  NOT NULL,
    [PhoneNo] nvarchar(max)  NOT NULL,
    [User_id] int  NOT NULL,
    [Courseinfo_Id] int  NOT NULL
);
GO

-- Creating table 'CourseinfoSet'
CREATE TABLE [dbo].[CourseinfoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [Course_date] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Latitude] nvarchar(max)  NOT NULL,
    [Longitude] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FeedbackSet'
CREATE TABLE [dbo].[FeedbackSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Rate] smallint  NOT NULL,
    [BookingBookingid] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Bookingid] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([Bookingid] ASC);
GO

-- Creating primary key on [Id] in table 'CourseinfoSet'
ALTER TABLE [dbo].[CourseinfoSet]
ADD CONSTRAINT [PK_CourseinfoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FeedbackSet'
ALTER TABLE [dbo].[FeedbackSet]
ADD CONSTRAINT [PK_FeedbackSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_UserBooking]
    FOREIGN KEY ([User_id])
    REFERENCES [dbo].[UserSet]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserBooking'
CREATE INDEX [IX_FK_UserBooking]
ON [dbo].[BookingSet]
    ([User_id]);
GO

-- Creating foreign key on [Courseinfo_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_BookingCourseinfo]
    FOREIGN KEY ([Courseinfo_Id])
    REFERENCES [dbo].[CourseinfoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingCourseinfo'
CREATE INDEX [IX_FK_BookingCourseinfo]
ON [dbo].[BookingSet]
    ([Courseinfo_Id]);
GO

-- Creating foreign key on [BookingBookingid] in table 'FeedbackSet'
ALTER TABLE [dbo].[FeedbackSet]
ADD CONSTRAINT [FK_BookingFeedback]
    FOREIGN KEY ([BookingBookingid])
    REFERENCES [dbo].[BookingSet]
        ([Bookingid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingFeedback'
CREATE INDEX [IX_FK_BookingFeedback]
ON [dbo].[FeedbackSet]
    ([BookingBookingid]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------