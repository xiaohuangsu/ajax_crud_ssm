package com.xiaohuang.service.impl;

import com.xiaohuang.dao.EmployeeMapper;
import com.xiaohuang.model.Employee;
import com.xiaohuang.model.EmployeeExample;
import com.xiaohuang.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/10 11:19
 * @version:1.0
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public List<Employee> getAllEmps() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    @Override
    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public Integer deleteEmpById(Integer id) {
        return employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
