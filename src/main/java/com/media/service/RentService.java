package com.media.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dao.CarDao;
import com.media.dao.RentDao;
import com.media.dto.CarDto;
import com.media.dto.MemberDto;
import com.media.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class RentService {

	@Autowired
	private CarDao cDao;

	@Autowired
	private RentDao rDao;

	ModelAndView mv;

	@Autowired
	private HttpSession session;

	private int listCount = 5;
	private int pageCount = 2;

	public ModelAndView getCarList(Integer pageNum) {
		// TODO Auto-generated method stub
		log.info("getRentCarList() - pageNum : " + pageNum);

		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		Map<String, String> rclmap = new HashMap<String, String>();

		rclmap.put("pageNum", String.valueOf(num));
		rclmap.put("cnt", String.valueOf(listCount));

		List<CarDto> rcList = rDao.getRclist(rclmap);

		mv.addObject("rcList", rcList);

		String paging = getPaging(num);

		mv.addObject("paging", paging);

		session.setAttribute("pageNum", num);

		mv.setViewName("reserv");

		return mv;
	}

	private String getPaging(int num) {
		int maxNum = rDao.getRcarCount();
		String listName = "rclist";

		Paging paging = new Paging(maxNum, num, listCount, pageCount, listName);

		String pagingHtml = paging.makePaging();

		return pagingHtml;
	}
	//


	public Map<String, List<CarDto>> getTypeSearch(String zone) {
		Map<String, List<CarDto>> rMap = new HashMap<String, List<CarDto>>();

		List<CarDto> sList = rDao.getTypeList(zone);

		rMap.put("sList", sList);

		return rMap;
	}

	public ModelAndView getrcarContents(String car_num) {
		// TODO Auto-generated method stub
		mv = new ModelAndView();

		CarDto rcar = rDao.getRcarContents(car_num);
		mv.addObject("rcar", rcar);

		mv.setViewName("mmUsageHistory");

		return mv;
	}

	public ModelAndView getRentcarList(Integer pageNum) {
		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		Map<String, String> lmap =
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));

		List<CarDto> rclist = rDao.getRcList(lmap);

		mv.addObject("rclist", rclist);

		String paging = getPaging(num);
		mv.addObject("paging", paging);

		session.setAttribute("pageNum", num);

		mv.setViewName("reserv");

		return mv;
	}


}
