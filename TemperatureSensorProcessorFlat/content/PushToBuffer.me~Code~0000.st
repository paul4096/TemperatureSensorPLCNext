
//Umieszczenie nowej probki w buforze w kolejce FIFO. 
//Nowa probka w elemencie "0". Najstarsza probka z elementu "9" jest usuwana
FOR i := 9 TO 1 BY -1 DO
    internalDataLocal.FIFOBuffer.samples[i] := internalDataLocal.FIFOBuffer.samples[i-1];
END_FOR;

internalDataLocal.FIFOBuffer.samples[0].value := newSampleValue;

if internalDataLocal.FIFOBuffer.bufferCount < 10 THEN
    internalDataLocal.FIFOBuffer.bufferCount := internalDataLocal.FIFOBuffer.bufferCount +1;
END_IF
