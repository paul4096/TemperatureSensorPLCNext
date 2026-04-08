IF not ioSensor.InputData.canWrite THEN
    RETURN;
END_IF
ioSensor.InternalData.FIFOBuffer:=THIS.PushInternalData(ioSensor.InputData.newValue,ioSensor.InternalData.FIFOBuffer);

ioSensor.InternalData.lastSampleTimestamp := THIS.GetTimestamp();

ioSensor.InternalData.lastSampleStatistics := THIS.CalcSignalStatistics(ioSensor.InternalData.FIFOBuffer,ioSensor.InputData.newValue);

ioSensor.InputData.canWrite := FALSE;