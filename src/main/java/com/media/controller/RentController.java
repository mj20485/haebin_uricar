package com.media.controller;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dto.CarDto;
import com.media.service.RentService;

import lombok.extern.java.Log;

@Controller
@Log
public class RentController {

	@Autowired
	private RentService rServ;
	
	ModelAndView mv;
	
	@GetMapping("rclist")
	public ModelAndView rentcarList(Integer pageNum) {
		log.info("rentcarlist()");
		
		mv = rServ.getRentcarList(pageNum);
		
		return mv;
	}
	
	@GetMapping("reserv")
	public ModelAndView rcarList(Integer pageNum) {
		log.info("reserv()");
		
		mv = rServ.getCarList(pageNum);
		
		return mv;
	}
	
	@GetMapping("reservcar")
	public ModelAndView carRcontents(String car_num) {
		log.info("rcarContents - car_num:" + car_num);
		
		mv = rServ.getrcarContents(car_num);
		
		return mv;
	}
	
	@PostMapping(value="typeSearch", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<CarDto>> typeSearch(String zone){
		log.info("typeSearch() - " + zone);
		
		Map<String, List<CarDto>> rMap = rServ.getTypeSearch(zone);
		
		return rMap;
	}
	

}
