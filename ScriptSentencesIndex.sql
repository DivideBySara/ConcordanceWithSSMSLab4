USE [Concordance]
GO

/****** Object:  Index [PK_Sentences]    Script Date: 9/7/2017 3:07:55 PM ******/
ALTER TABLE [AChristmasCarol].[Sentences] ADD  CONSTRAINT [PK_Sentences] PRIMARY KEY CLUSTERED 
(
	[ParagraphIndex] ASC,
	[SentenceIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

