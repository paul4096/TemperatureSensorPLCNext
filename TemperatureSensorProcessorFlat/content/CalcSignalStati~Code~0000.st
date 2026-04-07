sum := 0.0;
maxTemp := -1000.0;
FOR i := 0 TO 9 DO
    sum := sum + buffer[i];
    IF buffer[i] > maxTemp THEN
        maxTemp := buffer[i];
    END_IF;
END_FOR;

result.avg := sum / 10.0;

//calc statistics for newest sample in the buffer
result.deviation := buffer[0] - result.avg;
result.isAboveAvg := buffer[0] > result.avg;
result.isMaxSample := buffer[0] >= maxTemp;


CalcSignalStatistics := result;