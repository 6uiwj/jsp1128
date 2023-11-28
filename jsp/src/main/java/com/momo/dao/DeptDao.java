package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.DeptDto;

public class DeptDao extends DBConnection {

	//생성자를 통해서  Connection객체를 생성 후 멤버변수 con에 저장
	public DeptDao(ServletContext application) {
		//application으로부터 데이터베이스 접속 정보를 꺼내옵니다.
		super(application);
	}
	
	public List<DeptDto> getList() {
	List<DeptDto> list = new ArrayList<>();
	
	 try {
		stmt = con.createStatement();
		String sql = "select * from department d, location l where d.location_id = l.local_code";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			DeptDto deptDto = new DeptDto();
			deptDto.setDept_id(rs.getString(1));
			deptDto.setDept_title(rs.getString(2));
			deptDto.setLocation_id(rs.getString(3));
			deptDto.setLocal_code(rs.getString(4));
			deptDto.setNational_code(rs.getString(5));
			deptDto.setLocal_name(rs.getString(6));

			list.add(deptDto);
		
			 
		}
	} catch (SQLException e) {
		System.out.println("SQLException 예외 발생");
		e.printStackTrace();
	}
	
	 return list;
		

	}
	
	public static void main(String[] args) {
		
	}
}
