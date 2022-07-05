<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">日常打卡</li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form id="daily-report-form">
                            <input type="hidden" id="daily-report-id" name="id" value="${dailyReport.id}">
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md12">
                                    <label for="location" class="layui-form-label">打卡位置</label>
                                    <div class="layui-input-block" style="position: relative">
                                        <input type="text" readonly="readonly" value="${dailyReport.location}" id="location" name="location" autocomplete="off" class="layui-input" style="width: 80%">
                                        <input type="button" class="layui-input" onclick="getNowLocation()" style="width: 20%; position: absolute; left:815px; top:0px; cursor: pointer" value="获取当前打卡位置" />
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md12">
                                    <label class="layui-form-label">健康状态</label>
                                    <div class="layui-input-block">
                                        <c:if test="${dailyReport.healthStatus == 1}">
                                            <input type="radio" checked name="healthStatus" value="1" title="健康" autocomplete="off" class="layui-input">
                                        </c:if>
                                        <c:if test="${dailyReport.healthStatus != 1}">
                                            <input type="radio" name="healthStatus" value="1" title="健康" autocomplete="off" class="layui-input">
                                        </c:if>
                                        <c:if test="${dailyReport.healthStatus == 2}">
                                            <input type="radio" checked name="healthStatus" value="2" title="有发烧、咳嗽等症状" autocomplete="off" class="layui-input">
                                        </c:if>
                                        <c:if test="${dailyReport.healthStatus != 2}">
                                            <input type="radio" name="healthStatus" value="2" title="有发烧、咳嗽等症状" autocomplete="off" class="layui-input">
                                        </c:if>
                                        <c:if test="${dailyReport.healthStatus == 3}">
                                            <input type="radio" checked name="healthStatus" value="3" title="其他症状" autocomplete="off" class="layui-input">
                                        </c:if>
                                        <c:if test="${dailyReport.healthStatus != 3}">
                                            <input type="radio" name="healthStatus" value="3" title="其他症状" autocomplete="off" class="layui-input">
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="note" name="note" placeholder="请输入备注..." class="layui-textarea" style="height: 260px;">${dailyReport.note}</textarea>
                                </div>
                            </div>
                        </form>
                        <div class="layui-form-item">
                            <button class="layui-btn" onclick="submitDailyReport()">提交打卡</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=3tmfIS3gu3iSwpibAgXvIrvFx28mklvm"></script>
<script type="text/javascript">

    function submitDailyReport() {
        var data = serializeRemoveNull($("#daily-report-form").serialize());
        $.ajax({
            url:'../daily-report/save',
            dataType:'json',
            type:'post',
            data:data,
            success:function(result){
                if(result.code === 0){
                    layer.alert(result.msg, {icon: 6}, function () {
                        window.location.href = "../user/daily-report";
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，日常打卡失败！", {icon: 5});
            }
        });
    }

    function serializeRemoveNull(serStr){
        return serStr.split("&").filter(str => !str.endsWith("=")).join("&");
    }

    var id;
    function getNowLocation() {
        id = layer.msg('正在获取当前位置...请稍后....', {
            shade: 0.4,
            time:false //取消自动关闭
        });
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
                $("#location").val(result);
                layer.close(id);
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

</script>
</body>
</html>
