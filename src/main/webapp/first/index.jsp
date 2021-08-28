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
<div><h3>카카오 지도</h3></div>

<div id="map" style="width:100%;height:100vh;"></div>
<script>

    var markerData = [
        {
            name: '구로 경영 기술 개발원',
            xPos: '37.50098548763286',
            yPos: '126.88465274508538',
            iwContent : '구로 경영 기술 개발원 입니다'
        },
        {
            name: 'NC 백화점',
            xPos: '37.501202093856584',
            yPos: '126.88273551309669',
            iwContent : 'NC 백화점 입니다'
        }
    ]

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(markerData[0].xPos, markerData[0].yPos), // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        };

    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);


    var createdMarkers = []

    for (var data of markerData) {
        var position = new kakao.maps.LatLng(data.xPos, data.yPos);
        var marker = new kakao.maps.Marker({
            position: position,
            map: map // 마커를 표시할 지도 객체
        });
        var infowindow = new kakao.maps.InfoWindow({
            content : data.iwContent
        });

        // infowindow.open(map, marker); // 인포윈도우를 바로 띄지 않게 하기 위함

        createdMarkers.push(marker) // 생성된 마커를 배열에 담아준다

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    }

    // 마커 클러스터러를 생성합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10 // 클러스터 할 최소 지도 레벨
    });

    clusterer.addMarkers(createdMarkers);


    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }

</script>

</body>
</html>