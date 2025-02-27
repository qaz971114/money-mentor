package com.spring_boot_momentor.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_momentor.model.InsuVO;
import com.spring_boot_momentor.service.InsuService;

@Controller
public class InsuController {
	@Autowired
	InsuService service;
	
	@RequestMapping("/insu/disease")
    public String insertDiseaseInsu() throws SQLException, IOException {
		// insuCrolling(menuId, insuCtg)
		// insuCtg - 질병, 상해, 자동차, 화재
	  insuCrolling("001", "질병");
      return "index";
    }
	
	@RequestMapping("/insu/accident")
    public String insertAccidentInsu() throws SQLException, IOException {
	  insuCrolling("003", "상해");
      return "index";
    }
	
	@RequestMapping("/insu/driver")
    public String insertDriverInsu() throws SQLException, IOException {
	  insuCrolling("004", "자동차");
      return "index";
    }
	
	@RequestMapping("/insu/fire")
    public String insertFireInsu() throws SQLException, IOException {
	  insuCrolling("008", "화재");
      return "index";
    }
	
	// ctglist
	// 0 : 질병, 1 : 상해, 2 : 자동차, 4 : 화재
	public void insuCrolling(String pageNum, String ctg) throws SQLException, IOException {
		try {
			String URL = "https://www.e-insmarket.or.kr/guaranteeIns/guaranteeInsList.knia?menuId=C" + pageNum + "";
			//카드 페이지 받아옴
			Document doc = Jsoup.connect(URL).get();
			Elements page = doc.getElementsByClass("paginate");
			//다음페이지로 가기와 이전페이지로 가기 버튼을 제외하고(-2) 현재페이지(a가 아닌 strong 태그로 바뀜)를 더한 (+1) 버튼 수 계산
			int pageSize = page.select("a").size() - 1;

			String prdName = "";
			String prdLogo = "";
			String insuName = "";
			String insuCtg = ctg;
			String insuDes = "";
			String insuPrice = "";
			int male = 0;
			int female = 0;
			float insuIndex = 0;
			String age = "";
			String insuNote = "";
			String insuJoinURL = "";
			String insuPhoneNumber = "";

			int i = 1;
			
			
			//페이지별로 크롤링
			for(int nowPage = 1; nowPage <= pageSize; nowPage++) {
				URL = "https://www.e-insmarket.or.kr/guaranteeIns/guaranteeInsList.knia?menuId=C" + pageNum +"&page=" + nowPage + "";
				doc = Jsoup.connect(URL).get();
			    InsuVO vo = new InsuVO();
			    
				Elements insuList = doc.select("tr");
				
				for(int index = 1; index < insuList.size(); index++) {
					insuPrice = "";
					insuDes = "";
					
					Element insuDetail = insuList.get(index);
					prdName = insuDetail.getElementsByClass("comp_logo").select("img").attr("alt");
					prdLogo = insuDetail.getElementsByClass("comp_logo").select("img").attr("src");
					for(char ch = 'A'; ch <= 'Z'; ch++) {
						if(prdLogo.indexOf(ch) != -1) {
							prdLogo = prdLogo.substring(prdLogo.indexOf(ch));
							prdLogo = "https://www.e-insmarket.or.kr/img/company/" + prdLogo;
						} 
					}
					
					insuName = insuDetail.select("p").get(0).text();
					
					Elements items = insuDetail.getElementsByClass("item_list").select("li");
					int itemsSize = items.size();
					
					//보장명과 보장 금액 받아오기 위해 보장명이 얼마나 있는지 받아옴
					for(int itemIdx = 0; itemIdx < itemsSize; itemIdx++) {
						Element item = items.get(itemIdx);
						insuDes += item.getElementsByClass("kind").text() + "#";
						insuPrice += item.getElementsByClass("cost").text() + "#";
					}

					//남여 안 나눠져있어서 같은 값으로 저장
					String price = insuDetail.getElementsByClass("total_cost").text();
					price = price.replace(",", "");
					male = Integer.parseInt(price); 
					female = male; 
					
					//보험 가격 지수
					if(!(insuDetail.getElementsByClass("num").text().equals("")))
						insuIndex = Float.parseFloat(insuDetail.getElementsByClass("num").text());
					
					//나이 
					age = insuDetail.select("td").get(4).text();
					
					insuNote = insuDetail.select("td").get(6).select("span").get(0).html();
					insuJoinURL = insuDetail.select("td").get(7).select("span").get(1).select("button").attr("data-url");

					
					i++;
					
					vo.setAge(age);
					vo.setFemale(female);
					vo.setInsuCtg(insuCtg);
					vo.setInsuDes(insuDes);
					vo.setInsuIndex(insuIndex);
					vo.setInsuName(insuName);
					vo.setInsuNote(insuNote);
					vo.setInsuPhoneNumber(insuPhoneNumber);
					vo.setInsuPrice(insuPrice);
					vo.setInsuJoinURL(insuJoinURL);
					vo.setMale(male);
					vo.setPrdLogo(prdLogo);
					vo.setPrdName(prdName);
					service.insertInsu(vo);
					
				}

			}
			

			System.out.println("success");
		}
		catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
