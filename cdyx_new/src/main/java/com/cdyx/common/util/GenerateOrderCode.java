package com.cdyx.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by guyu on 2016/12/9.
 */
public class GenerateOrderCode {

    private static long orderNum = 0l;
    private static String date ;
    /**
     * 生成订单编号
     * @return
     */
    public static synchronized String getOrderNo() {

        String str = new SimpleDateFormat("yyyyMMdd").format(new Date());
        if(date==null||!date.equals(str)){
            date = str;
            orderNum  = 0l;
        }
        orderNum ++;
        long orderNo = Long.parseLong((date)) * 10000;
        orderNo += orderNum;;
        return orderNo+"";
    }
}
