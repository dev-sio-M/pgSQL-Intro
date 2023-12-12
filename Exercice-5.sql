CREATE OR REPLACE FUNCTION getNomJour(date DATE) RETURNS VARCHAR AS $$
DECLARE
    nom_jour VARCHAR(20);
BEGIN
    nom_jour := CASE EXTRACT(DOW FROM date)
        WHEN 0 THEN 'Dimanche'
        WHEN 1 THEN 'Lundi'
        WHEN 2 THEN 'Mardi'
        WHEN 3 THEN 'Mercredi'
        WHEN 4 THEN 'Jeudi'
        WHEN 5 THEN 'Vendredi'
        WHEN 6 THEN 'Samedi'
        ELSE 'Jour inconnu'
    END;

    RETURN nom_jour;
END;
$$ LANGUAGE plpgsql;
