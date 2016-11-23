package com.cdyx.exception;

/**
 * Created by guyu on 2016/10/3.
 */
public class BaseException extends RuntimeException{

    private static final long serialVersionUID = 1L;

    public BaseException(String message, Throwable cause) {
        super(message, cause);
    }

    public BaseException(String message) {
        super(message);
    }

    public BaseException(Throwable cause) {
        super(cause);
    }
}
