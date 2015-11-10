<%--
  Created by IntelliJ IDEA.
  User: makun
  Date: 2015/10/22
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>旅游团用户管理</title>
    <meta name="decorator" content="default"/>
    <style type="text/css">
        .popup{
            top:0%;
            left:0%;
            height: 100%;
            width: 100%;
            text-align: center;
            vertical-align:middle;
            background-color: #939595;
            opacity: 0.9;
            z-index: 10001;
            filter:Alpha(opacity=90);
            position:fixed;
        }
        .select2-drop{
            z-index: 11000;
        }

        .p-header-top{
            font-weight: bold;
            font-size: 15px;
            padding-left: 10px;
        }

        .p-header{
            font-weight: bold;
            font-size: 13px;
        }
        .p-message{
            color: #c15f2e;
            line-height: 20px;
            word-break:break-all;
        }
        .p-description{
            color: #454545;
            line-height: 20px;
            word-break:break-all;
        }
        .title{
            /*FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#b8c4cb,endColorStr=#f6f6f8); /!*IE 6 7 8*!/*/

            background: -ms-linear-gradient(top, #b8c4cb,#f6f6f8);        /* IE 10 */

            background:-moz-linear-gradient(top,#b8c4cb,#f6f6f8);/*火狐*/

            background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#b8c4cb), to(#f6f6f8));/*谷歌*/

            background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#b8c4cb), to(#f6f6f8));      /* Safari 4-5, Chrome 1-9*/

            background: -webkit-linear-gradient(top, #b8c4cb, #f6f6f8);   /*Safari5.1 Chrome 10+*/

            background: -o-linear-gradient(top, #b8c4cb, #f6f6f8);  /*Opera 11.10+*/
        }
        .title :hover{
            background-color: #b8c4cb;

        }
        .content{
            display: none;
        }
        .border {
            border:1px solid #cc3331;
            border-style: solid none;
        }
        #sortable1, #sortable2 {
            border: 1px solid #B4D434;
            width: 400px;
            min-height: 20px;
            list-style-type: none;
            float: left;
            margin: 0;
            padding: 5px 0 0 0;
            margin-right: 10px;
        }

    </style>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/tms/groupUser/?group=${groupId}">旅游团用户列表</a></li>
    <li><a href="${ctx}/tms/groupUser/form?group=${groupId}&sort=10">旅游团用户添加</a></li>
    <li class="active"><a href="${ctx}/tms/journeyDay/?groupId=${groupId}">旅游团行程</a></li>
</ul>
<sys:message content="${message}"/>
<div style="margin-left: auto;margin-right: auto">
    <input type="hidden" value="${groupId}" id="group_id" />
    <button id="addJourneyDay" type="button" class="btn btn-lg btn-primary">添加一天行程</button>&nbsp;&nbsp;&nbsp;
    <button id="saveJourney" type="button" class="btn btn-lg btn-success">保存当前行程</button>&nbsp;&nbsp;&nbsp;
    <div style="margin-left: 10%;margin-top: 10px">
        <p>
            <label style="color: #dd1f26">当前团队行程：</label>
            <label style="color: #dd1f26;margin-left: 318px">团队行程模板：
                <select id="template" name="template" style="width:200px">
                    <option value="" selected>清除行程模板</option>
                    <c:forEach items="${groupList}" var="t">
                        <option value="${t.id}">${t.name}</option>iug
                    </c:forEach>
                </select>
            </label>
        </p>
        <ul id="sortable1" class="connectedSortable" groupId="${groupId}">
            <c:forEach items="${list}" var="journeyDay">
                <li style="list-style-type:none;">
                    <div style="width:400px;background-color: #ECECEC" id="${journeyDay.id}" groupId="${journeyDay.groupId}">
                        <div class="title">
                            <p class="p-header-top">
                                    ${journeyDay.title}
                                <i class="fa fa-times close-day" style="float: right;margin-right: 10px;"></i>
                                <a href="#" style="float: right;margin-right: 10px;" id="updateDay">修改</a>
                                <a href="#" style="float: right;margin-right: 10px;" id="addPlan">添加</a>
                            </p>

                        </div>
                        <div class="content">
                            <ul class="sortable-content" id="plan-${journeyDay.id}">
                                <c:forEach items="${ journeyDay.list}" var="plan">
                                    <li>
                                        <div id="${plan.id}" class="border" groupId="${journeyDay.groupId}">
                                            <p class="p-header">${plan.name}
                                                <i class="fa fa-times close-plan" style="float: right;margin-right: 10px;"></i>
                                                <a href="#" id="updatePlan" style="float: right;margin-right: 10px;">修改</a>
                                            </p>
                                            <c:if test="${plan.timeFlag==1}">
                                                <p class='p-message'>${plan.time}</p>
                                            </c:if>
                                            <p class="p-description">${plan.description}</p>
                                            <p class="p-longitude">维度：${plan.longitude}</p>
                                            <p class="p-latitude">经度：${plan.latitude}</p>
                                            <p class="p-message">${plan.message}</p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                </li>
            </c:forEach>
        </ul>
        <ul id="sortable2" class="connectedSortable">


        </ul>
    </div>
</div>
<div id="journeyList" style="display: none" class="popup">
    <div style="position:fixed;left:35%;top:50%;background-color: white;padding-top: 20px;padding-bottom: 20px">
        <form:form id="inputForm" modelAttribute="journeyDay" action="${ctx}/tms/journeyDay/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <form:hidden path="groupId"/>
            <sys:message content="${message}"/>
            <label style="font-size: 15px;font-weight:bold;">城市:</label>
            <sys:treeselect id="city" name="city.id" value="" labelName="city.name" labelValue=""
                            cssStyle="width:300px" checked="true"   title="城市" url="/tim/city/treeData" notAllowSelectParent="true" cssClass="input-small" allowClear="true"/><br>
            <input id="btnSubmit" class="btn btn-default" type="button" value="保 存"/>&nbsp;
            <input id="btnCancel" class="btn" type="button" value="返 回" />

        </form:form>
    </div>
</div>

<div id="journeyPlan" style="display: none" class="popup">
    <%--<div style="position:fixed;left:20%;top:10%;background-color: white;padding-top: 20px;padding-bottom: 20px;width:600px">--%>
    <form style="margin-top: 30px">
        <input type="hidden" id="planId"/>
        <input type="hidden" id="dayId"/>
        <input type="hidden" id="cityIds"/>
        <div class="form-group" >
            <label for="plan-type">类型</label>
            <select id="plan-type" class="form-control"  tabindex="20000"  style="width:220px">
                <option value="-1" selected>请选择</option>
                <c:forEach items="${fns:getDictList('journey_plan')}" var="t">
                    <option value="${t.value}">${t.label}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="plan-list">列表</label>
            <select id="plan-list" class="form-control" tabindex="11000" style="width:220px">
            </select>
        </div>
        <div class="form-group">
            <label for="plan-name">标题</label>
            <input type="text" class="form-control" id="plan-name" placeholder="请输入标题"/>
        </div>
        <div class="form-group">
            <label for="hasTime">是否有时间</label>
            <label class="radio-inline" >
                <input type="radio" name="hasTime" id="hasTime" value="1"> 是
            </label>
            <label class="radio-inline" >
                <input type="radio" name="hasTime" value="0"> 否
            </label>
        </div>
        <div class="form-group">
            <label for="plan-time">时间</label>
            <input type="text" id="plan-time" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'HH:mm'})" class="Wdate"/>
        </div>
        <div class="form-group">
            <label for="plan-description">描述</label>
            <textarea class="form-control" rows="5" id="plan-description"></textarea>
        </div>
        <div class="form-group">
            <label for="plan-name">维度</label>
            <input type="text" class="form-control" id="plan-longitude" placeholder="请输入维度"/>
        </div>
        <div class="form-group">
            <label for="plan-name">经度</label>
            <input type="text" class="form-control" id="plan-latitude" placeholder="请输入经度"/>
        </div>
        <div class="form-group">
            <label for="plan-message">备注</label>
            <textarea class="form-control" rows="5" id="plan-message"></textarea>
        </div>
        <input id="plan-btnSubmit" class="btn btn-default" type="button" value="保 存"/>&nbsp;
        <input id="plan-btnCancel" class="btn" type="button" value="返 回" />
    </form>
    <%--</div>--%>
</div>
<script type="text/javascript">
    $(function(){
        var _groupId = $("#group_id").val();
        /**=======================页面效果====**/
        $( "#sortable1, #sortable2" ).sortable({
            connectWith: ".connectedSortable"
        }).disableSelection();
        $(".sortable-content" ).sortable({
            connectWith: ".sortable-content"
        }).disableSelection();
        $(".fa-times").live('mouseover',function(){
            $(this).addClass("fa-spin");
        });
        $(".fa-times").live('mouseout',function(){
            $(this).removeClass("fa-spin");
        });
        $("#plan-time").live('blur',function(){
            if($("#plan-time").val().length>0) {
                $("#hasTime").attr("checked", "checked");
            }
        });
        $(".title").live('click',function(e){
            var $this = $(this);
            if(e.toElement.localName=='a'){
                return false;
            }
            var content = $this.parent().children(".content");
            if(content.is(":hidden")){
                content.show(300);
            }else{
                content.hide(300);
            }
            e.preventDefault();
        });
        $("#btnCancel").click(function(){
            $("#journeyList").hide(200);
        });
        $("#plan-btnCancel").click(function(){
            $("#journeyPlan").hide(200);
        });
        $("#importJourney").click(function(){

            $("#modelList").show(300);
        });
        /**=======================页面效果end====**/
        /**======================导入模板=========**/
        $("#template").change(function(){
            var $this = $(this);
            var id = $this.val();
            $.ajax({
                url : "${ctx}/tms/journeyDay/getTemplate?groupId="+id,
                type:"get",
                dataType:"json",
                success : function(data){
                    var str = "";
                    for(var n in data){
                        var obj = data[n];
                        str +=  "<li style=\"list-style-type:none;\">"+
                                "<div style=\"width:400px;background-color: #ECECEC\" id=\""+ obj.id +"\" " +
                                "groupId=\""+ obj.groupId +"\">"+
                                "<div class=\"title\">"+
                                "<p class=\"p-header-top\">"+
                                obj.title +
                                "<i class=\"fa fa-times\" style=\"float: right;margin-right: 10px;\"></i>"
                                +"<a href=\"#\" style=\"float: right;margin-right: 10px;\" id='updateDay'>修改</a>"
                                +"<a href=\"#\" style=\"float: right;margin-right: 10px;\" id=\"addPlan\">添加</a>"
                                +"</p>"

                                +"</div>"
                                +"<div class=\"content\">"
                                +"<ul class=\"sortable-content\" id='plan-" + obj.id +"'>";
                        var str1 = "";
                        for(var i in obj.list){
                            var obj1 = obj.list[i];
                            str1 += plan(obj1,obj.groupId);
                        }
                        str += str1
                                +"</ul>"
                                +"</div>"
                                +"</div>"
                                +"</li>";
                    }
                    $("#sortable2").html(str);
                    $( "#sortable1, #sortable2" ).sortable({
                        connectWith: ".connectedSortable"
                    }).disableSelection();
                    $(".sortable-content" ).sortable({
                        connectWith: ".sortable-content"
                    }).disableSelection();
                }
            })
        });
        /**=========================导入模板end======**/
        /**========================删除==============**/
        $(".close-day").live('click',function(){
            var _div = $(this).parent().parent().parent();
            var groupId = _div.attr("groupId");
            if(groupId!=_groupId){
                _div.parent().remove();
                return false;
            }
            var id = _div.attr("id");
            $.ajax({
                url:"${ctx}/tms/journeyDay/delete?id="+id,
                type:"get",
                success:function(data){
                    data = eval("("+data+")");
                    if(data.status == 1){
                        _div.parent().remove();
                    }
                }
            })
        });
        $(".close-plan").live('click',function(){
            var _div = $(this).parent().parent();
            var groupId = _div.attr("groupId");
            if(groupId!=_groupId){
                _div.parent().remove();
                return false;
            }
            var id = _div.attr("id");
            $.ajax({
                url:"${ctx}/tms/journeyPlan/delete?id="+id,
                type:"get",
                success:function(data){
                    data = eval("("+data+")");
                    if(data.status == 1){
                        _div.parent().remove();
                    }
                }
            })
        });
        /**========================删除end==============**/
        /**============更新具体行程========**/

        $("#addPlan").live('click',function(){
            var dayId = $(this).parent().parent().parent().attr("id");
            var cityIds = '';
            $.ajax({
                url:"${ctx}/tms/journeyDay/get?id="+dayId,
                type:"get",
                dataType:"json",
                ansyc :true,
                success:function(data) {
                    cityIds = data.cityIds;
                    $("#cityIds").val(data.cityIds);
                }
            });
            var groupId = $(this).parent().parent().parent().attr("groupId");
            if(groupId!=_groupId){
                if(!check(dayId))return false;
                var data = copyDay(dayId);
                $(this).parent().parent().parent().attr("id",data.id);
                $(this).parent().parent().parent().attr("groupId",_groupId);
            }
            $("#plan-type").val('-1').trigger("change");
            $("#plan-list").val('').trigger("change");
            $("#plan-list").empty();
            $("#dayId").val(dayId);
            $("#planId").val('');
            $("#plan-name").val('');
            $("#plan-time").val('');
            $("#plan-description").val('');
            $("#plan-message").val('');
            $("#plan-longitude").val('');
            $("#plan-latitude").val('');
            $("input[name='hasTime'][value='0']").attr("checked",true);
            $("#journeyPlan").show(300);
        });

        $("#updatePlan").live('click',function(){
            var id = $(this).parent().parent().attr("id");
            var groupId = $(this).parent().parent().attr("groupId");
            if(groupId!=_groupId){
                if(!check(id))return false;
                var data = copyDay(dayId);
                $(this).parent().parent().attr("id",data.id);
                $(this).parent().parent().attr("groupId",_groupId);
            }
            var dayId = $(this).parent().parent().parent().parent().attr("id");
            dayId = dayId.substring(5);
            var cityIds = '';
            $.ajax({
                url:"${ctx}/tms/journeyDay/get?id="+dayId,
                type:"get",
                dataType:"json",
                async:false,
                success:function(data) {
                    if(groupId!=_groupId)id='';
                    cityIds = data.cityIds;
                    $("#cityIds").val(data.cityIds);
                }
            });

            if(id==undefined){
                return false;
            }
            if(groupId!=_groupId){
                if(!check(id))return false;
                var data = copyDay(dayId);
                $(this).parent().parent().parent().parent().attr("id","plan-" + data.id);
                $(this).parent().parent().attr("groupId",_groupId);
                $("#"+dayId).attr("groupId",_groupId);
                $("#"+dayId).attr("id",data.id);
                dayId=data.id;
                var plan = copyPlan(id,dayId);
                id = plan.id;
                $(this).parent().parent().attr("id",id);
            }
            $.ajax({
                url:"${ctx}/tms/journeyPlan/get?id="+id+"&cityIds="+cityIds,
                type:"get",
                dataType:"json",
                success:function(data) {
                    $("#plan-type").val(data.type).trigger("change");
                    var options = data.infos;

                    var str1 = '';
                    for(var i in options){
                        var option = options[i];
                        if(option.id===data.infoId)
                            str1 += "<option value='"+ option.id +"' selected >"+ option.name +"</option>";
                        else
                            str1 += "<option value='"+ option.id +"'>"+ option.name +"</option>";
                    }
                    $("#plan-list").empty();
                    $("#plan-list").append(str1);
                    $("#plan-list").val(data.infoId).trigger("change");
                    if(groupId!=_groupId)id='';
                    $("#planId").val(id);
                    $("#dayId").val(dayId);
                    $("#plan-name").val(data.name);
                    $("#plan-time").val(data.time);
                    $("#plan-description").val(data.description);
                    $("#plan-message").val(data.message);
                    $("#plan-longitude").val(data.longitude === undefined ? '':data.longitude);
                    $("#plan-latitude").val(data.latitude === undefined ? '':data.latitude);
                    $("input[name='hasTime'][value="+ data.timeFlag +"]").attr("checked",true);
                    $("#journeyPlan").show(300);
                }
            });
        });

        $("#plan-btnSubmit").click(function(){
            var id = $("#planId").val();
            var l = $("#plan-type");
            var type = l.val();
            if(type==='-1'){
                l.parent().append("<span style='color: #dd1f26;font-size: 12px;position: absolute' class='msg'>*请选择</span>");
                return false;
            }else{
                l.parent().find('.msg').remove();
            }
            var infoId = $("#plan-list").val();
            var dayId = $("#dayId").val();
            l = $("#plan-name");
            var name = l.val();
            if(name===''){
                l.parent().append("<span style='color: #dd1f26;font-size: 12px;position: absolute   ' class='msg'>*请输入标题</span>");
                return false;
            }else{
                l.parent().find('.msg').remove();
            }
            var time = $("#plan-time").val();
            var description = $("#plan-description").val();
            var message = $("#plan-message").val();
            l = $("#plan-longitude");
            var longitude = l.val();
            if(longitude!=''&&!isNaN(longitude)){
                l.parent().append("<span style='color: #dd1f26;font-size: 12px;position: absolute' class='msg'>*请输入正确的坐标</span>");
                return false;
            }else{
                l.parent().find('.msg').remove();
            }
            l = $("#plan-latitude");
            var latitude = l.val();
            if(latitude!=''&&!isNaN(latitude)){
                l.parent().append("<span style='color: #dd1f26;font-size: 12px;position: absolute' class='msg'>*请输入正确的坐标</span>");
                return false;
            }else{
                l.parent().find('.msg').remove();
            }
            var hasTime = $("input[name='hasTime']:checked").val();
            var data = {
                "dayId":dayId,
                "id":id,
                "type":type,
                "name":name,
                "infoId":infoId,
                "time":time,
                "description":description,
                "message":message,
                "timeFlag":hasTime,
                "longitude":longitude,
                "latitude":latitude
            }
            $.ajax({
                url:"${ctx}/tms/journeyPlan/save",
                dataType:"json",
                type:"post",
                data:data,
                success:function(data){
                    var str = plan(data,_groupId);
                    var ul = $("#plan-"+dayId);
                    if(id!=undefined&&id.length>0)$("#"+id).parent().remove();
                    ul.append(str);
                    $("#journeyPlan").hide(300);
                }
            })
        });

        $("#plan-type").change(function (e) {
            var dayId = $("#dayId").val();
            var type = e.target.value;

            $("#plan-description").val('');
            $("#plan-name").val('');
            $("#plan-longitude").val('');
            $("#plan-latitude").val('');
            $("#plan-description").removeAttr("readonly");
            $("#plan-name").removeAttr("readonly");
            $("#plan-longitude").removeAttr("readonly");
            $("#plan-latitude").removeAttr("readonly");
            $("#plan-list").val('').trigger("change");
            $("#plan-list").empty();
            if(type==1||type==2||type==4){
                return false;
            }
            $.ajax({
                url:"${ctx}/tms/journeyPlan/findTypeList",
                dataType:"json",
                type:"post",
                data:{"dayId":dayId,"type":type},
                success:function(data){
                    $("#plan-list").empty();
                    var str = '<option value=\"\" selected>请选择</option>';
                    for(var n in data){
                        var obj = data[n];
                        str += "<option value=\"" + obj.id + "\">" +obj.name+ "</option>"
                    }
                    $("#plan-list").append(str);
                }
            })
        });

        $("#plan-list").change(function(){
            var id = $(this).val();
            var type = $("#plan-type").val();
            if(id!=null && id.length>0){
                $.ajax({
                    url:"${ctx}/tms/journeyPlan/findType",
                    dataType:"json",
                    data:{"type":type,"infoId":id},
                    type:"post",
                    success:function(data){
                        if(data.id.length>0){
                            $("#plan-description").val(data.description);
                            $("#plan-name").val(data.name);
                            $("#plan-longitude").val(data.longitude);
                            $("#plan-latitude").val(data.latitude);
                            $("#plan-description").attr("readonly","true");
                            $("#plan-name").attr("readonly","true");
                            $("#plan-longitude").attr("readonly","true");
                            $("#plan-latitude").attr("readonly","true");
                        }else{
                            $("#plan-description").val('');
                            $("#plan-name").val('');
                            $("#plan-longitude").val('');
                            $("#plan-latitude").val('');
                            $("#plan-description").removeAttr("readonly");
                            $("#plan-name").removeAttr("readonly");
                            $("#plan-longitude").removeAttr("readonly");
                            $("#plan-latitude").removeAttr("readonly");
                        }
                    }
                })
            }
        });
        /**=======================================更新end**/
        /**==========更新天=====*/
        $("#updateDay").live('click',function(){
            var id = $(this).parent().parent().parent().attr("id");
            if(id==undefined){
                return false;
            }
            var groupId = $("#"+id).attr("groupId");
            if(groupId!=_groupId){
                if(!check(id))return false;
                $("#"+id).attr("groupId",_groupId);
                var data = copyDay(id);
                $("#"+id).attr("id",data.id);
                id = data.id;

            }
            $.ajax({
                url:"${ctx}/tms/journeyDay/get?id="+id,
                type:"get",
                dataType:"json",
                ansyc :true,
                success:function(data) {
                    if(groupId!=_groupId)id='';
                    $("#id").val(id);
                    $("#groupId").val(data.groupId);
                    $("#cityId").val(data.cityIds);
                    $("#cityName").val(data.title.replace(new RegExp(/(-)/g),","));
                    $("#journeyList").show(300);
                    event.preventDefault();
                    return false;

                }
            });
        });

        $("#addJourneyDay").click(function(){
            $("#cityId").val('');
            $("#cityName").val('');
            $("#id").val('');
            $("#journeyList").show(300);
        });

        $("#btnSubmit").click(function(){
            var cityId = $("#cityId").val();
            if(cityId.length==0){
                alertx("请选择城市！");
                return false;
            }
            $.ajax({
                url:"${ctx}/tms/journeyDay/save",
                dataType:"json",
                type:"post",
                data:{"id":$("#id").val(),"cityIds":$("#cityId").val()
                    ,"title":$("#cityName").val(),"groupId":_groupId},
                success:function(data){
                    var str = "<li style=\"list-style-type:none;\">"
                            +"<div style='width:400px;background-color: #ECECEC' id='"+ data.id +"' groupId='" + data.groupId + "'>"
                                +"<div class=\"title\">"
                                    +"<p class=\"p-header-top\">"
                                    +data.title
                                    +"<i class=\"fa fa-times close-day\" style=\"float: right;margin-right: 10px;\"></i>"
                                    +"<a href=\"#\" style=\"float: right;margin-right: 10px;\"  id=\"updateDay\">修改</a>"
                                    +"<a href=\"#\" style=\"float: right;margin-right: 10px;\" id=\"addPlan\">添加</a>"
                                    +"</p>"
                                +"</div>"
                                +"<div class=\"content\" style=\"display: block;\">"
                                    +"<ul class=\"sortable-content ui-sortable\" id='plan-"+ data.id +"' ></ul>"
                                +"</div>"
                            +"</div>"
                            +"</li>";
                    if($("#"+ data.id).length>0)
                        $("#"+ data.id).parent().remove();
                    $("#sortable1").append(str);
                    $( "#sortable1, #sortable2" ).sortable({
                        connectWith: ".connectedSortable"
                    }).disableSelection();
                    $(".sortable-content" ).sortable({
                        connectWith: ".sortable-content"
                    }).disableSelection();
                    $("#journeyList").hide(300);
                }
            });
        });

        /**最终保存**/
        $("#saveJourney").on('click',function(){
            var day = {};
            var days = [];
            var plan = {};
            var plans = [];
            var d = 0;
            var p = 0;
            var journey = {};
            journey.groupId = _groupId;

            $("#sortable1").find("li").each(function(){
                var _this = $(this);
                var div = _this.children("div");
                var id = div.attr("id");
                var groupId = div.attr("groupId");
                if(d == 0 && days.length==0){
                    days[d] = day;
                    day.id = id;
                    day.groupId = groupId;
                    day.children = plans;
                    return true;
                }

                if(_this.parent().attr("id") == 'sortable1'){//Day ul
                    d++;
                    day = new Object();
                    plans = new Array();
                    days[d] = day;
                    day.children = plans;
                    day.id = id;
                    day.groupId = groupId;
                    p = 0;
                }else{//Plan ul
                    plan = new Object();
                    plan.id = id;
                    plan.groupId = groupId;
                    plans[p] = plan;

                    p++;
                }
            });
            journey.list = days;
            var json = JSON.stringify(journey);
            $.ajax({
                url:"${ctx}/tms/journeyDay/sort",
                dataType:"json",
                type:"post",
                data:{json:json+""},
                success:function(data){
                    swal("保存成功!", data.msg, "success");
                }

            });
        });





    });

    function plan(obj1,groupId){
        var str1 = "<li>"
                +"<div id=\""+obj1.id+"\" class=\"border\" groupId=\""+ groupId +"\">"
                +"<p class=\"p-header\">"+obj1.name
                +"<i class=\"fa fa-times close-plan\" style=\"float: right;margin-right: 10px;\"></i>"
                +"<a href=\"#\" id='updatePlan' style=\"float: right;margin-right: 10px;\">修改</a>"+
                "</p>";
        if(obj1.timeFlag==1){
            str1 += "<p class='p-message'>"+obj1.time+"</p>";
        }
        str1 += "<p class=\"p-description\">"+obj1.description+"</p>";
        str1 += "<p class=\"p-description\">维度："+obj1.longitude+"</p>";
        str1 += "<p class=\"p-description\">经度："+obj1.latitude+"</p>";
        str1 += "<p class=\"p-message\">"+obj1.message+"</p>";
        str1 +=  "</div>"
                + "</li>";
        return str1;
    }

    function copyDay(dayId){//复制模板的Day
        var _data = {};
        $.ajax({
            url:"${ctx}/tms/journeyDay/copy?id="+dayId+"&groupId="+$("#group_id").val(),
            dataType:"json",
            type:"get",
            success:function(data){
                _data = data;
            }
        });
        return _data;
    }
    function copyPlan(id,dayId){//复制模板的plan
        var _data = {};
        $.ajax({
            url:"${ctx}/tms/journeyPlan/copy?id="+id
            +"&dayId"+dayId,
            dataType:"json",
            type:"get",
            success:function(data){
                _data = data;
            }
        });
        return _data;
    }

    function check(id){//验证ID是否存在
        if($("#sortable1").find("#"+id).length==0){//不存在
            swal({   title: "修改拒绝!",
                text: "请拖拽至<span style=\"color:#F8BB86\">当前团队行程</span>中修改.",
                html:true,
                timer: 2000,
                showConfirmButton: true }
            );
            return false;

        }
        return true;
    }



</script>

</body>
</html>