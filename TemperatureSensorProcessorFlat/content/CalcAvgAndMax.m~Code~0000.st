(*
Obliczenie sredniej oraz wyznaczenie maksymalnej wartosci w buforze
*)

maxValue := 0;
sum := 0;

FOR i := 0 TO internalDataLocal.FIFOBuffer.bufferCount-1 BY 1 DO
    sum := sum +internalDataLocal.FIFOBuffer.samples[i].value;
    IF internalDataLocal.FIFOBuffer.samples[i].value > maxValue THEN
        maxValue := internalDataLocal.FIFOBuffer.samples[i].value;
    END_IF;
END_FOR

CalcAvgAndMax.average := sum / internalDataLocal.FIFOBuffer.bufferCount;
CalcAvgAndMax.maxValue := maxValue;
