package com.momo.dto;

public class PageDto {
	//페이지 블럭을 그리기 위해 필요한 정보
	int startNo; //페이지 블럭 시작번호
	int endNo;	//페이지 블럭 끝번호
	int realEndNo; //게시물의 끝 페이지 번호 -> 총 게시물의 수 / 페이지 당 게시물의 수
	boolean prev, next; //이전, 다음 버튼(true: 보여주기)
	
	//위의 값들을 세팅하기 위해 필요한 값
	int totalCnt;	//총 게시물의 수
	Criteria cri;	//요청 페이지번호, 페이지 당 게시물 수
	int blockAmount = 10;	//페이지블럭에 보여 줄 페이지 수
	
	/**
	 * 
	 * 생성자를 통해 페이지블럭을 그리기 위한 정보를 세팅합니다.
	 * @param totalCnt
	 * @param cri
	 * @param blockAmount
	 */
	public PageDto(int totalCnt, Criteria cri, String blockAmount) {
		//생성자 호출
		this(totalCnt, cri);
		
		if(blockAmount != null 
				&& !"".equals(blockAmount)) {
			this.blockAmount = Integer.parseInt(blockAmount);
			System.out.println("pageDto - 너여기서도 조졌어");
		}
	}
	
	
	public PageDto(int totalCnt, Criteria cri) {
		super();
		this.totalCnt = totalCnt;
		this.cri = cri;

		//페이지 블럭의 끝번호를 구합니다.
		//요청 페이지, 블럭 당 페이지 수에 따라서 블럭의 범위가 정해집니다.
		//1-10, 11-20, 21-30...
		//ex) 현재페이지 7, 블럭당 페이지수 10 ->  올림(7/10.0) = 1 -> 첫번째 블럭
		// 보여줄 블럭의 끝번호 : 위에서구한 블럭(1) * blockAmount = 10
		//페이지 블럭의 시작 번호, 끝번호
		endNo = (int)Math.ceil(cri.getPageNo()/(blockAmount*1.0)) * blockAmount;
		System.out.println("PageDto에서 실행 - endNo =========" + endNo);
		startNo = endNo - (blockAmount - 1);
		
		//페이지 끝번호
		realEndNo = (int)Math.ceil((totalCnt*1.0)/cri.getAmount());
		
		//게시물이 67건인 경우
		//페이지 진짜 끝번호는 7인데 블럭의 끝번호는 10입니다.
		endNo = endNo > realEndNo? realEndNo : endNo;
		
		//앞으로 가기 버튼, 뒤로가기 버튼 설정
		prev = startNo == 1 ? false : true;
		next = endNo == realEndNo ? false : true;
		
		System.out.println("시작번호 : " + startNo);
		System.out.println("끝번호 : " + endNo);
		System.out.println("진짜끝번호 : " + realEndNo);
		System.out.println("prev : " + prev);
		System.out.println("next : " + next);
		System.out.println("==============================");
		System.out.println("요청페이지 번호 : " + cri.getPageNo());
		System.out.println("페이지당 개시물 수: " + cri.getAmount());
		System.out.println("총게시물 수 "+totalCnt +" PageDto Clear");

	}


	public int getStartNo() {
		return startNo;
	}


	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}


	public int getEndNo() {
		return endNo;
	}


	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}


	public int getRealEndNo() {
		return realEndNo;
	}


	public void setRealEndNo(int realEndNo) {
		this.realEndNo = realEndNo;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getTotalCnt() {
		return totalCnt;
	}


	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}


	public Criteria getCri() {
		return cri;
	}


	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
}
