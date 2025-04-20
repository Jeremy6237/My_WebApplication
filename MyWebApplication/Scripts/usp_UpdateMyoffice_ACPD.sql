CREATE PROCEDURE usp_UpdateMyoffice_ACPD
@JsonData NVARCHAR(MAX)
AS
BEGIN
    DECLARE @MyData TABLE (
        [ACPD_SID] [char](20) NOT NULL,
		[ACPD_Cname] [nvarchar](60) NULL,
		[ACPD_Ename] [nvarchar](40) NULL,
		[ACPD_Sname] [nvarchar](40) NULL,
		[ACPD_Email] [nvarchar](60) NULL,
		[ACPD_Status] [tinyint] NULL,
		[ACPD_Stop] [bit] NULL,
		[ACPD_StopMemo] [nvarchar](60) NULL,
		[ACPD_LoginID] [nvarchar](30) NULL,
		[ACPD_LoginPWD] [nvarchar](60) NULL,
		[ACPD_Memo] [nvarchar](600) NULL,
		[ACPD_NowDateTime] [datetime] NULL,
		[ACPD_NowID] [nvarchar](20) NULL,
		[ACPD_UPDDateTime] [datetime] NULL,
		[ACPD_UPDID] [nvarchar](20) NULL,
    );

    INSERT INTO @MyData
    SELECT *
    FROM OPENJSON(@JsonData)
    WITH (
        [ACPD_SID] [char](20) NOT NULL,
		[ACPD_Cname] [nvarchar](60) NULL,
		[ACPD_Ename] [nvarchar](40) NULL,
		[ACPD_Sname] [nvarchar](40) NULL,
		[ACPD_Email] [nvarchar](60) NULL,
		[ACPD_Status] [tinyint] NULL,
		[ACPD_Stop] [bit] NULL,
		[ACPD_StopMemo] [nvarchar](60) NULL,
		[ACPD_LoginID] [nvarchar](30) NULL,
		[ACPD_LoginPWD] [nvarchar](60) NULL,
		[ACPD_Memo] [nvarchar](600) NULL,
		[ACPD_NowDateTime] [datetime] NULL,
		[ACPD_NowID] [nvarchar](20) NULL,
		[ACPD_UPDDateTime] [datetime] NULL,
		[ACPD_UPDID] [nvarchar](20) NULL,
    );

    UPDATE Myoffice_ACPD
    SET ACPD_SID = pd.ACPD_SID,
        ACPD_Cname = pd.ACPD_Cname,
        ACPD_Ename = pd.ACPD_Ename,
        ACPD_Sname = pd.ACPD_Sname,
		ACPD_Email = pd.ACPD_Email,
        ACPD_Status = pd.ACPD_Status,
		ACPD_Stop = pd.ACPD_Stop,
        ACPD_StopMemo = pd.ACPD_StopMemo,
		ACPD_LoginID = pd.ACPD_LoginID,
        ACPD_LoginPWD = pd.ACPD_LoginPWD,
		ACPD_Memo = pd.ACPD_Memo,
        ACPD_NowDateTime = pd.ACPD_NowDateTime,
		ACPD_NowID = pd.ACPD_NowID,
        ACPD_UPDDateTime = pd.ACPD_UPDDateTime,
		ACPD_UPDID = pd.ACPD_UPDID,
    FROM Myoffice_ACPD m
    JOIN @MyData pd ON m.Id = pd.Id;

    EXEC usp_AddLog 'Update operation executed';
END;
