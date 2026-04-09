(*
Generator kolejnej wartosci probki dla podanego czujnika.
Wartosc bazowa probki to index czujnika * 3.
Wartosc probki zwiekszana co 1. 
Wartosc zwiekszenia dla poszczegolnych czujnikow przechowywana w tablicy "i"
Jesli wartosc zwiekszenia osiaga 20 to jest zerowana.
Blok funkcyjny przyjmuje numer indeksu czujnika w zmiennej "sensorIndex"
Blok funkcyjny wynik zapisuje do zmiennej "result" bedącą strukturą "ST_InputData"
*)


result.canWrite := TRUE;
result.newValue := 3*sensorIndex+i[sensorIndex];
i[sensorIndex] := i[sensorIndex]+1;

if i[sensorIndex] > 20 THEN
    i[sensorIndex] := 0;
END_IF

