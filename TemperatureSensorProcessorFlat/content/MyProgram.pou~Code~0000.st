
IF delayCounter = 0 THEN
    fbDataProvider(sensorIndex := sensorIndex);
    Sensors[sensorIndex].InputData := fbDataProvider.result;
    sensorIndex := IncrementCounter(sensorIndex,10);
END_IF
delayCounter := IncrementCounter(delayCounter,10);
timestamp :=  gSystemTime / 1000000;
DAY := RTC.DAY;
MONTH := RTC.MONTH;

//handle new sample for every sensor
FOR i := 0 TO 9 DO
    fbProcessor(ioSensor := Sensors[i]);
END_FOR;