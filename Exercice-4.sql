CREATE OR REPLACE FUNCTION dateSqlToDatefr(date DATE) RETURNS VARCHAR AS $$
DECLARE
    date_fr VARCHAR(10);
BEGIN
    date_fr := TO_CHAR(date, 'DD/MM/YYYY');
    RETURN date_fr;
END;
$$ LANGUAGE plpgsql;
