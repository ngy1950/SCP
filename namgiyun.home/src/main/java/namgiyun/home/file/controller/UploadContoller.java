package namgiyun.home.file.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class UploadContoller {
	@Value("/upload")
	private String uploadDir;
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public boolean upload(String title, MultipartFile uploadFile, Model model, HttpServletRequest request){
		String dir = request.getServletContext().getRealPath(uploadDir);
		System.out.println("dir: " + dir);
		String fileName = uploadFile.getOriginalFilename();
		save(dir + "/" + fileName, uploadFile);
		model.addAttribute("fileName", fileName);
		return true;
	}

	private void save(String fileFullName, MultipartFile uploadFile) {
		try{
			uploadFile.transferTo(new File(fileFullName));
			System.out.println(fileFullName);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}
