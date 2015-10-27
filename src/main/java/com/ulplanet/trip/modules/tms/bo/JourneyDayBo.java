package com.ulplanet.trip.modules.tms.bo;


import com.ulplanet.trip.modules.tms.entity.JourneyDay;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/9/22.
 */
public class JourneyDayBo {
    private String id;
    private String groupId;
    private Integer dayNumber;
    private String title;
    private List<JourneyPlanBo> list = new ArrayList<>();

    public JourneyDayBo(){}

    public JourneyDayBo(JourneyDay journeyDay){
        this.id = journeyDay.getId();
        this.groupId = journeyDay.getGroupId();
        this.dayNumber = journeyDay.getDayNumber();
        this.title = journeyDay.getTitle();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public Integer getDayNumber() {
        return dayNumber;
    }

    public void setDayNumber(Integer dayNumber) {
        this.dayNumber = dayNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<JourneyPlanBo> getList() {
        return list;
    }

    public void setList(List<JourneyPlanBo> list) {
        this.list = list;
    }
}
