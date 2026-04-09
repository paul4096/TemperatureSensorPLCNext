//procedura obliczajaca statystyki dla kazdej probki bufora
//wynik zapisywany jest w zmiennej lokalnej FunctionBlock internalDataLocal



//wyznaczenie statystyk dla kazdej probki w buforze, bazujac na oblicznej wczesniej sredniej i wartosci maksymalnej.
FOR i := 0 TO internalDataLocal.FIFOBuffer.bufferCount - 1 BY 1 DO
    internalDataLocal.FIFOBuffer.samples[i].deviation := internalDataLocal.FIFOBuffer.samples[i].value - average;
    internalDataLocal.FIFOBuffer.samples[i].isAboveAvg := internalDataLocal.FIFOBuffer.samples[i].value > average;
    internalDataLocal.FIFOBuffer.samples[i].isMaxSample := internalDataLocal.FIFOBuffer.samples[i].value >= maxValue;
END_FOR

