CREATE OR REPLACE FUNCTION getNbJoursParMois(date DATE) RETURNS INT AS $$
DECLARE
    nb_jours INT;
BEGIN
    nb_jours := EXTRACT(DAY FROM (date + INTERVAL '1 MONTH' - INTERVAL '1 DAY'));
    RETURN nb_jours;
END;
$$ LANGUAGE plpgsql;
