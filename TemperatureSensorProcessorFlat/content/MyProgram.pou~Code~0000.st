
//handle new sample for every sensor
FOR i := 0 TO 9 DO
    fbProcessor(ioSensor := arrSensory[i]);
END_FOR;