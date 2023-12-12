CREATE OR REPLACE FUNCTION getNbJoursParMois(date_param DATE) RETURNS INT AS $$
DECLARE
    nb_jours INT;
BEGIN
    nb_jours := EXTRACT(DAY FROM (date_param + INTERVAL '1 MONTH' - INTERVAL '1 DAY'));
    RETURN nb_jours;
END;
$$ LANGUAGE plpgsql;
