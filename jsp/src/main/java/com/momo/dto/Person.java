package com.momo.dto;

public class Person {
	private String name;
	private int age;
	
	//생성자 생성
	
	public Person() {}
	
	@Override
	public String toString() {
		return  age + "/" + name;
	}
	
	public Person(String name, int age) {
		this.name= name;
		this.age=age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
