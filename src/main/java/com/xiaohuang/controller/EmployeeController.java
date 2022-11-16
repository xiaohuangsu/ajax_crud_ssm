package com.xiaohuang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaohuang.model.Employee;
import com.xiaohuang.model.Msg;
import com.xiaohuang.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/10 11:17
 * @version:1.0
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    //普通处理形式
    @RequestMapping("/empsTest")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                          Model model){
        //分页查询
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAllEmps();
        //
        PageInfo pageInfo = new PageInfo(emps,5);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
    /**
     * 根绝页面，返回员工list集合
     * @param pn
     * @return
     */
    //ajax返回json处理
    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    @ResponseBody//需要导入jackson包正常工作
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //分页查询
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAllEmps();
        //
        PageInfo pageInfo = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",pageInfo);
    }
    /**
     * 校验用户信息@Valid表示需要使用检验,
     * @param employee
     * @param result BindingResult校验结果
     * @return
     */
    //
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        Map<String,Object> map = new HashMap<>();
        if (result.hasErrors()){
            List<FieldError> fieldError = result.getFieldErrors();
            for (FieldError error : fieldError) {
                System.out.println("错误字段："+error.getField());
                System.out.println("错误信息："+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }
    /**
     * 检查用户名是否合法
     * @param empName
     * @return
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)){
            return Msg.fail().add("ck_msg","用户名可填写的内容是6-16位英文加数字或2-5位中文");
        }
        boolean b = employeeService.checkUser(empName);
        if (b){
            return Msg.success();
        }
        else{
            return Msg.fail().add("ck_msg","用户名已存在！");
        }
    }
    /**
     * 根据id查询员工信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id")Integer id){
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp",employee);
    }
    /**
     * 员工更新方法
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee){
        System.out.println("要更新的数据" + employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }
    /**
     * 删除员工信息
     */
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            List<Integer> delId_list = new ArrayList<>();
            String[] str_id = ids.split("-");
            for (String s : str_id) {
                delId_list.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(delId_list);
        }else{
            int id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();
    }
}
