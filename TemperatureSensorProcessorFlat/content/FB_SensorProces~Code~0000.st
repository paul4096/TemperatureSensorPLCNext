IF not ioSensor.InputData.canWrite THEN
    RETURN;
END_IF

// 1. FIFO
ioSensor.InternalData.FIFOBuffer:=THIS.PushInternalData(ioSensor.InputData.newValue,ioSensor.InternalData.FIFOBuffer);

// 2. Czas (użycie systemowego czasu PLCnext)
// Uwaga: Wymaga podpięcia zmiennej systemowej lub użycia RTC
ioSensor.InternalData.timestamp := (IDG_CurrentTimeUTC * 1000);

// 3. Obliczenia
statistics := THIS.CalcSignalStatistics(ioSensor.InternalData.FIFOBuffer);
ioSensor.InternalData.isMaxSample := statistics.isMaxSample;
ioSensor.InternalData.isAboveAvg := statistics.isAboveAvg;
ioSensor.InternalData.deviation := statistics.deviation;
ioSensor.InternalData.avg := statistics.avg;

ioSensor.InputData.canWrite := FALSE;


