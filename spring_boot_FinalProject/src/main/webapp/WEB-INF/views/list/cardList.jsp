<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드비교</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/List.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/List_out.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/more.css'/>">
<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
<script src="<c:url value='/js/more.js' />"></script>
<script src="<c:url value='/js/cardSearch.js' />"></script>
<script src="<c:url value='/js/none.js' />"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/popup.css'/>">
<script src="<c:url value='/js/popup.js'/>"></script>
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section class="cardSec">
	<div class="filters">
		<div class="table">
			<div class="category">
				<form id="CardList">
					<div class="search ">
						<input id="cardId" type="text" name="keyword"
							class="input-search-word" placeholder="카드이름을 입력해주세요."> <img
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
							id="sreachimg">

					</div>

				</form>
			</div>


			<div class="category">
				<h5 class="title">카드사</h5>
				<div class="btncontainer">
					<button class="item" type="button">
						<span class="cardbtnImg"><img class="iogo" alt="국민카드"
							src="/image/KB.png"></span>
					</button>
					<button class="item" type="button">
						<span class="cardbtnImg"><img class="iogo" alt="현대카드"
							src="/image/HD.png"></span>
					</button>
				</div>
			</div>
			<div class="category">
				<h5 class="title">혜택</h5>
				<div class="btncontainer">
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">주유</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">통신</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">쇼핑</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">외식</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">자동차</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">의류</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">게임</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">보험</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">OTT</span>
					</button>
					<!-- 더 추가가능 -->
				</div>

			</div>

			<div class="category">
				<h5 class="title">연회비</h5>
				<div class="btncontainer">
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">전체</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">~1만원</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">~3만원</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">~10만원</span>
					</button>
					<button class="item" type="button">
						<span class="w-btn w-btn-indigo">10만원 이상</span>
					</button>
				</div>
			</div>


		</div>
	</div>
	<!-- cardSearchResultView -->
	<div id="searchResultBox"></div>


	<div class="comp_prod_selector" style="display: none" id='btn1'>
		<!-- compsel_head -->
		<div class="compsel_head compsel_show">
			<h4 class="compsel_title">
				상품비교<span class="comp_num"></span>
			</h4>
			<!-- head_opt -->
			<div class="head_opt">
				<button type="button" onclick="productCompare.close();"
					class="btn_layer_toggle">닫기</button>
			</div>
			<!-- //head_opt -->
		</div>
		<!-- //compsel_head -->

		<!-- compsel_body -->
		<div class="compsel_body" style="">

			<!-- compsel_prods -->
			<div class="compsel_prods">
				<!-- 안에 li 개수에 따라 ul.prod_list의 너비 값을 주어야 함 (li개수 x 140) li 개수 최대 10개 -->
				<ul class="prod_list" style="width: 280px;">
					<!-- none.js append 내부 데이터 들어옴 -->


				</ul>
			</div>
			<!-- //compsel_prods -->

			<!-- compsel_opt_area -->
			<div class="compsel_opt_area">
				<div class="opt_select">

					<button type="button" class="btn_compsel">
						<input type="checkbox" id="allCheck" name="allCheck"
							class="allCheck">전체선택/해제
					</button>
					<button type="button" class="btn_compsel" id="deleteCardBtn">선택상품
						삭제</button>
					<button type="button" class="btn_compsel sel_prod_comp"
						onclick="productCompare1()">상품비교</button>
				</div>
				<!-- //opt_select -->
				<!-- opt_delete -->
				<div class="opt_delete"></div>
				<!-- //opt_delete -->
			</div>
			<!-- //compsel_opt_area -->
		</div>
		<!-- //compsel_body -->
	</div>


	<!-- 상품 선택 모달 창 -->
	<div class="container">
		<div class="popup-wrap" id="popup" style="display: none">
			<!-- style="display: none" -->
			<div class="popup">
				<div class="popup-head">
					<span class="head-title">선택 상품 비교</span>
				</div>
				<div class="popup-body">
					<div class="body-content">

						<div class="body-contentbox"></div>
					</div>
				</div>
				<div class="popup-foot">
					<span class="pop-btn confirm" id="confirm">확인</span> <span
						class="pop-btn close" id="close">창 닫기</span>
				</div>
			</div>
		</div>
	</div>
	</section>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
