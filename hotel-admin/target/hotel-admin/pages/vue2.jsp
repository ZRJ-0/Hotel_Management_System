<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>vue2</title>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
        <style>
            .c1 {
                background-color: #00C1B3;
            }

            .c2 {
                background-color: #6BC0E4;
            }
        </style>
    </head>
    <body>
        <div id="box1">
            <%--  事件的冒泡  --%>
            <h1>事件的冒泡</h1>
            <div @click="aaa('div')" style="width: 100px;height: 100px;background-color: #000000;">
                <%--  取消事件冒泡    在子标签中加入 @click.stop  --%>
                <button @click.stop="aaa('button')">我是button</button>
            </div>
            <hr>
            <h1>事件的阻止</h1>
            <%--  事件的阻止 @click.prevent阻止事件的默认行为 此处阻止a链接默认跳转行为  --%>
            <a href="https://www.baidu.com" v-on:click.prevent="bd" style="text-decoration: none;">百度</a>
            <hr>
            <h1>v-once指令(只更新一次)</h1>
            <input type="text" v-model="uName"><span v-once>{{uName}}</span>
            <%--  v-bind(:)的使用  --%>
            <h1>v-bind(:)的使用</h1>
            <div v-bind:class="skin" style="width: 100px;height: 100px;"></div>
            <button @click="pf('c1')">皮肤1</button>
            <button @click="pf('c2')">皮肤2</button>
            <%--  computed的使用  --%>
            <h1>computed的使用</h1>
            请输入您的书名：<input type="text" v-model="bookName"><br>
            您购买书的详细信息为：<span>{{bName}}</span>
            <hr>
            <h1>查看vue中的this</h1>
            <button @click="bbb">查看vue中的this</button>
        </div>
        <script type="text/javascript">
            var vue1 = new Vue({
                el: "#box1",
                data: {
                    uName: "张三",
                    skin: "",
                    bookName: ""
                },
                methods: {
                    aaa(msg) {
                        console.log("我是" + msg);
                    },
                    bd() {
                        console.log("百度一下，你就知道!!!");
                    },
                    pf(skin) {
                        this.skin = skin;
                    },
                    bbb() {
                        console.log(this);
                    }
                },
                computed: {     //  计算属性
                    bName() {
                        return this.bookName + "---清华大学出版社";
                    },
                }
            });
        </script>
    </body>
</html>
 