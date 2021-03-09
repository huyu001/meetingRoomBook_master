package com.zhku.meeting.mapper;

import com.zhku.meeting.entities.Department;
import com.zhku.meeting.entities.Manager;
import java.util.List;

public interface ManagerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    int deleteByPrimaryKey(String username);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    int insert(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    Manager selectByPrimaryKey(String username);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    List<Manager> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    int updateByPrimaryKey(Manager record);

    //部门登录信息
    Manager loginMessage(Manager record);
}