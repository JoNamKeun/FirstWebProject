package org.diary.moon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.diary.moon.board.service.BoardService;
import org.diary.moon.board.service.MemberService;
import org.diary.moon.dto.BoardDTO;
import org.diary.moon.paging.BoardPaggingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

	private BoardService boardService;
	private MemberService memberService;
	
	public MainController(BoardService boardService, MemberService memberService) {
		this.boardService = boardService;
		this.memberService = memberService;
	}

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	                                                                               
	@RequestMapping("/main.do")
	public String boardList() {
		
		System.out.println("main.do : 진입");
		
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		List<BoardDTO> list = boardService.selectBoardList(page);
		request.setAttribute("list", list);
		//페이징 데이터 셋팅
		int count = boardService.selectAllCount();
		
		BoardPaggingVO vo = new BoardPaggingVO(count, page, 7, 4);
		request.setAttribute("pagging", vo);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle());
		}
		
		return "main";
	}
	
	
	
}
