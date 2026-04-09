
//Umieszczenie nowej probki w buforze w kolejce FIFO. 
//Nowa probka w elemencie "0". Najstarsza probka z elementu "9" jest usuwana
FOR i := 9 TO 1 BY -1 DO
    resultBuffer[i] := buffer[i-1];
END_FOR;
resultBuffer[0] := newSample;
PushInternalData := resultBuffer;