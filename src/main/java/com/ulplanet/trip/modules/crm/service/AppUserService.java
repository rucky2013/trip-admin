package com.ulplanet.trip.modules.crm.service;

import com.ulplanet.trip.common.service.CrudService;
import com.ulplanet.trip.common.utils.StringUtils;
import com.ulplanet.trip.modules.crm.dao.AppUserDao;
import com.ulplanet.trip.modules.crm.entity.AppUser;
import com.ulplanet.trip.modules.ims.bo.ResponseBo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 客户Service
 * Created by zhangxd on 15/10/20.
 */
@Service
public class AppUserService extends CrudService<AppUserDao, AppUser> {

    @Resource
    private AppUserDao appUserDao;

    public ResponseBo saveAppUser(AppUser user){
        if(StringUtils.isBlank(user.getId())) {
            user.preInsert();
            return ResponseBo.getResult(appUserDao.insert(user));
        }
        user.preUpdate();
        return ResponseBo.getResult(appUserDao.update(user));
    }

    public ResponseBo deleteUser(AppUser user){
        return ResponseBo.getResult(appUserDao.delete(user));
    }

    public ResponseBo hasPassport(String passport){
        AppUser appUser = new AppUser();
        appUser.setPassport(passport);
        List<AppUser> appUsers = appUserDao.findList(appUser);
        if(appUsers.size()>0){
            return new ResponseBo(0,"护照号已存在");
        }
        return new ResponseBo(1,"SUCCESS");
    }
}
