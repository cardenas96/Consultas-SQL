BACKUP DATABASE FasterPizzaSystem TO DISK ='D:\Respaldo\bd_Pizza.bak' WITH INIT,STATS=10
RESTORE DATABASE BD_Pizeria FROM DISK = 'D:\Respaldo\bd_Pizza.bak' WITH REPLACE