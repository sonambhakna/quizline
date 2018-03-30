--------------------------------------------------------
--  DDL for Procedure SP_MB_AUTHENTICATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_MB_AUTHENTICATION" 
(
X_USER_ID IN VARCHAR2,
X_PASSWORD IN VARCHAR2,
X_RESULT OUT SYS_REFCURSOR
) AS 
V_COUNT NUMBER;
BEGIN

     SELECT COUNT(1) INTO V_COUNT FROM TB_EMP_HRMS WHERE EMPLOYEE_NUMBER = X_USER_ID;
      
      IF V_COUNT > 0 THEN
       OPEN X_RESULT FOR SELECT 'Y'  AS  RESPONSE_TYPE,
       'Logged in successfully' AS RESPONSE_MESSAGE
       FROM DUAL;
      ELSE
       OPEN X_RESULT FOR SELECT 'N' AS  RESPONSE_TYPE,
       'Please enter valid username and password' AS RESPONSE_MESSAGE
       FROM DUAL;
      END IF;
    
 
END;

/
