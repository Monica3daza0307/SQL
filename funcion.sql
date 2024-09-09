DELIMITER $$

CREATE FUNCTION obtener_calificacion_promedio(idCita INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE calificacion_promedio FLOAT;

    -- Calcula la calificación promedio para la cita especificada
    SELECT AVG(
        CASE
            WHEN Calificacion = 'Excelente' THEN 5
            WHEN Calificacion = 'Bueno' THEN 4
            WHEN Calificacion = 'Buena' THEN 3
            WHEN Calificacion = 'Regular' THEN 2
            ELSE 1
        END
    ) INTO calificacion_promedio
    FROM detalle_cita
    WHERE Idcita = idCita;

    RETURN calificacion_promedio;
END $$

DELIMITER ;
SELECT obtener_calificacion_promedio(111) AS promedio_calificacion;
