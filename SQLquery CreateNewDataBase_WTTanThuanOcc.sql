USE [WTTanThuanOcc]
GO

/****** Object:  Table [dbo].[Measurements$]    Script Date: 3/7/2023 3:03:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Measurements$](
	[QualityIDTrigger] [int] NULL,
	[valuetimetrigger] [datetime] NULL,
	[TOTAL_P] [float] NULL,
	[Ambient_temperature] [float] NULL,
	[Total_active_power] [float] NULL,
	[Total_production] [float] NULL,
	[Wind_direction] [float] NULL,
	[Wind_speed] [float] NULL
) ON [PRIMARY]
GO