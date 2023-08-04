@echo off
FOR /L %%N IN (1,1,200) DO fsutil file createnew %%N.txt 1000000000
