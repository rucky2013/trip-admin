package com.ulplanet.trip.modules.iom.dao;

import com.ulplanet.trip.common.persistence.CrudDao;
import com.ulplanet.trip.common.persistence.annotation.MyBatisDao;
import com.ulplanet.trip.modules.iom.entity.Return;

/**
 * 产品归还Dao
 * Created by zhangxd on 15/12/01.
 */
@MyBatisDao
public interface ReturnDao extends CrudDao<Return> {

}
