
//Umieszczenie nowej probki w buforze w kolejce FIFO. 
//Nowa probka w elemencie "0". Najstarsza probka z elementu "9" jest usuwana

//Sprawdzenie poprawnosci zmiennych bufferCount oraz bufferHeadIndex
//Jesli wartosci sa po za granicami to reset kolejki FIFO
IF(internalDataLocal.FIFOBuffer.bufferCount < 0 OR internalDataLocal.FIFOBuffer.bufferCount > 10) THEN
    internalDataLocal.FIFOBuffer.bufferCount := 0;
    internalDataLocal.FIFOBuffer.bufferHeadIndex := 0;
END_IF

IF(internalDataLocal.FIFOBuffer.bufferHeadIndex < 0 OR internalDataLocal.FIFOBuffer.bufferHeadIndex >= 10) THEN
    internalDataLocal.FIFOBuffer.bufferCount := 0;
    internalDataLocal.FIFOBuffer.bufferHeadIndex := 0;
END_IF


//Przesuwamy pierwszy element
if internalDataLocal.FIFOBuffer.bufferCount > 0 THEN
    internalDataLocal.FIFOBuffer.bufferHeadIndex := IncrementCounter(internalDataLocal.FIFOBuffer.bufferHeadIndex,10);
END_IF

//Wypelnienie pierwszego elementu nowa wartoscia
internalDataLocal.FIFOBuffer.samples[internalDataLocal.FIFOBuffer.bufferHeadIndex].value := newSampleValue;

//Zwiekszenie licznika probek
if internalDataLocal.FIFOBuffer.bufferCount < 10 THEN
    internalDataLocal.FIFOBuffer.bufferCount := internalDataLocal.FIFOBuffer.bufferCount +1;
END_IF
