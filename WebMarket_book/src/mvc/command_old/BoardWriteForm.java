package mvc.command_old;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model_old.BoardDAO_old;

public class BoardWriteForm implements Command {
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션으로부터 로그인 아이디 얻기
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		//로그인 아이디가 없으면 로그인 페이지로 이동 처리
		if(sessionId==null || "".equals(sessionId)) {
			response.sendRedirect("./member/loginMember.jsp");
			return null;
		}
		//로그인 후 게시글 등록 페이지로 이동했는지, 로그인 한 작성자 이름 얻기
		requestLoginName(request);
		return "./board/writeForm.jsp";
	}
	
	//인증된 사용자명 얻기
	private void requestLoginName(HttpServletRequest request) {
		//파라미터로 넘어온 request의 id에 해당하는 값 얻기
		String id = request.getParameter("id");
		
		//DB에서 id에 해당하는 name정보 얻기
		BoardDAO_old dao = BoardDAO_old.getInstance();
		//id에 해당하는 name얻기 메소드
		String name = dao.getLoginNameById(id); //getLoginNameById()는 없는 메소드, 사용자가 만든 것
		
		request.setAttribute("name", name);
	}

}
