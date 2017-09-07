USE [Concordance]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [IX_WordRefs]    Script Date: 9/7/2017 11:10:06 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_WordRefs] ON [AChristmasCarol].[WordRefs]
(
	[Word] ASC,
	[ParagraphIndex] ASC,
	[SentenceIndex] ASC,
	[WordPositionIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

