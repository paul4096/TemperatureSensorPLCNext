PBCL_DateTimeGet_11(dtDateTime => DateTimeTmp);
timestamp := PBCL_DateTimeToUnix_1(DateTimeTmp);
milis := PBCL_DateTimeMillisecondOfSecond_1(DateTimeTmp);
GetTimestamp := timestamp*1000+milis;