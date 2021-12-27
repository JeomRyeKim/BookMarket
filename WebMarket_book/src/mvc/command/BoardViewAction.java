package mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardViewAction implements Command {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//상세글 페이지 가져오기
			//DB억세스 객체 생성
			BoardDAO dao = BoardDAO.getInstance();
			//파라미터로 넘어온 글 번호와 페이지 번호(리스트로 다시 이동시 해당 페이지 블럭으로 이동처리 위해)
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			//검색조회 파라미터 얻기
			String items =request.getParameter("items");
			String text = request.getParameter("text");
			
			//개별 속성 변수를 묶어서 처리할 DTO 객체 생성
			BoardDTO board = new BoardDTO();//BoardDTO쓰는 이유:개별적인 데이터를 하나로 묶어서 별도의 클래스를 만들어 전달하는게 관리가 쉬움
			//DAO에 상세글번호와 페이지 번호를 넘겨서 DB로부터 얻은 글 정보를 다시 받음.
			board = dao.getBoardByNum(num,pageNum);
			
			//상세 글정보를 상세 페이지로 전달 위해 request에 셋팅
			request.setAttribute("num", num); //글 번호 - autoBoxing(int(기본)타입->Object타입(래퍼객체) 자동형변환)
			request.setAttribute("page", pageNum); //페이지 번호
			request.setAttribute("board", board); //글 정보 - 얘만 받아서 처리 가능(이미 num,pageNum이 들어가 있음)
			request.setAttribute("items", items);//검색 타입
			request.setAttribute("text", text);//검색어
			
		return "/BoardView.do";
	}

}
