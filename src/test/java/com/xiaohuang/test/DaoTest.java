package com.xiaohuang.test;

import com.xiaohuang.dao.DeptMapper;
import com.xiaohuang.dao.EmployeeMapper;
import com.xiaohuang.model.Dept;
import com.xiaohuang.model.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/10 10:52
 * @version:1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class DaoTest {

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;
    @Test
    public void testCRUD(){

        System.out.println(deptMapper);
/*
        deptMapper.insertSelective(new Dept(null,"开发部"));
        deptMapper.insertSelective(new Dept(null,"测试部"));*/
        employeeMapper.insertSelective(new Employee(null,"李思","男","1233@qq.com",1));

        //可执行批量操作的sqlsession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);

        /*for (int i = 0; i < 100; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5) + i;
            mapper.insertSelective(new Employee(null,uid,"男",uid + "@aa.com",1));
        }
        System.out.println("批量添加完成");*/
    }
}
