package com.media.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.service.CarService;

import lombok.extern.java.Log;

@Controller
@Log
public class CarController {
	
	@Autowired
	private CarService cServ;
	
	ModelAndView mv;
	
	
	@GetMapping("clist")
	public ModelAndView carList(Integer pageNum) {
		log.info("carList()");
		
		mv = cServ.getCarList(pageNum);
		
		return mv;
	}
	
	@GetMapping("contents")
	public ModelAndView carContents(Integer car_seq) {
		log.info("carContents - car_seq:" + car_seq);
		
		mv = cServ.getcarContents(car_seq);
		
		return mv;
	}
	
	@GetMapping("carInsert")
	public String carInsert() {
		log.info("carInsert()");
		
		return "carInsert";
	}
	
	@GetMapping(value = "carNumCheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String carNumCheck(String car_num) {
		log.info("carNumCheck() - car_num : " + car_num);
		//서비스 -> DAO -> car번호 검색 
		String result = cServ.carNumCheck(car_num);
		
		return result;
	}
	
	@PostMapping("carWrite")
	public String carWrite
	(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		log.info("carWrite()");
		
		String view = cServ.carInsert(multi, rttr);
		
		return view;
	}
	
	@GetMapping("CupdateFrm")
	public ModelAndView CupdateFrm(int car_seq, 
			RedirectAttributes rttr) {
		log.warning("글번호 : " + car_seq);
		mv = cServ.CupdateFrm(car_seq, rttr);

		return mv;
	}
	
	@PostMapping("carUpdate")
	public String carUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = cServ.carUpdate(multi, rttr);
		
		return view;
	}
	
	@GetMapping("cdelete")
	public String cdelete(Integer car_seq, RedirectAttributes rttr) {
		log.info("cdelete - car_seq : " + car_seq);
		
		String view = cServ.deleteContents(car_seq, rttr);
		
		return view;
	}

}
