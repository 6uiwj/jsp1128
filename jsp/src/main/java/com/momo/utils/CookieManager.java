package com.momo.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {
	}
	
//객체를 생성하지 않고 사용햊기 위해 static 선언
	/**
	 * 쿠키를 만드는 메서드 - 쿠키를 생성 후 응답 객체에 저장
	 * 쿠키를 생성하기 위해 필요한 값
	 * 필요 매개변수: 쿠키 이름, 쿠키값, 시간, 
	 * 사용자에게 응답하기 위해서 - 응답객체를 매개변수로 전달받는다.
	 *  
	 * */
	public static void makeCookie(HttpServletResponse response, String name,
									String value, int time) {
		// 쿠키 생성
		Cookie cookie = new Cookie(name,value);
		// 유지기간 설정
		cookie.setMaxAge(time);
		// 응답객체에 추가
		response.addCookie(cookie);
	}
	
	/**
	 * 요청 객체로부터 쿠키배열을 가지고 온 뒤 원하는 쿠키이름를 찾아서 쿠키값을 반환
	 * @return
	 */
	public static String readCookie(HttpServletRequest request, String name) {
		String value = "";
		//request 객체로부터 쿠키의 배열을 가지고 오기.
		Cookie[] cookies = request.getCookies();
		
		//브라우저를 통해 처음 접근했을 때
		//쿠키가 하나도 저장되어 있지 않은 경우
		if(cookies != null) {
		//쿠키 배열을 돌면서 쿠키이름이 일치하는 객체가 있는지 확인
			for(Cookie cookie : cookies) {		
				if(cookie.getName().equals(name)) {
					value= cookie.getValue();
					break;
				}
			}
		}
		return value;
	}
	//쿠키 삭제하기
	public static void deleteCookie(HttpServletResponse response, String name) {
		makeCookie(response, name, "", 0);
	}
	
}
