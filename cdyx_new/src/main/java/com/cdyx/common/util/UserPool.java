package com.cdyx.common.util;

import com.cdyx.websocket.MyWebSocket;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.Session;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guyu on 2016/10/4.
 */
public class UserPool {

    private static Logger LOG = LoggerFactory.getLogger(UserPool.class);

    private static List<MyWebSocket> USER_POOL = new ArrayList<MyWebSocket>();

    public static synchronized  void add(MyWebSocket socket) {
        USER_POOL.add(socket);
        LOG.info("user [" + socket.getSession().getId() + "] connected");
    }

    public static void remove(MyWebSocket socket) {
        USER_POOL.remove(socket);
        LOG.info("user [" + socket.getSession().getId() + "] closed");
    }

    public static synchronized List<MyWebSocket> getUserPool() {
        return USER_POOL;
    }
}
