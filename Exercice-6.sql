CREATE OR REPLACE FUNCTION nombre_clients_debiteurs() RETURNS INTEGER AS $$
DECLARE
    nb_clients INTEGER;
BEGIN
    SELECT COUNT(DISTINCT id_operation) INTO nb_clients
    FROM Operation
    INNER JOIN Client ON Operation.num_compte = Client.num_client
    WHERE Operation.type_operation = 'Débit' AND date_part('year', Operation.dates::TIMESTAMP) = date_part('year', CURRENT_DATE);

    RETURN nb_clients;
END;
$$ LANGUAGE plpgsql;
