package com.media.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dao.CarDao;
import com.media.dto.BfileDto;
import com.media.dto.BoardDto;
import com.media.dto.CarDto;
import com.media.dto.CfileDto;
import com.media.dto.CmemberDto;
import com.media.dto.MemberDto;
import com.media.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class CarService {
	
	
	@Autowired
	private CarDao cDao;

	ModelAndView mv;
	
	@Autowired
	private HttpSession session;
	
	private int listCount = 5;
	private int pageCount = 2;

	
//	public ModelAndView carInsert(CarDto car, RedirectAttributes rttr) {
//		mv = new ModelAndView();
//		String view = null;
//		
//		try {
//			cDao.carInsert(car);
//			//차량 등록 성공 -> 기업정보페이지로 전환
//			view = "redirect:/";
//			rttr.addFlashAttribute("msg", "등록 성공");
//		} catch (Exception e) {
//			// TODO: handle exception
//			view = "redirect:carInsertFrm";
//			rttr.addAttribute("msg", "중복 차량");
//		}
//		
//		mv.setViewName(view);
//		return mv;
//	}
	
	public String carNumCheck(String car_num) {
		String result = null;
		
		try {
			int cnt = cDao.carNumCheck(car_num);
			
			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}

	public ModelAndView getCarList(Integer pageNum) {
		// TODO Auto-generated method stub
		log.info("getCarList() - pageNum : " + pageNum);
		
		mv = new ModelAndView();
		
		int num = (pageNum == null) ? 1 : pageNum;
		
		Map<String, String> clmap = new HashMap<String, String>();
		
		clmap.put("pageNum", String.valueOf(num));
		clmap.put("cnt", String.valueOf(listCount));
		
		List<CarDto> cList = cDao.getClist(clmap);
		
		mv.addObject("cList", cList);
		
		String paging = getPaging(num);
		mv.addObject("paging", paging);
		
		session.setAttribute("pageNum", num);
		
		mv.setViewName("carList");
		return mv;
	}
	
	private String getPaging(int num) {
		int maxNum = cDao.getCarCount();
		String listName = "clist";
		
		Paging paging = new Paging(maxNum, num, listCount, pageCount, listName);
		
		String pagingHtml = paging.makePaging();
		
		return pagingHtml;
	}

	public ModelAndView getcarContents(Integer car_seq) {
		// TODO Auto-generated method stub
		mv = new ModelAndView();
		
		CarDto car = cDao.getCarContents(car_seq);
		mv.addObject("car", car);
		
//		List<CfileDto> CfileList = cDao.getCfList(car_seq);
//		mv.addObject("cfList", CfileList);
//		
		mv.setViewName("carContents");
		
		return mv;
	}
	
	
	
	@Transactional
	public String carInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view=null;
		
		String cid = multi.getParameter("cid");
		String car_num = multi.getParameter("car_num");
		String car_option = multi.getParameter("car_option");
		//int car_seq = Integer.parseInt(multi.getParameter("car_seq"));
		String size = multi.getParameter("car_size");
		String zone = multi.getParameter("zone");
		String car_type = multi.getParameter("car_type");
		String oil_type = multi.getParameter("oil_type");
		int rent_amt = Integer.parseInt(multi.getParameter("rent_amt"));
		int drive_amt = Integer.parseInt(multi.getParameter("drive_amt"));
		int fcheck = Integer.parseInt(multi.getParameter("fileCheck"));
		
		CarDto car = new CarDto();
		car.setCid(cid);
		car.setCar_num(car_num);
		car.setCar_option(car_option);
		//car.setCar_seq(car_seq);
		car.setCar_size(size);
		car.setZone(zone);
		car.setCar_type(car_type);
		car.setOil_type(oil_type);
		car.setRent_amt(rent_amt);
		car.setDrive_amt(drive_amt);
		
		try {
			cDao.carInsert(car);
			view = "redirect:clist";
			rttr.addFlashAttribute("check", 2);
			
			log.info("carInsert - filecheck: " + fcheck);
			if(fcheck == 1) {
				
				fileUp(multi, car.getCar_seq());
			}
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:carInsert";
			rttr.addFlashAttribute("check", 1);
		}
		return view;
		
	}
	private void fileUp(MultipartHttpServletRequest multi, int cbnum) throws IllegalStateException, IOException {
		
		String path = multi.getSession()
				.getServletContext()
				.getRealPath("/") + "resources/upload/";
		log.info(path);
		
		File folder = new File(path);
		if(folder.isDirectory() == false) {
			folder.mkdir();
		}
	
		Map<String, String> fmap = new HashMap<String, String>();
		
		List<MultipartFile> fList = multi.getFiles("files");
		
		for(int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i);
			
			String cf_oriName = mf.getOriginalFilename();
			
			fmap.put("cf_oriFileName", cf_oriName);
			
			String sysName = System.currentTimeMillis()
					+ "."
					+ cf_oriName.substring(cf_oriName.lastIndexOf(".") + 1);
			
			mf.transferTo(new File(path+sysName));
			
			cDao.fileInsert(fmap);
		}
	}
	
	public void fileDown(String sysFileName, HttpServletRequest req, HttpServletResponse resp) {
		
		String path = req.getSession().getServletContext().getRealPath("/") + "resources/upload/";
		
		String oriName = cDao.getOriName(sysFileName);
		
		path += sysFileName;
		
		InputStream is = null;
		OutputStream os = null;
		
		try {
			String dFileName = URLEncoder.encode(oriName, "UTF-8");
			
			File file = new File(path);
			is = new FileInputStream(path);
			
			resp.setContentType("application/octet-stream");
			resp.setHeader("content-Disposition", "attachment; filename=\""+ dFileName+"\"");
			
			os = resp.getOutputStream();
			
			byte[] buffer = new byte[1024];
			int length;
			while((length = is.read(buffer)) != -1) {
				os.write(buffer, 0, length);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				os.flush();
				os.close();
				is.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	@Transactional
	public String carUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		
		String cid = multi.getParameter("cid");
		String car_num = multi.getParameter("car_num");
		String car_option = multi.getParameter("car_option");
		int car_seq = Integer.parseInt(multi.getParameter("car_seq"));
		String size = multi.getParameter("car_size");
		String zone = multi.getParameter("zone");
		String car_type = multi.getParameter("car_type");
		String oil_type = multi.getParameter("oli_type");
		int rent_amt = Integer.parseInt(multi.getParameter("rent_amt"));
		int drive_amt = Integer.parseInt(multi.getParameter("drive_amt"));
		
		CarDto car = new CarDto();
		car.setCid(cid);
		car.setCar_num(car_num);
		car.setCar_option(car_option);
		car.setCar_seq(car_seq);
		car.setCar_size(size);
		car.setZone(zone);
		car.setCar_type(car_type);
		car.setOil_type(oil_type);
		car.setRent_amt(rent_amt);
		car.setDrive_amt(drive_amt);
		
		try {
			cDao.carUpdate(car);
			view = "redirect:contents?car_seq="+car_seq;
			rttr.addFlashAttribute("Check", 2);
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:contents?car_seq="+car_seq;
			rttr.addFlashAttribute("check", 3);
		}
		return view;
	}
	
	@Transactional
	public String deleteContents(Integer car_seq, RedirectAttributes rttr) {
		String view = null;
		
		try {
			cDao.contentsDelete(car_seq);
			
			//cDao.fileDelete(car_seq);
			
			view = "redirect:clist";
			rttr.addFlashAttribute("check", 3);
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:contents?car_seq=" + car_seq;
			rttr.addFlashAttribute("check", 4);
		}
		
		return view;
	}
	
	

	public ModelAndView getUpContents(Integer car_seq) {
		// TODO Auto-generated method stub
		mv = new ModelAndView();
		CarDto car = cDao.getCarContents(car_seq);
		mv.addObject("car", car);
		return mv;
	}

	public ModelAndView CupdateFrm(int car_seq, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		CarDto car = cDao.getCarContents(car_seq);
		CmemberDto cmember = 
				(CmemberDto)session.
				getAttribute("cm");
		String sId = cmember.getCid();

		if(car.getCid().equals(sId)) {
			mv.addObject("car", car);
			List<CfileDto> cfList = cDao.getCfList(car_seq);
			mv.addObject("cfList", cfList);
			view = "updateFrm";
		}
		else {
			view = "redirect:contents?car_seq=" + car_seq;
			rttr.addFlashAttribute("check", 1);
		}

		mv.setViewName(view);

		return mv;
	}
	
}
