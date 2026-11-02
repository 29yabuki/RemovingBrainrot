SELECT curr.id
FROM Weather curr
    LEFT JOIN Weather prev ON prev.recordDate = (curr.recordDate - 1)
    LEFT JOIN Weather aftr ON aftr.recordDate = (curr.recordDate + 1)
WHERE curr.temperature > prev.temperature
ORDER BY curr.recordDate