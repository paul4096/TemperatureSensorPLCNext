(*
Funkcja zwiekszajaca licznik. Przyjmowana jest wartosc licznika i wartosc nieprzekraczalna.
Zwracana jest wartosc licznika + 1.
Jesli wartosc licznika jest ujemna zwracane jest 0
Jesli wartosc licznika po zwiekszeniu jest rowna wartosci maksymalnej zwracane jest 0
*)
IF counter < 0 THEN
    IncrementCounter := 0;
    RETURN;
END_IF

IncrementCounter := counter + 1;
IF IncrementCounter >= maxCounter THEN
    IncrementCounter := 0;
END_IF
