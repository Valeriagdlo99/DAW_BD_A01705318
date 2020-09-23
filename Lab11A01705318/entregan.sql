SET DATEFORMAT dmy

BULK INSERT a1705318.a1705318.[Entregan]

		FROM 'e:\wwwroot\rcortese\entregan.csv'
		WITH
			(
			CODEPAGE = 'ACP',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR='\n'
			
			)