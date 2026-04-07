FOR i := 0 TO 9 DO
    // Wywołanie metody z instancji FB dla każdego elementu tablicy
    fbProcessor(ioSensor := arrSensory[i]);
END_FOR;