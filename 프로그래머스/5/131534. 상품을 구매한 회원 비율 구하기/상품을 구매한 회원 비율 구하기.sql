-- 코드를 입력하세요
SELECT YEAR(SALES_DATE) AS 'YEAR', MONTH(SALES_DATE) AS 'MONTH', 
    COUNT(DISTINCT(A.USER_ID)) AS PUCHASED_USERS,
    ROUND(COUNT(DISTINCT(A.USER_ID))/(
            SELECT COUNT(*)
            FROM USER_INFO
            WHERE JOINED BETWEEN '2021-01-01' AND '2021-12-31'
            )
        , 1) AS PUCHASED_RATIO
FROM ONLINE_SALE A JOIN (
    SELECT DISTINCT(USER_ID)
    FROM USER_INFO
    WHERE JOINED BETWEEN '2021-01-01' AND '2021-12-31'
) B
ON A.USER_ID = B.USER_ID
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH