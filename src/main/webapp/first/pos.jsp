<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>kakaoMap</title>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키값"></script>
</head>
<body>
<div><h3>카카오 지도</h3></div>
<h3 id="clickLatlng"></h3>

<div id="map" style="width:100%;height:100vh;"></div>
<script>

    var guroXPos = '37.50098548763286';
    var guroYPos = '126.88465274508538';

    var guroPositon = new kakao.maps.LatLng(guroXPos, guroYPos);

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: guroPositon, // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        };

    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 지도에 마커를 생성하고 표시한다
    var marker = new kakao.maps.Marker({
        position: guroPositon,
        map: map // 마커를 표시할 지도 객체
    });


    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

        // 클릭한 위도, 경도 정보를 가져옵니다
        var latlng = mouseEvent.latLng;

        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);

        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';

        var resultDiv = document.getElementById('clickLatlng');
        resultDiv.innerHTML = message;

    });
</script>

</body>
</html>