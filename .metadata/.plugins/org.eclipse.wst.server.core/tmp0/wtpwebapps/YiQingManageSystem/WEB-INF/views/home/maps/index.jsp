<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/header.jsp"%>
<html>
<head>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=3tmfIS3gu3iSwpibAgXvIrvFx28mklvm"></script>
<%--    <script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=3tmfIS3gu3iSwpibAgXvIrvFx28mklvm"></script>--%>
</head>
<body>
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel" style="margin-bottom: 0;">

                <div style="text-align: center; height: 770px;">
                    <div style="display: inline-block;">
                        <div id="r-result">地点搜索:<input type="text" id="suggestId" size="20" placeholder="请输入地点信息..." style="width:250px;margin-top: 10px;margin-left:10px;padding: 0 20px;line-height: 36px;" /></div>
                        <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                        <div id="l-map" style="width:700px; height:680px;margin-top: 10px;"></div>
                    </div>
                </div>

            </div>
        </div>


        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">热门新闻</dt>
                <c:forEach items="${hotNewsList}" var="hotNews">
                    <dd>
                        <a href="../news/detail?id=${hotNews.id}" title="${hotNews.title}" style="max-width: 75%">${hotNews.title}</a>
                        <span><i class="iconfont" title="浏览量">&#xe60b;</i>${hotNews.viewNum}</span>
                        <span><i class="iconfont icon-pinglun1"></i> ${hotNews.commentNum}</span>
                    </dd>
                </c:forEach>
            </dl>
        </div>
        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <img src="../../resources/home/images/1.png" style="width: 380px; height:220px;">
            </dl>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var id;
    $(function() {
        layui.use('layer', function(){
            id = layui.layer.msg('正在获取疫情地图信息...请稍后....', {
                shade: 0.4,
                time:false //取消自动关闭
            });
        });
        // 获取当前位置
        getNowLocation();
    });

    var infectiveAddress = [];
    function markInfectiveLocation(map) {
        <c:forEach items="${mapsList}" var="maps" varStatus="vs">
            var maps = {
                lng: "${maps.lng}",
                lat: "${maps.lat}",
                createTime: "${maps.createTime}",
                location: "${maps.location}",
                count: "${maps.count}",
            };
            infectiveAddress.push(maps);
        </c:forEach>
        for(let i=0; i<infectiveAddress.length; i++) {
            let marker = new BMap.Marker(new BMap.Point(parseFloat(infectiveAddress[i].lng), parseFloat(infectiveAddress[i].lat)), {});
            map.addOverlay(marker);
            var opts = {
                width : 70,     // 信息窗口宽度
                height: 100,     // 信息窗口高度
                title : "疫情情况" , // 信息窗口标题
            };
            let infoWindow = new BMap.InfoWindow('<span style="color:red">疫情位置：'+ infectiveAddress[i].location +'<br/>确诊人数：' + infectiveAddress[i].count + '<br/>登记时间：'+ format(infectiveAddress[i].createTime) +'</span>', opts);  // 创建信息窗口对象
            marker.addEventListener("click", function(){
                map.openInfoWindow(infoWindow, new BMap.Point(parseFloat(infectiveAddress[i].lng), parseFloat(infectiveAddress[i].lat))); //开启信息窗口
            });
            map.openInfoWindow(infoWindow, new BMap.Point(parseFloat(infectiveAddress[i].lng), parseFloat(infectiveAddress[i].lat))); //开启信息窗口
        }
    }

    function markNowLocation(map, lng, lat, address) {
        var marker = new BMap.Marker(new BMap.Point(lng, lat), {});
        map.addOverlay(marker);

        var opts = {
            width : 70,     // 信息窗口宽度
            height: 30,     // 信息窗口高度
            title : "当前位置" , // 信息窗口标题
        };

        var infoWindow = new BMap.InfoWindow('地址：' + address, opts);  // 创建信息窗口对象
        marker.addEventListener("click", function(){
            map.openInfoWindow(infoWindow, new BMap.Point(lng, lat)); //开启信息窗口
        });
        map.openInfoWindow(infoWindow, new BMap.Point(lng, lat)); //开启信息窗口
    }

    var pp = null;

    function searchKeyWordNote(map) {
        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId"
                ,"location" : map
            });

        ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        var myValue;
        ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
            if(pp != null){
                deletePointMarker(map);
            }
            setPlace(map, myValue);
        });
        layer.close(id);
    }


    function initMap(lng, lat, address) {
        var map = new BMap.Map("l-map");
        map.centerAndZoom(new BMap.Point(lng, lat), 20);                   // 初始化地图,设置城市和地图级别。
        map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
        markInfectiveLocation(map);
        markNowLocation(map, lng, lat, address);
        searchKeyWordNote(map);
    }


    function setPlace(map, myValue){
        // map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 20);
            let flag = false; // 判断是否该点已经在图上标注过了
            for(let i=0; i<infectiveAddress.length; i++) {
                if(pp.lng.toFixed(5) === Number(infectiveAddress[i].lng).toFixed(5) && pp.lat.toFixed(5) === Number(infectiveAddress[i].lat).toFixed(5)) {
                    flag = true;
                }
            }
            if(!flag){
                map.addOverlay(new BMap.Marker(pp));    //添加标注
            }
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }

    function deletePointMarker(map) {
        if(pp == null) {
           return false;
        }
        var allOverlay = map.getOverlays();
        for(var i = 0;i<allOverlay.length;i++) {
            if(allOverlay[i].getPosition() == null) {
                continue;
            }
            if (allOverlay[i].getPosition().lng === pp.lng && allOverlay[i].getPosition().lat === pp.lat) {
                map.removeOverlay(allOverlay[i]);
                return false;
            }
        }

    }


    function getNowLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(locationSuccess, locationError, {
                // 指示浏览器获取高精度的位置，默认为false
                enableHighAccuracy: true,
                // 指定获取地理位置的超时时间，默认不限时，单位为毫秒
                timeout: 5000,
                // 最长有效期，在重复获取地理位置时，此参数指定多久再次获取位置。
                maximumAge: 3000
            });

        }else{
            alert("浏览器不支持Html5来获取地理位置信息");
        }
    }

    function locationSuccess(position) {
        let lat = position.coords.latitude;
        let lng = position.coords.longitude;
        const pointBak = new BMap.Point(lng, lat);
        const convertor = new BMap.Convertor();
        convertor.translate([pointBak], 1, 5,function(resPoint) {
            if(resPoint && resPoint.points && resPoint.points.length>0){
                lng = resPoint.points[0].lng;
                lat = resPoint.points[0].lat;
            }
            console.log("当前位置经度为:" + lng + "纬度为:" +lat);
            const point = new BMap.Point(lng, lat);
            const geo = new BMap.Geocoder();
            geo.getLocation(point, (rs) => {
                var addComp = rs.addressComponents;
                console.log(addComp);
                var result = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
                console.log("当前的位置为:" + result);
                initMap(lng, lat, result);
            });
        });
    }

    function locationError(error) {
        switch(error.code) {
            case error.TIMEOUT:
                alert("连接超时，请重试");
                break;
            case error.POSITION_UNAVAILABLE:
                alert('非常抱歉，我们暂时无法为您所在的星球提供位置服务');
                break;
            case error.PERMISSION_DENIED:
                alert('您拒绝了使用位置共享服务，查询已取消');
                break;
            default:
                alert('发生未知错误!');
                break;
        }

    }

    //时间格式显示
    function add0(m){return m<10?'0'+m:m }
    function format(shijianchuo){
        //shijianchuo是整数，否则要parseInt转换
        var time = new Date(shijianchuo);
        time.setHours(time.getHours() - 14);
        var y = time.getFullYear();
        var m = time.getMonth()+1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
    }

</script>

<style type="text/css">
    /*.BMap_bubble_content {*/
    /*    left: 0px;*/
    /*}*/
    /*.BMap_bubble_title {*/
    /*    padding-left: 0px;*/
    /*}*/
    /*.BMap_bubble_buttons {*/
    /*    right: -20px !important;*/
    /*}*/
    .BMap_cpyCtrl {
        display: none;
    }
</style>

