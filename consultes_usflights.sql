-- Consultes:
-- 1:
SELECT COUNT(flightID) AS total 
FROM flights;

-- 2:
SELECT 
	Origin, 
    AVG(ArrDelay) AS prom_arribades, 
    AVG(DepDelay) AS prom_sortides  
FROM flights 
GROUP BY Origin;

-- 3:
SELECT 
	Origin, 
    colYear, 
    colMonth, 
    AVG(ArrDelay) AS prom_arribades 
FROM flights 
GROUP BY Origin, colYear, colMonth
ORDER BY Origin;

-- 4:
SELECT 
	a.city, 
    f.colYear, 
    f.colMonth, 
    AVG(f.ArrDelay) AS prom_arribades 
FROM flights f
JOIN usairports a 
ON f.Origin = a.IATA 
GROUP BY a.City, colYear, colMonth
ORDER BY a.City;

-- 5: 
SELECT 
	UniqueCarrier, 
    colYear, 
    colMonth, 
    COUNT(Cancelled) AS total_cancelled 
FROM flights 
GROUP BY UniqueCarrier, colYear, coLMonth 
ORDER BY total_cancelled DESC;

-- 6: 
SELECT 
	TailNum, 
    SUM(Distance) as total_distance 
FROM flights 
WHERE TailNum !='' AND TailNum IS NOT NULL 
GROUP BY TailNum 
ORDER BY total_distance DESC 
LIMIT 10;

-- 7:
SELECT * FROM 
			(SELECT 
					UniqueCarrier, 
					AVG(ArrDelay) AS avg_delay 
			FROM flights
            GROUP BY UniqueCarrier 
			ORDER BY avg_delay DESC 
            ) as subTable
WHERE avg_delay > 10;   