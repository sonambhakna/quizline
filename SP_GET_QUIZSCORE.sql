--------------------------------------------------------
--  DDL for Procedure SP_GET_QUIZSCORE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_GET_QUIZSCORE" 
(
X_USER_ID IN VARCHAR2,
X_RESULT OUT SYS_REFCURSOR
) AS 
V_COUNT NUMBER;
BEGIN

    
       SELECT count(1) into V_COUNT FROM TB_QUIZ_MASTER QM
       JOIN TB_QUIZ_TXN QT ON QT.QUESTION_NO  = QM.QUESTION_NO AND TRIM(QT.ANSWER)=TRIM(QM.ANSWER)

       where login = X_USER_ID;
      
    OPEN X_RESULT FOR SELECT V_COUNT AS SCORE, CASE WHEN V_COUNT > 17 THEN 'PASS' ELSE 'FAIL' END AS STATUS FROM DUAL;
    
END;

/
