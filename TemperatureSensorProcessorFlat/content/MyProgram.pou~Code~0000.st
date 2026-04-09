
//Generowanie nowych probek z opoznieniem. Probka dla jednego czujnika generowana co 10 cykli.
//Kazdy czujnik dostaje nowa probke co 100 cykli.
IF delayCounter = 0 THEN
    fbDataProvider(sensorIndex := sensorIndex);
    Sensors[sensorIndex].InputData := fbDataProvider.result;
    sensorIndex := IncrementCounter(sensorIndex,10);
END_IF
delayCounter := IncrementCounter(delayCounter,4);


//Przetwarzanie probek z czujnikow przez dedykowany FB
FOR i := 0 TO 9 DO
    fbProcessor(ioSensor := Sensors[i]);
END_FOR;