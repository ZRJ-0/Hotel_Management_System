package com.java.controller;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logger = Logger.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(Exception.class)
    public String toErrorPages(Exception ex) {
        //  记录日志
        System.out.println("GlobalExceptionHandler......toErrorPages");
        // logger.error(ex.getMessage());
        ex.printStackTrace();
        return "error/error.jsp";
    }
}
