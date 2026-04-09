//Pobranie znacznika czasu w formie liczby milisekund od 01-01-1970
PBCL_DateTimeGet_11(dtDateTime => DateTimeTmp);

//przeliczenie DATA_AND_TIME na liczbe sekund od 01-01-1970
timestamp := PBCL_DateTimeToUnix_1(DateTimeTmp);

//dodanie milisekund
milis := PBCL_DateTimeMillisecondOfSecond_1(DateTimeTmp);
GetTimestamp := timestamp*1000+milis;