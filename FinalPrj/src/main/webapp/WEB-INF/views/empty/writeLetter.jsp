<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Resizable - Default functionality</title>
<link rel="stylesheet" href="resources/template/assets/css/core.css">
<style>

@font-face {
    font-family: 'Dolbomche_R';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/Dolbomche_R.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	background-image:
		url(${pageContext.request.contextPath}/resources/template/assets/img/letter/postcard.png);
	background-repeat: no-repeat;
	font-family:'Dolbomche_R';
}

.wrap {
	width: 830px;
	height: 550px;
}

.contents {
	position: absolute;
	top: 80px;
	left: 30px;
	width: 800px;
	height: 450px;
}

.bold {
	font-size: 24px;
	font-weight: 600;
	padding: 10px 0px 10px 5px;
}

.letter {
	margin: 0px;
	width: 780px;
	height: 331px;
	resize: none;
	overflow: auto;
	border: 0;
	background-color: transparent;
	outline: none;
	font-family:'Dolbomche_R';
	font-size: 16px;
	padding: 10px;
}

.left { float:left; }
.right { float:right; margin-right:20px;}
.button { font-size: 1rem }

</style>
</head>
<body>
	<div class="wrap">
		<div class="contents">
			<div class="bold"><span>To.누구에게</span></div>
			<div>
				<textarea class="letter">이데일리 박철근 김정현 기자] 정부가 국산 코로나19 백신을 내년 상반기까지 개발하겠다는 청사진을 제시했다. 2025년까지 세계 5대 백신강국으로 발돋움하기 위해 2025년까지 2조2000억원을 투입한다는 계획이다. 전문가들은 그러나 백신개발의 핵심인 mRNA(전령리보핵산) 개발에는 상당기간이 필요한 만큼 정부의 공언이 현실화될지는 미지수라고 지적한다.

정부는 5일 청와대, 정부 서울·세종청사 등에서 문재인 대통령 주재로 ‘K-글로벌 백신허브화 비전 및 전략’ 보고대회를 열고 이같은 내용을 발표했다.

정부 전략의 핵심은 △국산 코로나19 백신 신속개발 △글로벌 생산협력 강화 △글로벌 백신 허브 기반 구축 △차세대 백신 개발 지원 △백신산업 생태계 조성 등이다.


문 대통령은 “백신을 반도체, 배터리와 함께 ‘3대 국가전략기술’분야로 선정해 앞으로 5년간 2조2000억원을 투입할 계획”이라며 “연구개발과 시설투자에 대한 세제지원을 확대하고 필수 소재·부품·장비의 생산 및 기술을 자급화해 국내기업의 생산역량을 극대화할 수 있도록 하겠다”고 말했다. 이와 함께 현재 한미간 추진하고 있는 글로벌 백신 파트너십 외에 독일과 영국 등과도 백신 파트너십을 강화할 예정이다.

특히 백신 수급에 대한 논란을 벗어나기 위해 내년 상반기까지 국산 1호 백신의 상용화를 지원한다. 아울러 차세대 백신인 mRNA백신 개발을 위해 원부자재 국산화뿐만 아니라 특허분석 지원 등 다방면으로 지원한다는 방침이다.

전문가들은 국산 코로나19 백신의 활용성을 담보하기 어렵다고 지적했다.

천은미 이대목동병원 호흡기내과 교수는 “국산 1호 백신이 어느 정도 효과가 있을지 부작용이 있을지 검증이 어렵다”며 “이 때문에 국내 회사가 개발하고 있는 단백질 재조합 백신은 유럽이나 미국에서 승인이 어려울 수 있어 국내용으로 생각해야 한다”고 말했다.</textarea>
			</div>
			<div class="bold">
				<div class="left"><span>From.답장</span></div>	
				<div class="right">
					<button class="button">임시저장</button>
					<button class="button is-solid primary-button raised">편지 보내기</button>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>