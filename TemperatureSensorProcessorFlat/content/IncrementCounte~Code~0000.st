IF counter < 0 THEN
    IncrementCounter := 0;
    RETURN;
END_IF

IncrementCounter := counter + 1;
IF IncrementCounter >= maxCounter THEN
    IncrementCounter := 0;
END_IF
