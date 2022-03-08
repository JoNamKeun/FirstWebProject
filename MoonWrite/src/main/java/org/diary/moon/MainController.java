package org.diary.moon;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.diary.moon.board.service.BoardService;
import org.diary.moon.board.service.CommentService;
import org.diary.moon.board.service.MemberService;
import org.diary.moon.dto.BoardDTO;
import org.diary.moon.dto.CommentDTO;
import org.diary.moon.dto.MemberDTO;
import org.diary.moon.paging.BoardPaggingVO;
import org.json.JSONObject;
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
	
	@RequestMapping("main.do")
	public String main() {
		return "main";
	}

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	// 메인
	@RequestMapping("/myDiary.do")
	public String boardList(HttpSession session) {
		
		// admin 계정
		List<MemberDTO> one = memberService.selectOne();

		for (int i = 0; i < one.size(); i++) {
			System.out.println(one.get(i).getM_id());
		}

		// admin 계정 세션 저장
		// HttpSession session = null;
		// session.setAttribute("admin", one);
		
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();

//		String b_writer = "mdalli"; // 임시로 DB에 있는 계정 불러온 변수
		
		List<BoardDTO> writer = boardService.selectList(b_writer);
		List<CommentDTO> c_list = commentService.selectCommentList(b_writer);
		// 작성한 게시글 리스트(하나의 계정)

		writer = regDay(writer);

		request.setAttribute("writer", writer);

		// 페이지 변수 초기값
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// List<BoardDTO> list = boardService.selectBoardList(page);
		// request.setAttribute("list", list);
		// 페이징 데이터 셋팅
		int b_count = boardService.selectAllCount(b_writer); // 내가 쓴 글 갯수
		int c_count = c_list.size();
		request.setAttribute("b_count", b_count);
		request.setAttribute("c_count", c_count);
		session.setAttribute("b_writer", b_writer);
		request.setAttribute("board", writer);
		BoardPaggingVO vo = new BoardPaggingVO(b_count, page, 7, 4);
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

	// 작성한 댓글 목록 뷰 매핑
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
		int b_count = boardService.selectAllCount(b_writer);
		int c_count = c_list.size();

		BoardPaggingVO vo = new BoardPaggingVO(b_count, page, 7, 4);

		request.setAttribute("b_count", b_count);
		request.setAttribute("c_count", c_count);
		request.setAttribute("pagging", vo);
		request.setAttribute("c_list", c_list);
		return "comment_view";
	}

	// 게시글 작성 폼 이동 매핑
	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "board_write";
	}

	// 게시글 작성 매핑
	@RequestMapping("/write.do")
	public String write(HttpSession session) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String book_name = request.getParameter("book_name");
		String chk_info = request.getParameter("chk_info");
		String chk_secret = request.getParameter("chk_secret");
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();

		System.out.println(title + " " + content + " " + chk_info + " " + chk_secret + b_writer);
		if(chk_info.equals("book")) {
			chk_info = "b";
		} else {
			chk_info = "d";
		}
		
		if(chk_secret.equals("open")) {
			chk_secret = "o";
		}else {
			chk_secret = "s";
		}
		System.out.println(chk_info);
		boardService.insertBoard(new BoardDTO(title, content, chk_info, chk_secret, book_name, b_writer));

		return "my_diary";
	}

	// 회원가입 매핑
	@RequestMapping("join.do")
	public String join() {
		return "member_join";
	}

	@RequestMapping("boardView.do")
	public String boardView(int bno, HttpSession session) {
		
		return "board_view";
	}
	
	@RequestMapping("/boardLike.do")
	public String boardLike(int bno, String id,  HttpServletResponse response) throws IOException {
		
		//공감 하트를 눌렀을 때 ajax 를 타고 bno와 session-id 값을 가지고 넘어옵니다.
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("m_id", id);
		
		
		//공감 테이블에 m_id 와 bno 를 insert 할 때, 만약 이 정보가 공감테이블에 있다면
		//SQL Exception이 발생됩니다. (pk제약조건 충돌)
		//때문에 예외처리를 하고 catch 영역에서 그 정보를 지우는 방식으로 원클릭 공감/비공감 을 구현했습니다.
		int count = 0;
		try {
			count = boardService.insertBoardLike(map);
		}catch (Exception e) {
			//여기 들어왔다는건 공감테이블에 id+bno 정보가 이미 있다는 것!! (공감버튼을 눌렀다는 얘기)
			boardService.deleteBoardLike(map);
		}
		
		//json 객체에 공감인지 비공감인지 여부(result), 공감 갯수 셋팅
		JSONObject obj = new JSONObject();
		obj.put("result", count);
		obj.put("count", boardService.selectBoardLikeCount(bno));
		
		response.getWriter().write(obj.toString());
		
		return null;
		
	}


	// index에서 로그인 버튼 눌렀을 때, 로그인 화면으로 이동하는 메서드
	@RequestMapping("/loginView.do")
	public String loginView() {
		return "login";
	}

	// 실제 로그인을 하는 메서드
	@RequestMapping("/login.do")
	public String login(HttpSession session, String id, String password, HttpServletResponse response)
			throws IOException {

		// 로그인 실패시 알림창 띄울 때를 위해 utf-8 지정. 없으면 ?????????? 이렇게 나와요.
		response.setContentType("text/html; charset=UTF-8");

		// 로그인 요청 정보를 myBatis 에게 보내기 위한 map 선언
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);

		// 로그인 정보로 select 해온 member 정보를 dto로 치환.
		MemberDTO dto = memberService.login(map);

		// 만약 dto 가 null이면 로그인 실패
		if (dto == null) {
			response.getWriter().write("<script>alert('아이디와 비밀번호를 확인하세요!!'); history.back();</script>");
			return null;
		} else {
			// 로그인 성공 시 세션에 로그인 유저 정보 저장하고 main.do 로 이동. 서버간 이동은 redirect 로 !!
			session.setAttribute("member", dto);
			return "redirect:main.do";
		}

	}
	
	@RequestMapping("logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
