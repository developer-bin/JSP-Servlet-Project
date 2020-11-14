package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//각각의 서비스 로직에 대한 인터페이스, 이를 이용해 각각의 서비스 로직 메소드를 구현
public interface Command {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
	
}