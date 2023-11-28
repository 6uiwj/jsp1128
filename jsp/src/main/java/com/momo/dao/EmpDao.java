package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnPool;
import com.momo.dto.EmpDto;

/*
 * 데이터베이스에 접근해서 데이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * Dao(구식)
 *     -> mapper(Mybatis)
 */
public class EmpDao extends DBConnPool {
	/**
	 * 생성자를 이용하여 Connection 객체를 생성 후
	 * 멤버변수만 con에 저장합니다.
	 * @param application
	 */
//	public EmpDao(ServletContext application) {
//		super(application);
//	}
	
	
	/* 데이터 베이스에 접근
	 * 데이터베이스로부터 사원의 목록을 조회하여 반환합니다.
	 * 질의 결과를 resultset에 담고 
	 * 반환하기 위해서 dto -> 리스트에 담아줍니다.
	 */
	
	public List<EmpDto> getList() {
		List<EmpDto> list = new ArrayList<>();
		try {
			stmt = con.createStatement();
			String sql = "SELECT * FROM EMPLOYEE";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			//콘솔에 출력하던 데이터를 화면에 출력하기 위해서 저장된 값을 반환
			EmpDto dto = new EmpDto();
			dto.setEmp_id(rs.getString(1));
			dto.setEmp_name(rs.getString(2));
			dto.setEmp_no(rs.getString(3));
			//System.out.print(rs.getString(1));
			//System.out.print(rs.getString(2));
			//System.out.print(rs.getString(3));
			//System.out.println();
			
			list.add(dto);
			}
			close();

		} catch (SQLException e) {
			System.out.println("SQLException 예외사항 발생");
			e.printStackTrace();
		}
		
		return list;
	}

	public static void main(String[] args) {
		//EmpDao empDao = new EmpDao();
		//empDao.getList();
	}
}


