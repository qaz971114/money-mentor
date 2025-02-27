<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>예금 리스트</title>
  <link rel ="stylesheet" type="text/css" href="<c:url value='/css/savingForm.css' />">
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
	<script src="<c:url value='/js/depositSearch.js' />"></script>
    <c:import url="/WEB-INF/views/layout/head.jsp" />
   
  </head>
  <body>
    <div class="">
    	<div id="wrap">
    	<c:import url="/WEB-INF/views/layout/top.jsp" />
    		   				
		<!-- 리스트 -->
		<div class="prdList">
			<table>
			 <colgroup>
				<col width="*">
				<col width="30%">
			</colgroup> 
		<tbody>
		<section id="container">
			<div class="contents">
					<fieldset>
						<legend>조회</legend>
						<form id="DepositList">
						<div class="searchbox">
							<ul>
								<li>
									<label for="prdName">상품명</label>
									<input type="text" name="prdName" id="prdName" style="width:800px">
								</li>
								
								<li>
									<p>가입방법</p>
									<div class="radio_list">
									<input type="radio" name="joinway" id="joinway01" checked="checked" value="">
										<label for="joinway01">전체</label>
										<input type="radio" name="joinway" id="joinway02" value="인터넷">
										<label for="joinway02">인터넷</label>
										<input type="radio" name="joinway" id="joinway03" value="스마트폰">
										<label for="joinway03">스마트폰</label>
										<input type="radio" name="joinway" id="joinway04" value="영업점">
										<label for="joinway04">영업점</label>
									</div>
								</li>
								<li>
									<p>가입기간</p>
									<div class="radio_list">
										<input type="radio" name="date" id="date_01" checked="checked">
										<label for="date_01">전체</label>										
										<input type="radio" name="date" id="date_03" value="6">
										<label for="date_03">3~6개월 미만</label>
										<input type="radio" name="date" id="date_04" value="12">
										<label for="date_04">6~12개월 미만</label>
										<input type="radio" name="date" id="date_05" value="24">
										<label for="date_05">12~24개월 미만</label>
										<input type="radio" name="date" id="date_06" value="36">
										<label for="date_06">24개월 이상</label>
									</div>
								</li>
							</ul>

							<!-- button -->
							<div class="btn_set btn_center">
								<div class="btn btn01">
									<input type="submit" value="조회">
								</div>
							</div>							
						</div>
						</form>
					</fieldset>
						
					</div>
					</section>
					</tbody>
						</table>
							</div>
						<div id="searchResultBox">
								
						</div>
						<!-- button -->
						<div class="btn_set btn_center" id="js-btn-wrap">
							<div class="btn btn03">
								<a href="javascript:;" id="load">더보기</a>
							</div>
						</div>
				<c:import url="/WEB-INF/views/layout/footer.jsp" />	
    	</div>
    </div>
  </body>
</html>