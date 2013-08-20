/*spool*/
SELECT A.*,Akt.Active_AMPs from
(SELECT ddd.databasename USER_Name, SUM(currentspool)/1024/1024 SPOOL_MB FROM dbc.DiskSpace ddd
Group by 1) A
INNER JOIN 
 (SELECT databasename, count(*) Active_AMPs FROM dbc.DiskSpace 
 where currentspool<>0
 GROUP BY 1) Akt
ON A.USER_Name=Akt.databasename
ORDER BY 2 DESC;

/*skew*/
Select 
   vproc as Cislo_Ampu
   ,(MaxSpool(dec(18,0)))/1024/1024 as Maximal_Allowed_Spool
   ,(CurrentSpool(dec(18,0)))/1024/1024 as Actual_Used_Amps
From dbc.diskspace
Where databasename = 'my_user_id';
