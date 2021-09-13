<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>入住信息添加</title>
        <base href="<%=basePath%>">
        <link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/select-ui.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>>/editor/kindeditor.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/laydate/laydate.js"></script>
        <script type="text/javascript">
            $(document).ready(function (e) {
                $(".select1").uedSelect({
                    width: 345
                });
                $(".select2").uedSelect({
                    width: 167
                });
                $(".select3").uedSelect({
                    width: 100
                });
            });
        </script>
    </head>

    <body>
        <div class="place"><span>位置：</span>
            <ul class="placeul">
                <li><a href="#">首页</a></li>
                <li><a href="#">入住信息管理</a></li>
                <li><a href="#">添加入住信息</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>入住信息</span></div>
            <div id="usual1" class="usual">
                <div id="tab1" class="tabson">
                    <ul class="forminfo">
                        <li>
                            <label>房间号<b>*</b></label>
                            <div class="vocation">
                                <select class="select1" name="roomid">
                                    <option style="display: none;"></option>
                                    <c:forEach items="${roomList}" var="room" varStatus="num">
                                        <option rt="${room.room_type_name}" pr="${room.room_price}">
                                                ${room.room_num}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </li>
                        <li>
                            <label>房间类型<b>*</b></label>
                            <div class="vocation">
                                <input name="roomType" id="roomType" type="text" class="dfinput" placeholder="房间类型"
                                       value="" style="width:344px;"/>
                            </div>
                        </li>
                        <br>
                        <li>
                            <label>客人姓名<b>*</b></label>
                            <div class="vocation">
                                <input name="name" type="text" class="dfinput" placeholder="客户姓名" style="width:344px;"/>
                            </div>
                        </li>
                        <br/>
                        <li>
                            <label for="price" style="cursor:pointer">单价<b>*</b></label>
                            <div class="vocation">
                                <input name="price" id="price" class="dfinput" value=""
                                       style="width:344px;"/>
                            </div>
                        </li>
                        <br/>
                        <li>
                            <label for="yajin" style="cursor:pointer">押金<b>*</b></label>
                            <div class="vocation">
                                <input name="yajin" id="yajin" type="text" class="dfinput" placeholder="押金"
                                       style="width:344px;"/>
                            </div>
                        </li>
                        <br/>
                        <li>
                            <label for="qita" style="cursor:pointer">其他消费<b>*</b></label>
                            <div class="vocation">
                                <input name="qita" id="qita" type="text" class="dfinput" value="" style="width:344px;"/>
                            </div>
                        </li>
                        <br/>
                        <li>
                            <label style="cursor:pointer">入住时间<b>*</b></label>
                            <div class="vocation">
                                <input type="date" name="date1" class="dfinput" style="width:344px;"/>
                            </div>
                        </li>
                        <br/>
                        <li>
                            <label style="cursor:pointer">退房时间<b>*</b></label>
                            <div class="vocation">
                                <input type="date" name="date2" class="dfinput" style="width:344px;"/>
                            </div>
                            <br/>
                        </li>
                        <li>
                            <label>&nbsp;</label>
                            <input name="" type="submit" class="btn" value="提交"/>
                        </li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("select[name=roomid]").change(function () {
                        let rt = $(this).find("option:selected").attr("rt");
                        let pr = $(this).find("option:selected").attr("pr");
                        $("#roomType").val(rt);
                        $("#price").val(pr);
                        // console.log(rt);
                        // console.log(pr);
                    });
                });

                $("#usual1 ul").idTabs();
            </script>
            <script type="text/javascript">
                $('.tablelist tbody tr:odd').addClass('odd');

                !function () {
                    laydate.skin('qianhuang');
                    laydate({elem: '#Calendar'});
                    laydate.skin('qianhuang');
                    laydate({elem: '#Calendar2'});
                }();
                $(function dd() {
                    var d = new Date(), str = "";
                    str += (d.getFullYear() + "-");
                    str += "0";
                    str += (d.getMonth() + 1 + "-");
                    str += d.getDate();
                    $("#Calendar").attr("value", str);
                    $("#Calendar2").attr("value", str);
                });

            </script>
        </div>
    </body>
</html>
