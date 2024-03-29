-- 코드를 입력하세요
# 나가기 전에는 중성화 X 나간 후 중성화 된 동물.
# OUTS에서 중성화 된 동물 뽑기, 그 동물들 중에서 upon이 다른 동물들 출력

SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM ANIMAL_INS I JOIN (
    SELECT ANIMAL_ID, SEX_UPON_OUTCOME
    FROM ANIMAL_OUTS
    WHERE SEX_UPON_OUTCOME = 'Spayed Female' OR SEX_UPON_OUTCOME = 'Neutered Male'
) AS O
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE != O.SEX_UPON_OUTCOME