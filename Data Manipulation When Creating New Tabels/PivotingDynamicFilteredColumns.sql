DECLARE @metricID INT = 1;
DECLARE @variableNames AS NVARCHAR(MAX);
DECLARE @pivotQuery AS NVARCHAR(MAX);

-- Get the distinct variable names for the specified metric ID
SELECT @variableNames = COALESCE(@variableNames + ', ', '') + QUOTENAME(Variable)
FROM (SELECT DISTINCT Variable FROM DummyData WHERE Metric = @metricID) AS VariableNames;


-- Generate the pivot query dynamically
SET @pivotQuery = N'SELECT ' + @variableNames + '
                   FROM (
                       SELECT Variable, Val
                       FROM DummyData
                       WHERE Metric = ' + CAST(@metricID AS NVARCHAR(MAX)) + '
                   ) AS SourceTable
                   PIVOT (
                       MAX(Val)
                       FOR Variable IN (' + @variableNames + ')
                   ) AS PivotTable
				   WHERE Latest = 1;';

-- Execute the pivot query
EXEC sp_executesql @pivotQuery;
