CREATE PROCEDURE usp_DeleteMyoffice_ACPD
@JsonData NVARCHAR(MAX)
AS
BEGIN
    DECLARE @MyData TABLE (
        Id INT
    );

    INSERT INTO @MyData
    SELECT *
    FROM OPENJSON(@JsonData)
    WITH (
        Id INT
    );

    DELETE FROM Myoffice_ACPD
    WHERE Id IN (SELECT Id FROM @MyData);

    EXEC usp_AddLog 'Delete operation executed';
END;
