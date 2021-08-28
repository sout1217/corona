<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>kakaoMap</title>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키값&libraries=clusterer"></script>
</head>
<body>
<div id="map" style="width:100%;height:100vh;"></div>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.50104046748938, 126.88329556694958), // 지도의 중심좌표
            level: 2, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        };
    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    // 지도에 선을 표시한다
    var polyline = new kakao.maps.Polyline({
        map: map, // 선을 표시할 지도 객체
        path: [ // 선을 구성하는 좌표 배열
            new kakao.maps.LatLng(37.500951749657744, 126.88470368793328),
            new kakao.maps.LatLng(37.50087113752212, 126.88290001243737),
            new kakao.maps.LatLng(37.501602796217135, 126.88248891138772),
            new kakao.maps.LatLng(37.501378511481846, 126.88346467826916),
        ],
        endArrow: true, // 화살표
        strokeWeight: 3, // 선의 두께
        strokeColor: '#FF0000', // 선 색
        strokeOpacity: 0.9, // 선 투명도
        strokeStyle: 'solid' // 선 스타일
    });
    // 도형에 mouseover 이벤트를 등록한다
    kakao.maps.event.addListener(polyline, 'mouseover', function() {
        console.log('도형에 mouseover 이벤트가 발생했습니다!');
    });
    // 도형에 mouseout 이벤트를 등록한다
    kakao.maps.event.addListener(polyline, 'mouseout', function() {
        console.log('도형에 mouseout 이벤트가 발생했습니다!');
    });
    // 도형에 mousedown 이벤트를 등록한다
    kakao.maps.event.addListener(polyline, 'mousedown', function() {
        console.log('도형에 mousedown 이벤트가 발생했습니다!');
    });
</script>

</body>
</html>