//funkcja obliczajaca statystyki dla nowej probki wzgledem podanego bufora probek wczesniejszych

//Wyznaczenie sumy probek z bufora oraz maksymalnej wartosci probki w buforze.
sum := 0.0;
maxTemp := -1000.0;
FOR i := 0 TO 9 DO
    sum := sum + buffer[i];
    IF buffer[i] > maxTemp THEN
        maxTemp := buffer[i];
    END_IF;
END_FOR;

//wyznaczenie statystyk dla bufora.
result.avg := sum / 10.0;
result.deviation := lastSample - result.avg;
result.isAboveAvg := lastSample > result.avg;
result.isMaxSample := lastSample >= maxTemp;


CalcSignalStatistics := result;