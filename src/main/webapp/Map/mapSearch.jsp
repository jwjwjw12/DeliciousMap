<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>지도 탐색</title>
<style>
.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

#menu_wrap {
	position: absolute;
	top: 15%;
	left: 3%;
	bottom: 10%;
	width: auto;
	padding: 0.5em;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

ul {
	margin: 0 auto;
	padding: 0;
}

#category {
	position: absolute;
	bottom: 10px;
	right: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background: url(places_category.v2.png) no-repeat;
}

#category li .restaurant {
	background-position: -10px 0;
}

#category li .cafe {
	background-position: -10px -36px;
}

#category li .convenience {
	background-position: -10px -72px;
}

#category li .mart {
	background-position: -10px -108px;
}

#category li .tour {
	background-position: -10px -144px;
}

#category li .accommodation {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

html, body {
	padding: 0;
	margin: 0;
	background-color: white;
}

.map_wrap {
	position: inherit;
	margin: 0 auto;
	width: 95%;
	height: 85%;
	border-radius: 20px;
	box-shadow: 5px 5px 15px slategray;
}

.customOverlay {
	position: relative;
	padding: 0.1em;
	background-color: #F47521;
	border-radius: 0.8em;
	bottom: 10em;
	box-shadow: 2px 2px 8px slategray;
	bottom: 9em;
	transform: translate(0, -10%);
}

.CrtTitle {
	font-weight: bold;
	margin: 0.5em;
	color: white;
	font-size: small;
}

.Title_customOverlay {
	font-weight: bold;
	margin: 0.5em;
	padding: 0.8em;
	border-radius: 0.5em;
	background-color: white;
	cursor: pointer;
}

.img_customOverlay {
	margin: 0.5em;
	padding: 1em;
	border-radius: 0.5em;
	background-color: white;
	overflow: hidden;
	width: inherit;
	height: 10vw;
	cursor: pointer;
}

.img_overlay {
	width: 10vw;
	height: 10vw;
	object-fit: fill;
}

.Btns {
	text-align: right;
}

.CBtn {
	border: none;
	outline: none;
	margin: 0.5em;
	padding: 0.5em 1em 0.5em 1em;
	background-color: black;
	color: white;
	border-radius: 2em;
}

.ABtn {
	border: none;
	outline: none;
	margin: 0.5em;
	padding: 0.5em 1em 0.5em 1em;
	background-color: white;
	border-radius: 2em;
}

.score {
	border: none;
	outline: none;
	color: white;
	font-weight: bold;
	margin: 0.5em;
	padding: 0.5em 1em 0.5em 1em;
	background: transparent;
}
</style>
<link rel="stylesheet" href="../Pages/practice.css" />
</head>
<body>
	<header class="header nav-header">
		<img class="header__icon-logo" src="../Pages/img/nav_logo.png"
			alt="맛있는지도" />
		<div class="header__menu">
			<span class="header__menu__schedule header__menu__item">일정관리</span> <span
				class="header__menu__map header__menu__item">지도탐색</span> <span
				class="header__menu__board header__menu__item">게시판</span> <span
				class="header__menu__my-page header__menu__item">마이페이지</span>
			<div class="header__menu__log-out header__menu__item">로그아웃</div>
		</div>
	</header>
	<div class="map_wrap">
		<div id="map"
			style="border-radius: 20px; width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<ul id="category">
			<li id="FD6" data-order="0"><span class="category_bg restaurant"></span>
				음식점</li>
			<li id="CE7" data-order="1"><span class="category_bg cafe"></span>
				카페</li>
			<li id="CS2" data-order="2"><span
				class="category_bg convenience"></span> 편의점</li>
			<li id="MT1" data-order="3"><span class="category_bg mart"></span>
				마트</li>
			<li id="AT4" data-order="4"><span class="category_bg tour"></span>
				관광지</li>
			<li id="AD5" data-order="5"><span
				class="category_bg accommodation"></span> 숙박</li>
		</ul>
	</div>
	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				<form onsubmit="searchPlaces(); return false;">
					<input type="text" value="영남대 맛집" id="keyword" size="15">
					<button type="submit">검색하기</button>
				</form>
			</div>
		</div>
		<hr>
		<ul id="placesList"></ul>
		<div id="pagination"></div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2aa9b1e0c22390334575cf60d01b5c11&libraries=services"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/c452641c94.js"
		crossorigin="anonymous"></script>

	<script>
		const schedule = document.querySelector('.header__menu__schedule');
		const searchMap = document.querySelector('.header__menu__map');
		const board = document.querySelector('.header__menu__board');
		const logOut = document.querySelector('.header__menu__log-out');
		const logo = document.querySelector('.header__icon-logo');
		const myPage = document.querySelector('.header__menu__my-page ');
		
		//main.html 주소
		logo.addEventListener('click', () => {
		  const manageScheduleUrl = '../SchedulePage/main.jsp';
		  location.assign(manageScheduleUrl);
		});

		//main.html 주소
		schedule.addEventListener('click', () => {
		  const manageScheduleUrl = '../SchedulePage/main.jsp';
		  location.assign(manageScheduleUrl);
		});

		//지도 탐색 페이지(?) 주소
		searchMap.addEventListener('click', () => {
		  const searchMapUrl = '../Map/mapSearch.jsp';
		  location.assign(searchMapUrl);
		});

		//게시판 주소
		board.addEventListener('click', () => {
		  const boardUrl = '../board/board.jsp';
		  location.assign(boardUrl);
		});
		
		myPage.addEventListener('click', () => {
			  const myPageUrl = '../MyPage/myPage.html';
			  location.assign(myPageUrl);
			});

		logOut.addEventListener('click', () => {
			/*
		  firebase
		    .auth()
		    .signOut()
		    .then(() => {
		      location.assign('./index.html');
		    });*/
		  const logOutUrl = '../logout.jsp';
		  location.assign(logOutUrl);
		});
	</script>
	<script>
		var customOverlay = new kakao.maps.CustomOverlay();
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
				(function(marker, place) {
					//마커에 마우스 클릭했을 때
					kakao.maps.event.addListener(marker, 'click', function() {
						RunOverlay(place, marker.getPosition().getLat(), marker
								.getPosition().getLng());
					});

					//키워드 목록에 마우스 올렸을 때
					itemEl.onmouseover = function() {
						RunOverlay(place, marker.getPosition().getLat(), marker
								.getPosition().getLng());
					};
				})(marker, places[i]);
				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		//오버레이 실행
		function RunOverlay(place, lat, lng) {
			CloseOverlay();
			var name = place.place_name, id = place.id;
			const code = place.category_group_code;
			var tmp = '<div class="customOverlay">'
					+ '<div class="Title_customOverlay" onclick="open_detail(&quot;'
					+ id
					+ '&quot;,&quot;'
					+ name
					+ '&quot;,'
					+ lat
					+ ','
					+ lng
					+ ',&quot;'
					+ code
					+ '&quot;)">'
					+ name
					+ '</div>'
					+ '<div class="img_customOverlay" onclick="open_detail(&quot;'
					+ id + '&quot;,&quot;' + name + '&quot;,' + lat + ',' + lng + ',&quot;' + code + '&quot;'
					+ ')"><img class="img_overlay" id="img_overlay" alt="IMG"></img></div>';
			tmp += '<div class="Btns"><button class="score" id="scoreBtn">★'
					+ '</button>'
					+ '<button onclick="setLike(' + id + ')" class="ABtn" id="likeBtn">즐겨찾기</button><button onclick="CloseOverlay()" class="CBtn">닫기</button></div></div>';
					
			customOverlay = new kakao.maps.CustomOverlay({
				map : map,
				clickable : true,
				content : tmp,
				position : new kakao.maps.LatLng(lat, lng),
				zIndex : 3
			});
			
			$.ajax({ // 이미지, 평점, 즐겨찾기 유무를 가져오기 위함
				url : 'getOv.jsp', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
				mathod : 'post',
				data : {
					r_num : id	// 음식점 id를 넘겨줌
				},
				success : function(data) { //DB접근 후 가져온 데이터
					const json = JSON.parse($.trim(data));
					document.getElementById('scoreBtn').innerText = '★' + json.score;	// 평점 설정
					document.getElementById('img_overlay').src = json.img;	// 이미지 설정
					if(json.like)
						document.getElementById('likeBtn').innerHTML = '<i class="fas fa-star"></i>';
					else
						document.getElementById('likeBtn').innerHTML = '<i class="far fa-star"></i>';
				}
			})
		}

		//오버레이 닫기
		function CloseOverlay() {
			customOverlay.setMap(null);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		

		//상세정보 넘기는 함수(오버레이에서 상세보기 클릭 시 호출됩니다)
		function open_detail(id, name, lat, lng, code) {
			console.log(code);
			if(code == "FD6" || code == "CE7"){
				var geocoder = new kakao.maps.services.Geocoder()
			
		    	let coords = new kakao.maps.LatLng(lat, lng)
		   
		    	let callback = function(result, status) {
		        	if (status === kakao.maps.services.Status.OK) {
						window.name = "mapsearch.jsp"
						var url = 'loadRastaurant.jsp?r_num=' + id + "&name=" + name
								+ "&addr=" + result[0].address.address_name
						window.open(url)
		        	}
		    	};	
		    	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback)
			}
			else{
				var url = 'https://place.map.kakao.com/' + id;
	    		window.open(url);
			}
		}
	</script>

	<!--****************카테고리 관련 함수****************-->
	<script>
		var CtMarkers = [], //카테고리 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		//카테고리 장소 검색 객체를 생성합니다
		var Ctps = new kakao.maps.services.Places(map);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 카테고리 검색을 요청하는 함수입니다
		function CtsearchPlaces() {
			if (!currCategory) {
				return;
			}
			// 지도에 표시되고 있는 마커를 제거합니다
			CtremoveMarker();
			Ctps.categorySearch(currCategory, CtplacesSearchCB, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function CtplacesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				CtdisplayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function CtdisplayPlaces(places) {
			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute(
					'data-order');

			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var marker = CtaddMarker(new kakao.maps.LatLng(places[i].y,
						places[i].x), order);
				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						RunCrtOverlay(place, marker.getPosition().getLat(),
								marker.getPosition().getLng());
					});
				})(marker, places[i]);
			}
		}

		//카테고리 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function CtaddMarker(position, order) {
			var imageSrc = 'places_category.v2.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			CtMarkers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function CtremoveMarker() {
			for (var i = 0; i < CtMarkers.length; i++) {
				CtMarkers[i].setMap(null);
			}
			CtMarkers = [];
		}

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;
			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				CtremoveMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				CtsearchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}

		//카테고리용 오버레이 실행
		function RunCrtOverlay(place, lat, lng) {
			CloseOverlay();
			var name = place.place_name, id = place.id;
			const code = place.category_group_code;
			var tmp = '<div class="customOverlay" style="background-color:firebrick;">'
					+ '<div class="Title_customOverlay" onclick="open_detail(&quot;'
					+ id
					+ '&quot;,&quot;'
					+ name
					+ '&quot;,'
					+ lat
					+ ','
					+ lng
					+ ',&quot;'
					+ code
					+ '&quot;)">'
					+ name
					+ '</div>'
					+ '<div class="img_customOverlay" id="img_overlay" onclick="open_detail(&quot;'
					+ id
					+ '&quot;,&quot;'
					+ name
					+ '&quot;,'
					+ lat
					+ ','
					+ lng
					+ ',&quot;'
					+ code
					+ '&quot;)">'
					+ '<img class="img_overlay" alt="IMG" id="img_ct_overlay"></img></div>';
			tmp += '<div class="Btns"><button class="score" id="scoreBtn">★'
					+ '</button>'
					+ '<button onclick="setLike(' + id + ')" class="ABtn" id="likeBtn">즐겨찾기</button><button onclick="CloseOverlay()" class="CBtn">닫기</button></div></div>';

			customOverlay = new kakao.maps.CustomOverlay({
				map : map,
				clickable : true,
				content : tmp,
				position : new kakao.maps.LatLng(place.y, place.x),
				zIndex : 3
			});
			
			$.ajax({ // 이미지, 평점, 즐겨찾기 유무를 가져오기 위함
				url : 'getOv.jsp', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
				mathod : 'post',
				data : {
					r_num : id	// 음식점 id를 넘겨줌
				},
				success : function(data) { //DB접근 후 가져온 데이터
					const json = JSON.parse($.trim(data));
					document.getElementById('scoreBtn').innerText = '★' + json.score;	// 평점 설정
					document.getElementById('img_ct_overlay').src = json.img;	// 이미지 설정
					if(json.like)
						document.getElementById('likeBtn').innerHTML = '<i class="fas fa-star"></i>';
					else
						document.getElementById('likeBtn').innerHTML = '<i class="far fa-star"></i>';
				}
			})
		}
		
		function setLike(id) {
			$.ajax({ // 즐겨찾기 설정을 위함
				url : 'setLike.jsp', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
				mathod : 'post',
				data : {
					r_num : id	// 음식점 id를 넘겨줌
				},
				success : function(data) { //DB접근 후 가져온 데이터
					var like = $.trim(data);
					if(like)
						document.getElementById('likeBtn').innerHTML = '<i class="fas fa-star"></i>';
					else
						document.getElementById('likeBtn').innerHTML = '<i class="far fa-star"></i>';
				}
			})
		}
	</script>
</body>
</html>
