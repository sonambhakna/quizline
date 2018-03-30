--------------------------------------------------------
--  Constraints for Table TB_QUIZ_TXN
--------------------------------------------------------

  ALTER TABLE "TB_QUIZ_TXN" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "TB_QUIZ_TXN" MODIFY ("QUESTION_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_QUIZ_TXN" ADD CONSTRAINT "TB_QUIZ_TXN_PK" PRIMARY KEY ("LOGIN", "QUESTION_NO") USING INDEX  ENABLE;
