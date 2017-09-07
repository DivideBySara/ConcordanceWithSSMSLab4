USE [Concordance]
GO

/****** Object:  Table [AChristmasCarol].[Sentences]    Script Date: 9/7/2017 3:07:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AChristmasCarol].[Sentences](
	[ParagraphIndex] [int] NOT NULL,
	[SentenceIndex] [int] NOT NULL,
	[Sentence] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Sentences] PRIMARY KEY CLUSTERED 
(
	[ParagraphIndex] ASC,
	[SentenceIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

