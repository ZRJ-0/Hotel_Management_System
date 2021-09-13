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
        <title>入住信息查询</title>
        <base href="<%=basePath%>">
        <link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- 引入bootstrap分页 -->
        <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css"/>
        <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
        <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
        <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
        <script>
            $(function () {
                $('#pagination').bootstrapPaginator({
                    bootstrapMajorVersion: 3,
                    currentPage: ${requestScope.pageInfo.pageNum },
                    totalPages: ${requestScope.pageInfo.pages },
                    pageUrl: function (type, page, current) {
                        return 'getInRoomInfo.do?pageNum=' + page;
                    },
                    itemTexts: function (type, page, current) {
                        switch (type) {
                            case "first":
                                return "首页";
                            case "prev":
                                return "上一页";
                            case "next":
                                return "下一页";
                            case "last":
                                return "末页";
                            case "page":
                                return page;
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".click_add").click(function () {
                    $(".tip").fadeIn(200);
                });
                $(".click_update").click(function () {
                    $(".tip").fadeIn(200);
                    $(".tiptop>span").html("修改房间类型");
                });
                $(".click_delete").click(function () {
                    // $(".tip").fadeIn(200);
                    if (confirm("您确定要删除吗？")) {

                    }
                });

                $(".tiptop a").click(function () {
                    $(".tip").fadeOut(200);
                });

                $(".sure").click(function () {
                    $(".tip").fadeOut(100);
                });

                $(".cancel").click(function () {
                    $(".tip").fadeOut(100);
                });

            });
        </script>
        <style>
            .room_add {
                display: block;
                font-size: 15px;
                margin-top: 20px;
                padding-left: 10px;
            }

            .input_add {
                width: 200px;
                height: 32px;
                line-height: 32px;
                text-indent: 10px;
                border-top: solid 1px #c3ab7d;
                border-left: solid 1px #c3ab7d;
                border-right: solid 1px #e7d5ba;
                border-bottom: solid 1px #e7d5ba;
            }
        </style>
    </head>

    <body>
        <div class="place"><span>位置：</span>
            <ul class="placeul">
                <li><a href="#">客房管理</a></li>
                <li><a href="#">客房类型管理</a></li>
            </ul>
        </div>
        <div class="rightinfo">
            <div class="tools">
                <ul class="toolbar">
                    <li class="click_add"><span><img src="<%=basePath %>/static/images/t01.png"/></span>添加</li>
                    <li class="click_update"><span><img src="<%=basePath %>/static/images/t02.png"/></span>修改</li>
                    <li class="click_delete"><span><img src="<%=basePath %>/static/images/t03.png"/></span>删除</li>
                </ul>

                <div class="toolbar1">
                    <table>
                        <form method="post" name="serch" action="<%=basePath %>/getInRoomInfo.do">
                            <tr>
                                <td class="zi"><span>选择分类：</span></td>
                                <td>
                                    <select id="conditionType">
                                        <option value="roomNum">房间号</option>
                                        <option value="customerName">客人姓名</option>
                                        <option value="phone">手机号码</option>
                                        <option value="idcard">身份证号码</option>
                                    </select>
                                </td>
                                <td class="zi"><span>关键字：</span></td>
                                <td><input type="text" name="roomNum" id="keyword" placeholder="与分类关联"/></td>
                                <td><input type="submit" value="查询" class="button"/></td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("#conditionType").change(function () {
                        let v = $(this).find("option:selected").val();
                        $("#keyword").attr("name", v);
                    });
                });
            </script>
            <table class="tablelist">
                <thead>
                <tr>
                    <th><input name="" type="checkbox" value=""/></th>
                    <th>编号</th>
                    <th>房间号</th>
                    <th>房间类型</th>
                    <th>客人姓名</th>
                    <th>是否vip</th>
                    <th>折扣率</th>
                    <th>性别</th>
                    <th>身份证号码</th>
                    <th>手机号码</th>
                    <th>押金</th>
                    <th>入住时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="map" varStatus="num">
                    <tr>
                        <td><input name="" type="checkbox" value=""/></td>
                        <td>${num.count}</td>
                        <td>${map.room_num}</td>
                        <td>${map.room_type_name}</td>
                        <td>${map.customer_name}</td>
                        <td>${map.is_vip == '1' ? '是':'否'}</td>
                        <td>${map.is_vip == '1' ? map.vip_rate:'无折扣'}</td>
                        <td>${map.gender == '1' ? "男": "女"}</td>
                        <td>${map.idcard}</td>
                        <td>${map.phone}</td>
                        <td>${map.money}</td>
                        <td>${map.create_date}</td>
                        <td>
                            <c:choose>
                                <c:when test="${map.out_room_status == '0'}">
                                    <a href="<%=basePath %>/pages/bill/out.html?roomId=${map.room_id}&roomNum=${map.room_num}"
                                       class="tablelink">退房</a>&nbsp;
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="tablelink">已退房</a>
                                    <a href="#" class="tablelink">删除</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- 显示分页 -->
            <ul id="pagination"></ul>
            <div class="tip">
                <div class="tiptop"><span>添加房间类型</span><a></a></div>
                <div
                        class="tipinfo"><span><img src="<%=basePath %>/static/images/ticon.png"
                                                   style="width:50px;padding-top: 30px"/></span>
                    <label for="room_type" class="room_add">房间类型: &nbsp; <input type="text" name="room_type_name"
                                                                                id="room_type" class="input_add"
                                                                                placeholder="请输入3-10位的中文"></label>
                    <label for="room_price" class="room_add">房间单价: &nbsp; <input type="text" name="room_price"
                                                                                 id="room_price" class="input_add"
                                                                                 placeholder="请输入一个正数"></label>
                    <div class="tipbtn">
                        <input name="" type="button" class="sure" value="确定"/>
                        &nbsp;
                        <input name="" type="button" class="cancel" value="取消"/>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $('.tablelist tbody tr:odd').addClass('odd');
            </script>
    </body>
</html>
