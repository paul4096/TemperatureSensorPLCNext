IF not ioSensor.InputData.canWrite THEN
    RETURN;
END_IF
ioSensor.InternalData.FIFOBuffer:=THIS.PushInternalData(ioSensor.InputData.newValue,ioSensor.InternalData.FIFOBuffer);

ioSensor.InternalData.timestamp := THIS.GetTimestamp();

statistics := THIS.CalcSignalStatistics(ioSensor.InternalData.FIFOBuffer);
ioSensor.InternalData.isMaxSample := statistics.isMaxSample;
ioSensor.InternalData.isAboveAvg := statistics.isAboveAvg;
ioSensor.InternalData.deviation := statistics.deviation;
ioSensor.InternalData.avg := statistics.avg;

ioSensor.InputData.canWrite := FALSE;