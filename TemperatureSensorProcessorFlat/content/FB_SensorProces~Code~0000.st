// Wykrywanie zbocza narastającego ręcznie (bezpieczne w pętli FOR)
IF ioSensor.daneWej.ZapiszSignal AND NOT ioSensor.daneWej.ZapiszSignalOld THEN
    
    // 1. FIFO
    FOR i := 9 TO 1 BY -1 DO
        ioSensor.daneWew.buforFIFO[i] := ioSensor.daneWew.buforFIFO[i-1];
    END_FOR;
    ioSensor.daneWew.buforFIFO[0] := ioSensor.daneWej.nowaWartosc;

    // 2. Czas (użycie systemowego czasu PLCnext)
    // Uwaga: Wymaga podpięcia zmiennej systemowej lub użycia RTC
    // ioSensor.daneWew.stempelCzasu := (IDG_CurrentTimeUTC * 1000);

    // 3. Obliczenia
    suma := 0.0;
    maxTemp := -1000.0;
    FOR i := 0 TO 9 DO
        suma := suma + ioSensor.daneWew.buforFIFO[i];
        IF ioSensor.daneWew.buforFIFO[i] > maxTemp THEN
            maxTemp := ioSensor.daneWew.buforFIFO[i];
        END_IF;
    END_FOR;

    ioSensor.daneWew.srednia := suma / 10.0;
    
    // 4. Flagi dla nowej próbki (indeks 0)
    ioSensor.daneWew.odchylenie := ioSensor.daneWew.buforFIFO[0] - ioSensor.daneWew.srednia;
    ioSensor.daneWew.czyPowyzejSredniej := ioSensor.daneWew.buforFIFO[0] > ioSensor.daneWew.srednia;
    ioSensor.daneWew.czyJestNajwyzsza := ioSensor.daneWew.buforFIFO[0] >= maxTemp;

END_IF;

// Zapisz stan sygnału dla wykrycia zbocza w następnym cyklu
ioSensor.daneWej.ZapiszSignalOld := ioSensor.daneWej.ZapiszSignal;