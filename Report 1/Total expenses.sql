SELECT SUM((Timestamp_end - Timestamp_start)*(SELECT Money FROM test_db.Rates WHERE ID = "3")) AS 'Total expenses' FROM test_db.Call_logs
  WHERE Call_logs.To NOT IN (SELECT Phone_Number FROM test_db.Numbers)
  AND Call_dir = "out"