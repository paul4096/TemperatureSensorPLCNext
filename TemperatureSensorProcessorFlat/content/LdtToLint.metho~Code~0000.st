timestamp := PBCL_DateTimeToUnix_1(in_ldt);
milis := PBCL_DateTimeMillisecondOfSecond_1(in_ldt);
timestamp := timestamp*1000+milis;
LdtToLint := timestamp;