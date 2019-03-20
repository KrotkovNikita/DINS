SELECT Accounts.Name, Numbers.Phone_Number "Phone number", a.b "Total expenses"
  FROM test_db.Accounts 
  JOIN (SELECT UID, SUM((Timestamp_end - Timestamp_start)*(SELECT Money FROM test_db.Rates WHERE ID = "3")) AS b FROM test_db.call_logs
    WHERE call_logs.To NOT IN (SELECT Phone_Number FROM test_db.Numbers)
    AND Call_dir = "out"
    GROUP BY UID) a
  ON a.UID = Accounts.UID
  JOIN test_db.Numbers
  ON Numbers.UID = Accounts.UID
  ORDER BY a.b DESC
  LIMIT 10