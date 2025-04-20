CREATE PROCEDURE usp_CreateMyoffice_ACPD
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

    INSERT INTO Myoffice_ACPD (ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, ACPD_Status, ACPD_Stop, ACPD_StopMemo, ACPD_LoginID, ACPD_LoginPWD, ACPD_Memo, ACPD_NowDateTime, ACPD_NowID, ACPD_UPDDateTime, ACPD_UPDID)
    SELECT ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, ACPD_Status, ACPD_Stop, ACPD_StopMemo, ACPD_LoginID, ACPD_LoginPWD, ACPD_Memo, ACPD_NowDateTime, ACPD_NowID, ACPD_UPDDateTime, ACPD_UPDID
    FROM @MyData;

    EXEC usp_AddLog 'Create operation executed';
END;
