CREATE OR REPLACE FUNCTION calculer_longueur_max(chaine1 VARCHAR, chaine2 VARCHAR) RETURNS INT AS $$
DECLARE
    longueur_chaine1 INT := LENGTH(chaine1);
    longueur_chaine2 INT := LENGTH(chaine2);
    longueur_max INT;
BEGIN
    IF longueur_chaine1 > longueur_chaine2 THEN
        longueur_max := longueur_chaine1;
    ELSE
        longueur_max := longueur_chaine2;
    END IF;

    RETURN longueur_max;
END;
$$ LANGUAGE plpgsql;
