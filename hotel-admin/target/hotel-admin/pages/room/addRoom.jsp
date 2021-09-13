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
        <title>添加客房</title>
        <base href="<%=basePath%>">
        <link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
            .forminfo li {
                margin-bottom: 0px;
                height: 15px;
            }

            .vocation {
                height: 60px;
            }
        </style>
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/select-ui.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>/editor/kindeditor.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/laydate/laydate.js"></script>
        <script type="text/javascript">
            KE.show({
                id: 'content7',
                cssPath: './index.css'
            });
        </script>
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
                <li><a href="#">客房管理</a></li>
                <li><a href="#">添加客房</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>添加客房</span></div>
            <div id="usual1" class="usual">
                <div id="tab1" class="tabson">
                    <ul class="forminfo">
                        <li>
                            <label>房间号<b>*</b></label>
                            <div class="vocation">
                                <input name="room_num" type="text" class="dfinput" style="width:344px;"/>
                            </div>
                        </li>
                        <li>
                            <label>房间类型<b>*</b></label>
                            <div class="vocation">
                                <select class="select1" id="roomType" name="roomType">
                                </select>
                            </div>
                        </li>
                        <li style="display:none;" id="rt">
                            <label>房间单价<b>*</b></label>
                            <div class="vocation">
                                <input name="room_price" type="text" class="dfinput" style="width:344px;"
                                       readonly="readonly"/>
                            </div>
                        </li>
                        <li>
                            <label>房间状态<b>*</b></label>
                            <div class="vocation">
                                <select class="select1" name="roomStatus">
                                    <option value="0">空闲</option>
                                    <option value="1">已入住</option>
                                    <option value="2">打扫</option>
                                </select>
                            </div>
                        </li>
                        <br>
                        <li style="margin: 20px 0 0 180px;">
                            <input name="" type="button" class="btn" value="入住"/>
                        </li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">

                $("#usual1 ul").idTabs();
                $(function () {
                    $("#roomType").mouseenter(function () {
                        $.ajax({
                            url: "<%=basePath %>/getAllRoomType.do",
                            type: "POST",
                            dataType: "json",
                            success: function (rs) {
                                var content = "";
                                for (var i in rs) {
                                    content += "<option price='" + rs[i].room_price + "' value='" + rs[i].id + "'>" +
                                        rs[i].room_type_name + "</option>";
                                }
                                $("#roomType").html(content);
                            },
                            error: function () {

                            }
                        })
                    });

                    //  给房间类型下拉框添加change事件
                    $("#roomType").change(function () {
                        let price = $(this).find("option:selected").attr("price");
                        $("input[name=room_price]").val(price);
                        // $("#rt").attr("style", "display:block;");
                        $("#rt").show('1500');
                    });

                    $("input[name=room_num]").val();
                })
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
