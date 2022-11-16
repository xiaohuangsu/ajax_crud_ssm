package com.xiaohuang.model;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/10 15:03
 * @version:1.0
 */
public class Msg {
    //返回状态码100成功 200失败
    private int code;
    //返回提示信息
    private String msg;
    //返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }
    //自定义可添加操作
    public Msg add(String key,Object value){
        this.getextend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getextend() {
        return extend;
    }

    public void setextend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
