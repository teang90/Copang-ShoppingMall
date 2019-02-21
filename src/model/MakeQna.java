package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.CST_QNA;
import mybatis.DAO;

public class MakeQna implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/images");

		try {
			MultipartRequest mr = new MultipartRequest(request, path, 500*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			CST_QNA qna = new CST_QNA();
			qna.setQna_ctg(mr.getParameter("qna_ctg"));
			qna.setId(mr.getParameter("id"));
			qna.setPwd(mr.getParameter("pwd"));
			qna.setTitle(mr.getParameter("title"));
			qna.setContent(mr.getParameter("content"));
			if (mr.getFile("filename") != null) {
				qna.setFilename(mr.getFilesystemName("filename"));
			}else {
				qna.setFilename("");
			}

			int res = DAO.getMakeQna(qna);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "Controller?cmd=Qnalist&id="+request.getParameter("id")+"-";
	}

}
