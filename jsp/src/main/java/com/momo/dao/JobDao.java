package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.Job;

/**
 * Dao
 * 데이터 액세스 객체(Data Access Object)
 * 데이터베이스와의 상호작용을 관리하고 데이터베이스에서 데이터를 읽고 쓰는 데 사용
 * 
 * Dto(Data Transfer Obiect)
 * 데이터 전송 객체: 데이터를 담는 그릇
 */

public class JobDao extends DBConnection {
	//설정파일로부터 DB정보를 읽어올 수 있도록
	public JobDao(ServletContext application) {
		//부모의 생성자 호출
		super(application);
	}
	
	/*
	 * job 테이블의 내용을 조회 후 리스트에 담아서 반환
	 */
	//리스트를 조회해주는 getList 메서드 만들기
	public List<Job> getList() {
		List<Job> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select* from job");
			while(rs.next()) {
				Job job = new Job();
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				
				list.add(job);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}
	
	
}
