CREATE OR REPLACE FUNCTION nombre_clients_par_ville(ville VARCHAR) RETURNS INTEGER AS $$
DECLARE
    nb_clients INTEGER;
BEGIN
    SELECT COUNT(*) INTO nb_clients
    FROM Client
    WHERE adresse_client LIKE '%' || ville || '%';

    RETURN nb_clients;
END;
$$ LANGUAGE plpgsql;
