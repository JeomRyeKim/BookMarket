package mvc.command_old;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
