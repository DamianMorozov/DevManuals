# Pagefile.sys

-- SetUp settings
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=0,MaximumSize=0

-- Check settings
wmic pagefileset
wmic pagefileset list /format:list
