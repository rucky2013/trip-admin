package com.ulplanet.trip.modules.tim.dao;

import com.ulplanet.trip.common.persistence.CrudDao;
import com.ulplanet.trip.common.persistence.annotation.MyBatisDao;
import com.ulplanet.trip.modules.tim.entity.City;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 城市管理Dao
 * Created by zhangxd on 15/10/22.
 */
@MyBatisDao
public interface CityDao extends CrudDao<City> {

    City findByName(City city);

    List<String> getNames(@Param("ids")String[]ids);

}
