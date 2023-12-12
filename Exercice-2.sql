/*version en utilisant la boucle FOR*/
CREATE OR REPLACE FUNCTION nb_occurrences(
    carac CHAR,
    chaine VARCHAR,
    debut INT,
    fin INT
) RETURNS INT AS $$
DECLARE
    nb_occ INT := 0;
BEGIN
    IF debut < 1 OR fin > LENGTH(chaine) OR debut > fin THEN
        RAISE EXCEPTION 'Interval incorrect';
    END IF;

    FOR i IN debut..fin LOOP
        IF SUBSTR(chaine, i, 1) = carac THEN
            nb_occ := nb_occ + 1;
        END IF;
    END LOOP;

    RETURN nb_occ;
END;
$$ LANGUAGE plpgsql;


/*version avec la boucle LOOP/EXIT*/
CREATE OR REPLACE FUNCTION nb_occurrences(
    carac CHAR,
    chaine VARCHAR,
    debut INT,
    fin INT
) RETURNS INT AS $$
DECLARE
    nb_occ INT := 0;
    i INT := debut;
BEGIN
    IF debut < 1 OR fin > LENGTH(chaine) OR debut > fin THEN
        RAISE EXCEPTION 'Interval incorrect';
    END IF;

    LOOP
        EXIT WHEN i > fin;
        IF SUBSTR(chaine, i, 1) = carac THEN
            nb_occ := nb_occ + 1;
        END IF;
        i := i + 1;
    END LOOP;

    RETURN nb_occ;
END;
$$ LANGUAGE plpgsql;


/*version en utilisant la boucle WHILE*/
CREATE OR REPLACE FUNCTION nb_occurrences(
    carac CHAR,
    chaine VARCHAR,
    debut INT,
    fin INT
) RETURNS INT AS $$
DECLARE
    nb_occ INT := 0;
    i INT := debut;
BEGIN
    IF debut < 1 OR fin > LENGTH(chaine) OR debut > fin THEN
        RAISE EXCEPTION 'Interval incorrect';
    END IF;

    WHILE i <= fin LOOP
        IF SUBSTR(chaine, i, 1) = carac THEN
            nb_occ := nb_occ + 1;
        END IF;
        i := i + 1;
    END LOOP;

    RETURN nb_occ;
END;
$$ LANGUAGE plpgsql;


