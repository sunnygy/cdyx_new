package com.cdyx.common.util;

/**
 * Created by guyu on 2016/10/3.
 */
public enum DaoExceptionType {

    UPDATE_ERROR("更新数据出错", 1),INSERT_ERROR("插入数据出错", 2),DELETE_ERROR("删除数据出错", 3),QUERY_ERROR("查询数据出错", 4),CUDSQL_ERROR("新增、更新或删除错误", 5),UNKNOW_RUNTIME_ERROR("未知数据库异常", 6);
    //异常信息描述
    private String name;
    //异常类型
    private int type;

    private DaoExceptionType(String name,int type){
        this.name=name;
        this.type=type;
    }

    /**
     * @Title: getName
     * @Description:通过类型获取异常信息
     * @author rensy
     * @date 2014-11-18 下午3:27:45
     * String
     * @throws
     */
    public static String getName(int type){
        for(DaoExceptionType  daoExceptionType:DaoExceptionType.values()){
            if(daoExceptionType.getType()==type){
                return daoExceptionType.getName();
            }
        }
        return null;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }


}
