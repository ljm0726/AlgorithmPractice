-- 코드를 입력하세요
SELECT HISTORY_ID,
    ROUND ((
        CASE
        WHEN DIFF < 7
        THEN DAILY_FEE * DIFF
        ELSE DAILY_FEE*((100-DISCOUNT_RATE)/100) * DIFF
        END
    )) AS FEE
FROM CAR_RENTAL_COMPANY_CAR C JOIN (
        SELECT TIMESTAMPDIFF(DAY, START_DATE, END_DATE)+1 AS DIFF, CAR_ID, HISTORY_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    ) AS H
    ON H.CAR_ID = C.CAR_ID
    LEFT OUTER JOIN (
        SELECT CAR_TYPE, DURATION_TYPE, DISCOUNT_RATE
        FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
        WHERE P.CAR_TYPE = '트럭'
    ) AS P
    ON P.CAR_TYPE = C.CAR_TYPE
    AND P.DURATION_TYPE = (
    CASE
    WHEN DIFF >= 90
    THEN '90일 이상'
    WHEN DIFF >= 30
    THEN '30일 이상'
    WHEN DIFF >= 7
    THEN '7일 이상'
    END
)
WHERE C.CAR_TYPE = '트럭'
ORDER BY FEE DESC, HISTORY_ID DESC



# SELECT HISTORY_ID, ROUND(SUM(C.DAILY_FEE*(DATEDIFF(END_DATE, START_DATE)+1)*(1-IFNULL(DISCOUNT_RATE, 0)/100)),0) AS FEE, DATEDIFF(END_DATE, START_DATE)+1, DISCOUNT_RATE
# FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS R
# LEFT JOIN CAR_RENTAL_COMPANY_CAR AS C ON C.CAR_ID = R.CAR_ID
# LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS D ON C.CAR_TYPE = D.CAR_TYPE AND
#       D.DURATION_TYPE=(CASE
#                        WHEN DATEDIFF(R.END_DATE, R.START_DATE)+1 BETWEEN 7 AND 29 THEN "7일 이상"
#                        WHEN DATEDIFF(R.END_DATE, R.START_DATE)+1 BETWEEN 30 AND 89 THEN "30일 이상"
#                        WHEN DATEDIFF(R.END_DATE, R.START_DATE)+1 >= 90 THEN "90일 이상"
#                        ELSE "" END)
#       WHERE C.CAR_TYPE="트럭"
# GROUP BY HISTORY_ID
# ORDER BY FEE DESC, R.HISTORY_ID DESC