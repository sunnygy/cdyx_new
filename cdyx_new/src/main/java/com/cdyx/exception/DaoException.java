package com.cdyx.exception;

import com.cdyx.common.util.DaoExceptionType;

/**
 * Created by guyu on 2016/10/3.
 */
public class DaoException  extends BaseException{


    private static final long serialVersionUID = 1L;

    private DaoExceptionType daoExceptionType= DaoExceptionType.UNKNOW_RUNTIME_ERROR;

    public DaoException(String message, Throwable cause) {
        super(message, cause);
    }

    public DaoException(String message) {
        super(message);
    }

    public DaoException(Throwable cause) {
        super(cause);
    }

    public DaoException(DaoExceptionType daoExceptionType,String message) {
        super(message);
        this.daoExceptionType=daoExceptionType;
    }

    public DaoException(DaoExceptionType daoExceptionType,Throwable cause) {
        super(cause);
        this.daoExceptionType=daoExceptionType;
    }

    public DaoException(DaoExceptionType daoExceptionType,String message,Throwable cause) {
        super(message,cause);
        this.daoExceptionType=daoExceptionType;
    }

    /**
     * @return the daoExceptionType
     */
    public DaoExceptionType getDaoExceptionType() {
        return daoExceptionType;
    }
}
