package com.ulplanet.trip.modules.tms.dao;


import com.ulplanet.trip.common.persistence.CrudDao;
import com.ulplanet.trip.common.persistence.Parameter;
import com.ulplanet.trip.common.persistence.annotation.MyBatisDao;
import com.ulplanet.trip.modules.tms.entity.GroupUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zhangxd on 15/8/11.
 */
@MyBatisDao
public interface GroupUserDao extends CrudDao<GroupUser> {

    int insertGroupUser(GroupUser groupUser);

    int insertUser(GroupUser groupUser);

    int updateGroupUser(GroupUser groupUser);

    int updateUser(GroupUser groupUser);

    int deleteGroupUser(GroupUser groupUser);

    int deleteUser(GroupUser groupUser);

    String findMaxCode(Parameter parameter);

    List<GroupUser> findUserByPassport(@Param("id") String id, @Param("group") String group);

    GroupUser getUserById(@Param("id") String id);

}