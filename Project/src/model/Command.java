package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//������ ���� ������ ���� �������̽�, �̸� �̿��� ������ ���� ���� �޼ҵ带 ����
public interface Command {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
	
}