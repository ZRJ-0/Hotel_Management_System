package com.java.utils;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * MD5加密组件
 *
 * @author wbw
 * @version 1.0
 * @since 1.0
 */
public class MD5Tool {

    /**
     * MD5加密
     *
     * @param data 待加密数据
     * @return byte[] 消息摘要
     * @throws Exception
     */
    public static byte[] encodeMD5(String data) throws Exception {

        // 执行消息摘要  
        return DigestUtils.md5(data);
    }

    /**
     * MD5加密
     *
     * @param data 待加密数据
     * @return byte[] 消息摘要
     * @throws Exception
     */
    public static String encodeMD5Hex(String data) {
        // 执行消息摘要  
        return DigestUtils.md5Hex(data);
    }
}  