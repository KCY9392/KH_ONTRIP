package com.ontrip.question.service;

import com.ontrip.question.dao.admin.QuestionDao;

public class QuestionService {

    QuestionDao questionDao = QuestionDao.getInstance();

    private static final QuestionService instance = new QuestionService();

    public static QuestionService getInstance(){
        return  instance  ;
    }




}
