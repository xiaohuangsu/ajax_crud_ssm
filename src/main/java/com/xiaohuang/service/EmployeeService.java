package com.xiaohuang.service;

import com.xiaohuang.model.Employee;

import java.util.List;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/10 11:19
 * @version:1.0
 */
public interface EmployeeService {
    List<Employee> getAllEmps();

    void saveEmp(Employee employee);

    boolean checkUser(String empName);

    Employee getEmpById(Integer id);

    void updateEmp(Employee employee);

    Integer deleteEmpById(Integer id);

    void deleteBatch(List<Integer> ids);
}
