package com.momo.el;

public class MyElClass {
	public String gender= "str";
	/**
	 * 주민등록번호를 입력받아서 성별을 변환
	 * 
	 * @param jumin
	 * @return 성별(남,여)
	 */
	public String getGender(String jumin) {
		String gender = "";
		if ("1".equals(jumin.substring(7, 8)) || "3".equals(jumin.substring(7, 8))) {
			gender = "남자";
		} else if ("2".equals(jumin.substring(7, 8)) || "4".equals(jumin.substring(7, 8))) {
			gender = "여자";
		} else {
			gender = "주민등록번호를 확인해 주세요";
		}
		return gender;
	}

	public String getGender2(String jumin) {
		String gender = "";
		int startIndex = ((jumin.indexOf("-") + 1));
		String sex = jumin.substring(startIndex, startIndex + 1);

		if ("1".equals(sex) || "3".equals(sex)) {
			gender = "남자";
		} else if ("2".equals(sex) || "4".equals(sex)) {
			gender = "여자";
		} else {
			System.out.println("주민등록번호를 확인해주세요.");
			gender="주민등록번호를 확인해주세요";
		}
		return gender;

	}

	public static void main(String[] args) {
		MyElClass myClass = new MyElClass();
		String jumin = "950607-5111111";
		//String test = myClass.getGender("000000-0000000");
		System.out.println(myClass.getGender("000000-0000000"));
		System.out.println(myClass.getGender("000000-1000000"));
		System.out.println(myClass.getGender("000000-2000000"));
		System.out.println(myClass.getGender("000000-3000000"));
		System.out.println(myClass.getGender("000000-4000000"));
		System.out.println(myClass.getGender("000000-5000000"));
		System.out.println("-------------------");

		//String test1 = myClass.getGender2("000000-0000000");
		System.out.println(myClass.getGender2("000000-0000000"));
		System.out.println(myClass.getGender2("000000-1000000"));
		System.out.println(myClass.getGender2("000000-2000000"));
		System.out.println(myClass.getGender2("000000-3000000"));
		System.out.println(myClass.getGender2("000000-4000000"));
		System.out.println(myClass.getGender2("000000-5000000"));
		System.out.println(myClass.getGender2("000000-0000000"));


	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}
