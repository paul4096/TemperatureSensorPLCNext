(*
Blok funkcyjny realizuje zapis kolejnej probki do czujnika.

*)

//Jesli brak nowej probki to koniec wykonania
IF not ioSensor.InputData.canWrite THEN
    RETURN;
END_IF

//reset flagi informujacej o nowej probce
ioSensor.InputData.canWrite := FALSE;

//Lokalna kopia InternalData 
internalDataLocal := ioSensor.InternalData;

//Zapisanie probki do bufora probek
THIS.PushInternalData(ioSensor.InputData.newValue);

//Zapisanie znacznika czasowego w ms od 01-01-1970
internalDataLocal.lastSampleTimestamp := THIS.GetTimestamp();

//Wyliczenie sredniej oraz wartosci maksymalnej w buforze
bufferCalcResult := THIS.CalcAvgAndMax();
internalDataLocal.FIFOBuffer.averageValue := bufferCalcResult.average;
//Wyliczenie statystyk dla kazdej probki w buforze
THIS.CalcSignalStatistics(bufferCalcResult.average,bufferCalcResult.maxValue);

//przepisanie lokalnej kopii po modyfikacjach do sensora
ioSensor.InternalData := internalDataLocal;
