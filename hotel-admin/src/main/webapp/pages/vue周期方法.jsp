<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>vue周期方法</title>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    </head>
    <body>
        <div id="box1">
            <input type="text" v-model="num">
            <button @click="num++">+</button>
        </div>
        <script>
            const vue1 = new Vue({
                el: "#box1",
                data: {
                    num: 0
                },
                beforeCreate() {
                    console.log("------------------------------------------------");
                    console.log("beforeCreate.....");
                    console.log("data..." + this.$data);
                    console.log("el..." + this.$el);
                },
                created() {
                    console.log("------------------------------------------------");
                    console.log("created.....");
                    console.log("data..." + this.$data);
                    console.log("el..." + this.$el);
                },
                beforeMount() {
                    console.log("------------------------------------------------");
                    console.log("beforeMount.....");
                    console.log("data..." + this.$data);
                    console.log("el..." + this.$el);
                },
                // mounted() {
                //     console.log("------------------------------------------------");
                //     console.log("mounted.....");
                //     console.log("data..." + this.$data);
                //     console.log("el..." + this.$el);
                // },
                beforeUpdate() {
                    console.log("------------------------------------------------");
                    console.log("beforeUpdate.....");
                    console.log("data..." + this.$data);
                    console.log("el..." + this.$el);
                },
                updated() {
                    console.log("------------------------------------------------");
                    console.log("updated.....");
                    console.log("data..." + this.$data);
                    console.log("el..." + this.$el);
                },
                beforeDestroy() {
                    console.log("------------------------------------------------");
                    console.log("beforeDestroy.....");
                },
                destroyed() {
                    console.log("------------------------------------------------");
                    console.log("destroyed.....");
                }
            });
        </script>
    </body>
</html>
 