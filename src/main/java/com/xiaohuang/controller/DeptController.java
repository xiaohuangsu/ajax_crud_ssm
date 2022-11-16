package com.xiaohuang.controller;

import com.xiaohuang.model.Dept;
import com.xiaohuang.model.Msg;
import com.xiaohuang.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/11 9:15
 * @version:1.0
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Dept> depts = deptService.getDepts();
        return Msg.success().add("depts",depts);
    }
}
