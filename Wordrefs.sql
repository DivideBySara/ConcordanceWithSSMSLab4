USE [Concordance]
GO

/****** Object:  Table [AChristmasCarol].[WordRefs]    Script Date: 9/2/2017 3:27:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AChristmasCarol].[WordRefs](
	[Word] [nvarchar](100) NOT NULL,
	[ParagraphIndex] [int] NOT NULL,
	[SentenceIndex] [int] NOT NULL,
	[WordPositionIndex] [int] NOT NULL
) ON [PRIMARY]
GO

