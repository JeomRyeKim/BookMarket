package mvc.command_old;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model_old.BoardDAO_old;

public class BoardView implements Command {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//게시글 조회수 증가 처리
			int num = Integer.parseInt(request.getParameter("num"));
			//DB억세서 객체 생성
			BoardDAO_old dao = BoardDAO_old.getInstance();
			dao.updateHit(num);
			
		return "./board/view.jsp";
	}

}
