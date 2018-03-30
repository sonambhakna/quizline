--------------------------------------------------------
--  DDL for Procedure SP_GET_QUESTIONS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_GET_QUESTIONS" 
(
X_USER_ID IN VARCHAR2,
X_RESULT OUT SYS_REFCURSOR
) AS 
V_COUNT NUMBER;
BEGIN

    
  /*     OPEN X_RESULT FOR SELECT  JSON_OBJECT('QUESTION_NO' VALUE QUESTION_NO,
                                             'QUESTION' VALUE QUESTION,
                                             'OPTION' VALUE JSON_ARRAY( OPTION1,
                                                                        OPTION2,
                                                                        OPTION3,
                                                                        OPTION4)) AS OBJECT_JSON
                         FROM TB_QUIZ_MASTER QUIZ1;*/
                         
          OPEN X_RESULT FOR SELECT  QUESTION_NO,
                                    QUESTION,
                                    OPTION1,
                                    OPTION2,
                                    OPTION3,
                                    OPTION4
                            FROM TB_QUIZ_MASTER order by to_number(QUESTION_NO) ;

END;

/
