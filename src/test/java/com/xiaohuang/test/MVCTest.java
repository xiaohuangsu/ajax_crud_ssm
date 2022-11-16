package com.xiaohuang.test;

import com.github.pagehelper.PageInfo;
import com.xiaohuang.model.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @Author:xiaohuangsu
 * @Date:2022/11/10 11:29
 * @version:1.0
 *
 * 测试web模块的方法
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:SpringMVC.xml"})
public class MVCTest {

    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage()throws Exception{
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/empsTest").param("pn","64"))
                .andReturn();
        //
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页面：" + pageInfo.getPageNum()) ;
        System.out.println("总页码：" + pageInfo.getPages()) ;
        System.out.println("总记录数：" + pageInfo.getTotal()) ;
        System.out.println("在页面需要连续显示的页码数：");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i : nums) {
            System.out.println(" " + i);
        }
        //获取员工数据
        List<Employee> list = pageInfo.getList();
        for (Employee employee : list) {
            System.out.println("ID: " +  employee.getEmpId() + "==>" + employee.getEmpName());
        }
        System.out.println("执行完毕");
        System.out.println("hot-fix");
        System.out.println("master test");
        System.out.println("hot-fix test");
    }
}
