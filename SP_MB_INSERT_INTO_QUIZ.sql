--------------------------------------------------------
--  DDL for Procedure SP_MB_INSERT_INTO_QUIZ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_MB_INSERT_INTO_QUIZ" ( X_LOGIN_ID IN VARCHAR2,
                                                    X_QUS_NO IN VARCHAR2,
                                                    X_ANSWER IN VARCHAR2,
                                                    X_RESULT OUT SYS_REFCURSOR)
AS
BEGIN

      UPDATE TB_QUIZ_TXN SET 
      ANSWER =X_ANSWER,
      MODIFY_TIMESTAMP = SYSTIMESTAMP
      WHERE LOGIN     = X_LOGIN_ID
      AND QUESTION_NO = X_QUS_NO;
      
  IF SQL%ROWCOUNT = 0 THEN
      INSERT INTO TB_QUIZ_TXN
        (LOGIN, 
         QUESTION_NO, 
         ANSWER,
         CREATE_TIMESTAMP
        ) VALUES
        (X_LOGIN_ID,
         TO_NUMBER(X_QUS_NO),
         X_ANSWER,
         SYSTIMESTAMP
        );
 
  END IF;
COMMIT;  
OPEN X_RESULT FOR SELECT 'Y'  AS  RESPONSE_TYPE,
                          'Inserted successfully' AS RESPONSE_MESSAGE 
                  FROM DUAL;
                  
EXCEPTION WHEN OTHERS THEN  
OPEN X_RESULT FOR SELECT 'N'  AS  RESPONSE_TYPE,
                          '' AS RESPONSE_MESSAGE 
                  FROM DUAL;      

END ;

/
