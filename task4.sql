CREATE TEMP TABLE signups (
    date DATE PRIMARY KEY,
    sign_ups INT
);

INSERT INTO signups (date, sign_ups) VALUES
('2018-01-01', 10),
('2018-01-02', 20),
('2018-01-03', 50),
('2018-01-04', 40),
('2018-01-05', 30),
('2018-01-06', 60),
('2018-01-07', 20),
('2018-01-08', 25);

SELECT s1.date,
      (SELECT SUM(s2.sign_ups)
       FROM signups s2
       WHERE s2.date BETWEEN s1.date - INTERVAL '6 days' AND s1.date) / 7 AS moving_avg
FROM signups s1
ORDER BY s1.date