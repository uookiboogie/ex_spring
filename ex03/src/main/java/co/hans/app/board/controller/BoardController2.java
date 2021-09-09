package co.hans.app.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.hans.app.board.domain.BoardAttachVO;
import co.hans.app.board.domain.BoardVO;
import co.hans.app.board.domain.Criteria;
import co.hans.app.board.domain.PageVO;
import co.hans.app.board.service.BoardAttachService;
import co.hans.app.board.service.BoardService;

//@Controller
//@RequestMapping("/board/*")
////@SessionAttributes("cri")
public class BoardController2 {
	
	@Autowired BoardService boardService;
	@Autowired BoardAttachService boardAttachService;
	
	
	//전체조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		
		int total = boardService.getTotalCount(cri);
		
		model.addAttribute("list",boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	//단건조회(수정페이지)
	@GetMapping("/get")
	public void get(Model model, BoardVO boardVO, @ModelAttribute("cri") Criteria cri) {  //bno 파라미터 -> 커맨드 객체
		model.addAttribute("board",boardService.read(boardVO));
	}
	//수정처리
	@PostMapping("/modify")
	public String modify(BoardVO vo,
			             @ModelAttribute("cri") Criteria cri,
			             RedirectAttributes rttr) {
		int result = boardService.update(vo);
		if(result ==1) {
			rttr.addFlashAttribute("result", "success");			
		}
		//rttr.addAttribute("pageNum", cri.getPageNum());
		//rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list"; //파라미터 전달 X
	}
	//등록페이지
	@GetMapping("/register")
	public void registerForm() {
		
	}
	//등록처리
	@PostMapping("/register")
	public String register(BoardVO vo, 
			               RedirectAttributes rttr, 
			               MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		
		List<BoardAttachVO> list = new ArrayList<BoardAttachVO>();
		
		String path = "c:/upload";
		
		for(int i=0; i<uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if(!ufile.isEmpty() && ufile.getSize()>0) {
			  String fileName = ufile.getOriginalFilename();
			  //확장자 붙이기
			  int pos = fileName .lastIndexOf(".");
			  String _fileName = fileName.substring(pos);
			  
			  String saveName = System.currentTimeMillis()+_fileName;
			  
			  UUID uuid = UUID.randomUUID(); //uuid 만들기
			  
			  File file = new File(path, uuid+fileName);
			  ufile.transferTo(file);
			  //파일정보
			  BoardAttachVO attachvo = new BoardAttachVO();
			  attachvo.setUuid(uuid.toString());
			  attachvo.setFileName(fileName);
			  attachvo.setUploadPath(path);
			  list.add(attachvo);
			}
		}
		vo.setAttachList(list);
		
		boardService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list"; //파라미터 전달 X
	}
	//삭제처리
	@PostMapping("/delete")
	public String delete(BoardVO vo,
			             @ModelAttribute("cri") Criteria cri,
			             RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if(result ==1) {
			rttr.addFlashAttribute("result", "success");			
		}
		//rttr.addAttribute("pageNum", cri.getPageNum());
		//rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list"; //파라미터 전달 X
	}
	
	/**
	* 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다. *
	* @param commandMap
	* @param response
	* @throws Exception
	*/
	@RequestMapping(value = "/download")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
	  String uuid = (String) commandMap.get("uuid");
	  
	  //uuid 로 첨부파일 검색
	  BoardAttachVO attachVO = boardAttachService.read(uuid);
	  String fileName = "";
	  if(attachVO != null) {
		  fileName = attachVO.getFileName();
	  }
	  
	  File uFile = new File("c:/upload", uuid+fileName);
	  long fSize = uFile.length();
	  if (fSize > 0) {
	    String mimetype = "application/x-msdownload";
	    response.setContentType(mimetype);
	    response.setHeader("Content-Disposition", "attachment;filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\"");
	//setDisposition(atchFileId, request, response);
	  BufferedInputStream in = null;
	  BufferedOutputStream out = null;
	  try {
	    in = new BufferedInputStream(new FileInputStream(uFile));   //파일을 읽고
	    out = new BufferedOutputStream(response.getOutputStream()); //쓰고
	    FileCopyUtils.copy(in, out);                                //반복
	    out.flush();
	  } catch (IOException ex) {
	  } finally {
	    in.close(); response.getOutputStream().flush(); response.getOutputStream().close();
	    }
	  } else {
	response.setContentType("application/x-msdownload");
	PrintWriter printwriter = response.getWriter();
	printwriter.println("<html>");
	printwriter.println("<h2>Could not get file name:<br>" + fileName + "</h2>");
	printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
	printwriter.println("&copy; webAccess");
	printwriter.println("</html>");
	printwriter.flush();
	printwriter.close();
	}
	}
	
}
