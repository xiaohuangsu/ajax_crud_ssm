package com.xiaohuang.service.impl;

import com.xiaohuang.dao.DeptMapper;
import com.xiaohuang.model.Dept;
import com.xiaohuang.model.Employee;
import com.xiaohuang.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/11 9:17
 * @version:1.0
 */
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;
    @Override
    public List<Dept> getDepts() {
        return deptMapper.selectByExample(null);
    }
}
