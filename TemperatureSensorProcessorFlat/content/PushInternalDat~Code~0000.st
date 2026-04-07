// 1. FIFO
FOR i := 9 TO 1 BY -1 DO
    resultBuffer[i] := buffer[i-1];
END_FOR;
resultBuffer[0] := newSample;
PushInternalData := resultBuffer;