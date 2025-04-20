CREATE PROCEDURE usp_ReadMyoffice_ACPD
AS
BEGIN
    SELECT *
    FROM Myoffice_ACPD
    FOR JSON PATH;

    EXEC usp_AddLog 'Read operation executed';
END;
