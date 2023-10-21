-- 코드를 입력하세요
SELECT YEAR(SALES_DATE) AS YEAR, MONTH(SALES_DATE) AS MONTH, GENDER, COUNT(DISTINCT(UI.USER_ID)) AS USERS
FROM USER_INFO UI JOIN (
        SELECT *
        FROM ONLINE_SALE
    ) AS OS
    ON UI.USER_ID = OS.USER_ID
WHERE GENDER IS NOT NULL
GROUP BY YEAR, MONTH, GENDER
ORDER BY YEAR, MONTH, GENDER


# SELECT *
# FROM USER_INFO