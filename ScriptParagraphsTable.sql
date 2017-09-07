USE [Concordance]
GO

/****** Object:  Table [AChristmasCarol].[Paragraphs]    Script Date: 9/7/2017 3:06:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AChristmasCarol].[Paragraphs](
	[ParagraphIndex] [int] NOT NULL,
	[Paragraph] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Paragraphs] PRIMARY KEY CLUSTERED 
(
	[ParagraphIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

