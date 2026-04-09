(*
Blok funkcyjny realizuje zapis kolejnej probki do czujnika.

*)

//Jesli brak nowej probki to koniec wykonania
IF not ioSensor.InputData.canWrite THEN
    RETURN;
END_IF

//Zapisanie probki do bufora probek
ioSensor.InternalData.FIFOBuffer:=THIS.PushInternalData(ioSensor.InputData.newValue,ioSensor.InternalData.FIFOBuffer);

//Zapisanie znacznika czasowego w ms od 01-01-1970
ioSensor.InternalData.lastSampleTimestamp := THIS.GetTimestamp();

//Wyliczenie statystyk dla nowej probki
ioSensor.InternalData.lastSampleStatistics := THIS.CalcSignalStatistics(ioSensor.InternalData.FIFOBuffer,ioSensor.InputData.newValue);

ioSensor.InputData.canWrite := FALSE;