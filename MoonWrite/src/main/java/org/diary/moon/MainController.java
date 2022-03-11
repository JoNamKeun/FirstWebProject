package org.diary.moon;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
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
import org.json.JSONArray;
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

		if (session.getAttribute("member") == null)
			return "redirect:/";
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();

//		String b_writer = "mdalli"; // 임시로 DB에 있는 계정 불러온 변수

		List<BoardDTO> writer = boardService.selectList(b_writer);
		List<CommentDTO> c_list = commentService.selectCommentList(b_writer);
		// 작성한 게시글 리스트(하나의 계정)

//		writer = regDay(writer);

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

		for (int i = 0; i < writer.size(); i++) {
			System.out.println(writer.get(i).toString());
		}

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
	public String viewComent(HttpSession session) {

		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();
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
		String b_kind = request.getParameter("chk_info");
		String b_secret = request.getParameter("chk_secret");
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();
		String m_name = request.getParameter("m_name");

		System.out.println(title + " " + content + " " + b_kind + " " + b_secret + b_writer);
		if (b_kind.equals("book")) {
			b_kind = "b";
		} else {
			b_kind = "d";
		}

		if (b_secret.equals("open")) {
			b_secret = "o";
		} else {
			b_secret = "s";
		}
		System.out.println(b_kind);
		boardService.insertBoard(new BoardDTO(title, content, b_kind, b_secret, book_name, b_writer));

		return "redirect:myDiary.do";
	}

	// 회원가입 매핑
	@RequestMapping("join.do")
	public String join() {
		return "member_join";
	}

	@RequestMapping("boardView.do")
	public String boardView(int bno, String page, HttpSession session) {
		// session 정보로 최초 표시될 공감하트 색깔과 [수정, 삭제] 버튼이 결정되기 때문에
		// boardView 페이지 표시 이전에 session 정보를 읽어와야 하는데요.
		// 이때, 로그아웃 상태면 session 을 읽어올 때 서버에서 error를 띄웁니다.
		// jsp에서 sessionCheck 를 걸어놨어도, 서버에서 먼저 에러를 발생시켜서....
		// 일단 예외처리 해뒀어요.

		// 1) 로그인 유저 정보 확인 및 안전장치+예외처리
		String id = "";
		try {
			id = ((MemberDTO) session.getAttribute("member")).getM_id();
		} catch (NullPointerException e) {
			return "redirect:content3.do"; // 로그인 유도
		}

		// 2) 조회수 증가
		// HashSet(중복값을 허용하지 않는) 을 session에 set 해서 중복된 bno를 제거
		HashSet<Integer> set = (HashSet<Integer>) session.getAttribute("pageSet");
		if (set == null) {
			set = new HashSet<Integer>();
			session.setAttribute("pageSet", set);
		}
		if (set.add(bno))
			boardService.addCount(bno);

		// 3) bno로 해당 글 정보와 공감 갯수 찾기
		BoardDTO dto = boardService.selectBoard(bno);
		int bLike = boardService.selectBoardLikeCount(bno);

		List<CommentDTO> c_list = commentService.selectAllCommentList(bno);

		request.setAttribute("c_list", c_list);

		for (int i = 0; i < c_list.size(); i++) {
			System.out.println(c_list.get(i).toString());
		}

		// 4) 지금 로그인 한 사용자가 이 글에 공감을 눌렀는가?? 를 확인.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", id);
		map.put("bno", bno);

		int userLikeTrue = 0;
		userLikeTrue = boardService.selectUserLikeTrue(map);

		// 5) 날짜에서 시간부분 짜르기
		String tmpDate = dto.getRegist_day().split(" ")[0];
		dto.setRegist_day(tmpDate);

		// jsp 에서 식별해야 할 정보 셋팅
		session.setAttribute("id", id);
		request.setAttribute("board", dto);
		request.setAttribute("bLike", bLike);
		request.setAttribute("userLikeTrue", userLikeTrue);
		request.setAttribute("page", page);

		return "board_view";
	}

	@RequestMapping("/boardLike.do")
	public String boardLike(int bno, String id, HttpServletResponse response) throws IOException {

		// 공감 하트를 눌렀을 때 ajax 를 타고 bno와 session-id 값을 가지고 넘어옵니다.

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("m_id", id);

		// 공감 테이블에 m_id 와 bno 를 insert 할 때, 만약 이 정보가 공감테이블에 있다면
		// SQL Exception이 발생됩니다. (pk제약조건 충돌)
		// 때문에 예외처리를 하고 catch 영역에서 그 정보를 지우는 방식으로 원클릭 공감/비공감 을 구현했습니다.
		int count = 0;
		try {
			count = boardService.insertBoardLike(map);
		} catch (Exception e) {
			// 여기 들어왔다는건 공감테이블에 id+bno 정보가 이미 있다는 것!! (공감버튼을 눌렀다는 얘기)
			boardService.deleteBoardLike(map);
		}

		// json 객체에 공감인지 비공감인지 여부(result), 공감 갯수 셋팅
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

	@RequestMapping("updateView.do")
	public String updateView(HttpSession session, int bno) {
		BoardDTO dto = boardService.selectBoard(bno);
		request.setAttribute("board", dto);
		return "board_update_view";
	}

	@RequestMapping("updateBoard.do")
	public String update(int bno, HttpSession session) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String book_name = request.getParameter("book_name");
		String b_kind = request.getParameter("chk_info");
		String b_secret = request.getParameter("chk_secret");
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();
		String m_name = request.getParameter("m_name");

		System.out.println(title + " " + content + " " + b_kind + " " + b_secret + b_writer);
		if (b_kind.equals("book")) {
			b_kind = "b";
		} else {
			b_kind = "d";
		}

		if (b_secret.equals("open")) {
			b_secret = "o";
		} else {
			b_secret = "s";
		}
		System.out.println(b_kind);
		boardService.updateBoard(new BoardDTO(bno, title, content, b_kind, b_secret, book_name));

		return "redirect:myDiary.do";
	}

	@RequestMapping("deleteBoard.do")
	public String deleteBoard() {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int page = Integer.parseInt(request.getParameter("page"));
		boardService.deleteBoard(bno);
		System.out.println(bno + " " + page);
		return "redirect:myDiary.do?page=" + page;
	}

	@RequestMapping("commentAdd.do")
	public String addComment(int c_bno, HttpSession session, HttpServletResponse response) throws IOException {
		String content = request.getParameter("comment_area");
		String c_writer = ((MemberDTO) session.getAttribute("member")).getM_id();

		System.out.println(content + " " + c_bno);
		int count = commentService.addComment(new CommentDTO(c_bno, c_writer, content));
		List<CommentDTO> c_list = null;

		if (count > 0) {
			c_list = commentService.selectComment(c_bno);
		}

		JSONArray arr = new JSONArray(c_list);
		for (int i = 0; i < c_list.size(); i++) {
			System.out.println(arr.get(i).toString());
		}

		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(arr.toString());

		return null;
	}

	// ====================================================================================================================

	@RequestMapping("/content3.do")
	public String content3(String page, HttpSession session) {

		session.setAttribute("host", "content3.do");

		List<BoardDTO> boardList = null;
		int pageNo = 1;

		// 기억하는 page 가 있는지?
		if (page == null)
			page = "1";
		else
			pageNo = Integer.parseInt(page);

		/*
		 * 전체 게시글 개수 읽어오기 아래 메서드를 실행하기 위해서는 공유여부가 'o'인 글들만 view 로 만든 -->
		 * board_no_secret_list 를 db에 만들어 줘야 합니다.
		 */
		int cnt = boardService.selectBoardCount();
		BoardPaggingVO vo = new BoardPaggingVO(cnt, pageNo, 7, 4);

		// 게시글 첫 페이지 글목록 읽어오기
		boardList = boardService.selectPageBoard(pageNo);
		boardList = regDay(boardList); // 시간 부분 짤라주는 메서드

		// 공유 게시판에 필터가 [일기별로보기], [글귀별로보기], [전체-default], [검색결과보기] 이렇게 4가지 경우이기 때문에,
		// jsp 에 알려주기 위해 requestScope 를 사용했습니다.
		request.setAttribute("board_list", boardList);
		request.setAttribute("pagging", vo);
		request.setAttribute("kind", null); // 종류, 검색어 없으니까 둘다 null
		request.setAttribute("keyword", null);

		return "content3";
	}

	// content3: 드롭다운 메뉴에서 kind 별 list + pagging
	@RequestMapping("/kindList.do")
	public String kindList(String kind, String page, HttpServletResponse response) throws IOException {

		// 전체를 선택했다면 그냥 content3.do 로 이동
		if (kind.equals("a"))
			return "redirect:content3.do";

		int pageNo = 1;
		if (page == null)
			page = "1";
		else
			pageNo = Integer.parseInt(page);

		// kind에 맞는 글 갯수만 다시 확인
		int cnt = boardService.selectKindBoardCount(kind);
		BoardPaggingVO vo = new BoardPaggingVO(cnt, pageNo, 7, 4);

		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("page", pageNo);

		List<BoardDTO> boardList = boardService.selectKind(map);
		boardList = regDay(boardList);

		request.setAttribute("board_list", boardList);
		request.setAttribute("pagging", vo);
		request.setAttribute("kind", kind);
		request.setAttribute("keyword", null); // 검색어 없으니까 null

		return "content3";
	}

}
