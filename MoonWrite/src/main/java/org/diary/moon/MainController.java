package org.diary.moon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.diary.moon.board.service.BoardService;
import org.diary.moon.board.service.CommentService;
import org.diary.moon.board.service.MemberService;
import org.diary.moon.dto.BoardDTO;
import org.diary.moon.dto.CommentDTO;
import org.diary.moon.dto.MemberDTO;
import org.diary.moon.paging.BoardPaggingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	private BoardService boardService;
	private MemberService memberService;
	private CommentService commentService;

	public MainController(BoardService boardService, MemberService memberService, CommentService commentService) {
		this.boardService = boardService;
		this.memberService = memberService;
		this.commentService = commentService;
	}

	@Autowired
	HttpServletRequest request;

	@RequestMapping("/")
	public String main() {
		return "index";
	}

	//메인
	@RequestMapping("/myDiary.do")
	public String boardList() {

		// admin 계정
		List<MemberDTO> one = memberService.selectOne();

		for (int i = 0; i < one.size(); i++) {
			System.out.println(one.get(i).getM_id());
		}

		// admin 계정 세션 저장
		// HttpSession session = null;
		// session.setAttribute("admin", one);

		String b_writer = "mdalli";
		List<BoardDTO> writer = boardService.selectList(b_writer);

		writer = regDay(writer);

		request.setAttribute("writer", writer);

		// 페이지 변수 초기값
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		List<BoardDTO> list = boardService.selectBoardList(page);
		request.setAttribute("list", list);
		// 페이징 데이터 셋팅
		int count = boardService.selectAllCount(b_writer);

		BoardPaggingVO vo = new BoardPaggingVO(count, page, 7, 4);
		request.setAttribute("pagging", vo);

		return "my_diary";
	}

	// data 시간부분 짤라주는 메서드
	public List<BoardDTO> regDay(List<BoardDTO> list) {
		String[] regDay = new String[list.size()];

		for (int i = 0; i < list.size(); i++) {
			regDay[i] = list.get(i).getRegist_day().split(" ")[0];
			list.get(i).setRegist_day(regDay[i]);
		}
		return list;
	}

	//작성한 댓글 목록 뷰 매핑
	@RequestMapping("/viewComment.do")
	public String viewComent() {
		String b_writer = "mdalli";
		List<CommentDTO> c_list = commentService.selectCommentList(b_writer);
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		List<BoardDTO> list = boardService.selectBoardList(page);
		request.setAttribute("list", list);
		// 페이징 데이터 셋팅
		int count = boardService.selectAllCount(b_writer);

		BoardPaggingVO vo = new BoardPaggingVO(count, page, 7, 4);
		request.setAttribute("pagging", vo);
		request.setAttribute("c_list", c_list);
		return "comment_view";
	}

	//게시글 작성 폼 이동 매핑
	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "board_write";
	}

	//게시글 작성 매핑
	@RequestMapping("/write.do")
	public String write() {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String chk_info = request.getParameter("chk_info");
		String chk_secret = request.getParameter("chk_secret");

		System.out.println(title + " " + content + " " + chk_info + " " + chk_secret);
//		boardService.insertBoard(new BoardDTO());
		
		return "redirect:my_diary";
	}

	//회원가입 매핑
	@RequestMapping("join.do")
	public String join() {
		return "member_join";
	}

	//로그인 매핑
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}

}
