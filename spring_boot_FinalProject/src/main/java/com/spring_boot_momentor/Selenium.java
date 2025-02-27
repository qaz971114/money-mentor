package com.spring_boot_momentor;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class Selenium {
	private WebDriver driver;

	private static final String url = "https://yourei.jp/腕を磨く";

	public void process() {
		System.setProperty("webdriver.chrome.driver",
				"C:\\Program Files\\Google\\Chrome\\ChromeDriver\\chromedriver.exe");
		// 크롬 드라이버 셋팅 (드라이버 설치한 경로 입력)

		driver = new ChromeDriver();
		// 브라우저 선택

		try {
			getDataList();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		driver.close(); // 탭 닫기
		driver.quit(); // 브라우저 닫기
	}

	// 데이터 가져오기
	private List<String> getDataList() throws InterruptedException {
		List<String> list = new ArrayList<>();

		driver.get(url); // 브라우저에서 url로 이동한다.
		Thread.sleep(1000); // 브라우저 로딩될 때까지 잠시 기다린다.

		List<WebElement> elements = driver.findElements(By.cssSelector("#sentence-example-list .sentence-list li"));
		for (WebElement element : elements) {
			System.out.println("----------------------------");
			System.out.println(element);
		}

		return list;
	}

}
