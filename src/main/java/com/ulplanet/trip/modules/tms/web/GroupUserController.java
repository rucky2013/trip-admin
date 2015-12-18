package com.ulplanet.trip.modules.tms.web;

import com.ulplanet.trip.common.persistence.Page;
import com.ulplanet.trip.common.utils.StringUtils;
import com.ulplanet.trip.common.web.BaseController;
import com.ulplanet.trip.modules.ims.bo.ResponseBo;
import com.ulplanet.trip.modules.tms.entity.GroupUser;
import com.ulplanet.trip.modules.tms.service.GroupUserService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2015/10/27.
 */
@Controller
@RequestMapping(value = "${adminPath}/tms/groupUser")
public class GroupUserController  extends BaseController {

    @Resource
    private GroupUserService groupUserService;


    @ModelAttribute
    public GroupUser get(@RequestParam(required=false) String id,@RequestParam(value = "group",required=false) String group) {
        if (StringUtils.isNotBlank(id)){
            return groupUserService.get(id);
        }else{
            GroupUser groupUser = new GroupUser();
            if(StringUtils.isNotBlank(group)){
                groupUser.setGroup(group);
            }
            return groupUser;
        }
    }

    @RequestMapping(value = "/save")
    public String save(GroupUser groupUser,Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, groupUser)){
            return form(groupUser, model);
        }
        ResponseBo responseBo = groupUserService.saveGroupUser(groupUser);


        addMessage(redirectAttributes,responseBo.getMsg());
        if(responseBo.getStatus()==1) {
            return "redirect:" + adminPath + "/tms/groupUser/list/?group=" + groupUser.getGroup() + "&&repage";
        }
        return form(groupUser, model);
    }

    @RequestMapping(value = "/delete")
    public String delete(GroupUser groupUser,Model model, RedirectAttributes redirectAttributes) {
        ResponseBo responseBo = this.groupUserService.deleteUser(groupUser);
        addMessage(redirectAttributes, responseBo.getMsg());
        if(responseBo.getStatus()==1) {
            return "redirect:" + adminPath + "/tms/groupUser/list/?group=" + groupUser.getGroup() + "&&repage";
        }
        return form(groupUser, model);
    }

    @RequestMapping(value = {"/list",""})
    public String list(GroupUser groupUser, HttpServletRequest request, HttpServletResponse response, Model model){
        Page<GroupUser> page = this.groupUserService.findPage(new Page<>(request, response), groupUser);

        model.addAttribute("page",page);
        model.addAttribute("groupId", groupUser.getGroup());
        return "modules/tms/groupUserList";
    }

    @RequestMapping(value = "/getPassport")
    @ResponseBody
    public Object getPassport(
            @RequestParam(value = "query", required = false) String searchValue,
            @RequestParam(value = "group", required = false) String group) {
        return this.groupUserService.getPassport(searchValue,group);
    }

    @RequestMapping(value = "/form",method = RequestMethod.GET)
    public String form(GroupUser group,Model model) {
        group.setList(groupUserService.getPassportList(group.getGroup()));
        model.addAttribute("groupUser", group);
        return "modules/tms/groupUserForm";
    }

    @RequestMapping(value = "/groupQRCode")
    public String groupQRCode(@RequestParam String groupId,Model model){
        GroupUser groupUser = new GroupUser();
        groupUser.setGroup(groupId);
        List<GroupUser> list = groupUserService.findList(groupUser);
        model.addAttribute("list",list);
        return "modules/tms/groupQRCode";
    }

    @RequestMapping(value = "/import")
    @Transactional(readOnly = false)
    public String importExcel(@RequestParam MultipartFile file,@RequestParam String groupId, RedirectAttributes redirectAttributes){
        ResponseBo responseBo = groupUserService.importExcel(file, groupId);
        addMessage(redirectAttributes, responseBo.getMsg());
        return "redirect:" + adminPath + "/tms/groupUser/list/?group=" + groupId + "&&repage";
    }


}
