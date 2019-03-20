SELECT Accounts.Name, Numbers.Phone_Number "Phone number", a.b "Total call count"
  FROM test_db.Accounts 
  JOIN (SELECT UID, COUNT(*) AS b FROM test_db.Call_logs GROUP BY UID) a 
  ON a.UID = Accounts.UID
  JOIN test_db.Numbers
  ON Numbers.UID = Accounts.UID
  ORDER BY a.b DESC
  LIMIT 10