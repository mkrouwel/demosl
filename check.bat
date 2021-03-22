@ECHO OFF
SET rule=%1
IF [%rule%]==[] SET rule=*
SET show=%2
IF [%show%]==[] SET show="-tree"
@ECHO ON
for %%f in (test\%rule%.txt) do grun demo %%~nf %%f %show%