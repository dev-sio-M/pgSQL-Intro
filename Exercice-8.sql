CREATE OR REPLACE FUNCTION inserer_client(
    nom_client VARCHAR(50),
    prenom_client VARCHAR(50),
    adresse_client VARCHAR(50),
    identifiant_internet INT,
    mdp_internet VARCHAR(50)
) RETURNS BOOLEAN AS $$
DECLARE
    nouveau_num_client VARCHAR(50);
BEGIN
    SELECT MAX(CAST(SUBSTRING(num_client FROM 2) AS INTEGER)) + 1
    INTO nouveau_num_client
    FROM Client;
    
    INSERT INTO Client(num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet)
    VALUES (nouveau_num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet);

    IF FOUND THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;
