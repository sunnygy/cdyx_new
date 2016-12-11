package com.cdyx.common.util;

import com.cdyx.websocket.OrderWebSocket;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.util.ArrayList;

import java.util.List;


/**
 * Created by guyu on 2016/10/4.
 */
public class UserPool {

    private static Logger LOG = LoggerFactory.getLogger(UserPool.class);

    private static List<OrderWebSocket> USER_POOL = new ArrayList<OrderWebSocket>();

    public static synchronized  void add(OrderWebSocket socket) {
        USER_POOL.add(socket);
        LOG.info("user [" + socket.getSession().getId() + "] connected");
    }

    public static void remove(OrderWebSocket socket) {
        USER_POOL.remove(socket);
        LOG.info("user [" + socket.getSession().getId() + "] closed");
    }

    public static synchronized List<OrderWebSocket> getUserPool() {
        return USER_POOL;
    }
}
