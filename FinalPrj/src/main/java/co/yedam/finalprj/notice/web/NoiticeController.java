package co.yedam.finalprj.notice.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.notice.vo.NoticeVO;

@Controller
public class NoiticeController {

	@Autowired
	NoticeService noticeDao;
	//공지사항리스트
	@RequestMapping("admin/noticeList.do")
	public String noticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeDao.noticeSelectList());
		return "admin/noticeList";
	}
	//공지사항작성페이지이동
	@RequestMapping("admin/noticeForm.do")
	public String noticeForm() {
		return "admin/noticeForm";
	}
	//공지사항작성 db입력
	@RequestMapping("admin/noticeInsert.do")
	public String noticeInsert(NoticeVO vo, Model model, HttpServletRequest req) throws Exception {
		//notice table 저장
		MultipartFile uploadFile = vo.getFile();
		
		if (!uploadFile.isEmpty()) {
			String name = uploadFile.getOriginalFilename();
			String ext = null;
			int dot = name.lastIndexOf(".");
			if (dot != -1) {                              //확장자가 있을때
			      ext = name.substring(dot);
			} else {                                     //확장자가 없으면
			      ext = "";
		    }
			UUID uuid = UUID.randomUUID();
			String fileUUID = uuid.toString() + ext;
			vo.setFileName(name);
			vo.setUuid(fileUUID);
			System.out.println(fileUUID);
			String path = req.getServletContext().getRealPath("/resources/fileupload/"); //경로지정
			System.out.println(path);
			uploadFile.transferTo(new File(path, fileUUID));//파일을 경로로 저장
			System.out.println(vo.getFileName());
			
		} else {
			System.out.println("첨부파일이 없습니다.");
		}
		
		noticeDao.noticeInsert(vo);
		
		return "redirect:admin/noticeList.do";
	}
	
	//공지사항수정페이지이동
	@RequestMapping("admin/noticeUpdateForm.do")
	public String noticeUpdateForm(NoticeVO vo, Model model) {
		System.out.println(vo.getNotice_id());
		String path = "";
		//공지사항클릭시 조회수1증가
		int r = noticeDao.noticeUpdateHit(vo);
		if(r > 0) {
			System.out.println("조회");
			model.addAttribute("notice", noticeDao.noticeSelect(vo));
			path = "admin/noticeUpdateForm";
		}else {
			path = "redirect:noticeList.do";
		}
		return path;
	}
	//공지사항파일삭제
	@RequestMapping("admin/noticeFileDelete.do")
	public String noticeFileDelete(NoticeVO vo, HttpServletRequest req) {
		//서버에 올라가있는 파일삭제
		vo = noticeDao.noticeSelect(vo);
		String path = req.getServletContext().getRealPath("/resources/fileupload/");
		String uuid = vo.getUuid();
		String filePath = path+uuid;
		File file = new File(filePath);
		
		if(file.exists() == true) {
			file.delete();
			noticeDao.noticeUpdateFile(vo);
		}
	    
		
		
		return "redirect:noticeUpdateForm.do?notice_id="+vo.getNotice_id();
	}
	
	//공지사항 수정
	@RequestMapping("admin/noticeUpdate.do")
	public String noticeUpdate(NoticeVO vo, Model model, HttpServletRequest req) throws Exception {
		//notice table 수정
		MultipartFile uploadFile = vo.getFile();
		
		if (!uploadFile.isEmpty()) {
			String name = uploadFile.getOriginalFilename();
			String ext = null;
			int dot = name.lastIndexOf(".");
			if (dot != -1) {                              //확장자가 있을때
			      ext = name.substring(dot);
			} else {                                     //확장자가 없으면
			      ext = "";
		    }
			UUID uuid = UUID.randomUUID();
			String fileUUID = uuid.toString() + ext;
			vo.setFileName(name);
			vo.setUuid(fileUUID);
			System.out.println(fileUUID);
			String path = req.getServletContext().getRealPath("/resources/fileupload/"); //경로지정
			System.out.println(path);
			uploadFile.transferTo(new File(path, fileUUID));//파일을 경로로 저장
			System.out.println(vo.getFileName());
			
		} else {
			System.out.println("첨부파일이 없습니다.");
		}
		int r = noticeDao.noticeUpdate(vo);
		System.out.println(r + "건 수정");
		return "redirect:noticeUpdateForm.do?notice_id="+vo.getNotice_id();
	}
	//공지사항 삭제
	@RequestMapping("admin/noticeDelete.do")
	public String noticeDelete(NoticeVO vo, HttpServletRequest req) {
		vo = noticeDao.noticeSelect(vo);
		//첨부파일지우기
		String path = req.getServletContext().getRealPath("/resources/fileupload/");
		String uuid = vo.getUuid();
		String filePath = path+uuid;
		File file = new File(filePath);
		if(file.exists() == true) {
			file.delete();
		}
		int r = noticeDao.noticeDelete(vo);
		System.out.println(r + "건 삭제");
		return "redirect:noticeList.do";
	}
	
	//ck에디터 
	@RequestMapping("/ckupload")
	@ResponseBody
	protected void ckUpload(HttpServletRequest req,
						  HttpServletResponse resp, 
						  @RequestParam MultipartFile upload) throws ServletException, IOException {
		
		UUID uuid = UUID.randomUUID(); 
		String fileUUID = uuid.toString() + ".png";
		System.out.println(fileUUID);
		OutputStream out = null; 
		PrintWriter printWriter = null;

		resp.setCharacterEncoding("UTF-8");
		
		try { 
			// 업로드 경로 
			String path = req.getServletContext().getRealPath("/resources/upload/"); //filename alias name으로저장
			upload.transferTo(new File(path, fileUUID));
		
		} catch (IOException e) { 
			e.printStackTrace(); 
		} finally { 
			try { 
				if(out != null) { 
					out.close(); 
				} if(printWriter != null) { 
					printWriter.close(); } 
				} catch(IOException e) { 
					e.printStackTrace(); } 
		} 
		JsonObject json = new JsonObject();
		json.addProperty("uploaded", 1);
		json.addProperty("fileName", fileUUID);
		json.addProperty("url", req.getContextPath() + "/resources/upload/" + fileUUID);
		resp.getWriter().print(json);
		
	}
	//파일다운로드
	@RequestMapping("fileDown.do")
	public void fileDown(NoticeVO vo, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		vo = noticeDao.noticeSelect(vo);
		
		// 여기에 파일다운로드 만들기
		String filename = vo.getUuid(); //UUID로 저장된 이름
		String downname = vo.getFileName(); //실제파일명
		String realPath = request.getServletContext().getRealPath("/resources/fileupload/"); 	//저장디렉토리
		System.out.println("downname: " + downname);
		if (filename == null || "".equals(filename)) {
			return;
		}
		try {
			String browser = request.getHeader("User-Agent");
			// 브라우저 별로 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				downname = URLEncoder.encode(downname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downname = new String(downname.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realPath = realPath + filename; //물리적위치의 파일
		System.out.println(realPath);
		File file1 = new File(realPath);
		if (!file1.exists()) {
			return ;
		}
		// 파일명 지정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downname + "\""); 
		//다운로드시 표시되는 이름 attachment:첨부파일을 의미, "attachment; fileName=" 사이에 띄어쓰기 필수
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realPath); //InputStream으로 파일을 읽을 위치저장

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (FileNotFoundException ex) {
			System.out.println("FileNotFoundException");
		} catch (IOException ex) {
			System.out.println("IOException");
		}

	}
}
