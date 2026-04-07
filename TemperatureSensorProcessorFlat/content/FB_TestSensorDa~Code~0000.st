
result.canWrite := TRUE;
result.newValue := 3*sensorIndex+i[sensorIndex];
i[sensorIndex] := i[sensorIndex]+1;

if i[sensorIndex] > 100 THEN
    i[sensorIndex] := 0;
END_IF

